public class Test {
    public static void main(String[] args) {
        int a = 3 / 3;
        int b = 3 % 3;

        System.out.println(a + "/" + b);

        System.out.println((a - 1) + "/" + b);  //위로 이동 가능 여부
        System.out.println(a + "/" + (b + 1));  //우측으로 이동 가능 여부
        System.out.println((a + 1) + "/" + b);  //아래로 이동 가능 여부
        System.out.println(a + "/" + (b - 1));  //좌측으로 이동 가능 여부
    }
}
