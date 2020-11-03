

import java.util.ArrayList;
import java.util.HashMap;

import practice.generics.model.vo.Farm;

public class FarmController {
	
	private HashMap<Farm, Integer> hMap = new HashMap<>();
	private ArrayList<Farm> list = new ArrayList<>();
	
	public boolean addNewkind(Farm f, int amount) {
		if(!hMap.containsKey(f)) {
			hMap.put(f, amount);
			return true;
		}else {
			return false;
		}
	}
	public boolean removekind(Farm f) {
		if(hMap.containsKey(f)) {
			hMap.remove(f);
			return true;
		}else {
			return false;
		}
	}
	public boolean changeAmount(Farm f, int amount) {
		if(hMap.containsKey(f)) {
			hMap.put(f, amount);
			return true;
		}else {
			return false;
		}
	}
	public HashMap<Farm, Integer> printFarm(){
		return hMap;
	}
	public boolean buyFarm(Farm f) {
		if(hMap.containsKey(f) && hMap.get(f) > 0) {
			list.add(f);
			hMap.put(f, hMap.get(f) - 1);
			return true;
		}
		return false;
	}
	public boolean removeFarm(Farm f) {
		if(list.contains(f)) {
			list.remove(f);
			hMap.put(f,hMap.get(f) + 1);
			return true;
		}
		return false;
	}
	public ArrayList<Farm> printBuyFarm(){
		return list;
	}
}


import java.util.ArrayList;
import java.util.HashMap;

import practice.generics.model.vo.Farm;

public class FarmController {
	
	private HashMap<Farm, Integer> hMap = new HashMap<>();
	private ArrayList<Farm> list = new ArrayList<>();
	
	public boolean addNewkind(Farm f, int amount) {
		if(!hMap.containsKey(f)) {
			hMap.put(f, amount);
			return true;
		}else {
			return false;
		}
	}
	public boolean removekind(Farm f) {
		if(hMap.containsKey(f)) {
			hMap.remove(f);
			return true;
		}else {
			return false;
		}
	}
	public boolean changeAmount(Farm f, int amount) {
		if(hMap.containsKey(f)) {
			hMap.put(f, amount);
			return true;
		}else {
			return false;
		}
	}
	public HashMap<Farm, Integer> printFarm(){
		return hMap;
	}
	public boolean buyFarm(Farm f) {
		if(hMap.containsKey(f) && hMap.get(f) > 0) {
			list.add(f);
			hMap.put(f, hMap.get(f) - 1);
			return true;
		}
		return false;
	}
	public boolean removeFarm(Farm f) {
		if(list.contains(f)) {
			list.remove(f);
			hMap.put(f,hMap.get(f) + 1);
			return true;
		}
		return false;
	}
	public ArrayList<Farm> printBuyFarm(){
		return list;
	}
}