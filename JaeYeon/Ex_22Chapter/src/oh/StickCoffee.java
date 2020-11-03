package oh;

import java.util.Objects;

public class StickCoffee {
    private final String name;
    private final long price;

    public StickCoffee(String name, long price) {
        this.name = name;
        this.price = price;
    }

    // sc1.equals(sc2)
    @Override
    public boolean equals(Object o) {
        // �ڱ��ڽ��ΰ�?
        if (this == o)
            return true;

        // 1. null�̸� �������� ����
        // 2. Ŭ������ �������� ������ �������� ����
        if (o == null || getClass() != o.getClass())
            return false;

        // ���� ������ ������.
        StickCoffee that = (StickCoffee) o;
        return price == that.price &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, price);
    }

    @Override
    public String toString() {
        return "StickCoffee{" +
                "name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
