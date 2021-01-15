package aop_step1;

public class Main {
	public Main() {
		BoardDao bDao = new BoardDao();
		MemberDao mDao = new MemberDao();
		SaleDao sDao = new SaleDao();
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
