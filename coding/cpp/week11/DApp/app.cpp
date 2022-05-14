#include <iostream>
using namespace std;

class Shape
{
public:
	virtual void Move(double x, double y);  
	virtual void Draw() const = 0;  // virtual, 순수 가상함수.

	Shape();
	Shape(double x, double y);

protected:
	double _x, _y;
};


void Shape::Draw() const
{
	cout << "[Shape] Position = ( " << _x << ", " << _y << ")\n";
}


Shape::Shape()
{
	_x = _y = 0.0;
}

Shape::Shape(double x, double y)
{
	_x = x;
	_y = y;
}

void Shape::Move(double x, double y)
{
	_x = x;
	_y = y;
}


class Rectangle : public Shape
{
public:
	void Draw() const;
	void Resize(double width, double height);

	Rectangle();
	Rectangle(double x, double y, double width, double height);

protected:
	double _width;
	double _height;

};

Rectangle::Rectangle()
{
	_width = _height = 100.0f;
}

Rectangle::Rectangle(double x, double y, double width, double height)
: Shape(x, y)
{
	Resize( width, height);
}

void Rectangle::Draw() const
{
	cout << "[Rectangle] Position = ( " << _x << ", " << _y << ") "
		"Size = ( " << _width << ", " << _height << ")\n";
}

void Rectangle::Resize(double width, double height)
{
	_width = width;
	_height = height;
}


class Circle : public Shape
{
public:
	void Draw() const;
	void SetRadius(double radius);

	Circle();
	Circle(double x, double y, double radius);

protected:
	double _radius;
};

Circle::Circle()
{
	_radius = 100.0f;
}

Circle::Circle(double x, double y, double radius)
: Shape(x, y)
{
	SetRadius( radius);
}

void Circle::Draw() const
{
	cout << "[Circle] Position = ( " << _x << ", " << _y << ") "
		"Radius = " << _radius << "\n";
}

void Circle::SetRadius(double radius)
{
	_radius = radius;
}

int main()
{
	Shape* shapes[5] = {nullptr};

	shapes[0] = new Circle( 100, 100, 50);
	shapes[1] = new Rectangle( 300, 300, 100, 100);
	shapes[2] = new Rectangle( 200, 100, 50, 150);
	shapes[3] = new Circle(100, 300, 150);
	shapes[4] = new Rectangle( 200, 200, 200, 200);

	for (int i = 0; i < 5; ++i)
		shapes[i]->Draw();

	for (int i = 0; i < 5; ++i)
	{
		delete shapes[i];
		shapes[i] = NULL;
	}

	return 0;
}

