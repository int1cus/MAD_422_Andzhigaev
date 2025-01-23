/*
15. Проверка даты
Напишите функцию, которая проверяет, является ли строка корректной
датой в формате "dd.MM.yyyy". Если формат неверен, выбрасывайте DateTimeParseException.
*/
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class Task_15 {

    public static void validateDate(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        try {
            LocalDate.parse(date, formatter);
            System.out.println("Дата " + date + " является корректной.");
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException("Дата " + date + " записана в неверном формате. Используйте формат dd.MM.yyyy.");
        }
    }

    public static void main(String[] args) {
        try {
            validateDate("11.09.2001");
            validateDate("32.13.2077");
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}