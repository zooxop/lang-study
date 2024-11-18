package algorithm.java.boj;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class BOJRunner {
    public static void main(String[] args) throws IOException {
        TestCaseInputBuilder input = new TestCaseInputBuilder();

        // 테스트 케이스 입력 e.g.) input.append("5 10");
        input.append("9 3");
        input.append("1 2 3 4 5 6 7 8 9");

        input.inputStringToSystem();

        // 코드 실행
        Main.main(args);
    }

    private static class TestCaseInputBuilder {
        private final StringBuilder stringBuilder = new StringBuilder();

        public void append(String text) {
            stringBuilder.append(text).append("\n");
        }

        public void inputStringToSystem() {
            System.setIn(new ByteArrayInputStream(getBytesForSystemSetIn()));
        }

        private byte[] getBytesForSystemSetIn() {
            return stringBuilder.toString().getBytes();
        }
    }
}
