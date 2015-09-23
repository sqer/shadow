package pl.shadow.portal.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * 
 * Klasa przydatna do autentykacji uzytkownika opisuje co sie stanie gdy nie
 * powiedzie sie autentykacja
 * 
 */
public class AuthenticationProcessingFilter extends
		UsernamePasswordAuthenticationFilter {

	private ShadowUserDetailsService userDetailsService;

	/**
	 * otrzymywanie hasla
	 */
	@Override
	protected String obtainPassword(HttpServletRequest request) {
		String password = super.obtainPassword(request);
		return password;
	}

	/**
	 * dzialania gdy nie zalogowano
	 */
	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException failed)
			throws ServletException, IOException {

		System.out.println("Unsuccessful authentication");
		userDetailsService.setCurrentUser(null);

		super.unsuccessfulAuthentication(request, response, failed);
	}

	public ShadowUserDetailsService getShadowUserDetailsService() {
		return userDetailsService;
	}

	public void setShadowUserDetailsService(
			ShadowUserDetailsService shadowUserDetailsService) {
		this.userDetailsService = shadowUserDetailsService;
	}

}
