var awsGet,awsReset,awsSet,get,reset,restore_options,save_options,set;save_options=function(){var e,t,o;for(console.log("save_options"),e=t=1;10>=t;e=++t)""!==document.getElementById("url"+e).value?set(e):reset(e);for(e=o=1;5>=o;e=++o)""!==document.getElementById("aws"+e).value?awsSet(e):awsReset(e);document.getElementById("status").innerHTML="Options Saved.",setTimeout(function(){document.getElementById("status").innerHTML=""},1e3)},restore_options=function(){var e,t,o;for(console.log("restore_options"),e=t=1;10>=t;e=++t)get(e);for(e=o=1;5>=o;e=++o)awsGet(e)},window.onload=function(){restore_options(),document.getElementById("save").onclick=function(){save_options()}},awsSet=function(e){var t;return console.log("set "+e),t={},t["aws"+e]=document.getElementById("aws"+e).value,t["awscolor"+e]=document.getElementById("awscolor"+e).value,chrome.storage.sync.set(t)},awsGet=function(e){return console.log("get "+e),chrome.storage.sync.get(["aws"+e,"awscolor"+e],function(t){return t["aws"+e]?(document.getElementById("aws"+e).value=t["aws"+e],document.getElementById("awscolor"+e).value=t["awscolor"+e]):void 0})},awsReset=function(e){var t;return console.log("awsreset "+e),t={},t["aws"+e]="",t["awscolor"+e]="",chrome.storage.sync.set(t)},set=function(e){var t;return console.log("set "+e),t={},t["url"+e]=document.getElementById("url"+e).value,t["color"+e]=document.getElementById("color"+e).value,t["message"+e]=document.getElementById("message"+e).value,chrome.storage.sync.set(t)},get=function(e){return console.log("get "+e),chrome.storage.sync.get(["url"+e,"color"+e,"message"+e],function(t){return t["url"+e]?(document.getElementById("url"+e).value=t["url"+e],document.getElementById("color"+e).value=t["color"+e],document.getElementById("message"+e).value=t["message"+e]):void 0})},reset=function(e){var t;return console.log("reset "+e),t={},t["url"+e]="",t["color"+e]="",t["message"+e]="",chrome.storage.sync.set(t)};