package week11;

import java.util.Random;

public class Pokemon {
    private String name;
    private boolean available = true;

    public Pokemon(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public void catchPokemon(String trainerName) {
        try {
            Thread.sleep(new Random().nextInt(100));
            System.out.println(trainerName + " caught " + name + " (" + this + ")");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        setAvailable(true);
    }
}
