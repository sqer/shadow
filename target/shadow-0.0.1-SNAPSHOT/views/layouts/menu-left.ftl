<div class="yui-skin-sam" id="yahoo-com">
   <div class="yui-b">
      <div id="menu-left" class="yuimenu">
         <div class="bd">
            <ul class="first-of-type">
               <li class="yuimenuitem first-of-type"><a class="yuimenuitemlabel" href="index.html">Strona główna</a>   
               </li>

<#if userDetails.getCurrentUser()?exists && userDetails.getCurrentUser().getRola()="ROLE_ADMIN">                   
            <hr class="hr_left_menu"/>
   <li class="yuimenuitem first-of-type"><a class="yuimenuitemlabel" href="uzytkownicy.html">Użytkownicy</a></li>
            </#if>
            </ul>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
   YAHOO.util.Event.onContentReady("menu-left", function () {
   
       var oMenu = new YAHOO.widget.Menu(
                           "menu-left", 
                           {
                               position: "static", 
                               hidedelay: 750, 
                               lazyload: true, 
                               effect: { 
                                   effect: YAHOO.widget.ContainerEffect.FADE,
                                   duration: 0.25
                               } 
                           }
                       );
       oMenu.render();            
   	
   });
</script>