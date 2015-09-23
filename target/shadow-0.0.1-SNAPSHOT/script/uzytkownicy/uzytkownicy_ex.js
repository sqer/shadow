

function validate() {
	var valid = true;
	var imie = document.getElementById("imie");
	var nazwisko = document.getElementById("nazwisko");
	var login = document.getElementById("login");
	var haslo = document.getElementById("haslo");
	var rola = document.getElementById("rola");
	var telefon = document.getElementById("telefon");


	if (imie.value == "") {
		document.getElementById("uzytkownik_imie_error").innerHTML = "Imię użytkownika musi zostać uzupełnione";
		valid = false;
	} else {
		document.getElementById("uzytkownik_imie_error").innerHTML = "";
	}
	if (nazwisko.value == "") {
		document.getElementById("uzytkownik_nazwisko_error").innerHTML = "Nazwisko użytkownika musi zostać uzupełnione";
		valid = false;
	} else {
		document.getElementById("uzytkownik_nazwisko_error").innerHTML = "";
	}
	if (login.value == "") {
		document.getElementById("uzytkownik_login_error").innerHTML = "Login musi zostać uzupełniony";
		valid = false;
	} else {
		document.getElementById("uzytkownik_login_error").innerHTML = "";
	}
	if (haslo.value == "") {
		document.getElementById("uzytkownik_haslo_error").innerHTML = "Hasło musi zostać uzupełnione";
		valid = false;
	} else {
		document.getElementById("uzytkownik_haslo_error").innerHTML = "";
	}
	if (rola.value == "") {
		document.getElementById("uzytkownik_rola_error").innerHTML = "Rola musi zostać uzupełniona";
		valid = false;
	} else {
		document.getElementById("uzytkownik_rola_error").innerHTML = "";
	}
	if (telefon.value == "") {
		document.getElementById("uzytkownik_telefon_error").innerHTML = "Telefon musi zostać uzupełniony";
		valid = false;
	} else {
		document.getElementById("uzytkownik_telefon_error").innerHTML = "";
	}

	return valid;

}
