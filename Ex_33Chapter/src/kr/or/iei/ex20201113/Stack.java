package kr.or.iei.ex20201113;

public interface Stack {

	/**
     * @param value 값을 넣는다
     */
    void push(T value);

    /**
     * @return 꼭대기에 있는 값을 꺼낸다
     */
    T pop();

    /**
     * @return 비어있으면 true
     */
    boolean isEmpty();
}

