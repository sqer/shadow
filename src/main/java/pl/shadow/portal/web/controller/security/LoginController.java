/*
 * $Id$
 *
 * Copyright (C) 2005-2012 Lufthansa Systems AG.  All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Lufthansa Systems AG.
 */

package pl.shadow.portal.web.controller.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * Kontroler widoku logowania
 * 
 */
@Controller
@RequestMapping("/")
public class LoginController {

    @RequestMapping("login")
    public String getLoginPage(){
        return "login";
    }
    
    @RequestMapping("logout")
    public String getLogoutPage(){
        return "login";
    }
    
    @RequestMapping("denied")
    public String getDeniedPage(){
        return "denied";
    }
}
