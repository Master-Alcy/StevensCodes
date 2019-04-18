#include <iostream>
using namespace std;

class Fraction {
private:
  int num, den;
public:
  Fraction(int n, int d) {
    num = n;
		den = d;
	}
  friend ostream& operator <<(ostream& s, Fraction f);
	friend Fraction operator +(Fraction left, Fraction right);
	friend Fraction operator -(Fraction a);
};

ostream& operator <<(ostream& s, Fraction f) {
	s << f.num << '/' << f.den;
	return s;
}

Fraction operator +(Fraction left, Fraction right) {
	return Fraction(left.num*right.den + right.num*left.den, left.den*right.den);
}

Fraction operator -(Fraction a) {
	return Fraction(-a.num, a.den);
}

int main() {
  const	Fraction a(1,2); // 1/2
	const Fraction b(1,3); // 1/3
	Fraction c = a + b;
	Fraction d = -a;
	cout << c << '\t' << d << '\n';


}



