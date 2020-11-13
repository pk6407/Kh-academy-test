package kr.or.iei.ex20201113;

import java.util.List;

public class DoublyLinkedList<T> implements List<T> {

    private Node<T> head;
    private Node<T> tail;

    @Override
    public int size() {
        return 0;
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public T get(int index) {
        return null;
    }

    @Override
    public boolean contains(T element) {
        return false;
    }

    @Override
    public boolean add(T element) {
        return false;
    }

    @Override
    public boolean remove(T element) {
        return false;
    }

    @Override
    public void clear() {

    }

    private static class Node<T> {
        private T data;
        private Node<T> next;
        private Node<T> prev;
    }
}

