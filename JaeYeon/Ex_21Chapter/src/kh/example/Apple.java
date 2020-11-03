package kh.example;

import java.util.ArrayList;
import java.util.List;

import kh.example.Coffee.CoffeeType;
import kh.example.ddasda.RequestMethod;

public class Apple {

	public static void main(String[] args) {
		//for (타입 변수이름 : 배열(컬렉션)
		final List<String> list = new ArrayList<>();
		list.add("A");
		list.add("B");
		list.add("C");
		list.add("D");

		for(String message : list) {
			System.out.println(message);
		}
		//자료형[] 변수이름 =
		//자료형 변수이름[] =
		final String[] strings = new String[5];
		for(int i = 0; i < 5; i++) {
			strings[i] = "A";
		}
		for(String value : strings) {
			System.out.println(value);
		}
		String a = "A";
		String b = "A";
		System.out.println(a.hashCode());
		System.out.println(b.hashCode());

		int data = 777;
		double pi = 3.141592;
		String kor = "가나다라마바사";
		String eng = "ABCDEFGHI";

		String str1 = "ABC";
		String str2 = "ABC";
		String str3 = new String("ABC");

		System.out.println(str1 == str2);
		System.out.println(str1 == str3); 
		//foreach,enhanced for문
		//for(타입 변수이름 : 배열(컬렉션)){
		//}
		/*문과 식의 차이
		 * 문:명령
		 * 식:평가 결과가 값
		 * 조건식 : 평가 결과가 boolean
		 */
		/*타입의 종류
		 * 원시 타입(primitive type)
		 * -스택에 바로 저장
		 * 참조 타입(referece type)
		 * -객체는 실제로 heap 공간에 존재하고, 그것을 가리키는 값이 스택
		 */
		/*배열
		 * 
		 * 1.타입[] 변수이름;
		 * 2.타입 변수이름[];
		 * 3.타입[] 변수이름 = new 타입[길이]
		 */
		//배열 초기화 입력
		// 타입[] 변수이름 = {값,.....,값N};
		//타입[] 변수이름 = new 타입[길이];
		final String[] fruits = {"grape", "apple"};
		int length = fruits.length;
		for(int i = 0; i < length; i++) {
			System.out.println(fruits[i]);
		}
		final String[] fruits1 = new String[2];
		fruits1[0] = "orange";
		fruits1[1] = "apple";
		for(String fruit: fruits1) {
			System.out.println(fruit);
		}
		/*파라미터(parameter)랑 인자(argument)차이
		 * y = f(x)
		 * x가 파라미터(parameter)
		 * y = f(5)
		 * 5가 인자(argument)
		 */
		int[][] m1 = new int[2][];	//A
		m1[0] = new int[] {1,2,3};	//B
		m1[1] = new int[] {4,5,6};	//C

		//행
		for(int i = 0; i < 2; i++) {
			//열
			for(int j= 0; j < 3; j++) {
				System.out.println(m1[i][j]);
			}

			//enum 선언
			/* enum 열거형이름{
			 * 값
			 * }
			 */
		}
			System.out.println(RequestMethod.CONNECT.name());
			System.out.println(RequestMethod.CONNECT.ordinal());
		
			//클래스 선언
			//접근지정자 class 클래스이름{
			//접근지정자 변수명
			
			//추상화
			//객체를 모델링하는 기법인데
			//필요한 특징만 추출한데
			//데이터
			//행동
			//클래스 이름 객체 = new 클래스이름(생성자 내용);
			//객체.메소드(인자);
			
			//캡슐화
			//데이터의 직접적인 조작을 막음
			//객체 정보가 오염됨
			//객체가 참고하는 값이 오염되면 행동에 영향을 끼침.
			
			//접근지정자(Access Modifier)
			//private:스코프가 객체 내부
			//protected:스코프가 패키지 내부
			//public :스코프가 전체
			
			//상속
			//부모의 특성을 물려 받는 행위
			//부모객체 - 상위객체,superclass
			//자식객체 - 하위객체,subclass
			
			//다형성(polymorphism)
	}
}