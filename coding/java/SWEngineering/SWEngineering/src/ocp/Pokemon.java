package ocp;

public abstract class Pokemon {
    private String name;
    protected int level;
    protected int hp;

    public Pokemon(String name, int level, int hp) {
        this.name = name;
        this.level = level;
        this.hp = hp;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public abstract void attack();
    public abstract void evolve();
}
