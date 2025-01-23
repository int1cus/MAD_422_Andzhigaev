/*
16. Конкатенация строк
Реализуйте функцию, которая объединяет две строки.
Если одна из строк равна null, выбрасывайте NullPointerException.
*/

public class Task_16 {

    public static String concatenateStrings(String str1, String str2) {
        if (str1 == null || str2 == null) {
            throw new NullPointerException("Одна из строк является пустой.");
        }
        return str1 + str2;
    }

    public static void main(String[] args) {
        try {
            System.out.println("Объединенные строки: " + concatenateStrings("Jesus", "Christ"));
            System.out.println("Объединенные строки: " + concatenateStrings(null, "skibidi"));
        }
        catch (NullPointerException e) {
            System.err.println(e.getMessage());
        }
    }
}