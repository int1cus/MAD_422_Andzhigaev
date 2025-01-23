/*
7. Проверка массива на нули
Создайте функцию, которая проверяет массив на наличие нулей.
Если в массиве есть нули, выбрасывайте исключение.
*/

public class Task_7 {

    public static void checkArray(int[] array) {
        for (int num : array) {
            if (num == 0) {
                throw new IllegalArgumentException("Массив содержит нули");
            }
        }
        System.out.println("Массив не содержит нулей");
    }

    public static void main(String[] args) {
        try {
            checkArray(new int[]{1, 2, 3});
            checkArray(new int[]{0, 1, 2});
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}