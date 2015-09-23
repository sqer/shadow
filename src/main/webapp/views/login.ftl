<#ftl encoding='UTF-8'>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kapital Portal</title>
		<link rel="stylesheet" type="text/css" href="./styles/style_login.css" />
    </head>
    <body>
	  <div id="header_area">
  <div id="product"><img style="margin-top: -40px;margin-left: -40px;" src="images/logo_small.png" /></div>
<div id="logo" align="right"><!--<img src="./images/logo-lh.png" alt="logo lh"  border="0" />--></div>
  </div>
	
		<div class="wrapper">
		
			<div class="content">
				<div class="form_wrapper">
					<form id="loginForm" name="loginForm" action="j_spring_security_check" method="post" class="login active">
						<h3>Login to  Portal</h3>
						<div>
							<label>Nazwa użytkownika:</label>
							<input id="usernameField" type="text" name="j_username" TABINDEX="1"/>
						</div>
						<div>
							<label>Hasło:</label>
							<input id="passwordField" type="password" name="j_password" TABINDEX="2" />
											<#if Session.SPRING_SECURITY_LAST_EXCEPTION?? && Session.SPRING_SECURITY_LAST_EXCEPTION.message?has_content>
						<div class="error">
							
						<span id="infomessage" class="errormessage">
						Niepoprawny login i/lub hasło
						</span>
						
						</div>
						</#if>
						</div>
						<div class="bottom">
							
							<input class="button_style" type="submit" value="Zaloguj"></input>
							
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		   <div id="footer">
<div id="contact-footer">
@2013 Kapital Systems
</div>
</div>
    </body>
</html>