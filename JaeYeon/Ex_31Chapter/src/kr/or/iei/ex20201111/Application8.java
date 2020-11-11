package kr.or.iei.ex20201111;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Application8 {

	public static void main(String[] args) {
		final String[][] test = {
				{"abc", "def"}, {"�ƹ���"}, {"������", "�����", "ȣ����"}
		};

		final List<String> list = Arrays.stream(test)
				.flatMap(Arrays::stream)
				.collect(Collectors.toList());
		for (String s : list) {
			System.out.println(s);
		}
	}
}