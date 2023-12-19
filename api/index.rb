require 'net/http'
require 'uri'
require "zlib"
require_relative 'xhttp'
require_relative 'link-resolver-js'
require_relative 'rubystyle-css'
require_relative 'rubyscript'
require_relative 'highlight-js'
 
repl = false
if ENV['PATH'].include?('runner')
  repl = true;
end



def flattenHeaders(headers)
  flatHeaders={};
  headers.each do |attr_name, attr_value|
    hostname = "www.ruby-lang.org"
    if !(attr_name.include?("x-"))
      flatHeaders[attr_name]=attr_value[0].sub("#{headers['host'][0]}", hostname)
    end
  end
  return flatHeaders
end

def addHeaders(request,headers)
  flatHeaders={};
  headers.each do |attr_name, attr_value|
    hostname = "www.ruby-lang.org"
    if (!(attr_name.include?("x-")))&&(!(attr_name.include?("referer")))&&(!(attr_name.include?("cookie")))&&(!(attr_name.include?("host")))&&(!(attr_name.include?("sec-")))&&(!(attr_name.include?("accept-")))&&(!(attr_name.include?("upgrade-")))&&(!(attr_name.include?("user-agent")))
      a2 = attr_value[0].sub("#{headers['host'][0]}", hostname)
      request[attr_name] = a2
    end
  end
  return request
end

def printHeaders(headers)
  flatHeaders={};
  headers.each do |attr_name, attr_value|
   puts attr_name +':'+ attr_value
  end
  return flatHeaders
end

Handler = Proc.new do |req, res|
  begin
    #puts req.inspect
    Encoding.default_external=Encoding::UTF_8
    Encoding.default_internal=Encoding::UTF_8
    
   
    req_request_uri="#{req.request_uri}"


    
    ref = ""
    if req['referer']
      ref="#{req['referer']}".encode("ascii", "utf-8", replace: "/")
    end


    
    response=fetch(req)

    res.status=response.code
    res['Content-Type'] = response.header['content-type']

    if(response.header['content-length'])
      res['Content-Length'] = response.header['content-length']
    end
    body=response.body
    if(response.header['content-encoding'])&&(response.header['content-encoding']=='gzip')
      body = Zlib.gunzip(body)
    end

     
      body = body.unpack('U*').pack('C*')
 


    response.header.each do |attr_name, attr_value|
      if (attr_name.downcase == 'content-encoding') && (attr_value.downcase.include?('gzip'))
        next
      end
      res[attr_name] = attr_value
    end
    res['Content-Length'] = body.length
    res.body=body

  rescue Exception => error
    puts  error
   body=('<pre><code>'+error.inspect+error.message+"\n<br>"+req.inspect+'</code></pre><script src="/api/rubyscript.js"></script><script src="/api/highlight.js"></script>').gsub(',',",\n<br>")
   res['Content-Type']='text/html;charset=UTF-8'
   res['Content-Length'] = body.length
   res.body=body
  end
end