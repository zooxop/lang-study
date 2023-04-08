package week06.decorator.pokemon;

public class BasicPokemon implements Pokemon {
    private String name;
    private int level;
    private int hp;

    public BasicPokemon(String name, int level, int hp) {
        this.name = name;
        this.level = level;
        this.hp = hp;
    }

    @Override
    public void attack() {
        System.out.println(name + " 공격 시전!");
    }

    @Override
    public int getLevel() {
        return this.level;
    }

    @Override
    public int getHP() {
        return this.hp;
    }

    @Override
    public String getName() {
        return this.name;
    }
}
