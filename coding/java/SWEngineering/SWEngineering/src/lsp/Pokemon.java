package lsp;

interface Pokemon {
    void attack();
}

class FirePokemon implements Pokemon {
    @Override
    public void attack() {
        System.out.println("불 속성 공격 성공~");
    }
}

class WaterPokemon implements Pokemon {
    @Override
    public void attack() {
        System.out.println("물 속성 공격 성공~");
    }
}

class ElectronicPokemon implements Pokemon {

    @Override
    public void attack() {
        System.out.println("전기 공격 성공~");
    }
}

class Trainer {
    public void attackPokemon(Pokemon pokemon) {
        pokemon.attack();
    }
}

