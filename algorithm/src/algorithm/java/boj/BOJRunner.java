package algorithm.java.boj;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class BOJRunner {
    public static void main(String[] args) throws IOException {
        AutoLineStringBuilder input = new AutoLineStringBuilder();

        // 테스트 케이스 입력 e.g.) input.append("5 10");


        System.setIn(new ByteArrayInputStream(input.getBytesForSystemSetIn()));

        // 코드 실행
        Main.main(args);
    }

    private static class AutoLineStringBuilder {
        StringBuilder stringBuilder = new StringBuilder();

        public void append(String text) {
            stringBuilder.append(text).append("\n");
        }

        public byte[] getBytesForSystemSetIn() {
            return stringBuilder.toString().getBytes();
        }
    }
}
