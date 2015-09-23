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
	<input type="hidden" name="mode" id="mode" value="create"/>
	<div id="create_form_header" >Dodaj nowy wpis</div>
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
						<option>użytkownik</option>
                                                <option>kierownik</option>
						<option>administrator</option>
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
			<td><input type="button" onclick="submitForm()" style="max-width:70px" class="button_style" value="Dodaj" /></td>
		</tr>
	</table>
	</div>
</form>
	
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Imię</th>
			<th>Nazwisko</th>
			<th>Login</th>
			<th>Rola</th>
			<th>Akcje</th>
		</tr>
	</thead>
	<tbody>
	<#if uzytkownicy_list?exists>
		<#list uzytkownicy_list as uztykownicy>
		<tr class="gradeX">
			<td>${uztykownicy.imie?if_exists}</td>
			<td>${uztykownicy.nazwisko?if_exists}</td>
			<td>${uztykownicy.login?if_exists}</td>
			<#if uztykownicy.rola = "ROLE_ADMIN">
			<td>administrator</td>
			<#elseif  uztykownicy.rola = "ROLE_MANAGER">
                        <td>kierownik</td> 
                        <#else>
			<td>użytkownik</td>
			</#if>
			<td style="max-width:20px">
			<form id="edit" action="" method="POST" style="display:inline">
				<input type="hidden" name="mode" id="mode" value="edit"/>
				<input type="hidden" name="id_uzytkownika" id="id_uzytkownika" value="${uztykownicy.id}"/>
			 	<input class="button_as_link" type="submit" value="Edytuj" />
			</form> / 
			<form id="delete" action="" method="POST" style="display:inline">
				<input type="hidden" name="mode" id="mode" value="delete"/>
				<input type="hidden" name="id_uzytkownika" id="id_uzytkownika" value="${uztykownicy.id}"/>
			 	<input class="button_as_link" type="submit" value="Usuń" />
			</form>
			</td>
		</tr>
		</#list>
	</#if>
	</tbody>
</table>

<script type="text/javascript">
	$(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({allow_single_deselect:true});
</script>

      
</@layout.basic>