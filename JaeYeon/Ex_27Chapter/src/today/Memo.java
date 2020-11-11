package today;
import java.sql.Date;
public class Memo {

	private int no;
	private String name;
	private String msg;
	private Date writeday;

	public Memo() {
		super();
	}

	public Memo(int no, String name, String msg, Date writeday) {
		super();
		this.no = no;
		this.name = name;
		this.msg = msg;
		this.writeday = writeday;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getWriteday() {
		return writeday;
	}

	public void setWriteday(Date writeday) {
		this.writeday = writeday;
	}	
}