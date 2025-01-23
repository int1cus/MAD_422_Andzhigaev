/*
9. Обрезка строки
Напишите функцию, которая принимает строку и число символов.
Функция должна возвращать строку, обрезанную до указанного
числа символов. Если число символов больше длины строки, выбрасывайте исключение.
*/

public class Task_9 {

    public static String cutString(String text, int length) {
        if (length > text.length()) {
            throw new IllegalArgumentException("Число символов превышает длину строки");
        }
        return text.substring(0, length);
    }

    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + cutString("Textext",4));
            System.out.println("Результат: " + cutString("Textext", 10));
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}