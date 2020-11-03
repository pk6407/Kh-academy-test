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
        // 자기자신인가?
        if (this == o)
            return true;

        // 1. null이면 동등하지 않음
        // 2. 클래스가 동일하지 않으면 동등하지 않음
        if (o == null || getClass() != o.getClass())
            return false;

        // 값이 같으면 동등함.
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
