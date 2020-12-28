# 1교시

```java
package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class Application {
   // Connection conn을 만약 static으로 선언했다면 여기 멤버필드에서 선언 불가하고
   // 생성자 안에 static Connection conn 으로 선언한 후 사용해야 하며 
   // 아래의 public Connection getConn 메소드도 static(정적)으로 선언해야 사용가능하다.
	Connection conn;
	String userName = "system";
	String userPwd = "oracle";
	public Application() {
		connect();
	}
	
	public Application(String u, String p) {
		this.userName = u;
		this.userPwd = p;
		connect();
	}
	
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", 
					userName, userPwd );
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public Connection getConn() {
		return conn;
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
		PUBLIC "-mybatis.org//DTD Config 3.0//EN"
		"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
				<property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
				<property name="username" value="system"/>
				<property name="password" value="oracle"/>
			</dataSource>
		</environment>
	</environments>

	<mappers>
	
	</mappers>

</configuration>
```

```java
package board;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("board/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
```

```java
package board;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {

	SqlSession sqlSession;
	
	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				System.out.println("연결중 오류");
			}else {
				System.out.println("성공~");
			}
			sqlSession.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new BoardDao();
	}
	
}
```

# 2교시

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
 PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
 "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="board">
 <resultMap type="class full name" id="id">
 <result property='property' column='column'/>
 ...
 </resultMap>


 <select id='id' parameterType="type" resultType='type|id'>
 select 문장
 </select>
 <update id="id" parameterType="type">
 update 문장
 </update>
 <insert id='type' parameterType="type">
 insert 문장
 </insert>

 <delete id='id' parameterType="type">
 delete 문장
 </delete>
</mapper> 
```

mybatis.pdf 에 8쪽부터 13쪽까지 쭉한번 보시길 바란다^^
- java auto boxing 검색 해서 이해해보자^^

```sql
/*게시판 테이블 생성 및 시퀀스 생성*/

CREATE TABLE board(
    serial integer primary key,
    mid varchar2(20),
    pwd varchar2(20),
    subject VARCHAR2(200),
    doc VARCHAR2(4000),
    mdate VARCHAR2(20),
    hit INTEGER,
    pserial INTEGER
);
```

# 3교시

```java
package board;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {

	SqlSession sqlSession;

	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();

			System.out.println(sqlSession);

			if(sqlSession == null) {
				System.out.println("연결중 오류");
			}else {
				System.out.println("성공~");

				//모든 serial값을 가져옴
				/*
				List<Integer> list = sqlSession.selectList("board.all_serial");
				System.out.println(Arrays.toString(list.toArray()));
				*/
				int serial = sqlSession.selectOne("board.one_serial");
				System.out.println("serial : " + serial);
 
			}
			sqlSession.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new BoardDao();
	}

}
```

```java
package board;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("board/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
		PUBLIC "-mybatis.org//DTD Config 3.0//EN"
		"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
				<property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
				<property name="username" value="system"/>
				<property name="password" value="oracle"/>
			</dataSource>
		</environment>
	</environments>

	<mappers>
		<mapper resource="board/board.xml"/>
	</mappers>

</configuration>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	
<mapper namespace="board">
	<select id="all_serial" resultType="int">
		select serial from board
		</select>

	<select id="one_serial" resultType="int">
		select serial from board where serial=1
	</select>
	
	
</mapper>
```

```sql
/* 게시판 테이블 생성 및 시퀀스 생성 */

CREATE TABLE board(
    serial integer primary key,
    mid varchar2(20),
    pwd varchar2(20),
    subject VARCHAR2(200),
    doc VARCHAR2(3000),
    mdate VARCHAR2(20),
    hit INTEGER,
    pserial INTEGER
);

/* 첨부 파일 */
CREATE TABLE boardAtt(
    serial INTEGER PRIMARY key,
    board_serial INTEGER,
    oriFile VARCHAR2(200),
    sysFile VARCHAR2(200)
);

/* board, boardAtt 시퀀스 */
CREATE SEQUENCE seq_board;
CREATE SEQUENCE seq_boardAtt;

INSERT INTO board(serial,subject) VALUES (1,'hi1');
INSERT INTO board(serial,subject) VALUES (2,'hi2');
INSERT INTO board(serial,subject) VALUES (3,'hi3');
INSERT INTO board(serial,subject) VALUES (4,'hi4');
INSERT INTO board(serial,subject) VALUES (5,'hi5');
INSERT INTO board(serial,subject) VALUES (6,'hi6');
INSERT INTO board(serial,subject) VALUES (7,'hi7');
INSERT INTO board(serial,subject) VALUES (8,'hi8');
INSERT INTO board(serial,subject) VALUES (9,'hi9');
INSERT INTO board(serial,subject) VALUES (10,'hi10');

commit;

SELECT * FROM board;
```

- WEB-INF/lib/ojdbc5.jar파일 말구 ojdbc6.jar로 써야 된다.mybatis때문에

# 점심후 4교시

- 자동화구현을 위해 컴럼명과필드명을 일치시킨다.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE configuration
		PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
		"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
				<property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
				<property name="username" value="system"/>
				<property name="password" value="oracle"/>
			</dataSource>
		</environment>
	</environments>

	<mappers>
		<mapper resource="board/board.xml"/>
	</mappers>

</configuration>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	
<mapper namespace="board">
	<select id="all_serial" resultType="int">
		select serial from board
		</select>

	<select id="one_serial" resultType="int">
		select serial from board where serial=1
	</select>
	
	<select id="list" resultType='board.BoardVo'>
		select * from board
	</select>	
	
	
</mapper>
```

```java
package board;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("board/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
```

```java
package board;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {

	SqlSession sqlSession;

	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();

			System.out.println(sqlSession);

			if(sqlSession == null) {
				System.out.println("연결중 오류");
			}else {
				System.out.println("성공~");

				//모든 serial값을 가져옴
				/*
				List<Integer> list = sqlSession.selectList("board.all_serial");
				System.out.println(Arrays.toString(list.toArray()));
				*/
				int serial = sqlSession.selectOne("board.one_serial");
				System.out.println("serial : " + serial);
 
			}
			sqlSession.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new BoardDao();
	}

}
```

```java
package board;

public class BoardVo {
	
	int serial;
	String mid;
	String pwd;
	String subject;
	String doc;
	String mdate;
	int hit;
	int pserial;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getPserial() {
		return pserial;
	}
	public void setPserial(int pserial) {
		this.pserial = pserial;
	}
	
}
```

# 5교시

```java
package board;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {
	SqlSession sqlSession;

	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();

			System.out.println(sqlSession);

			if(sqlSession == null) {
				System.out.println("연결중 오류");
			}else {
				System.out.println("성공~");

				//모든 serial값을 가져옴
				
				/*
				*List<Integer> list = sqlSession.selectList("board.all_serial");
				*System.out.println(Arrays.toString(list.toArray()));
				*
				*int serial = sqlSession.selectOne("board.one_serial");
				*System.out.println("serial : " + serial);
				*/
				
				// 모든 데이터를 BoardVo에 담아 출력
				List<BoardVo> list2 = sqlSession.selectList("board.list");
				for(BoardVo vo : list2) {
					System.out.println(vo.getSerial() + " : " + vo.getSubject());
				}
				
				// serial번호에 해당하는 BoardVo 한건 출력
				BoardVo vo = sqlSession.selectOne("board.view",1); //지정 숫자 넣어라
				System.out.println("-----------------------");
				System.out.println("serial : " + vo.getSerial());
				System.out.println("subject : " + vo.getSubject());
			
				// 검색어를 전달받아 해당 자료를 BoardVo에 담아 출력
				List<BoardVo> list3 = sqlSession.selectList("board.select","3");
				System.out.println("---------------------");
				for(BoardVo v : list3) {
					System.out.println(v.getSerial());
					System.out.println(v.getSubject());
				}
				
				// 한건의 데이터를 BoardVo에 담아 저장하시오.
				BoardVo vo2 = new BoardVo();
				vo2.setMid("hong");
				vo2.setSubject("방가와용");
			
				int cnt = sqlSession.insert("board.insert",vo2);
				if(cnt>0) {
					System.out.println("insert 성공");
					sqlSession.commit();
				}else {
					System.out.println("insert 실패");
				}
				
				
			}
			sqlSession.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new BoardDao();
	}

}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	
<mapper namespace="board">
	<select id="all_serial" resultType="int">
		select serial from board
		</select>

	<select id="one_serial" resultType="int">
		select serial from board where serial=1
	</select>
	
	<select id="list" resultType='board.BoardVo'>
		select * from board
	</select>	
	
	<select id="view" resultType="board.BoardVo" parameterType="int">
		select * from board where serial = #{_parameter}
	</select>
	
	<select id="select" resultType="board.BoardVo" parameterType="String">
		select * from board where subject like '%${_parameter}%' or doc like '%${_parameter}%'
	</select>
	
	<insert id="insert" parameterType="board.BoardVo">
		insert into board(serial, mid, subject) values(seq_board.nextval, #{mid}, #{subject} )
	</insert>
</mapper>
```

# 6교시

```java
package board;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {
	SqlSession sqlSession;

	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();

			System.out.println(sqlSession);

			if(sqlSession == null) {
				System.out.println("연결중 오류");
			}else {
				System.out.println("성공~");

				//모든 serial값을 가져옴
				
				
				List<Integer> list = sqlSession.selectList("board.all_serial");
				System.out.println(Arrays.toString(list.toArray()));
				
				int serial = sqlSession.selectOne("board.one_serial");
				System.out.println("serial : " + serial);
				
				
				// 모든 데이터를 BoardVo에 담아 출력
				List<BoardVo> list2 = sqlSession.selectList("board.list");
				for(BoardVo vo : list2) {
					System.out.println(vo.getSerial() + " : " + vo.getSubject());
				}
				
				// serial번호에 해당하는 BoardVo 한건 출력
				BoardVo vo = sqlSession.selectOne("board.view",1); //지정 숫자 넣어라
				System.out.println("-----------------------");
				System.out.println("serial : " + vo.getSerial());
				System.out.println("subject : " + vo.getSubject());
			
				// 검색어를 전달받아 해당 자료를 BoardVo에 담아 출력
				List<BoardVo> list3 = sqlSession.selectList("board.select","3");
				System.out.println("---------------------");
				for(BoardVo v : list3) {
					System.out.println(v.getSerial());
					System.out.println(v.getSubject());
				}
				
				// 한건의 데이터를 BoardVo에 담아 저장하시오.
				
				BoardVo vo2 = new BoardVo();
				vo2.setMid("hong");
				vo2.setSubject("방가와용");
			
				int cnt = sqlSession.insert("board.insert",vo2);
				if(cnt>0) {
					System.out.println("insert 성공");
					sqlSession.commit();
				}else {
					System.out.println("insert 실패");
				}
				
				
				// serial = 1인 자료의 subject, doc를 수정
				
				BoardVo vo3 = new BoardVo();
				
				vo3.setSubject("수정된 제목");
				vo3.setDoc("수정된 내용");
				vo3.setSerial(11);
				vo3.setPwd("1111");
				
				int cnt1 = sqlSession.update("board.update", vo3);
				if(cnt1>0) {
					System.out.println("수정됨");
					sqlSession.commit();
				}
			
				
				// serial 과 암호를 전달받아 자료를 삭제
				BoardVo vo4 = new BoardVo();
				vo4.setSerial(11);
				vo4.setPwd("1111");
				
				int cnt2 = sqlSession.delete("board.delete", vo4);
				if(cnt2>0) {
					System.out.println("삭제됨");
					sqlSession.commit();
				}
				
			}
			sqlSession.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new BoardDao();
	}

}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	
<mapper namespace="board">
	<select id="all_serial" resultType="int">
		select serial from board
		</select>

	<select id="one_serial" resultType="int">
		select serial from board where serial=1
	</select>
	
	<select id="list" resultType='board.BoardVo'>
		select * from board
	</select>	
	
	<select id="view" resultType="board.BoardVo" parameterType="int">
		select * from board where serial = #{_parameter}
	</select>
	
	<select id="select" resultType="board.BoardVo" parameterType="String">
		select * from board where subject like '%${_parameter}%' or doc like '%${_parameter}%'
	</select>
	
	<insert id="insert" parameterType="board.BoardVo">
		insert into board(serial, mid, subject) values(seq_board.nextval, #{mid} , #{subject} )
	</insert>
	
	<update id="update" parameterType="board.BoardVo">
		update board set subject=#{subject}, doc=#{doc} where serial = #{serial} and pwd = #{pwd}
	</update>
	
	<delete id="delete" parameterType="board.BoardVo">
		delete from board where serial=#{serial} and pwd=#{pwd}
	</delete>
	
	
</mapper>
```

이후 부터는 14쪽부터 20쪽 까지 진도다^^

# 7교시 

21쪽 부터 쭉 22쪽까지다^^

- 게시판 
  - 요구분석(필요한 기능) : 여러 개의 첨부
  - UI설계(wire frame, story board...)
  - prototype web page 작성 + 퍼블리싱
  - 스크립트 작업
  - mybatis와 mapper 파일 작성(BoardFactory)
  - BoardServlet,BoardVo,BoardDao
  - TEST 및 배포(war)

- UI작성
  - WebContent/board 폴더 생성
    - select, insert, update, view, repl, result
  - WebContent/css/board.css
  - WebContent/js/board.js

- Controll(src/board)
  - BoardFactory.java
  - config.xml,board.xml
  - BoardVo.java
  - BoardDao.java
  - BoardServlet.java

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<div id='msg'>
		입력|수정|삭제|댓글 처리가 됨
	</div>
	<form name='frm_board' method='post'>
		<input type='button' value='목록' id='btnSelect' />	
	
	</form>

</div>


<script>board()</script>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
	<label>아이디</label>
	<input type='text' name='mid' placeholder='영숫자와!$_만 가능' /><br/>	
	
	<label>제목</label>
	<input type='text' name='subject' maxlength='200' /><br/>
	
	<label></label>
	<textarea name='doc' rows='7' cols='80'></textarea><br/>
	
	<label>암호</label>
	<input type='password' name='pwd' placeholder='영숫자와!$_만 가능' /><br/>
	
	<label>첨부</label>
	<div id='attach_zone'>
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
	</div>
	
	<div class='btns'>
		<input type='button' value='수정' id='btnModify' />
		<input type='button' value='삭제' id='btnDelete' />
		<input type='button' value='댓글' id='btnRepl' />
		<input type='button' value='목록' id='btnSelect' />
	</div>
	</form>
</div>

</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
	<label>아이디</label>
	<input type='text' name='mid' placeholder='영숫자와!$_만 가능' /><br/>	
	
	<label>제목</label>
	<input type='text' name='subject' maxlength='200' /><br/>
	
	<label></label>
	<textarea name='doc' rows='7' cols='80'></textarea><br/>
	
	<label>암호</label>
	<input type='password' name='pwd' placeholder='영숫자와!$_만 가능' /><br/>
	
	<label>첨부</label>
	<div>
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
	</div>
	
	<label>새첨부</label>
	<div id='attach_zone'>
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
	</div>
	
	<div class='btns'>
		<input type='button' value='수정' id='btnUpdate' />
		<input type='button' value='목록' id='btnSelect' />
	</div>
	</form>
</div>

</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title_main'>게시판</h2>
	<form name='frm_board' method='post'>
	<label>아이디</label>
	<input type='text' name='mid' placeholder='영숫자와!$_만 가능' /><br/>	
	
	<label>제목</label>
	<input type='text' name='subject' maxlength='200' /><br/>
	
	<label></label>
	<textarea name='doc' rows='7' cols='80'></textarea><br/>
	
	<label>암호</label>
	<input type='password' name='pwd' placeholder='영숫자와!$_만 가능' /><br/>
	
	<label>첨부</label>
	<div id='attach_zone'>
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
		<img src='http://placehold.it/120X100' />
	</div>
	
	<div class='btns'>
		<input type='button' value='저장' id='btnSave' />
		<input type='button' value='목록' id='btnSelect' />
	</div>
	</form>
</div>

</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel='stylesheet' type='text/css' href='./css/board.css'>
<script src='./js/board.js'></script>
</head>
<body>
<div id='board'>
	<h2 class='title'>게시판</h2>
	<form name='frm_board' method='post'>
		<input type='button' id='btnInsert' value='입력'>
		<div>
		<input type='text' name='findStr' id='findStr'>
		<input type='button' name='btnFind' value='조회'/>
		</div>
	</form>
	
	<div class='title'>
		<span class='no'>NO</span>
		<span class='subject'>제목</span>
		<span class='mid'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<div class='items'>
		<c:forEach var='vo' begin='1' end='12'>
		<div class='item'>
		<span class='no'>NO{vo}</span>
		<span class='subject'>제목(10)</span>
		<span class='mid'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
		</div>
		</c:forEach>
	</div>
	
	<div class='btns'>
		<input type='button' value='맨첨'>
		<input type='button' value='이전'>
	
		<c:forEach var='i' begin='1' end='5'>
			<input type='button' value='${i }'>
		</c:forEach>
	
		<input type='button' value='다음'>
		<input type='button' value='이전'>
	</div>
</div>

<script>board()</script>
</body>
</html>
```