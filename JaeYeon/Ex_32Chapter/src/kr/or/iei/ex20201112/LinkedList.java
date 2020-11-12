package kr.or.iei.ex20201112;

public class LinkedList<T> implements List<T> {

    private Node<T> head;

    @Override
    public int size() {
        // 1. �Ӹ��� ���� ���
        if (head == null) {
            return 0;
        }

        // 2. �Ӹ��� �ִ� ���
        int size = 0;
        Node<T> pointer = head;
        while (pointer != null) {
            pointer = pointer.getNext();
            size++;
        }
        return size;
    }

    @Override
    public boolean isEmpty() {
        return head == null;
    }

    @Override
    public T get(int index) {
        // 1. �Ӹ��� ����
        if (head == null) {
            return null;
        }

        // 2. �Ӹ��� �ִ�
        int idx = 0;
        Node<T> pointer = head;
        while (pointer != null && idx != index) {
            pointer = pointer.getNext();
            idx++;
        }
        return pointer.data;
    }

    @Override
    public boolean contains(T element) {
        return false;
    }

    @Override
    public boolean add(T element) {
        final Node<T> newNode = new Node<>(element, null);
        // 1. head�� ���� ���
        if (head == null) {
            head = newNode;
            return true;
        }

        // 2. head�� �ִ� ���
        Node<T> pointer = head;
        while (pointer.getNext() != null) {
            pointer = pointer.getNext();
        }
        pointer.setNext(newNode);
        return true;
    }

    @Override
    public boolean remove(T element) {
        // 1. �Ӹ��� ����
        if (head == null) {
            return false;
        }

        Node<T> pointer = head;
        while (pointer.getNext() != null && pointer.getData() != element) {
            pointer = pointer.getNext();
        }
        final Node<T> next = pointer.getNext();
        // 1. next�� ���� pointer��
        pointer.setData(next.getData());
        // 2. pointer�� next�� ���� ����� ���� ���� ����
        pointer.setNext(next.getNext());
        // 3. pointer�� ���� ��忴�� ģ���� next�� null��
        next.setNext(null);
        return true;
    }

    @Override
    public void clear() {
        head = null;
    }

    private static class Node<T> {
        private T data;
        private Node<T> next;
        
        public Node(T data, Node<T> next) {
            this.data = data;
            this.next = next;
        }

        public T getData() {
            return data;
        }

        public void setData(T data) {
            this.data = data;
        }

        public Node<T> getNext() {
            return next;
        }

        public void setNext(Node<T> next) {
            this.next = next;
        }

        @Override
        public String toString() {
            return "Node{" +
                    "data=" + data +
                    ", next=" + next +
                    '}';
        }
    }
}
