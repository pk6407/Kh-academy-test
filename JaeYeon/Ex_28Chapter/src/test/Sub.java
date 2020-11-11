package test;

public class Sub extends Super {
    String data;

    public Sub() {
        data = "subclass";
    }
    
    @Override
    public void print() {
    	System.out.println("자식 클래스");
    }
}

