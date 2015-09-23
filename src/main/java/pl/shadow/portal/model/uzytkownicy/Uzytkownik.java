package pl.shadow.portal.model.uzytkownicy;

import java.io.Serializable;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * 
 * Klasa odwzorowujaca kolumny w tabeli uzytkownik
 *
 */
public class Uzytkownik implements UserDetails, Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	private String login;

	private String haslo;

	private String rola;

	private String imie;

	private String nazwisko;

	private String telefon;

	private Collection<? extends GrantedAuthority> authorities;

	public Uzytkownik() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getHaslo() {
		return haslo;
	}

	public void setHaslo(String haslo) {
		this.haslo = haslo;
	}

	public String getRola() {
		return rola;
	}

	public void setRola(String rola) {
		this.rola = rola;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	@Override
	public String toString() {
		return "";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Uzytkownik) {
			Uzytkownik inst = (Uzytkownik) obj;

			if (id == inst.getId()) {
				return true;
			}
		}

		return false;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return this.authorities;
	}

	@Override
	public String getPassword() {
		return this.haslo;
	}

	@Override
	public String getUsername() {
		return this.login;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public void setAuthorities(
			Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

}
