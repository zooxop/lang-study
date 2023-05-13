package week11;

public class Trainer implements Runnable {
    private PokemonCenter center;
    private String trainName;
    private int numCatches;

    public Trainer(PokemonCenter center, String trainName, int numCatches) {
        this.center = center;
        this.trainName = trainName;
        this.numCatches = numCatches;
    }

    @Override
    public void run() {
        int catches = 0;
        while (catches < numCatches) {
            Pokemon p = center.getPokemon();
            if(p != null) {
                p.catchPokemon(trainName);
                catches++;
            }
        }
    }
}
