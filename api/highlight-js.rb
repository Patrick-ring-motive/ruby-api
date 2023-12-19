



def highlight()

 return <<-TEXT

globalThis.highlightLang='ruby';

globalThis.highlighter=async function(){
  if(document.querySelector('[class*="language-"]:not(:has(.token,a))')){
  try{
    if(globalThis.Prism){
      let hs=Array.from(document.querySelectorAll('[class*="language-"]:not(:has(.token,a))'));
      let hs_length=hs.length;
      for(let i=0 ; i<hs_length ; i++){try{
        await Prism.highlightElement?.(hs[i]);
      }catch(e){await("highlight");continue;}}
      //await Prism.highlightAll();
      }
      
    }catch(e){await(console.log(e));}
  }
}


declare(async ()=>{
if(!(document.querySelector('link[href="https://cdnjs.cloudflare.com/ajax/libs/prism/9000.0.1/themes/prism.min.css"]'))){
  let prismCss = document.createElement('link');
  prismCss.setAttribute('href','https://cdnjs.cloudflare.com/ajax/libs/prism/9000.0.1/themes/prism.min.css');
  prismCss.updateAttribute('rel','stylesheet');
  document.firstElementChild.appendChild(prismCss);
}

await import('https://cdnjs.cloudflare.com/ajax/libs/prism/9000.0.1/prism.min.js');
await import('https://cdnjs.cloudflare.com/ajax/libs/prism/9000.0.1/components/prism-ruby.min.js');


queryApplyAll('code a',(a)=>{a.updateAttribute('class','token');});

let prs=Array.from(document.querySelectorAll('pre:not([class],:has(a))'));
const prs_length=prs.length;
for(let i=0;i<prs_length;i++){try{
  prs[i].innerHTML='<code class="language-ruby">'+prs[i].innerHTML+'</code>';
  prs[i].updateAttribute('class','language-ruby');
}catch(e){await console.log(e); continue;}}

let notprs=Array.from(document.querySelectorAll(':not(pre)>code:not(:has(a))'));
const notprs_length=notprs.length;
for(let i=0;i<notprs_length;i++){try{
  notprs[i].updateAttribute('class','language-ruby');
  notprs[i].outerHTML='<pre class="language-ruby">'+notprs[i].outerHTML+'</pre>';
}catch(e){await console.log(e); continue;}}

let aprs=Array.from(document.querySelectorAll('pre[class*="language-"]:not(:has(code,.token,a))'));
const aprs_length=aprs.length;
for(let i=0;i<aprs_length;i++){try{
if(aprs[i].innerHTML.toString().includes('#highlight#')){
aprs[i].innerHTML='<code class="language-ruby">'+aprs[i].innerHTML+'</code>';
}else{
  aprs[i].innerHTML='<code class="language-ruby">\\n#highlight#\\n'+aprs[i].innerHTML+'</code>';
  }
}catch(e){await console.log(e); continue;}}

if(document.querySelector('[class*="language-"]:not(:has(.token,a))')){
highlighter();
}

});



declare(async ()=>{

let comments=Array.from(document.querySelectorAll('.comment:not([comment="highlight"])'));
const comments_length=comments.length;
for(let i=0;i<comments_length;i++){try{

if(comments[i].innerHTML.toString().trim()=='#highlight#'){
  comments[i].updateAttribute('comment','highlight');
}

}catch(e){await("comments");console.log(e);continue;}}


});

TEXT
end