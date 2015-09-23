package pl.shadow.portal.web.controller.uzytkownicy;

import java.security.NoSuchAlgorithmException;
import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import pl.shadow.portal.model.uzytkownicy.Uzytkownik;
import pl.shadow.portal.service.uzytkownicy.UzytkownicyService;
import pl.shadow.portal.utils.Utils;

/**
 *
 * Kontroler widoku uzytkownicy
 *
 */
@Controller
public class UzytkownicyController {

    public static final String UZYTKOWNICY_HOME_CONTEXT_PATH = "/uzytkownicy";
    public static final String UZYTKOWNICY_HOME_PATH = "uzytkownicy/uzytkownicy";
    public static final String UZYTKOWNICY_EDIT_PATH = "uzytkownicy/uzytkownicy_edit";
    private static final Logger logger = LoggerFactory
            .getLogger(UzytkownicyController.class);
    @Autowired
    @Qualifier("defaultUzytkownicyService")
    private UzytkownicyService uzytkownicyService;

    @ModelAttribute
    public void initModel(ModelMap model) {
        // init defualt variables
    }

    /**
     * glowny widok uzytkownicy
     *
     */
    @RequestMapping(value = UZYTKOWNICY_HOME_CONTEXT_PATH)
    public String home(ModelMap model, Principal principal) {

        if (uzytkownicyService.getUzytkownicyList() != null
                || !uzytkownicyService.getUzytkownicyList().isEmpty()) {
            model.addAttribute("uzytkownicy_list",
                    uzytkownicyService.getUzytkownicyList());
        }

        model.addAttribute("uzytkownik", new Uzytkownik());

        return UZYTKOWNICY_HOME_PATH;
    }

    /**
     *
     * zapis uzytkownika
     *
     */
    @RequestMapping(method = RequestMethod.POST, value = UZYTKOWNICY_HOME_CONTEXT_PATH, params = "mode=create")
    public String createReceived(Uzytkownik uzytkownik, WebRequest request,
            BindingResult bindingResult, ModelMap model) {

        String rola = convertRole(request.getParameter("rola"));
        uzytkownik.setRola(rola);

        try {
            uzytkownik.setHaslo(Utils.encodePassword(uzytkownik.getHaslo()));
        } catch (NoSuchAlgorithmException e) {
            logger.error(e.getMessage());
        }

        uzytkownicyService.persist(uzytkownik);

        return "redirect:uzytkownicy.html";
    }

    /**
     *
     * usuwanie uzytkownika
     *
     */
    @RequestMapping(method = RequestMethod.POST, value = UZYTKOWNICY_HOME_CONTEXT_PATH, params = "mode=delete")
    public String deleteReceived(WebRequest request, ModelMap model) {

        Integer id = Integer.parseInt(request.getParameter("id_uzytkownika"));

        if (id != null) {
            uzytkownicyService.delete(id);
        }

        return "redirect:uzytkownicy.html";
    }

    /**
     *
     * widok edycji uzytkownika
     *
     */
    @RequestMapping(method = RequestMethod.POST, value = UZYTKOWNICY_HOME_CONTEXT_PATH, params = "mode=edit")
    public String editReceived(WebRequest request, ModelMap model) {

        Integer id = Integer.parseInt(request.getParameter("id_uzytkownika"));

        if (id != null) {
            Uzytkownik uzytkownik = uzytkownicyService.getUzytkownikById(id);
            if (uzytkownik != null) {
                model.addAttribute("uzytkownik", uzytkownik);
            }
        }

        return UZYTKOWNICY_EDIT_PATH;
    }

    /**
     *
     * aktualizacja uzytkownika
     *
     */
    @RequestMapping(method = RequestMethod.POST, value = UZYTKOWNICY_HOME_CONTEXT_PATH, params = "mode=update")
    public String updateSended(Uzytkownik uzytkownik, WebRequest request,
            ModelMap model) {

        Integer id = Integer.parseInt(request.getParameter("id_uzytkownika"));
        uzytkownik.setId(id);
        String rola = convertRole(request.getParameter("rola"));
        uzytkownik.setRola(rola);

        try {
            uzytkownik.setHaslo(Utils.encodePassword(uzytkownik.getHaslo()));
            uzytkownicyService.changePassword(uzytkownik);
        } catch (NoSuchAlgorithmException e) {
            logger.error(e.getMessage());
        }

        uzytkownicyService.update(uzytkownik);

        return "redirect:uzytkownicy.html";
    }

    /**
     *
     * zmienia nazwe roli na poprawna nazwe do zapisu w bazie danych
     *
     */
    private String convertRole(String role) {
        if (role != null) {
            if (role.equals("administrator")) {
                return "ROLE_ADMIN";
            } else if (role.equals("kierownik")) {
                return "ROLE_MANAGER";
            } else {
                return "ROLE_USER";
            }
        }
        return null;
    }
}
