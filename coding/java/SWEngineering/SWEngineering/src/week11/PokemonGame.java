package week11;

public class PokemonGame {
    private static final int TRAINER_NUMBER = 5;
    private static final int CATCHES_PER_TRAINER = 3;

    public static void main(String[] args) {
        PokemonCenter pokemonCenter = PokemonCenter.getCenter();
        Trainer[] trainers = new Trainer[TRAINER_NUMBER];
        Thread[] threads = new Thread[TRAINER_NUMBER];

        for(int i = 0; i < TRAINER_NUMBER; i++) {
            trainers[i] = new Trainer(pokemonCenter,"Trainer " + (i+1), CATCHES_PER_TRAINER);
            threads[i] = new Thread(trainers[i]);
            threads[i].start();
        }
    }
}
