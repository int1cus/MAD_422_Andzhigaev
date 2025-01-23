/*
3. Конвертер строк в числа
Напишите функцию, которая принимает строку и пытается конвертировать
её в целое число. Если строка не может быть конвертирована,
выбрасывайте NumberFormatException.
*/

public class Task_3 {

    public static int stringToInt(String text) {
        if (text == null || text.isEmpty()) {
            throw new NumberFormatException("Строка пуста или равна null. Невозможно выполнить преобразование.");
        }

        try {
            return Integer.parseInt(text);
        } catch (NumberFormatException e) {
            throw new NumberFormatException("Строка \"" + text + "\" не может быть преобразована в целое число.");
        }
    }

    public static void main(String[] args) {
        String[] test = {"13", "123asd", "", null, "42"};

        for (String text : test) {
            try {
                int result = stringToInt(text);
                System.out.println("Результат: " + result);
            } catch (NumberFormatException e) {
                System.err.println(e.getMessage());
            }
        }
    }
}