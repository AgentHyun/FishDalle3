package com.puft.game;

import java.util.List;

public class Fishes {
  private List<Fish> fish;
  
  
  public Fishes() {
}


public Fishes(List<Fish> fish) {
	super();
	this.fish = fish;
}


public List<Fish> getFish() {
	return fish;
}


public void setFish(List<Fish> fish) {
	this.fish = fish;
}


}
