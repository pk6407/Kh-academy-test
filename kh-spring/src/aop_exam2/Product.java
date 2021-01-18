package aop_exam2;

import java.util.List;

public interface Product {
	public List<String>select(String findStr);
	public int insert(String name);
	public int update(String name);
	public int delete(int serial);
}
