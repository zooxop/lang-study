package week13.command;

public class AttackCommand implements Command {
    private Pokemon pokemon;

    public AttackCommand(Pokemon pokemon) {
        this.pokemon = pokemon;
    }

    @Override
    public void execute() {
        pokemon.attack();
    }
}
