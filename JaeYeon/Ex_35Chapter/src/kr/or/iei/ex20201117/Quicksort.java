package kr.or.iei.ex20201117;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Quicksort {

    public static List<Integer> sort(List<Integer> origin) {
        // 0. Ż�� ���� ����
        if (origin.isEmpty()) {
            return origin;
        }

        // 1. �ǹ� ����
        final Integer pivot = origin.get(0);

        // 2. �ǹ� �߽����� �з�
        List<Integer> less = origin.stream().filter(x -> x < pivot).collect(Collectors.toList());
        List<Integer> greater = origin.stream().filter(x -> x > pivot).collect(Collectors.toList());
        final List<Integer> pivots = origin.stream().filter(x -> x.equals(pivot)).collect(Collectors.toList());

        // 3. �з��� ���ο� ����Ʈ���� ����
        less = sort(less);
        greater = sort(greater);

        // 4. ����
        less.addAll(pivots);
        less.addAll(greater);

        return less;
    }
}