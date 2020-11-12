package kr.or.iei.ex20201112;

public interface List<T> {

    /**
     * @return ����� ������ ��ȯ
     */
    int size();

    /**
     * @return ��Ұ� ������ true
     */
    boolean isEmpty();

    /**
     * @param index ã�� ����� ��ġ
     * @return ���
     */
    T get(int index);

    /**
     * 
     * @param element ã�� ���
     * @return ã�� ��Ұ� �����ϸ� true
     */
    boolean contains(T element);

    /**
     * @param element �߰��� ���
     * @return �߰� ���� �� true
     */
    boolean add(T element);

    /**
     * @param element ������ ���
     * @return ���� �� true
     */
    boolean remove(T element);

    /**
     * ��� ��� ����
     */
    void clear();
}
