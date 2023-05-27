package week13.command;

public class DependCommand implements Command {
    private Pokemon pokemon;

    public DependCommand(Pokemon pokemon) {
        this.pokemon = pokemon;
    }

    @Override
    public void execute() {
        pokemon.depend();
    }
}
