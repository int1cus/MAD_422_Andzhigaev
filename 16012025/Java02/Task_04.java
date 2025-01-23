/*
4. Проверка возраста
Создайте функцию, которая принимает возраст и выбрасывает
IllegalArgumentException, если возраст меньше нуля или больше 150.
*/

public class Task_4 {

    public static void checkAge(int age) {
        if (age < 0 || age > 150) {
            throw new IllegalArgumentException("Человек столько не живет");
        }
        System.out.println("Возраст: " + age);
    }

    public static void main(String[] args) {
        try {
            checkAge(20);
            checkAge(151);
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}