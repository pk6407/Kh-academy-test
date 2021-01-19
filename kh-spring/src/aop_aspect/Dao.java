package aop_aspect;

import java.util.List;

public interface Dao {
	public List<String> select();
	public String insert();
	public String update();
	public String delete();
	public String repl();
}
