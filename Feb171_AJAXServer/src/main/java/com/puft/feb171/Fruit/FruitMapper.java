package com.puft.feb171.Fruit;

import java.util.List;

public interface FruitMapper {
  public abstract List<Fruit> getAllFruit();
  public abstract List<Fruit> searchFruit(Fruit f);
  
}
