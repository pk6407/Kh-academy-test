package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class SmartTVProduct implements Product {

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("SmartTVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("SmartTVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("SmartTVProduct.delete()");
		return 3;
	}
}

