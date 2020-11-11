package kr.or.iei.ex20201111;

public class Application {

	public static void main(String[] args) {
		LengthOfTwoStrings lambda = (s1, s2) -> s1.length() + s2.length();
		final int length = lambda.getLength("abc", "defg");
		System.out.println(length);
	}
}