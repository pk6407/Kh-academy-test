package kr.or.iei.ex20201112;

public interface List<T> {

    /**
     * @return 요소의 개수를 반환
     */
    int size();

    /**
     * @return 요소가 없으면 true
     */
    boolean isEmpty();

    /**
     * @param index 찾을 요소의 위치
     * @return 요소
     */
    T get(int index);

    /**
     * 
     * @param element 찾을 요소
     * @return 찾을 요소가 존재하면 true
     */
    boolean contains(T element);

    /**
     * @param element 추가할 요소
     * @return 추가 성공 시 true
     */
    boolean add(T element);

    /**
     * @param element 삭제할 요소
     * @return 삭제 시 true
     */
    boolean remove(T element);

    /**
     * 요소 모두 삭제
     */
    void clear();
}
