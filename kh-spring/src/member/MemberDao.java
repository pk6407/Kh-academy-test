package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;
	MemberFactory f;
	public MemberDao() {}
	public MemberDao(MemberFactory f) {
		this.f = f;
		sqlSession = f.getFactory().openSession();
	}
	
	@Override
	public boolean log(String mid, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String,Object> select(Page p) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()..................");
		System.out.println("nowPage : " + p.getNowPage()); 
		
		int cnt = sqlSession.selectOne("member.tot_list_size",p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage()); 
		System.out.println("endNo : " +p.getEndPage()); 
		
		List<MemberVo> list = sqlSession.selectList("member.select",p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		sqlSession.close();
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = f.getFactory().openSession();
		
		System.out.println("Dao.view()..." + mid);
		
		MemberVo vo =sqlSession.selectOne("member.view",mid);
		
		System.out.println(vo.getName());
		
		sqlSession.close();
		return vo;
	}

}
