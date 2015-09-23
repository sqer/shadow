package pl.shadow.portal.web.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * Kontroler widoku index
 * 
 */
@Controller
public class MainController {
	private static final Logger logger = LoggerFactory
			.getLogger(MainController.class);

	/**
	 * 
	 * widok index
	 * 
	 */
	@RequestMapping(value = "/index")
	public String index(Model model, Principal principal) {
		String username = principal.getName();
		model.addAttribute("user", username != null ? username : "");
		return "index";
	}



}
