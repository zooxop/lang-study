package week4_exam;

import week4_exam.abs.Pokemon;
import week4_exam.impls.*;
import week4_exam.realizations.Charizard;
import week4_exam.realizations.Pikachu;
import week4_exam.realizations.Squirtle;

public class PokemonMain {
    public static void main(String[] args) {
        System.out.println("포켓몬스터 인하 게임을 시작합니다.");

        Pokemon pikachu = new Pikachu("피카츄", 1, 10, new Thunderbolt(), new NoFly());
        Pokemon charizard = new Charizard("리자몽", 2, 20, new Flamethrower(), new Wings());
        Pokemon squirtle = new Squirtle("꼬부기", 3, 30, new BubbleBeam(), new JetPack());

        pikachu.performAttack(charizard);
        charizard.performAttack(pikachu);
        squirtle.performAttack(charizard);

        pikachu.performFly();
        charizard.performAttack(squirtle);

        charizard.evolve();
        charizard.performFly();

        charizard.performAttack(pikachu);
        squirtle.evolve();
        squirtle.performAttack(charizard);

        System.out.println("게임을 종료합니다!");
    }
}


/*
포켓몬스터 인하 게임을 시작합니다...
피카 피카~
자몽 자몽!
꼬북 꼬북...
전기를 리자몽에게 내뿜습니다!
화염방사를 피카츄에게 사용합니다!
거품광선을 리자몽에게 발사합니다!
날 수 없어요!
화염방사를 꼬부기에게 사용합니다!
리자몽이(가) 진화했습니다!
날개를 사용해 날아갑니다!
화염방사를 피카츄에게 사용합니다!
꼬부기이(가) 진화했습니다!
거품광선을 리자몽에게 발사합니다!
게임을 종료합니다!
 */