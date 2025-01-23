/*
13. Чтение элемента списка
Напишите функцию, которая возвращает элемент списка по индексу.
Если индекс выходит за пределы списка, выбрасывайте IndexOutOfBoundsException.
*/
import java.util.Arrays;
import java.util.List;

public class Task_13 {

    public static <T> T getElement(List<T> list, int index) {
        if (index < 0 || index >= list.size()) {
            throw new IndexOutOfBoundsException("Индекс " + index + " выходит за пределы списка.");
        }
        return list.get(index);
    }

    public static void main(String[] args) {
        try {
            System.out.println("Элемент списка: " + getElement(Arrays.asList(1, 2, 3, 4), 1));
            System.out.println("Элемент списка: " + getElement(Arrays.asList(1, 2, 3 ,4), 4));
        }
        catch (IndexOutOfBoundsException e) {
            System.err.println(e.getMessage());
        }
    }
}