package week10.singleton;

class Singleton {
    //public Singleton() { }

    private static Singleton singleton = new Singleton();

    private Singleton() {
        System.out.println("Only One!");
    }

    public static Singleton getSingleton() {
        return singleton;
    }
}

public class SingletonDemo {
    public static void main(String[] args) {
        System.out.println(Singleton.getSingleton());
        Singleton s3 = Singleton.getSingleton();
        Singleton s4 = Singleton.getSingleton();
        System.out.println(s3);  // 같은 메모리 공간을 사용한다.
        System.out.println(s4);  // 같은 메모리 공간을 사용한다.
//        Singleton s1 = new Singleton();
//        Singleton s2 = new Singleton();
//        System.out.println(s1);
//        System.out.println(s2);
    }
}
