# Binary Search Tree 만들고 탐색하기

## 1. 문제

- Binary Search Tree 자료구조에 값을 넣을 n개의 숫자를 입력받으세요.
- 이제 1~6까지 각 숫자들이 Binary Search Tree에 존재하는지 출력하는 프로그램을 작성해주세요.
- insert함수와 find함수는 모두 재귀호출로 구현해주세요.

<img src="./Graph03.png" alt="Graph" style="zoom:60%;" />

## 2. 입력

- 첫 줄: Binary Search Tree에 넣을 n개의 숫자
- 마지막 줄: n개의 숫자 값

## 3. 출력

- 이제 1~6까지 각 숫자들이 Binary Search Tree에 존재하는지 출력해주세요.

## 4. 입력 예시

```
4
1 3 4 7
```

## 5. 출력 예시

```
1:O
2:X
3:O
4:O
5:X
6:X
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int vect[1000] = { 0 };
void insert(int now, int v) {
	if (vect[now] == 0) {
		vect[now] = v;
		return;
	}

	if (vect[now] < v) insert(now * 2 + 1, v);
	else insert(now * 2, v);
}

char find(int now, int v) {
	if (now > 1000) return 'X';
	if (vect[now] == 0) return 'X';
	if (vect[now] == v) return 'O';

	if (vect[now] < v) find(now * 2 + 1, v);
	else find(now * 2, v);
}

int main() {
	int n;
	cin >> n;

	for (int i = 0; i < n; i++) {
		int t;
		cin >> t;

		insert(1, t);
	}

	for (int i = 1; i <= 6; i++) {
		cout << i << ":" << find(1, i) << "\n";
	}

	return 0;
}
```
