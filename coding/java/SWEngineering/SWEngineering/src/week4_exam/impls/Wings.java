package week4_exam.impls;

import week4_exam.interfaces.Fly;

public class Wings implements Fly {

    @Override
    public void fly() {
        System.out.println("날개를 사용해 날아갑니다!");
    }
}
