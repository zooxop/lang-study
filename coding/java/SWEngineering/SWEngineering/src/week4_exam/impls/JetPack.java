package week4_exam.impls;

import week4_exam.interfaces.Fly;

public class JetPack implements Fly {

    @Override
    public void fly() {
        System.out.println("JetPack을 사용해 날아갑니다!");
    }
}
