/*
19. Конвертер температуры
Напишите функцию, которая переводит температуру из Цельсия в Фаренгейт.
Если температура меньше абсолютного нуля, выбрасывайте исключение.
*/

public class Task_19 {

    public static double celsiusToFahrenheit(double celsius) {
        if (celsius < -273.15) {
            throw new IllegalArgumentException("Температура не может быть ниже абсолютного нуля.");
        }
        return celsius * 9/5 + 32;
    }

    public static void main(String[] args) {
        try {
            System.out.println("Результат: " + celsiusToFahrenheit(0));
            System.out.println("Результат: " + celsiusToFahrenheit(-1000));
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}