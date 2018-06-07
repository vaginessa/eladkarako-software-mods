var DEBUG_MODE = true             //true means verbose - extra-information will be written using console.error (STDERR).
   ,fs         = require("fs")
   ,path       = require("path")
   ,console    = (function(console){      //make console.error useless when DEBUG_MODE is off.
                   console.error = (true === DEBUG_MODE) ? console.error : function(){};
                   return console;
                 }(require("console")))
   ,exec       = require("child_process").exec
   ,trim       = function(s){return (s || "").replace(/(^\s+|\s+$)/gm, "");}
   ,file       = path.resolve(process.argv.filter(function(s){return false === /node\.exe/i.test(s) && false === /index\.js/i.test(s);})[0].replace(/\\+/g,"/")).replace(/\\+/g,"/")
   ,file_out   = (function(){
                    var parts = path.parse(file);
                    parts = parts.dir + "/" + parts.name + "_ariainputfile" + parts.ext;
                    parts = parts.replace(/\\+/g,"/");
                    parts = path.resolve(parts).replace(/\\+/g,"/");
                    return parts;
                 }())
   ,file_cmd   = (function(){
                    var parts = path.parse(file);
                    parts = parts.dir + "/" + parts.name + "_ariainputfile" + ".cmd";
                    parts = parts.replace(/\\+/g,"/");
                    parts = path.resolve(parts);       //.replace(/\\+/g,"/");  //will do what OS is compatible with: / or \
                    return parts;
                 }())

   ,lines      = fs.readFileSync(file,{encoding: "utf8"}).replace(/[\r\n]+/gm, "\n").split("\n").filter(function(line){return trim(line).length > 2;}) //filter-out empty lines

   ,COMMAND    = "youtube-dl.cmd --abort-on-error --no-warnings --format \"best[ext=mp4][height <=? 720]\" --force-ipv4 --no-check-certificate --no-call-home --skip-download --dump-json \"##LINE##\""
   ,CONF_EXEC  = {timeout:     120 * 1000   //120s delay limit
                 ,encoding:    "utf8"
                 ,windowsHide: false
                 }
   ,CONF_WRITE = {flag:"w", encoding:"utf8"}
   ,TEMPLATE_OUT  = "##URL##\r\n    out=\/##OUT##"    //one entry of Aria2c's '--input-file'. Note that for some reason you can not wrap the path with \".......\"  due to Aria2C quirk/bug.
   ,output     = []
   ,counter    = lines.length
   ,TEMPLATE_CMD  = ['@echo off'
                    ,'chcp 65001 2>nul >nul'
                    ,'@echo on'
                    ,'call aria2c --dir="." --file-allocation="falloc" --human-readable="true" --enable-color="true" --split="3" --min-split-size="1M" --user-agent="Mozilla/5.0 Chrome" --continue="true" --allow-overwrite="false" --auto-file-renaming="false" --check-certificate="false" --check-integrity="false" --enable-http-keep-alive="true" --enable-http-pipelining="true" --disable-ipv6="true" --max-concurrent-downloads="4" --max-connection-per-server="16" --input-file="##FILE_OUT##"'
                    ,'@echo off'
                    ,'pause'
                    ].join("\r\n")
   ;


function handler(error, stdout, stderr){
  if(null !== error){         console.error("[ERROR] handler got error.", error);            return;}
  
//stderr = trim(stderr);
//if(stderr.length > 2){      console.error("[ERROR] stderr has content.", stderr);          return;}

  stdout = trim(stdout);
  if(stdout.length < 10){     console.error("[ERROR] stdout is too short.", stdout);         return;}

  try{stdout = JSON.parse(stdout);
  }catch(err){stdout = null;}
  if(null === stdout){        console.error("[ERROR] JSON.parse error of stdout.", stdout);  return;}

  console.error("[INFO] JSON.parse success.", stdout);
  
  if("string" !== typeof stdout.url){        console.error("[ERROR] can not find \".url\" in the parsed JSON", stdout);        return;}
  if("string" !== typeof stdout._filename){  console.error("[ERROR] can not find \"._filename\" in the parsed JSON", stdout);  return;}

  stdout._filename = trim(stdout._filename).replace(/[\'\"]/gm, "").replace(/[\&]/gm, " and ");

  stdout = TEMPLATE_OUT.replace(/##URL##/gm, stdout.url)
                       .replace(/##OUT##/gm, stdout._filename)
                       ;

  output.push(stdout);
  output.push("");      //for an extra empty-line.

  console.error("[INFO] line done. adding: " + stdout);


  counter--;
  if(counter > 0){ console.error("[INFO] still [" + (lines.length - counter) + "] items to go...");  return;}   //not last-job-done yet.

  console.error("[INFO] all items are done."); 

  //all done.
  output = output.join("\r\n");
  
  if(trim(output.replace(/[\r\n\s]+/gm, "")).length < 5){
    console.error("[ERROR] collected-output is too short.");
    process.exitCode = 111;
    console.error("[INFO] program ends with no STDOUT.");
    return;
    //no STDOUT output.
  }else{
    console.error("[INFO] collected-output is valid.");
    process.exitCode = 0;
    //write list
    console.error("[INFO] Success.");
    console.error("[INFO] writing to [" + file_out + "]:");
    console.error("======================================================================");
    console.error(output);
    console.error("======================================================================");
    fs.writeFileSync(file_out, output, CONF_WRITE); //overwrite

    //write download-helper (CMD) to re-start the aria-download later.
    console.error("[INFO] writing aria2c download-helper: [" + file_cmd + "]");
    fs.writeFileSync(file_cmd, TEMPLATE_CMD.replace("##FILE_OUT##", file_out), CONF_WRITE); //overwrite


    //STDOUT output: filename of the aria-compatible list.
    console.error("[INFO] program ends with this STDOUT: [" + file_out + "]");
    console.log("\"" + file_out + "\"");

    console.error("[ALL DONE] exit." + "\r\n");
  }

  process.exit();
}




/*****************
 * PROGRAM START *
 *****************/




if(lines.length > 10){ //only handle lists with up-to 10 URLs.
  console.error("[ERROR] ytdl2aria is limited to lists with up-to 10 URLs, due to YouTube-DL multi-process crash-issues. [" + file + "] has [" + lines.length + "] so it will be skipped. The caller application (ytdl.cmd?) will notified with exit-code (ErrorLevel) 999. It then should swith to using YouTube-DL's '--batch-file' argument." + "\r\n");
  process.exitCode = 999;
  process.exit();
}


console.error("[INFO] got [" + file + "] as an argument.");
console.error("[INFO] going to process [" + lines.length + "] items.");

lines.forEach(function(line, index){
  console.error("[INFO] processing line [#" + String(index+1) + "/" + String(lines.length) + "]: [" + line + "].");
  line = COMMAND.replace("##LINE##", line);
  console.error("[INFO] starting sub-process [#" + String(index+1) + "/" + String(lines.length) + "]: [" + line + "] ...");

  exec(line, CONF_EXEC, handler);
});

