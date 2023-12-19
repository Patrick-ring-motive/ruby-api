def rubyscript()
  <<-TEXT

    void function rubyscript(){

    globalThis.await=(promise)=>{console.log("Attempting to await promise in synchronous context ",promise);return promise;};

    globalThis.yield=(next)=>{console.log("Attempting to yield next outside of a generator ",next);return next;};


    globalThis.queryApplyAll=async function(query,func){

    let elems=Array.from(document.querySelectorAll(query));
    const elems_length=elems.length;
    for(let i=0;i<elems_length;i++){try{
      func(elems[i]);
    }catch(e){await("queryApplyAll");console.log(e); continue;}}

    }

    Element.prototype.updateAttribute=function(attr,val){
    const el = this;
    if(!(el.hasAttribute(attr,val))){
    el.setAttribute(attr,val);
    }else{
    if(el.getAttribute(attr)!=val){
    el.setAttribute(attr,val);
    }
    }
    }

    if(!(globalThis.declarations)){globalThis.declarations=[];globalThis.declarationStrings=[];}

    globalThis.declare=function(func){
        let funcString=func.toString();
        if(!(declarationStrings.includes(funcString))){
         globalThis.declarations.push(func);
         globalThis.declarationStrings.push(funcString);
        }
    };

    globalThis.declareEvaluator=async function(){
    
      const declarations_length = declarations.length;
    	for(let i = 0;i < declarations_length;i++){try{
   
    		declarations[i]();
   
    	}catch(e){await("declareEvaluator");console.log(e);continue;}}
   
    };


    globalThis.declareEvaluator();
    document.addEventListener("DOMContentLoaded", (event) => {globalThis.declareEvaluator();});
    document.addEventListener("readystatechange", (event) => {globalThis.declareEvaluator();});
    window.addEventListener("load", (event) => {globalThis.declareEvaluator();});
    setInterval(function(){globalThis.declareEvaluator();},100);



    globalThis.page_html = document.querySelector('html');

    page_html.setAttribute('window-location' , window.location.href);
    declare(()=>page_html.updateAttribute('window-location' , window.location.href));

    page_html.setAttribute('user-agent' , navigator.userAgent);
    declare(()=>page_html.updateAttribute('user-agent' , navigator.userAgent));

    if (window!=window.top){
    page_html.setAttribute('framed','');
    }

    declare(()=>{

      if(window.innerHeight==window.innerWidth){
        page_html.updateAttribute('orientation','square');
      }
      if(window.innerHeight>window.innerWidth){
        page_html.updateAttribute('orientation','portrait');
      }
      if(window.innerHeight<window.innerWidth){
        page_html.updateAttribute('orientation','landscape');
      }

    });


    declare(()=>{

      const untagged = Array.from(document.querySelectorAll(':not([tag-name])'));
      const untagged_length=untagged.length;
      for(let i=0;i<untagged_length;i++){try{
      const tagname = untagged[i].outerHTML.toString().split('<')[1].split(' ')[0].split('>')[0];
      untagged[i].setAttribute('tag-name',tagname);
      }catch(e){continue;}}

    });


    function swapSapphireText(el){

      if(!el){return;}
      var n, a=[], walk=document.createTreeWalker(el,NodeFilter.SHOW_TEXT,null,false);
      while(n=walk.nextNode()){
      a.push(n);
        let ntext=n.textContent;

      ntext=ntext.replace(/ruby/gi,'Sapphire');

      if(ntext!=n.textContent){
        n.textContent=ntext;
      }

      };
      if(document.title.toLowerCase().includes('ruby')){
        document.title=document.title
          .replace(/ruby/gi,'Sapphire')
         }
      return a;
      }


    if(window.location.href.toLowerCase().includes('sapphire')){
    setInterval(function(){

    swapSapphireText(document.body);

    },100);

    }






    function swapEmeraldText(el){

      if(!el){return;}
      var n, a=[], walk=document.createTreeWalker(el,NodeFilter.SHOW_TEXT,null,false);
      while(n=walk.nextNode()){
      a.push(n);
        let ntext=n.textContent;

      ntext=ntext.replace(/ruby/gi,'Emerald');

      if(ntext!=n.textContent){
        n.textContent=ntext;
      }

      };
      if(document.title.toLowerCase().includes('ruby')){
        document.title=document.title
          .replace(/ruby/gi,'Emerald')
         }
      return a;
      }


    if(window.location.href.toLowerCase().includes('emerald')){
    setInterval(function(){

    swapEmeraldText(document.body);

    },100);

    }

function swapRuaText(el){

  if(!el){return;}
  var n, a=[], walk=document.createTreeWalker(el,NodeFilter.SHOW_TEXT,null,false);
  while(n=walk.nextNode()){
  a.push(n);
    let ntext=n.textContent;

  ntext=ntext.replace(/ruby/gi,'Rua').replaceAll('def','function');

  if(ntext!=n.textContent){
    n.textContent=ntext;
  }

  };
  if(document.title.toLowerCase().includes('ruby')){
    document.title=document.title
      .replace(/ruby/gi,'Rua')
     }
  return a;
  }


if(window.location.href.toLowerCase().includes('rua')){
setInterval(function(){

swapRuaText(document.body);

},100);

}
                                                                                        


    }();

  TEXT
end
