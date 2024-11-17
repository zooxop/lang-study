package algorithm.java.programmers.level2;

public class 올바른괄호 {
    boolean solution(String s) {
        String[] chars = s.split("");

        int value = 0;
        for (String c : chars) {
            if (c.equals("(")) value++;
            else value--;

            if (value < 0) return false;
        }

        return value == 0;
    }
}
