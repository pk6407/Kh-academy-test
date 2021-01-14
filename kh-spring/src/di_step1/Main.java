package di_step1;

//개발자 팀장의 코드
public class Main {

	public Main() {
		String r = null;
		// 개발자 김씨
		OracleDB kim = new OracleDB();
		r = kim.findResult();
		System.out.println(r);
		
		// 개발자 박씨
		Database park = new Database();
		r = park.select();
		System.out.println(r);
		
		// 개발자 이씨
		MyDB lee = new MyDB();
		lee.search();
		
	}
	public static void main(String[] args) {
		new Main();

	}

}
