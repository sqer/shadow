package pl.shadow.portal.security;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Formatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.test.context.ContextConfiguration;

import pl.shadow.portal.model.uzytkownicy.Uzytkownik;
import pl.shadow.portal.persistence.uzytkownicy.UzytkownicyMapper;

/**
 * 
 *Klasa autentykujaca uzytkownika za pomoca loginu i hasła 
 * 
 */

@ContextConfiguration(locations = { "classpath:META-INF/spring/applicationContext-data.xml" })
public class ShadowUserDetailsService implements UserDetailsService {

	@Autowired
	UzytkownicyMapper uzytkownicyMapper;

	private Uzytkownik currentUser;
	private GrantedAuthority adminAuthority = new GrantedAuthority() {
		private static final long serialVersionUID = 1L;

		@Override
		public String getAuthority() {
			return "ROLE_ADMIN";
		}
	};;
	private GrantedAuthority userAuthority = new GrantedAuthority() {
		private static final long serialVersionUID = 1L;

		@Override
		public String getAuthority() {
			return "ROLE_USER";
		}
	};

	/**
	 * ladowanie podanych danych podczas logowania i sprawdzanie czy uzytkownik istnieje
	 * jesli tak to pobierane sa jego role : admin lub user
	 */
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Uzytkownik uzytkownik = uzytkownicyMapper.getUzytkownikByName(username);
		if (uzytkownik != null) {
			if (uzytkownik.getRola().equals("ROLE_ADMIN")) {
				Collection<? extends GrantedAuthority> authorities = getAdminAuthorities();
				uzytkownik.setAuthorities(authorities);
				currentUser = uzytkownik;
				return uzytkownik;
			}
			else{
				Collection<? extends GrantedAuthority> authorities = getUserAuthorities();
				uzytkownik.setAuthorities(authorities);
				currentUser = uzytkownik;
				return uzytkownik;
			}

		} else {
			this.currentUser = null;
			throw new UsernameNotFoundException("Użytkownik " + username
					+ " nie został znaleziony.");
		}
	}
	
	private static String encryptPassword(String password)
	{
	    String sha1 = "";
	    try
	    {
	        MessageDigest crypt = MessageDigest.getInstance("SHA-1");
	        crypt.reset();
	        crypt.update(password.getBytes("UTF-8"));
	        sha1 = byteToHex(crypt.digest());
	    }
	    catch(NoSuchAlgorithmException e)
	    {
	        e.printStackTrace();
	    }
	    catch(UnsupportedEncodingException e)
	    {
	        e.printStackTrace();
	    }
	    return sha1;
	}

	private static String byteToHex(final byte[] hash)
	{
	    Formatter formatter = new Formatter();
	    for (byte b : hash)
	    {
	        formatter.format("%02x", b);
	    }
	    String result = formatter.toString();
	    formatter.close();
	    return result;
	}

	private Collection<? extends GrantedAuthority> getAdminAuthorities() {
		List<GrantedAuthority> autorithies = new ArrayList<GrantedAuthority>();
		autorithies.add(adminAuthority);
		return autorithies;
	}

	private Collection<? extends GrantedAuthority> getUserAuthorities() {
		List<GrantedAuthority> autorithies = new ArrayList<GrantedAuthority>();
		autorithies.add(userAuthority);
		return autorithies;
	}

	public UserDetails getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(Uzytkownik currentUser) {
		this.currentUser = currentUser;
	}

}
