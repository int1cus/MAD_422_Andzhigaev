/*
11. Конвертация в двоичную систему
Создайте функцию, которая конвертирует целое число в двоичную строку. 
Если число отрицательное, выбрасывайте исключение.
*/

public class Task_11 {

    public static String toBinary(int number) {
        if (number < 0) {
            throw new IllegalArgumentException("Число не должно быть отрицательным.");
        }
        return Integer.toBinaryString(number);
    }


    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + toBinary(5));
            System.out.println("Результат: " + toBinary(-1));
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}