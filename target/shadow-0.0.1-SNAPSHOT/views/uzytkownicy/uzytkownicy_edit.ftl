<#ftl encoding='UTF-8'>
<@layout.basic title="<li><a href='uzytkownicy.html'>Uzytkownicy</a></li>" path="./">
	 	
	 	<!-- STYLES -->
	 	<link rel="stylesheet" href="script/chosen.css" />
	 	<link rel="stylesheet" href="styles/jquery.datepick.css" />
	 	<link rel="stylesheet" href="styles/uzytkownicy.css" />
	 	<link rel="stylesheet" href="styles/main.css" />
	 	<style type="text/css" title="currentStyle">
			@import "styles/demo_table_jui.css";
			@import "styles/jquery-ui-1.8.4.custom.css";
		</style>
		
	 	<!-- SCRIPTS -->
	 	
		<script type="text/javascript" language="javascript" src="script/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="script/jquery.dataTables.js"></script>
		<script src="script/jquery.datepick.js"></script>
    	<script src="script/jquery.datepick-pl.js"></script>
    	<script src="script/uzytkownicy/uzytkownicy.js"></script>
    	<script src="script/uzytkownicy/uzytkownicy_ex.js"></script>
    	<script src="script/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				oTable = $('#example').dataTable({
					"bJQueryUI": true,
					"sPaginationType": "full_numbers"
				});
			} );
		</script> 
  
<form id="main_form" action="" method="POST">
	<input type="hidden" name="mode" id="mode" value="update"/>
	<input type="hidden" name="id_uzytkownika" id="id_uzytkownika" value="${uzytkownik.id}"/>
	<div id="create_form_header" >Edytuj wpis</div>
	<div id="create_form">
	<table class="table_create" id="create_table">
			<tr>
			<td style="min-width:120px;">Imię uzytkownika:</td>
			<td class="tableTd">
      			<@spring.formInput "uzytkownik.imie" />
			</td>
			<td style="min-width:150px;">Nazwisko uzytkownika:</td>
			<td class="tableTd">
				<@spring.formInput "uzytkownik.nazwisko" />
			</td>
		</tr>
		<tr>
			<td></td><td><span class="error" id="uzytkownik_imie_error"></span></td>
			<td></td><td><span class="error" id="uzytkownik_nazwisko_error"></span></td>
		</tr>
		<tr>
			<td>Login:</td>
			<td><@spring.formInput "uzytkownik.login" /></td>
			<td>Hasło:</td>
			<td><@spring.formPasswordInput "uzytkownik.haslo" /></td>
		</tr>
		<tr>
			<td></td><td><span class="error" id="uzytkownik_login_error"></span></td>
			<td></td><td><span class="error" id="uzytkownik_haslo_error"></span></td>
		</tr>
		<tr>
			<td>Rola:</td>
			<td>
      			<div id="div_kontrahent">     
       				 <select id="rola" name="rola"  data-placeholder="Wybierz rolę..." class="chzn-select" tabindex="2">
          				<option value=""></option> 
						<#if uzytkownik.rola="ROLE_ADMIN">
						<option>użytkownik</option>
                                                 <option>kierownik</option>
						<option SELECTED>administrator</option>
						<#elseif uzytkownik.rola="ROLE_MANAGER">
                                                <option SELECTED>kierownik</option>
                                                <option>użytkownik</option>
						<option>administrator</option>
                                                <#else>
						<option SELECTED>użytkownik</option>
						<option>administrator</option>
                                                <option>kierownik</option>
						</#if>
       				 </select>
    			</div>
			</td>
			<td>Telefon:</td>
			<td><@spring.formInput "uzytkownik.telefon" /></td>
		</tr>
		<tr>
			<td></td><td><span class="error" id="uzytkownik_rola_error"></span></td>
			<td></td><td><span class="error" id="uzytkownik_telefon_error"></span></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" onclick="submitForm()" style="width:80px" class="button_style" value="Zapisz" />
			<input type="button" onclick="window.location.href='uzytkownicy.html'" style="width:80px" class="button_style" value="Cofnij" /></td>
		</tr>
	</table>
	</div>
</form>
<script type="text/javascript">

	$(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({allow_single_deselect:true});

</script>
      
</@layout.basic>