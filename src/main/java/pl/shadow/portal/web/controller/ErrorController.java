package pl.shadow.portal.web.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * Kontroler bledow, przekierowanie po bledzie na konkretna strone
 * 
 */
@Controller
public class ErrorController {
	private static final Logger logger = LoggerFactory
			.getLogger(ErrorController.class);

	@RequestMapping(method = RequestMethod.GET, value = "/PageNotFound")
	public String notFoundError(ModelMap model) {
		return "PageNotFound";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/ServletErrorView")
	public String servletError(ModelMap model) {
		return "ServletErrorView";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/Error")
	public String error(ModelMap model) {
		return "errors/error";
	}
	

}
