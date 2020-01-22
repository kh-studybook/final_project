package kh.finalproject.studybook.domain;

public class Food_reserve {
	private int r_code;
	private int food_code;
	private int count;
	private int food_total_cost;
	
	//음식이름만 필요
	private String food_name;
	
	
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
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
