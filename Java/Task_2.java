/// Задача 2
/// Минимальное из трех чисел
/// Условие:
/// Пользователь вводит три целых числа. Программа должна найти и вывести минимальное из них.

import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

public class Task_2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        List<Integer> numberList = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            try {
                System.out.println("Введите число " + (i + 1) + ": ");
                numberList.add(in.nextInt());
            }
            catch (InputMismatchException e) {
                System.out.println("Ошибка ввода! Введите целое число.");
                System.exit(0);
            }
        }

        int min = numberList.get(0);
        for (int number : numberList) {
           if (number < min) {
               min = number;
           }
        }

        System.out.printf("Минимальное из трех чисел: %d", min);
        in.close();
    }
}