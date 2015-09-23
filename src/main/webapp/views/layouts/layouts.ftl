<#macro basic title path>
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK REL=StyleSheet HREF="styles/style.css" TYPE="text/css">
		<!--[if IE]>
		<LINK REL=StyleSheet HREF="styles/style_ie.css" TYPE="text/css">
		<![endif]-->
			<LINK REL=StyleSheet HREF="styles/menu.css" TYPE="text/css">
			<LINK REL=StyleSheet HREF="styles/dialog.css" TYPE="text/css">
			<script type="text/javascript" src="script/menu/yahoo-dom-event.js"></script>
            <script type="text/javascript" src="script/menu/animation.js"></script>
            <script type="text/javascript" src="script/menu/container_core.js"></script>
			<script src="script/yui-min3.6.js"></script>
			<script type="text/javascript" src="script/menu/menu-min.js"></script>
			<link rel="stylesheet" type="text/css" href="styles/fonts-min.css" />
			<script type="text/javascript" src="script/yahoo-dom-event.js"></script>
			<script type="text/javascript" src="script/connection-min.js"></script>
			<script type="text/javascript" src="script/element-min.js"></script>
			<script type="text/javascript" src="script/container-min.js"></script>
			<script src="script/popup-calendar.js"></script>
			<script type="text/javascript" src="script/event-delegate-min.js"></script>
			<script type="text/javascript" src="script/datatable-min.js"></script>
			<script type="text/javascript" src="script/datasource-min.js"></script>
			<script type="text/javascript" src="script/event-delegate-min.js"></script>
	</head>
<body>
  <div id="container">
	<div id="header_area">
		<a name="top"></a>
		<div id="product"><a href="index.html" target="_self"><img style="margin-top: -40px;margin-left: -40px;" src="images/logo_small.png" /></a></div>
		<div id="logo" align="right"></div>
	</div>
	<div id="menu">
		<div class="yui-skin-sam" id="yahoo-com">
		<div id="doc" class="yui-t1">			
			<div id="menu_header">Kapital menu</div>			
				<div id="bd">
					<div id="yui-main">
						<div class="yui-b">
						<!-- MENU TOP -->
							<div id="menu-top" style="" >
								<div class="yui-b">
									 <!--  <div id="productsandservices" class="yuimenubar yuimenubarnav">
											<div class="bd">

												<ul style="margin-left:0px;width:100%" class="first-of-type">
													<li class="yuimenubaritem first-of-type" ><a class="yuimenubaritemlabel" href="#ConfigParams">ConfigParams</a>
								
														<div id="communication" class="yuimenu">
															<div class="bd">
																<ul id="menu_description">
																
																	<li class="custom_menu_item" >
																	<a class="menu_link" href="./params.html"><img style="menu_img" src="images/menu/bullet_2.png"/><font class="menu_link_text" >parameters</font></a>
																	<hr id="hr-menu"/>
																	<font class="description_text">
																	Table params of shadow instance
																	</font>
																	</li>
																</ul>
															</div>
														</div>      
													
													</li>
													<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="./business_services.html">Business services</a></li>
												</ul>            
											</div>
										</div>-->
								</div>
							</div>
								<!--
								<div id="hidemenu">
									<button id="hide" class="button_menu_style" style="margin-right:5px">>> Shadow menu</button>
								</div>
								<div id="showmenu">
									<button id="show" class="button_menu_style" style="margin-right:5px"><< Shadow menu</button>
								</div>
									 END MENU TOP -->
							<ul style="margin-top:0px;"id="crumbs">
								${title}
							</ul>	
							<div id="content">
								<noscript>
									<h3 id="no_js_enabled">WARNING: Javascript not enabled ! This page might not function correctly !</h3>
								</noscript>
								<#nested>
							</div>
						</div>
					</div>
					<#include "menu-left.ftl">
				</div>
			</div>
		</div>
	</div>
   </div>
	<div id="back-footer">
		<a href="#Top">
		<img src="images/arrow_up.png"/>
		Back to top</a>
	</div>
   <div id="footer">
		<div id="contact-footer">
			@ 2013 Shadow Systems
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
/*YUI().use('node', function(Y) {
node = Y.one('#productsandservices');
node2= Y.one('#showmenu');
node3= Y.one('#hidemenu');
node3.hide();
node2.hide();
node.hide();
});*/

//--------------------------------------------------
YAHOO.namespace("example.container");

YAHOO.util.Event.onDOMReady(function () {
	
	var handleSubmit = function() {
		this.submit();
	};
	var handleCancel = function() {
		this.cancel();
	};
	var handleSuccess = function(o) {
		var response = o.responseText;
		response = response.split("<!")[0];
		document.getElementById("resp").innerHTML = response;
	};
	var handleFailure = function(o) {
		alert("Submission failed: " + o.status);
	};

    // Remove progressively enhanced content class, just before creating the module
    YAHOO.util.Dom.removeClass("panel1", "yui-pe-content");

	// Instantiate the Dialog
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("panel1", 
							{ width : "30em",
							  fixedcenter : true,
							  visible : false, 
							  constraintoviewport : true,
							 
							});

	// Validate the entries in the form to require that both first and last name are entered
	YAHOO.example.container.dialog1.validate = function() {
		var data = this.getData();
		if (data.firstname == "" || data.lastname == "") {
			alert("Please enter your first and last names.");
			return false;
		} else {
			return true;
		}
	};

	// Wire up the success and failure handlers
	YAHOO.example.container.dialog1.callback = { success: handleSuccess,
						     failure: handleFailure };
	
	// Render the Dialog
	YAHOO.example.container.dialog1.render();

	YAHOO.util.Event.addListener("show_dialog", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);
});


</script>
</#macro>	



