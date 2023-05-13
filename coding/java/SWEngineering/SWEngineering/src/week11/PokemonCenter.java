package week11;

import java.util.ArrayList;

// Singleton design pattern
public class PokemonCenter {
    private ArrayList<Pokemon> pokemonList = new ArrayList<>();
    private static PokemonCenter center = null;

    private PokemonCenter() {
        pokemonList.add(new Pokemon("피카츄"));
        pokemonList.add(new Pokemon("파이리"));
        pokemonList.add(new Pokemon("꼬부기"));
    }

    public synchronized static PokemonCenter getCenter() {
        if (center == null) {
            center = new PokemonCenter();
        }
        return center;
    }

    public synchronized Pokemon getPokemon() {
        for(Pokemon p: pokemonList) {
            if(p.isAvailable()) {
                p.setAvailable(false);
                return p;
            }
        }
        return null;
    }
}
