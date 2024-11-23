package algorithm.java.boj;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class TestCaseInputBuilder {
    private final StringBuilder stringBuilder = new StringBuilder();

    public TestCaseInputBuilder inputLine(String text) {
        stringBuilder.append(text).append("\n");
        return this;
    }

    public void run(String[] args) throws IOException {
        inputStringToSystem();
        Main.main(args);
        System.out.println("==============");
    }

    private void inputStringToSystem() {
        System.setIn(new ByteArrayInputStream(getBytesForSystemSetIn()));
    }

    private byte[] getBytesForSystemSetIn() {
        return stringBuilder.toString().getBytes();
    }
}
