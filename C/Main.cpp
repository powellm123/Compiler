#include <iostream>
using namespace std;

class DemoC {
public:
    DemoC() {}

    int fib(int k) {
		//cout << k;
		if (k == 0) return 0;
		else if (k == 1) return 1;
		else return (fib(k - 1) + fib(k - 2));
    }
};

int main() {
    int k;
    int j;
    int sum;
    DemoC dc;

    cout << '>';
    cin >> k;
    cout << '\n';

    while (k != 0) {
		if (k < 0) {
			k = k + -1;
			sum = 0;
			while (k > 0) {		
				j = k;
				while (j >= 1) {
					if ((j * 3) > 15)
						sum = 2 * sum + j * 3;
					j = j - 1;
				}
				k = (k - 1);
			}

			cout << sum;
			cout << '\n';

		}
		else {
			sum = dc.fib(k);
			cout << sum;
			cout << '\n';
		}

		cout << '>';
		cin >> k;
		cout << '\n';
    }
	return 0;
}
