function showMessage(){YUI().use("transition","panel",function(l){var h=l.one("#openButton"),j,g;function k(){j.show();g.transition({duration:0,top:"30%"})}function i(){g.transition({duration:0,top:"-300px"},function(){j.hide()})}j=new l.Panel({srcNode:"#panelContent",width:330,centered:true,zIndex:5,modal:true,visible:true,render:true,buttons:[{value:"Close",section:"footer",action:function(a){a.preventDefault();i()}}]});g=j.get("boundingBox");k()});YUI().use("transition","panel",function(b){panel.show();bb.transition({duration:0,top:"80px"})})};