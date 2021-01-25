# 1~2 교시

- 금요일 날 한거 이어서함..

- 오전 : MemberDao 에서 sql문장 mybatis 용으로 변환
  - servlet -> spring/mybatic - 고도화,리뉴얼 한다
- 오후 : 통합구현 시험

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace='member'>

	<!-- 테이블의 컬럼명과 vo 객체의 필드명이 서로 다른경우 -->
	<!-- column : 테이블의 컬럼명, property : vo의필드명 -->
	<resultMap type='mVo' id='m_vo'>
		<result column='m_id' property='mId'/>
		<result column='m_name' property='mName'/>
	</resultMap>

	
	<select id='temp_select' parameterType='page' resultMap='m_vo'>
	
	</select>
	
	<select id='tot_list_size' parameterType='String' resultType='Integer'>
		select count(mid) cnt from members 
		where mid like '%${_parameter}%' or email like '%${_parameter}%' 
		or phone like '%${_parameter}%'  or address like '%${_parameter}%'
	</select>
	
	
	<select id='select' parameterType='page' resultType='mVo'>
		select * from (
		select rownum no, m.* from (
		select * from members
		where mid like '%${findStr}%' or email like '%${findStr}%' 
		or phone like '%${findStr}%' or address like '%${findStr}%'
		order by name asc) m
		) where no between #{startNo} and #{endNo}
	</select>

	<insert id='insert' parameterType='mVo'>
	insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
	values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}
, sysdate )
	</insert>
```

# 3교시

member.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mapper
   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
   "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace='member'>

	<!-- 테이블의 컬럼명과 vo 객체의 필드명이 서로 다른경우 -->
	<!-- column : 테이블의 컬럼명, property : vo의필드명 -->
	<resultMap type='mVo' id='m_vo'>
		<result column='m_id' property='mId'/>
		<result column='m_name' property='mName'/>
	</resultMap>

	
	<select id='temp_select' parameterType='page' resultMap='m_vo'>
	
	</select>
	
	<select id='tot_list_size' parameterType='String' resultType='Integer'>
		select count(mid) cnt from members 
		where mid like '%${_parameter}%' or email like '%${_parameter}%' 
		or phone like '%${_parameter}%'  or address like '%${_parameter}%'
	</select>
	
	
	<select id='select' parameterType='page' resultType='mVo'>
		select * from (
		select rownum no, m.* from (
		select * from members
		where mid like '%${findStr}%' or email like '%${findStr}%' 
		or phone like '%${findStr}%' or address like '%${findStr}%'
		order by name asc) m
		) where no between #{startNo} and #{endNo}
	</select>

	<insert id='insert' parameterType='mVo'>
		insert into members(mid, pwd, name, email, phone, zipcode, address, photo, mdate)
		values(#{mid}, #{pwd}, #{name}, #{email}, #{phone}, #{zipcode}, #{address}, #{photo}, sysdate )
	</insert>

	<update id='update' parameterType='mVo'>
		update members set 
		name = #{name}, email=#{email}, zipcode=#{zipcode}, address=#{address}, phone=#{phone}
	
	<if test="#{photo} != null">
		,photo= #{photo}
	</if>
	
		where mid=#{mid} and pwd=#{pwd}
	
	</update>

	<delete id='delete' parameterType='mVo'>
		delete from members where mid=#{mid} and pwd=#{pwd}
	</delete>
	
	<select id='view' parameterType='String' resultType='mVo'>
		select * from members where mid=#{_parameter}
	</select>
	
</mapper>   
```

<bean id='myda' class='bean.MemberFactory' />
	<bean id='mDao' class='member.MemberDao'>
		<constructor-arg ref='myba'/>
	</bean>

이것들이

<bean id='mController' class='member.MemberController' >
		<constructor-arg ref="mDao"/>
	</bean>

member.MemberController로 DI(의존성 주입)햇다.

# 점심후 는 시험 본다아! 통합구현

