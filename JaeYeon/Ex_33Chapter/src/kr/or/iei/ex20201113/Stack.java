package kr.or.iei.ex20201113;

public interface Stack {

	/**
     * @param value ���� �ִ´�
     */
    void push(T value);

    /**
     * @return ����⿡ �ִ� ���� ������
     */
    T pop();

    /**
     * @return ��������� true
     */
    boolean isEmpty();
}

