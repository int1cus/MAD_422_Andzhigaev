import java.util.Scanner;
import java.util.InputMismatchException;

public class Task_1
{
    public static void main(String[] args)
    {
        System.out.print("Введите целое число: ");
        Scanner in = new Scanner(System.in);
        try
        {
            int number = in.nextInt();

            if (number % 2 == 0)
            {
                System.out.printf("Число %d четное", number);
            }
            else
            {
                System.out.printf("Число %d нечетное", number);
            }
        }
        catch (InputMismatchException e)
        {
            System.out.println("Ошибка ввода! Введите целое число.");
            in.nextLine();
        }
        finally {
            in.close();
        }

    }
}