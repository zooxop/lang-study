import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.PriorityQueue;

public class EightPuzzle {
    public static final String TARGET = "123456789";
    public static char[][] puzzle = new char[3][3];

    //{위, 우측, 아래, 좌측} 이동 가능여부 체크를 위한 변수
    public static int[] verTemplate = {-1, 0, 1, 0};  //위, 0, 아래, 0
    public static int[] horTemplate = {0, 1, 0, -1};  //0, 우, 0, 좌

    public static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    //
    public static HashMap<Integer, Integer> historyMap = new HashMap<>();
    public static HashSet<Integer> impossibleSet = new HashSet<>();

    public static PriorityQueue<Node> priorityQueue = new PriorityQueue<>(new Comparator<Node>() {
        @Override
        public int compare(Node o1, Node o2) {
            if(o1.f == o2.f) {
                return Integer.compare(o1.g, o2.g);
            } else {
                return Integer.compare(o1.f, o2.f);
            }
        }
    });

    public static class Node {
        private String puzzle;
        private int g;  //시작 노드로부터의 거리(총 cost)
        private int f;  //출발 지점에서 목적지까지 총 cost의 합

        public Node(String puzzle, int g, int f){
            this.puzzle = puzzle;
            this.g = g;
            this.f = f;
        }
    }
    public static void main(String[] args) throws Exception{
        int g = 0;  //시작노드로부터의 거리
        int h = 0;  //제 위치에 있지 않은 타일 개수
        int f = 0;  //g + h

        setData();



    }

    public static void aStar(){
        while (!priorityQueue.isEmpty()){
            Node tempNode = priorityQueue.poll();
            String tempPuzzle = tempNode.puzzle;

            int nodeIdx = tempPuzzle.indexOf("9");  //Node의 위치
            //상하 => [0~2:0], [3~5:1], [6~8:2] 리턴.
            int ver = nodeIdx / 3;
            //좌우 => [0,3,5:0], [1,4,7:1], [2,5,8:2] 리턴.
            int hor = nodeIdx % 3;

            if(impossibleSet.contains(Integer.parseInt(tempPuzzle))) {
                //
                return;
            }

            String data = "";
            for(int i=0; i < 4; i++){
                int upDown = ver + verTemplate[i]; // {-1, 0, 1, 0} => -1 값이 0보다 작으면 위로 올라갈 수 없고, +1 값이 2보다 크면 아래로 내려갈 수 없음.
                int leftRight = hor + horTemplate[i]; // { 0, 1, 0 -1} => -1 값이 0보다 작으면 좌측으로 이동할 수 없고, +1 값이 2보다 크면 우측으로 이동할 수 없음.
                if (rangeCheck(upDown, leftRight)){
                    StringBuilder sb = new StringBuilder(tempPuzzle);
                    sb = swap(ver, hor, upDown, leftRight, sb);
                    data = sb.toString();
                    if(historyMap.containsKey(Integer.parseInt(data))){  //이미 방문한 적 있는 케이스라면 건너뛰기
                        continue;
                    } else {
                        int g = tempNode.g;
                        int heuristic = getHeuristicVal(data);
                        int f = g + heuristic;
                        priorityQueue.add(new Node(data, g+1, f));
                        historyMap.put(Integer.parseInt(data), g+1);
                        //여기부터
                    }
                }
            }
        }
    }

    //제 위치에 있지 않은 타일 개수 리턴(휴리스틱)
    private static int getHeuristicVal(String data){
        int cnt = 0;
        for (int i=0; i < data.length(); i++){
            if (TARGET.charAt(i) != data.charAt(i)) cnt++;
        }
        return cnt;
    }

    private static StringBuilder swap(int ver, int hor, int upDown, int leftRight, StringBuilder sb){
        int currentVal = ver * 3 + hor;  //현재위치. ver 값에 다시 3을 곱해준 뒤, hor값을 더하면 된다.
        int nextVal = upDown * 3 + leftRight;  //(Node가 이동가능한) 다음 위치.
        char temp = sb.charAt(currentVal);
        sb.setCharAt(currentVal, sb.charAt(nextVal));  //현재 위치 값을 다음 위치 값으로 변경.
        sb.setCharAt(nextVal, temp);  //다음 위치 값을 현재 위치 값으로 변경.

        return sb;
    }

    //상하좌우 계산값이 0이상 3미만일 때만 움직일 수 있다.
    public static boolean rangeCheck(int upDown, int leftRight){
        if (upDown >= 0 && upDown < 3 && leftRight >= 0 && leftRight < 3){
            return true;
        } else {
            return false;
        }
    }

    public static void setData() throws IOException {
        String input = "";
        for(int row=0; row < 3; row++){
            puzzle[row] = br.readLine().toCharArray();
            for(int col=0; col < 3; col++){
                input += puzzle[row][col];
            }
        }
        priorityQueue.add(new Node(input, 0, 0));  //초기값 설정
        historyMap.put(Integer.parseInt(input), 0);
    }
}

//To-do
// 1. Node의 위치 기준으로 움직일 수 있는 영역을 가져오는 메소드 작성하기.
// 2. 경우의 수 마다 f(n) 값을 도출해내어 최적의 경로를 탐색해나가기.


/*
Target : ("9"는 Node를 의미함)
    1 2 3
    4 5 6
    7 8 9

Input example :
    213
    495
    786

 */