package lsp;

public class PokemonDemo {

    public static void main(String[] args) {
        Trainer trainer = new Trainer();
        trainer.attackPokemon(new FirePokemon());
        trainer.attackPokemon(new WaterPokemon());
        trainer.attackPokemon(new ElectronicPokemon());
    }
}
