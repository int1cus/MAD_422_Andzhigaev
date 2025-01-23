/*
20. Проверка строки на пустоту
Создайте функцию, которая проверяет, является ли строка пустой или null.
Если строка пустая или равна null, выбрасывайте исключение.
*/

public class Task_20 {

    public static void validateString(String str) {
        if (str == null || str.isEmpty()) {
            throw new IllegalArgumentException("Строка пустая или равна null.");
        }
        System.out.println("Строка: " + str);
    }

    public static void main(String[] args) {
        try {
            validateString("L + ratio + skill issue");
            validateString("");
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}