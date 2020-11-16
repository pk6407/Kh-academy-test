package kr.or.iei.ex20201116;

public class ArrayQueue<T> implements Queue<T> {

    private static final int DEFAULT_SIZE = 5;

    private Object[] queue = new Object[DEFAULT_SIZE];
    private int rear = -1;
    private int front = -1;

    @Override
    public void enqueue(T data) {
        if (isFull()) {
            System.out.println("full");
            return;
        }
        queue[++rear] = data;
    }

    @SuppressWarnings("unchecked")
    @Override
    public T dequeue() {
        if (isEmpty()) {
            return null;
        }
        front = ++front % DEFAULT_SIZE;
        return (T) queue[front];
    }

    private boolean isFull() {
        return rear == (DEFAULT_SIZE - 1);
    }

    private boolean isEmpty() {

        return front == rear;
    }
}
