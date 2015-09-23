/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.shadow.portal.web.controller;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import pl.shadow.portal.service.uzytkownicy.UzytkownicyService;

/**
 *
 * @author tomasz
 */
public class AbstractController {

    @Autowired
    @Qualifier("defaultUzytkownicyService")
    private UzytkownicyService uzytkownicyService;


}
