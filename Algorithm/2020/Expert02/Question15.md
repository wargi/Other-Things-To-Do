# 괄호 계산 #

## 1. 문제

- 중괄호 { } 와 대괄호 [ ]가 섞여있는 문자열이 있습니다.
- 중괄호와 대괄호 안에는 숫자들이 적혀있습니다.

```
ABC123[10]B{3}AT[20][10]BB{2}Q
```

- 왼쪽부터 오른쪽으로 Parsing을 하며, 중괄호 / 대괄호 안에 있는 숫자들로 연산을 하려고 합니다.
- 대괄호[ ] 가 나오면 합을 구하면 되고, 중괄호{ } 가 나오면 곱을 구하면 됩니다.

```
위 예제에서는
[10] {3} [20] [10] {2} 를 구할 수 있으며,

1. 0 + [10] = 10
2. 10 x {3} = 30
3. 30 + [20] = 50
4. 50 + [10] = 60
5. 60 x {2} = 120

따라서 정답은 120 입니다.
```

## 2. 입력

- 문자열을 입력받습니다.

> **[세부조건]**
>
> 1. 1 <= n <= 10,000
>
> 2. 숫자는 모두 양수로 구성되어 있습니다.
>
> 3. 괄호가 부정확한 데이터는 입력되지 않습니다.
>
> 4. 괄호 안에는 모두 숫자로 구성되어 있습니다.

## 3. 출력

- Parsing 후 연산 결과를 출력 해 주세요.

## 4. 예제 입력
```
ABC123[10]B{3}AT[20][10]BB{2}Q
```

## 4. 예제 출력
```
120
```

## 5. 코드
```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int sum = 0;

void add(string s) {

}

int main()
{
	string s;
	cin >> s;
	
	int start = 0;
	while (1) {
		int a = s.find('[', start);
		int b = s.find('{', start);

		if (a != -1 && b != -1) {
			if (a < b) {
				start = a + 1;
				int c = s.find(']', a);
				string res = s.substr(a + 1, c - a - 1);
				sum += stoi(res);
			}
			else {
				start = b + 1;
				int d = s.find('}', b);
				string res = s.substr(b + 1, d - b - 1);
				sum *= stoi(res);
			}
		}
		else if (b != -1) {
			start = b + 1;
			int d = s.find('}', b);
			string res = s.substr(b + 1, d - b - 1);
			sum *= stoi(res);
		}
		else if (a != -1) {
			start = a + 1;
			int c = s.find(']', a);
			string res = s.substr(a + 1, c - a - 1);
			sum += stoi(res);
		}
		else break;
	}

	cout << sum;


	return 0;
}

```
