package kr.or.iei.ex20201113;

import java.util.LinkedList;
import java.util.List;

public class LinkedListStack<T> implements Stack<T> {

    private final List<T> stack = new LinkedList<>();

    public void push(T value) {
        stack.add(value);
    }

    public T pop() {
        final int size = stack.size();
        if (size <= 0) {
            return null;
        }
        return stack.remove(size - 1);
    }

    public boolean isEmpty() {
        return stack.isEmpty();
    }
}

