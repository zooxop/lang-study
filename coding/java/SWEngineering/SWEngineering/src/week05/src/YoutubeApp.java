package week05.src;

public class YoutubeApp {
    public static void main(String[] args) {
        LandCh landCh = new LandCh();

        // LandCh 채널의 구독자 2명 추가.
        KoreanSubscriber ks1 = new KoreanSubscriber("꼬부기", landCh);
        KoreanSubscriber ks2 = new KoreanSubscriber("리자몽", landCh);

        landCh.setPrice(3000000);

        KoreanSubscriber ks3 = new KoreanSubscriber("개굴닌자", landCh);

        landCh.setPrice(2900000);

        // 리자몽 구독 해제
        landCh.removeSubscriber(ks2);

        Subscriber es1 = new EnglishSubscriber("Pikachu", landCh);

        landCh.setPrice(2000000);
    }
}
