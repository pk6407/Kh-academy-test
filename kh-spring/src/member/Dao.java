package member;

import java.util.List;

public interface Dao {
	public boolean log(String mid, String pwd);
	public int getTotListSize(String findStr);
	public List<MemberVo>select(Page p);
	public String insert(MemberVo vo);
	public String update(MemberVo vo);
	public String delete(MemberVo vo);
	public MemberVo view(String mid);
}
