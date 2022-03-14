import java.io.BufferedReader;
import java.io.InputStreamReader;

public class EightPuzzle {
    public static final String TARGET = "12345678N";

    public static void main(String[] args) throws Exception{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String input = br.readLine();

        int g = 0;  //시작노트로부터의 거리
        int h = 0;  //제 위치에 있지 않은 타일 개수
        int f = 0;  //g + h

        for(int i=0; i < input.length(); i++){
            if (input.charAt(i) != TARGET.charAt(i)){
                h++;
                System.out.print(input.charAt(i) + " ");
            }

            //To-do
            // 1. Node의 위치 기준으로 움직일 수 있는 영역을 가져오는 메소드 작성하기.
            // 2. 경우의 수 마다 f(n) 값을 도출해내어 최적의 경로를 탐색해나가기.
        }
        System.out.println("\nh : " + h);
    }
}


/*
Target :
    1 2 3
    4 5 6
    7 8 N

Input example :
    2 1 3
    4 N 5
    7 8 6

 */