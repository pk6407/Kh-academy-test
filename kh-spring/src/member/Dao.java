package member;

import java.util.Map;

public interface Dao {
	public boolean log(String mid, String pwd);
	public int getTotListSize(String findStr);
	public Map<String, Object> select(Page p);
	public String insert(MemberVo vo);
	public String update(MemberVo vo);
	public String delete(MemberVo vo);
	public MemberVo view(String mid);
	
}
