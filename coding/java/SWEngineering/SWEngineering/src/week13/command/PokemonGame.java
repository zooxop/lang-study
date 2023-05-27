package week13.command;

// 클라이언트 클래스
public class PokemonGame {
    public static void main(String[] args) {
        Pokemon pikachu = new Pokemon("피카츄");  // 리시버 객체 생성

        Command attackCommand = new AttackCommand(pikachu);  // 커맨드 객체 생성
        Command dependCommand = new DependCommand(pikachu);  // 커맨드 객체 생성

        Game game = new Game();  // 인보커 객체 (만능 리모컨)
        game.setCommand(attackCommand);  // 커맨드 등록
        game.play();
        //game.setCommand(dependCommand);  // 커맨드 등록
        game.setCommand(() -> pikachu.depend());  // lambda expression
        game.play();
    }
}
