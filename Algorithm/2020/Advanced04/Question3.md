# Binary Search Tree로 정렬하기 #

## 1. 문제
- 다섯 개의 숫자를 Binary Search Tree 자료구조에 저장하고, 작거나 같은 수는 왼쪽, 큰 수는 오른쪽에 저장하는 Binary Search Tree에서 DFS를 이용하여 쉽게 숫자를 정렬하고 출력할 수 있습니다.

<img src="./Graph01.png" alt="Graph" style="zoom:80%;" />

- Binary Search Tree 자료구조를 만들고, 다섯 개의 숫자를 입력받아, Binary Search Tree에 순서대로 insert 해주세요.
- 만들어진 Binary Search Tree를 탐색하여, 정렬 결과를 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫 줄: 다섯 개의 숫자를 입력받는다.

## 3. 출력
- 만들어진 Binary Search Tree를 탐색하여, 정렬 결과를 출력하시오.

## 4. 예제 입력
```
5 7 2 3 1
```

## 5. 예제 출력
```
1 2 3 5 7
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int vect[1000];
void insert(int now, int v) {
	if (vect[now] == 0) {
		vect[now] = v;
		return;
	}

	if (vect[now] < v) insert(now * 2 + 1, v);
	else insert(now * 2, v);
}

void run(int now) {
	if (vect[now] == 0) return;

	run(now * 2);
	cout << vect[now] << " ";
	run(now * 2 + 1);
}

int main() {
	for (int i = 0; i < 5; i++) {
		int t;
		cin >> t;

		insert(1, t);
	}

	run(1);

	return 0;
}
```
