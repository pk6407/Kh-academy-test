package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class TVProduct implements Product{
	String name = "kim";
	
	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		System.out.println("TVProduct.select()");
		this.name = "lee";
		return list;
	}
	@Override
	public int insert(String name) {
		this.name = name;
		System.out.println("TVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("TVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("TVProduct.delete()");
		return 3;
	}
}
