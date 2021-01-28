package member;

import java.io.File;
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
	public Map<String , Object> select(Page p) {
		sqlSession = f.getFactory().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(p==null) {
			p = new Page();
			p.setNowPage(1);
		}else if(p.getNowPage()<1){
			p.setNowPage(1);
		}
		
		
		System.out.println("Dao.select()...................");
		System.out.println("nowPage : " + p.getNowPage());
		
		int cnt = sqlSession.selectOne("member.tot_list_size", p);
		p.setTotListSize(cnt);
		p.pageCompute();
		
		System.out.println("startNo : " + p.getStartPage());
		System.out.println("endNo : " + p.getEndNo());
		
		List<MemberVo> list = sqlSession.selectList("member.select" , p);
		
		System.out.println("list.size : " + list.size());
		
		map.put("list", list);
		map.put("page", p);
		
		sqlSession.close();
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 저장되었습니다.";
		sqlSession = f.getFactory().openSession();
		int cnt = sqlSession.insert("member.insert", vo);
		if(cnt<1) {
			msg = "회원 정보 저장중 오류 발생";
			sqlSession.rollback();
		}
		sqlSession.commit();
		sqlSession.close();
		return msg;
	}

	@Override
	public String update(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 수정되었습니다.";
		sqlSession = f.getFactory().openSession();
		int cnt = sqlSession.update("member.update", vo);
		if(cnt>0) {
			sqlSession.commit();
			if(vo.getPhoto() !=null && !vo.getPhoto().equals("")) {
				File file = new File(FileUpload.saveDir + vo.getDelFile());
				if(file.exists()) file.delete();
			}
		}else {
			msg = "회원 정보 수정중 오류 발생";
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return msg;
	}

	@Override
	public String delete(MemberVo vo) {
		String msg = "회원 정보가 정상적으로 삭제되었습니다.";
		sqlSession = f.getFactory().openSession();
		
		int cnt = sqlSession.delete("member.delete", vo);
		if(cnt>0) {
			File file = new File(FileUpload.saveDir + vo.getDelFile());
			if(file.exists()) file.delete();
			sqlSession.commit();
		}else {
			msg = "회원 정보 삭제중 오류 발생";
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return msg;
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = f.getFactory().openSession();
		
		System.out.println("Dao.view()..." + mid);
		
		MemberVo vo = sqlSession.selectOne("member.view", mid);
		
		
		System.out.println(vo.getName());
		
		sqlSession.close();
		return vo;
	}

}














