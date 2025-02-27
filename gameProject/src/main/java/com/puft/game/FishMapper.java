package com.puft.game;

import java.util.List;




public interface FishMapper {
	  public abstract List<Fish> getAllFish();
	  public abstract List<Fish> searchFish(Fish f);
	
}
