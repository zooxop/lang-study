public class Test {
    public static void main(String[] args) {
        int a = 3 / 3;
        int b = 3 % 3;

        System.out.println(a + "/" + b);

        System.out.println((a - 1) + "/" + b);  //위로 이동 가능 여부
        System.out.println(a + "/" + (b + 1));  //우측으로 이동 가능 여부
        System.out.println((a + 1) + "/" + b);  //아래로 이동 가능 여부
        System.out.println(a + "/" + (b - 1));  //좌측으로 이동 가능 여부
        System.out.println();
        System.out.println("Heuristic '123456798': " + getHeuristicVal("123456798"));
    }

    //제 위치에 있지 않은 타일 개수 리턴(휴리스틱)
    private static int getHeuristicVal(String data){
        int cnt = 0;
        String target = "123456789";
        for (int i=0; i < data.length(); i++){
            if (target.charAt(i) != data.charAt(i)){
                if (data.charAt(i) != '9'){
                    cnt++;
                }
            }
        }
        return cnt;
    }
}
