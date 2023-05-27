package week13.command;

public class Pokemon {
    private String name;

    public Pokemon(String name) {
        this.name = name;
    }

    public void attack() {
        System.out.println(name + "가(이) 공격합니다.");
    }

    public void depend() {
        System.out.println(name + "가(이) 방어합니다.");
    }
}
