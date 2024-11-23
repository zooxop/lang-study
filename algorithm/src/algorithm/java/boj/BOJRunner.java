package algorithm.java.boj;

import java.io.IOException;

public class BOJRunner {
    public static void main(String[] args) throws IOException {
        TestCaseInputBuilder input = new TestCaseInputBuilder();

        input.inputLine("1 16")
            .run(args);
    }
}
