# 문자 Card 순열

## 1. 문제

- 문자가 적혀 있는 세 장의 Card를 입력 받습니다.
- 이 세 장의 Card를 이용하여 만들 수 있는 순열을 출력해주세요.

> - 같은 알파벳 카드는 등장하지 않습니다.
> - 재귀호출을 사용하여 구현 해 주세요.


## 2. 입력

- 문자가 적혀 있는 세 장의 Card를 입력 받습니다.

## 3. 출력

- 이 세 장의 Card를 이용하여 만들 수 있는 순열을 출력해주세요.


## 4. 예제 입력
```
A B C
```

## 5. 예제 출력
```
ABC
ACB
BAC
BCA
CAB
CBA
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

char vect[4];
char path[4];
int check[3] = { 0 };

void run(int level) {
	if (level == 3) {
		cout << path << "\n";
		return;
	}

	for (int i = 0; i < 3; i++) {
		if (check[i]) continue;
		check[i] = 1;
		path[level] = vect[i];
		run(level + 1);
		check[i] = 0;
		path[level] = 0;
	}
}

int main() {
	cin >> vect[0];
	cin >> vect[1];
	cin >> vect[2];

	run(0);


	return  0;
}
```
