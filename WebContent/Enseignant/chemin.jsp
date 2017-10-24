var currentLocation = document.location.href;
var current = currentLocation.substring(currentLocation.indexOf("/",10),currentLocation.lastIndexOf("/"))+"/";
current = current.substring(0,current.indexOf("/",3));
var chemin = current+'/';