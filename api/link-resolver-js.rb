

def link_resolver()
  
  return <<-TEXT

if((document.title=='404: Not Found')&&(!(location.href.includes('reload')))){location.href=location.href+'?reload';location.reload();}
  
  if(!globalThis.hostTargetList){
  globalThis.hostTargetList = ['www.ruby-lang.org','docs.ruby-lang.org','ruby-doc.org','ruby-doc.com','www.ruby-doc.org','www.ruby-doc.com'];

}




try{
 /* document.firstElementChild.style.filter='hue-rotate(-45deg)';*/

   }catch(e){}
window.addEventListener("DOMContentLoaded", (event) => {try{

}catch(e){}});


  //linkSheets();


document.addEventListener("readystatechange", (event) => {
 // linkSheets();
});

document.addEventListener("DOMContentLoaded", (event) => {
 // linkSheets();
});

document.addEventListener("load", (event) => {
  //linkSheets();
});


setInterval(function(){

  transformLinks('href');
  transformLinks('src');
  transformLinks('action');
 // linkSheetsAsync();
},100);



async function transformLinks(attr){

let rubydocs=document.querySelectorAll('a[href*="www.ruby-doc.com"],a[href*="ruby-doc.org"]')
let rubydocs_length=rubydocs.length;
for(let i=0;i<rubydocs_length;i++){try{
rubydocs[i].href=rubydocs[i].href
.replace(/www.ruby-doc.com/gi,'ruby-doc.com')
.replace(/www.ruby-doc.org/gi,'ruby-doc.com')
.replace(/ruby-doc.org/gi,'ruby-doc.com');
}catch(e){continue;}}

 let pkgs = document.querySelectorAll('['+attr+'^="/"]:not([backup]),['+attr+'^="./"]:not([backup]),['+attr+'^="../"]:not([backup]),['+attr+']:not(['+attr+'*=":"]):not([backup])');
  let pkgs_length = pkgs.length;
  for(let i=0;i<pkgs_length;i++){
    await backupNode(pkgs[i]);
       pkgs[i].setAttribute(attr,pkgs[i][attr]);
  }

  const hostTargetList_length = globalThis.hostTargetList.length;
  for(let i=0;i<hostTargetList_length;i++){
    pkgs = document.querySelectorAll('['+attr+'^="https://'+globalThis.hostTargetList[i]+'"]:not([backup])');
    pkgs_length = pkgs.length;
    for(let x=0;x<pkgs_length;x++){
      await backupNode(pkgs[x]);
      let hash='';
      if(pkgs[x][attr].includes('#')){hash='#'+pkgs[x][attr].split('#')[1];}
      let char='?';
      if(pkgs[x][attr].includes('?')){char='&';}
         pkgs[x].setAttribute(attr,
                           pkgs[x][attr].split('#')[0]
                              .replace('https://'+globalThis.hostTargetList[i],
                               window.location.origin)+
                              char+'hostname='+
                              globalThis.hostTargetList[i]+
                              '&referer='+window.location.host+
                              hash);
    }  

  }

  pkgs = document.querySelectorAll('['+attr+'^="http://"]:not([backup])');
    pkgs_length = pkgs.length;
    for(let x=0;x<pkgs_length;x++){
      await backupNode(pkgs[x]);
      let char='?';
      if(pkgs[x][attr].includes('?')){char='&';}
         pkgs[x].setAttribute(attr,
                           pkgs[x][attr].replaceAll("http://","https://"));
    }

let downloads = document.querySelectorAll('a[href*=".tar.xz"]:not(a[href*="www.nodejs.org"])');
let downloads_length = downloads.length;
for(let i=0;i<downloads_length;i++){try{
  downloads[i].href=downloads[i].href.replace(window.location.hostname,'www.nodejs.org');
}catch(e){continue;}}

let slashLinks = document.querySelectorAll('a[href^="http"]:not([href$="/"],[href*=".html"],[href*=".tar.xz"],[href*=".json"],[href*=".jsml"],[href*=".css"],[href*=".woff"],[backup])');


let slashLinks_length = slashLinks.length;
for(let x=0;x<slashLinks_length;x++){try{
slashLinks[x].href=slashLinks[x].href+'/';
}catch(e){continue;}}

let logos = document.querySelectorAll('img[src*="logo"]');
let logos_length=logos.length;

for(let x=0;x<logos_length;x++){try{
logos[x].src='/mode.svg';
}catch(e){continue;}}
    let localhostname = globalThis.proxyhost;
    if(window.location.href.includes('hostname=')){
    localhostname = window.location.href.split('hostname=')[1].split('&')[0].split('?')[0].split('#')[0];
    }else{
      if(!(globalThis.proxyhost)){return;}
    }
    pkgs = document.querySelectorAll('['+attr+'^="'+window.location.origin+'"]:not(['+attr+'*="hostname="],['+attr+'$="tour"],['+attr+'$="tour/"])');
    pkgs_length = pkgs.length;
    for(let x=0;x<pkgs_length;x++){
      let hash='';
      if(pkgs[x][attr].includes('#')){hash='#'+pkgs[x][attr].split('#')[1];}
      let char='?';
      if(pkgs[x][attr].includes('?')){char='&';}
         pkgs[x].setAttribute(attr,
                           pkgs[x][attr].split('#')[0]+char+'hostname='+localhostname+'&referer='+window.location.host+hash);
    }


}




if(!globalThis.backupElements){globalThis.backupElements={};}
async function backupNode(element){try{
  if(element.tagName.toLowerCase()!='link'){return;}
  if(element.getAttribute('rel')!='stylesheet'){return;}
  if(document.querySelectorAll('[href="'+element.getAttribute('href')+'"]').length>2){return;}
  if(document.querySelector('[href="'+element.getAttribute('href')+'"][backup]')){
await new Promise((resolve, reject) => {setTimeout(resolve,100);})

  }
  let backup = element.cloneNode(true);
  let backupId = new Date().getTime();
  backup.setAttribute('backup',backupId);
  if(document.head){
  document.head.insertBefore(backup,document.head.firstElementChild);
  }else{
  let h=document.createElement('head');
  document.firstElementChild.appendChild(h);
  document.firstElementChild.appendChild(backup);
  }
  backup.promise = new Promise((resolve, reject) => {
    globalThis.backupElements[''+backupId]={"promise":backup.promise,"resolve":resolve};
});
  backup.onerror = function(e){globalThis.backupElements[backupId].resolve();}
  backup.onload = function(e){globalThis.backupElements[backupId].resolve();}
  backup.style.visibility="hidden";
  if(document.head){
  document.head.insertBefore(backup,document.head.firstElementChild);
  }else{
  let h=document.createElement('head');
  document.firstElementChild.appendChild(h);
  document.firstElementChild.appendChild(backup);
  }
const promise1 = new Promise((resolve, reject) => {setTimeout(resolve,100);});

  await Promise.race([backup.promise,promise1]) ;
  return;
}catch(e){
  return;
  }
}


      function linkSheets(){
       let linksheets = document.querySelectorAll('link[rel="stylesheet"]:not([styled])');
       let linksheets_length = linksheets.length;
       for(let i=0;i<linksheets_length;i++){try{
if(document.querySelector('style[url="'+linksheets[i].href+'"]')){
continue;
}

let request = new XMLHttpRequest();
request.open("GET", linksheets[i].href, false); 
request.send(null);

if (request.status === 200) {
 let linksheet_text = request.responseText; 
 let ls = document.createElement('style');
 ls.innerHTML = linksheet_text;
 ls.setAttribute('url',linksheets[i].href);
 document.body.appendChild(ls)
}

       linksheets[i].setAttribute('styled','true');

       }catch(e){linksheets[i].setAttribute('styled','true');continue;}}

     }

       async function linkSheetsAsync(){
        let linksheets = document.querySelectorAll('link[rel="stylesheet"]:not([styled],[backup])');
        let linksheets_length = linksheets.length;
        for(let i=0;i<linksheets_length;i++){try{
if(document.querySelector('style[url="'+linksheets[i].href+'"]')){
continue;
}


     let request = await fetch(linksheets[i].href);


     let linksheet_text = await request.text(); 
     let ls = document.createElement('style');
     ls.innerHTML = linksheet_text;
     ls.setAttribute('url',linksheets[i].href);
     document.body.appendChild(ls)


        linksheets[i].setAttribute('styled','true');

        }catch(e){linksheets[i].setAttribute('styled','true');continue;}}

      }





void async function preloaded(){
try{

const cache = await caches.open('app');
let all = await cache.matchAll();

for(let i=0;i<all.length;i++){
try{
const url = all[i].url;
let links = document.querySelectorAll('a[href="'+url+'"]');
for(let x=0;x<links.length;x++){try{

links[x].setAttribute('preloaded','true');


}catch(e){continue;}}


}catch(e){continue;}}
}catch(e){}
}();


function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function preloadLink(a){
if(!a){return;}
a.setAttribute('preloaded','true');
preloader(a.href);
}



async function preloader(url){
  let ifr = document.createElement('iframe');
  ifr.setAttribute('frameborder','0');
  ifr.style.border='none';
  ifr.style.padding='0px';
  ifr.style.margin='0px';
  ifr.style.visibility='none';
  ifr.style.height='0px';
  ifr.style.width='0px';
  ifr.src = url;
  document.body.appendChild(ifr);
  await sleep(5000);
  ifr.remove();
}

setInterval(function(){

if(window==window.top){
  preloadLink(document.querySelector('a[href^="'+window.location.origin+'"]:not([preloaded],html[user-agent*="obile"] *)'));
}

},8000);


      
TEXT
end