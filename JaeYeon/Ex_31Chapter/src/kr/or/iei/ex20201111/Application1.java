package kr.or.iei.ex20201111;

public class Application1 {

	public static void main(String[] args) {
		ConcatStrings cs = (s1,s2) -> s1 + s2;
		final String s = cs.concat("Hello","Lambda!");
		System.out.println(s);
	}

}
