import java.util.*;

public class EightPuzzle {
    public static char[] puzzle = {'2','8','3',
                                   '1','6','4',
                                   '7','0','5'};

    public static char[] goal = {'1','2','3',
                                 '8','0','4',
                                 '7','6','5'};

    public static PriorityQueue<State> openQueue = new PriorityQueue<>(new Comparator<State>() {
        @Override
        public int compare(State o1, State o2) {
            if(o1.f() == o2.f()) {
                return Integer.compare(o1.g(), o2.g());
            } else {
                return Integer.compare(o1.f(), o2.f());
            }
        }
    });

    public static class State {
        private char[] board;
        private int moves;
        private char[] goal;

        public State(char[] board, int moves, char[] goal) {
            this.board = board;
            this.moves = moves;
            this.goal = goal;
        }

        //Node를 이동시킨 상태 객체를 new return
        public State getNewBoard(int i1, int i2, int moves){
            char[] newBoard = this.board.clone();
            char temp = newBoard[i1];
            newBoard[i1] = newBoard[i2];
            newBoard[i2] = temp;
            return new State(newBoard, moves, this.goal);
        }

        public List<State> expand(int moves){
            List<State> result = new ArrayList<>();
            int i = 0;
            //Node 위치 탐색
            for (int j=0; j < this.board.length; j++){
                if (this.board[j] == '0') i = j;
            }

            if (i != 0 && i != 1 && i != 2){  //Up
                result.add(this.getNewBoard(i, i-3, moves));
            }
            if (i != 0 && i != 3 && i != 6){  //Left
                result.add(this.getNewBoard(i, i-1, moves));
            }
            if (i != 2 && i != 5 && i != 8){  //Right
                result.add(this.getNewBoard(i, i+1, moves));
            }
            if (i != 6 && i != 7 && i != 8){  //Down
                result.add(this.getNewBoard(i, i+3, moves));
            }
            return result;
        }

        //f(n) = g(n) + h(n)
        public int f(){
            return this.h() + this.g();
        }

        //h(n) = 제 위치에 있지 않은 타일 개수
        public int h(){
            int cnt = 0;
            for (int i=0; i < this.board.length; i++){
                if (this.board[i] != goal[i] && this.board[i] != '0') cnt++;  //Node "0" 제외.
            }
            return cnt;
        }

        //g(n) = 이동 횟수(시작 노드로부터의 거리)
        public int g(){
            return this.moves;
        }

        public void print(){
            System.out.println("------- f(n) = " + this.f());
            System.out.println("------- h(n) = " + this.h());
            System.out.println("------- g(n) = " + this.g());
            for (int i=0; i < this.board.length; i++){
                System.out.print(this.board[i] + " ");
                if (i % 3 == 2){
                    System.out.println();
                }
            }
            System.out.println("------- -------");
        }
    }

    public static void main(String[] args) {
        //openQueue : 우선순위 큐. f(n)값이 1순위, g(n)값이 2순위 이다.
        openQueue.add(new State(puzzle, 0, goal));  //초기 상태값 입력.
        List<State> closedQueue = new ArrayList<>();
        boolean isSuccess = false;

        while(!openQueue.isEmpty()){
            State current = openQueue.poll();
            current.print();

            if (Arrays.equals(current.board, goal)){
                System.out.println("탐색 성공");
                isSuccess = true;
                break;
            }

            //이동 가능한 경우의 수 만큼 노드를 확장시킨 뒤 리턴한다.
            for (State state : current.expand(current.moves + 1)){
                if (!closedQueue.contains(state)){  //방문한 적 없는 경우에만 add
                    openQueue.add(state);
                }
            }
            closedQueue.add(current);  //방문 기록
        }

        if (!isSuccess){
            System.out.println("탐색 실패.");
        }
    }
}
