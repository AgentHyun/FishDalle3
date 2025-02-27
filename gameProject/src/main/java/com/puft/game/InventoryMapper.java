package com.puft.game;

import java.util.List;

public interface InventoryMapper {
 
    public abstract List<Fish> searchFish(Fish f);
    public abstract void insertInventory(Inventory inventory);

    public abstract List<Inventory> sellFish(Inventory inventory);
    public abstract List<Inventory> selectAllInventory();
}
