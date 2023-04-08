package week05.src;

public class KoreanSubscriber implements Subscriber {

    private String name;
    private int value;
    private Subject landCh;  // has-a

    public KoreanSubscriber(String name, LandCh landCh) {
        this.name = name;
        this.landCh = landCh;
        landCh.registerSubscriber(this);
    }

    @Override
    public void update() {
        this.value = landCh.getPrice();  // pull 방식
        System.out.println(name + "님 가격이 " + value + "원으로 변경되었습니다.");
    }
}
