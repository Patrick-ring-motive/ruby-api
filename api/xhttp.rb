require 'net/http'
require 'uri'
require "zlib"


def newRequest (method,uri,headers,body)
  req = nil
  case method.upcase
  when 'GET'
    req = Net::HTTP::Get.new(uri,headers)
  when 'HEAD'
    req = Net::HTTP::Head.new(uri,headers)
  when 'POST'
    req = Net::HTTP::Post.new(uri,headers)
  when 'PUT'
    req = Net::HTTP::Put.new(uri,headers)
  when 'DELETE'
    req = Net::HTTP::Delete.new(uri,headers)
  when 'OPTIONS'
    req = Net::HTTP::Options.new(uri,headers)
  when 'TRACE'
    req = Net::HTTP::Trace.new(uri,headers)
  when 'PATCH'
    req = Net::HTTP::Patch.new(uri,headers)
  when 'PROPFIND'
    req = Net::HTTP::Propfind.new(uri,headers)
  when 'PROPPATCH'
    req = Net::HTTP::Proppatch.new(uri,headers)
  when 'MKCOL'
    req = Net::HTTP::Mkcol.new(uri,headers)
  when 'COPY'
    req = Net::HTTP::Copy.new(uri,headers)
  when 'MOVE'
    req = Net::HTTP::Move.new(uri,headers)
  when 'LOCK'
    req = Net::HTTP::Lock.new(uri,headers)
  when 'UNLOCK'
    req = Net::HTTP::Unlock.new(uri,headers)
  else
    req = Net::HTTP::Get.new(uri,headers)
  end

  if body
    req.body = body
  end
  puts req
  return req
end

def flattenReqHeaders(req)
  headers = req.header
  flatHeaders={};
  headers.each do |attr_name, attr_value|
    if !(attr_name.include?("x-"))
      flatHeaders[attr_name]=attr_value[0]
    end
  end
  return flatHeaders
end

def fetch(req)

  response={}
  begin


    uristring=req.path.sub("https:/","https://").sub("https:///","https://").sub("/http","http")
if !(uristring.include?("https://"))
  uristring="https://www.google.com/"
end
puts "uristring"
    puts uristring
  if (uristring.split('.').length == 3) && (uristring[uristring.length-1]!="/")
    uristring=uristring+'/'
  end
  newURI = URI.parse(uristring)
 
  if req.request_method && (req.request_method[0]=="P")
    response=Net::HTTP.post(newURI, req.body(),flattenReqHeaders(req))
    return response
  end
    response=Net::HTTP.get_response(newURI,flattenReqHeaders(req),443)
    return response
  
    rescue Exception => error
    puts error
     response.body=error.inspect+error.message
     response.code='500';
     return response
    end
end