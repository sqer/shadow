(function(){var b=YAHOO.util;var a=function(f,e,c,d){if(!f){}this.init(f,e,c,d)};a.NAME="Anim";a.prototype={toString:function(){var c=this.getEl()||{};var d=c.id||c.tagName;return(this.constructor.NAME+": "+d)},patterns:{noNegatives:/width|height|opacity|padding/i,offsetAttribute:/^((width|height)|(top|left))$/,defaultUnit:/width|height|top$|bottom$|left$|right$/i,offsetUnit:/\d+(em|%|en|ex|pt|in|cm|mm|pc)$/i},doMethod:function(d,c,e){return this.method(this.currentFrame,c,e-c,this.totalFrames)},setAttribute:function(e,d,c){var f=this.getEl();if(this.patterns.noNegatives.test(e)){d=(d>0)?d:0}if(e in f&&!("style" in f&&e in f.style)){f[e]=d}else{b.Dom.setStyle(f,e,d+c)}},getAttribute:function(g){var c=this.getEl();var e=b.Dom.getStyle(c,g);if(e!=="auto"&&!this.patterns.offsetUnit.test(e)){return parseFloat(e)}var h=this.patterns.offsetAttribute.exec(g)||[];var f=!!(h[3]);var d=!!(h[2]);if("style" in c){if(d||(b.Dom.getStyle(c,"position")=="absolute"&&f)){e=c["offset"+h[0].charAt(0).toUpperCase()+h[0].substr(1)]}else{e=0}}else{if(g in c){e=c[g]}}return e},getDefaultUnit:function(c){if(this.patterns.defaultUnit.test(c)){return"px"}return""},setRuntimeAttribute:function(d){var j;var c;var f=this.attributes;this.runtimeAttributes[d]={};var h=function(i){return(typeof i!=="undefined")};if(!h(f[d]["to"])&&!h(f[d]["by"])){return false}j=(h(f[d]["from"]))?f[d]["from"]:this.getAttribute(d);if(h(f[d]["to"])){c=f[d]["to"]}else{if(h(f[d]["by"])){if(j.constructor==Array){c=[];for(var g=0,e=j.length;g<e;++g){c[g]=j[g]+f[d]["by"][g]*1}}else{c=j+f[d]["by"]*1}}}this.runtimeAttributes[d].start=j;this.runtimeAttributes[d].end=c;this.runtimeAttributes[d].unit=(h(f[d].unit))?f[d]["unit"]:this.getDefaultUnit(d);return true},init:function(d,c,f,i){var h=false;var g=null;var e=0;d=b.Dom.get(d);this.attributes=c||{};this.duration=!YAHOO.lang.isUndefined(f)?f:1;this.method=i||b.Easing.easeNone;this.useSeconds=true;this.currentFrame=0;this.totalFrames=b.AnimMgr.fps;this.setEl=function(j){d=b.Dom.get(j)};this.getEl=function(){return d};this.isAnimated=function(){return h};this.getStartTime=function(){return g};this.runtimeAttributes={};this.animate=function(){if(this.isAnimated()){return false}this.currentFrame=0;this.totalFrames=(this.useSeconds)?Math.ceil(b.AnimMgr.fps*this.duration):this.duration;if(this.duration===0&&this.useSeconds){this.totalFrames=1}b.AnimMgr.registerElement(this);return true};this.stop=function(j){if(!this.isAnimated()){return false}if(j){this.currentFrame=this.totalFrames;this._onTween.fire()}b.AnimMgr.stop(this)};this._handleStart=function(){this.onStart.fire();this.runtimeAttributes={};for(var j in this.attributes){if(this.attributes.hasOwnProperty(j)){this.setRuntimeAttribute(j)}}h=true;e=0;g=new Date()};this._handleTween=function(){var l={duration:new Date()-this.getStartTime(),currentFrame:this.currentFrame};l.toString=function(){return("duration: "+l.duration+", currentFrame: "+l.currentFrame)};this.onTween.fire(l);var k=this.runtimeAttributes;for(var j in k){if(k.hasOwnProperty(j)){this.setAttribute(j,this.doMethod(j,k[j].start,k[j].end),k[j].unit)}}this.afterTween.fire(l);e+=1};this._handleComplete=function(){var j=(new Date()-g)/1000;var k={duration:j,frames:e,fps:e/j};k.toString=function(){return("duration: "+k.duration+", frames: "+k.frames+", fps: "+k.fps)};h=false;e=0;this.onComplete.fire(k)};this._onStart=new b.CustomEvent("_start",this,true);this.onStart=new b.CustomEvent("start",this);this.onTween=new b.CustomEvent("tween",this);this.afterTween=new b.CustomEvent("afterTween",this);this._onTween=new b.CustomEvent("_tween",this,true);this.onComplete=new b.CustomEvent("complete",this);this._onComplete=new b.CustomEvent("_complete",this,true);this._onStart.subscribe(this._handleStart);this._onTween.subscribe(this._handleTween);this._onComplete.subscribe(this._handleComplete)}};b.Anim=a})();YAHOO.util.AnimMgr=new function(){var e=null;var c=[];var g=0;this.fps=1000;this.delay=20;this.registerElement=function(j){c[c.length]=j;g+=1;j._onStart.fire();this.start()};var f=[];var d=false;var h=function(){var j=f.shift();b.apply(YAHOO.util.AnimMgr,j);if(f.length){arguments.callee()}};var b=function(k,j){j=j||a(k);if(!k.isAnimated()||j===-1){return false}k._onComplete.fire();c.splice(j,1);g-=1;if(g<=0){this.stop()}return true};this.unRegister=function(){f.push(arguments);if(!d){d=true;h();d=false}};this.start=function(){if(e===null){e=setInterval(this.run,this.delay)}};this.stop=function(j){if(!j){clearInterval(e);for(var l=0,k=c.length;l<k;++l){this.unRegister(c[0],0)}c=[];e=null;g=0}else{this.unRegister(j)}};this.run=function(){for(var j=0,k=c.length;j<k;++j){var l=c[j];if(!l||!l.isAnimated()){continue}if(l.currentFrame<l.totalFrames||l.totalFrames===null){l.currentFrame+=1;if(l.useSeconds){i(l)}l._onTween.fire()}else{YAHOO.util.AnimMgr.stop(l,j)}}};var a=function(j){for(var l=0,k=c.length;l<k;++l){if(c[l]===j){return l}}return -1};var i=function(m){var j=m.totalFrames;var o=m.currentFrame;var n=(m.currentFrame*m.duration*1000/m.totalFrames);var l=(new Date()-m.getStartTime());var k=0;if(l<m.duration*1000){k=Math.round((l/n-1)*m.currentFrame)}else{k=j-(o+1)}if(k>0&&isFinite(k)){if(m.currentFrame+k>=j){k=j-(o+1)}m.currentFrame+=k}};this._queue=c;this._getIndex=a};YAHOO.util.Bezier=new function(){this.getPosition=function(a,f){var b=a.length;var e=[];for(var d=0;d<b;++d){e[d]=[a[d][0],a[d][1]]}for(var c=1;c<b;++c){for(d=0;d<b-c;++d){e[d][0]=(1-f)*e[d][0]+f*e[parseInt(d+1,10)][0];e[d][1]=(1-f)*e[d][1]+f*e[parseInt(d+1,10)][1]}}return[e[0][0],e[0][1]]}};(function(){var c=function(h,g,e,f){c.superclass.constructor.call(this,h,g,e,f)};c.NAME="ColorAnim";c.DEFAULT_BGCOLOR="#fff";var a=YAHOO.util;YAHOO.extend(c,a.Anim);var b=c.superclass;var d=c.prototype;d.patterns.color=/color$/i;d.patterns.rgb=/^rgb\(([0-9]+)\s*,\s*([0-9]+)\s*,\s*([0-9]+)\)$/i;d.patterns.hex=/^#?([0-9A-F]{2})([0-9A-F]{2})([0-9A-F]{2})$/i;d.patterns.hex3=/^#?([0-9A-F]{1})([0-9A-F]{1})([0-9A-F]{1})$/i;d.patterns.transparent=/^transparent|rgba\(0, 0, 0, 0\)$/;d.parseColor=function(e){if(e.length==3){return e}var f=this.patterns.hex.exec(e);if(f&&f.length==4){return[parseInt(f[1],16),parseInt(f[2],16),parseInt(f[3],16)]}f=this.patterns.rgb.exec(e);if(f&&f.length==4){return[parseInt(f[1],10),parseInt(f[2],10),parseInt(f[3],10)]}f=this.patterns.hex3.exec(e);if(f&&f.length==4){return[parseInt(f[1]+f[1],16),parseInt(f[2]+f[2],16),parseInt(f[3]+f[3],16)]}return null};d.getAttribute=function(e){var g=this.getEl();if(this.patterns.color.test(e)){var i=YAHOO.util.Dom.getStyle(g,e);var h=this;if(this.patterns.transparent.test(i)){var f=YAHOO.util.Dom.getAncestorBy(g,function(j){return !h.patterns.transparent.test(i)});if(f){i=a.Dom.getStyle(f,e)}else{i=c.DEFAULT_BGCOLOR}}}else{i=b.getAttribute.call(this,e)}return i};d.doMethod=function(e,j,k){var g;if(this.patterns.color.test(e)){g=[];for(var f=0,h=j.length;f<h;++f){g[f]=b.doMethod.call(this,e,j[f],k[f])}g="rgb("+Math.floor(g[0])+","+Math.floor(g[1])+","+Math.floor(g[2])+")"}else{g=b.doMethod.call(this,e,j,k)}return g};d.setRuntimeAttribute=function(e){b.setRuntimeAttribute.call(this,e);if(this.patterns.color.test(e)){var g=this.attributes;var j=this.parseColor(this.runtimeAttributes[e].start);var k=this.parseColor(this.runtimeAttributes[e].end);if(typeof g[e]["to"]==="undefined"&&typeof g[e]["by"]!=="undefined"){k=this.parseColor(g[e].by);for(var f=0,h=j.length;f<h;++f){k[f]=j[f]+k[f]}}this.runtimeAttributes[e].start=j;this.runtimeAttributes[e].end=k}};a.ColorAnim=c})();
/*!
TERMS OF USE - EASING EQUATIONS
Open source under the BSD License.
Copyright 2001 Robert Penner All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
YAHOO.util.Easing={easeNone:function(e,a,g,f){return g*e/f+a},easeIn:function(e,a,g,f){return g*(e/=f)*e+a},easeOut:function(e,a,g,f){return -g*(e/=f)*(e-2)+a},easeBoth:function(e,a,g,f){if((e/=f/2)<1){return g/2*e*e+a}return -g/2*((--e)*(e-2)-1)+a},easeInStrong:function(e,a,g,f){return g*(e/=f)*e*e*e+a},easeOutStrong:function(e,a,g,f){return -g*((e=e/f-1)*e*e*e-1)+a},easeBothStrong:function(e,a,g,f){if((e/=f/2)<1){return g/2*e*e*e*e+a}return -g/2*((e-=2)*e*e*e-2)+a},elasticIn:function(i,h,k,f,g,j){if(i==0){return h}if((i/=f)==1){return h+k}if(!j){j=f*0.3}if(!g||g<Math.abs(k)){g=k;var e=j/4}else{var e=j/(2*Math.PI)*Math.asin(k/g)}return -(g*Math.pow(2,10*(i-=1))*Math.sin((i*f-e)*(2*Math.PI)/j))+h},elasticOut:function(i,h,k,f,g,j){if(i==0){return h}if((i/=f)==1){return h+k}if(!j){j=f*0.3}if(!g||g<Math.abs(k)){g=k;var e=j/4}else{var e=j/(2*Math.PI)*Math.asin(k/g)}return g*Math.pow(2,-10*i)*Math.sin((i*f-e)*(2*Math.PI)/j)+k+h},elasticBoth:function(i,h,k,f,g,j){if(i==0){return h}if((i/=f/2)==2){return h+k}if(!j){j=f*(0.3*1.5)}if(!g||g<Math.abs(k)){g=k;var e=j/4}else{var e=j/(2*Math.PI)*Math.asin(k/g)}if(i<1){return -0.5*(g*Math.pow(2,10*(i-=1))*Math.sin((i*f-e)*(2*Math.PI)/j))+h}return g*Math.pow(2,-10*(i-=1))*Math.sin((i*f-e)*(2*Math.PI)/j)*0.5+k+h},backIn:function(e,a,h,g,f){if(typeof f=="undefined"){f=1.70158}return h*(e/=g)*e*((f+1)*e-f)+a},backOut:function(e,a,h,g,f){if(typeof f=="undefined"){f=1.70158}return h*((e=e/g-1)*e*((f+1)*e+f)+1)+a},backBoth:function(e,a,h,g,f){if(typeof f=="undefined"){f=1.70158}if((e/=g/2)<1){return h/2*(e*e*(((f*=(1.525))+1)*e-f))+a}return h/2*((e-=2)*e*(((f*=(1.525))+1)*e+f)+2)+a},bounceIn:function(e,a,g,f){return g-YAHOO.util.Easing.bounceOut(f-e,0,g,f)+a},bounceOut:function(e,a,g,f){if((e/=f)<(1/2.75)){return g*(7.5625*e*e)+a}else{if(e<(2/2.75)){return g*(7.5625*(e-=(1.5/2.75))*e+0.75)+a}else{if(e<(2.5/2.75)){return g*(7.5625*(e-=(2.25/2.75))*e+0.9375)+a}}}return g*(7.5625*(e-=(2.625/2.75))*e+0.984375)+a},bounceBoth:function(e,a,g,f){if(e<f/2){return YAHOO.util.Easing.bounceIn(e*2,0,g,f)*0.5+a}return YAHOO.util.Easing.bounceOut(e*2-f,0,g,f)*0.5+g*0.5+a}};(function(){var c=function(j,i,g,h){if(j){c.superclass.constructor.call(this,j,i,g,h)}};c.NAME="Motion";var a=YAHOO.util;YAHOO.extend(c,a.ColorAnim);var b=c.superclass;var e=c.prototype;e.patterns.points=/^points$/i;e.setAttribute=function(h,g,i){if(this.patterns.points.test(h)){i=i||"px";b.setAttribute.call(this,"left",g[0],i);b.setAttribute.call(this,"top",g[1],i)}else{b.setAttribute.call(this,h,g,i)}};e.getAttribute=function(g){if(this.patterns.points.test(g)){var h=[b.getAttribute.call(this,"left"),b.getAttribute.call(this,"top")]}else{h=b.getAttribute.call(this,g)}return h};e.doMethod=function(g,k,h){var j=null;if(this.patterns.points.test(g)){var i=this.method(this.currentFrame,0,100,this.totalFrames)/100;j=a.Bezier.getPosition(this.runtimeAttributes[g],i)}else{j=b.doMethod.call(this,g,k,h)}return j};e.setRuntimeAttribute=function(o){if(this.patterns.points.test(o)){var g=this.getEl();var i=this.attributes;var p;var k=i.points.control||[];var h;var l,n;if(k.length>0&&!(k[0] instanceof Array)){k=[k]}else{var j=[];for(l=0,n=k.length;l<n;++l){j[l]=k[l]}k=j}if(a.Dom.getStyle(g,"position")=="static"){a.Dom.setStyle(g,"position","relative")}if(f(i.points.from)){a.Dom.setXY(g,i.points.from)}else{a.Dom.setXY(g,a.Dom.getXY(g))}p=this.getAttribute("points");if(f(i.points.to)){h=d.call(this,i.points.to,p);var m=a.Dom.getXY(this.getEl());for(l=0,n=k.length;l<n;++l){k[l]=d.call(this,k[l],p)}}else{if(f(i.points.by)){h=[p[0]+i.points.by[0],p[1]+i.points.by[1]];for(l=0,n=k.length;l<n;++l){k[l]=[p[0]+k[l][0],p[1]+k[l][1]]}}}this.runtimeAttributes[o]=[p];if(k.length>0){this.runtimeAttributes[o]=this.runtimeAttributes[o].concat(k)}this.runtimeAttributes[o][this.runtimeAttributes[o].length]=h}else{b.setRuntimeAttribute.call(this,o)}};var d=function(h,g){var i=a.Dom.getXY(this.getEl());h=[h[0]-i[0]+g[0],h[1]-i[1]+g[1]];return h};var f=function(g){return(typeof g!=="undefined")};a.Motion=c})();(function(){var b=function(h,g,e,f){if(h){b.superclass.constructor.call(this,h,g,e,f)}};b.NAME="Scroll";var d=YAHOO.util;YAHOO.extend(b,d.ColorAnim);var a=b.superclass;var c=b.prototype;c.doMethod=function(g,f,h){var e=null;if(g=="scroll"){e=[this.method(this.currentFrame,f[0],h[0]-f[0],this.totalFrames),this.method(this.currentFrame,f[1],h[1]-f[1],this.totalFrames)]}else{e=a.doMethod.call(this,g,f,h)}return e};c.getAttribute=function(f){var e=null;var g=this.getEl();if(f=="scroll"){e=[g.scrollLeft,g.scrollTop]}else{e=a.getAttribute.call(this,f)}return e};c.setAttribute=function(g,f,e){var h=this.getEl();if(g=="scroll"){h.scrollLeft=f[0];h.scrollTop=f[1]}else{a.setAttribute.call(this,g,f,e)}};d.Scroll=b})();YAHOO.register("animation",YAHOO.util.Anim,{version:"2.9.0",build:"2800"});