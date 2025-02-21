package com.puft.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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


    @RequestMapping(value = "/insertInventory", method = RequestMethod.POST)
    public String addInventory(@RequestParam("f_name") String f_name, @RequestParam("f_price") int f_price,@RequestParam("f_size") int f_size, HttpServletRequest req) {
        try {
            iDAO.insertInventory(f_name, f_price, f_size);
            iDAO.selectAllInventory(req);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main";  
    }
    @RequestMapping(value = "/sellFish", method = RequestMethod.POST)
    public String sellFish(@RequestParam("f_name") String f_name, @RequestParam("f_price") int f_price,@RequestParam("f_size") int f_size, HttpServletRequest req) {
        try {
           
        	iDAO.selectAllInventory(req);
        	iDAO.sellFish(f_name, f_price, f_size);  

            
              
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main";  
    }

}
