package week05.headfirst.designpatterns.observer.weather;

public interface Observer {
    public void update(float temp, float humidity, float pressure);
}

