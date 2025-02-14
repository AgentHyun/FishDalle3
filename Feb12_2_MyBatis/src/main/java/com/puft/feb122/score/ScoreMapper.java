package com.puft.feb122.score;

import java.util.List;



public interface ScoreMapper {

	
	public abstract int regScore(Score s);
	
	public abstract List<Score> getAllScore();
	
}
