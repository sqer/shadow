YUI({insertBefore:"over"});YUI().use("slider",function(d){var b,e;function a(g){var f=this.getData(),h=f.slider,i=parseInt(this.get("value"),10);if(f.wait){f.wait.cancel()}f.wait=d.later(200,h,function(){f.wait=null;this.set("value",i)})}function c(f){this.set("value",f.newVal)}b=d.one("#hour");b.setData("slider",new d.Slider({axis:"x",min:0,max:23,value:0,length:"80px",after:{valueChange:d.bind(c,b)}}).render(".h_slider")).on("keyup",a);e=d.one("#minute");e.setData("slider",new d.Slider({axis:"x",min:0,max:60,value:0,length:"80px",after:{valueChange:d.bind(c,e)}}).render(".m_slider")).on("keyup",a)});YUI().use("popup-calendar",function(c){var a=c.one("form input[name=date]"),b=new c.PopupCalendar({input:a,autoFocusOnFieldFocus:false,autoTabIndexFormElements:false,width:"400px",showPrevMonth:true,showNextMonth:true,date:new Date(),align:{node:a,points:[c.WidgetPositionAlign.TL,c.WidgetPositionAlign.TR]}});b.on("dateSelected",function(h){var f=h.newSelection[0];var d=f.getDate();var i=f.getMonth()+1;var g="";var e="";if(i<10){g="0"+i}else{g=i}if(d<10){e="0"+d}else{e=d}b.get("input").set("value",f.getFullYear()+"-"+g+"-"+e)})});