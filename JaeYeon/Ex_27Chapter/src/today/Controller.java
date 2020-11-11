package today;
import java.util.ArrayList;


public class Controller {
	public static void main(String[] args) {
		Dao dao = new Dao();
		ArrayList<Memo> list = dao.selectAll();
		if(list.isEmpty()) {
			System.out.println("데이터가 없습니다.");
		}else {
			System.out.println("NO\tNAME\tMSG\tWRITEDAY");
			System.out.println("-----------------------------------");
			for(Memo m : list) {
				System.out.println(m.getNo() + "\t" + m.getName() + "\t" + m.getMsg() + "\t" + m.getWriteday());			
			}
		}
		
	}
}