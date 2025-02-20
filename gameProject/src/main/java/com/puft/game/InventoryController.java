package com.puft.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InventoryController {

    @Autowired
    private InventoryDAO iDAO;  


    @RequestMapping(value = "/getAllInventory", method = RequestMethod.GET)
    public String viewInventory(HttpServletRequest req) {
        try {
            
            iDAO.selectAllInventory(req);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "main";
    }


    @RequestMapping(value = "/insertInventory", method = RequestMethod.GET)
    public String addInventory(HttpServletRequest req) {
        try {
      
            iDAO.insertInventory(req);
        } catch (Exception e) {
            e.printStackTrace();
        }

        
        return "main";  
    }
}
