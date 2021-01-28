package di_anno;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int    delete(String mid, String pwd, int serial);
}
