package kh.finalproject.studybook.domain;

import java.util.List;

public class Food_reserve {
	private int r_code;
	private int food_code;
	private int mem_key;
	private int count;
	private int food_total_cost;
	public List<Food_reserve> food_reservelist;
	

	public List<Food_reserve> getFood_reservelist() {
		return food_reservelist;
	}
	public void setFood_reservelist(List<Food_reserve> food_reservelist) {
		this.food_reservelist = food_reservelist;
	}
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public int getFood_code() {
		return food_code;
	}
	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}
	public int getMem_key() {
		return mem_key;
	}
	public void setMem_key(int mem_key) {
		this.mem_key = mem_key;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getFood_total_cost() {
		return food_total_cost;
	}
	public void setFood_total_cost(int food_total_cost) {
		this.food_total_cost = food_total_cost;
	}

	
	
}
