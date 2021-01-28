package aop_exam1;

public class Advice implements LogIn{
	Dao dao;
	public Advice(Dao dao) {
		this.dao = dao;
	}

	@Override
	public boolean loginCheck() {
		// 로그인 되어 있는 상태 mid="hong";
		return false;
	}
	
	public void before() { //Before Advice
		String r = "";
		if(loginCheck()) {
			System.out.println("로그인 되었습니다.");
			dao.select();
		}else {
			System.out.println("로그인이 필요합니다.");
		}
	}
}
