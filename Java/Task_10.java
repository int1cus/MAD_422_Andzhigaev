/*
10. Поиск элемента в массиве
Напишите функцию, которая ищет элемент в массиве.
Если элемент не найден, выбрасывайте исключение с сообщением об ошибке.
*/

public class Task_10 {

    public static int findElem(int[] array, int num) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] == num) {
                return array[i];
            }
        }
        throw new IllegalArgumentException("Элемент " + num + " не найден в массиве");
    }

    public static void main(String[] args) {
        try {
            System.out.println("Элемент " + findElem(new int[]{1, 2, 3, 4}, 3) + " найден в массиве");
            findElem(new int[]{1, 2, 3 ,4}, 5);
        }
        catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}