package com.puft.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InventoryDAO {

    @Autowired
    SqlSession ss;

 
    public void insertInventory(String f_name, int f_price,int f_size) {
        try {
            Inventory inventory = new Inventory();
            inventory.setF_name(f_name);
            inventory.setF_price(f_price);
            inventory.setF_size(f_size);
            InventoryMapper mapper = ss.getMapper(InventoryMapper.class);
            mapper.insertInventory(inventory); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    
    public void selectAllInventory(HttpServletRequest req) {
        try {
            InventoryMapper mapper = ss.getMapper(InventoryMapper.class);
            List<Inventory> inventoryList = mapper.selectAllInventory();
            
            Map<String, Integer> inventoryCount = new HashMap<>();
            for (Inventory item : inventoryList) {
                inventoryCount.put(item.getF_name(), inventoryCount.getOrDefault(item.getF_name(), 0) + 1);
            }
            System.out.println("Inventory List: " + inventoryList);
            req.setAttribute("inventoryList", inventoryList);
            req.setAttribute("inventoryCount", inventoryCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void sellFish(String f_name, int f_price, int f_size) {
    	try {
            Inventory inventory = new Inventory();
            inventory.setF_name(f_name);
            inventory.setF_price(f_price);
            inventory.setF_size(f_size);

            InventoryMapper mapper = ss.getMapper(InventoryMapper.class);
            mapper.sellFish(inventory); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
   
    

}
