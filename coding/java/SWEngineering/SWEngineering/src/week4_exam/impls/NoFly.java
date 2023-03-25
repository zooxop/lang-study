package week4_exam.impls;

import week4_exam.interfaces.Fly;

public class NoFly implements Fly {

    @Override
    public void fly() {
        System.out.println("날 수 없어요!");
    }
}
