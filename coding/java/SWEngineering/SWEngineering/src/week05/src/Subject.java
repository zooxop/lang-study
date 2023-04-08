package week05.src;

public interface Subject {
    public void registerSubscriber(Subscriber subscriber);
    public void removeSubscriber(Subscriber subscriber);
    public void notifySubscriber();
    public int getPrice();
}
