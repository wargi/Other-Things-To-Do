# Binary Search Tree 탐색하기

## 1. 문제

- 숫자 다섯 개를 다섯 칸짜리 1차원 배열에 입력 받아주세요.
- 그리고 아래의 Binary Search Tree 이미지를 1차원 배열에 하드코딩 해주세요.

<img src="./Graph02.png" alt="Graph" style="zoom:80%;" />

- 재귀 호출을 이용하여 target 숫자들이 각각 존재하는지 찾아서 출력하는 프로그램을 작성해주세요.

## 2. 입력
- 숫자 다섯 개를 다섯 칸짜리 1차원 배열에 입력 받아주세요.

## 3. 출력

- 재귀 호출을 이용하여 target 숫자들이 각각 존재하는지 찾아서 출력해주세요.

## 4. 예제 입력

```
8 16 9 25 30
```

## 5. 예제 출력

```
8:3회만에찾음
16:4회만에찾음
9:없음
25:3회만에찾음
30:없음
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int vect[1000] = { 0 };

void insert(int val) {
	int now = 1;

	while (1) {
		if (vect[now] == 0) {
			vect[now] = val;
			return;
		}

		if (vect[now] < val) now = now * 2 + 1;
		else now = now * 2;
	}
}

int find(int v) {
	int now = 1, cnt = 0;

	while (1) {
		cnt++;
		if (now > 1000) return 0;
		if (vect[now] == 0) return 0;
		if (vect[now] == v) return cnt;

		if (vect[now] < v) now = now * 2 + 1;
		else now = now * 2;
	}
}

int main() {
	insert(15);
	insert(7);
	insert(19);
	insert(8);
	insert(17);
	insert(25);
	insert(16);
	insert(18);

	for (int i = 0; i < 5; i++) {
		int n;
		cin >> n;

		int cnt = find(n);

		if (cnt) cout << n << ":" << cnt << "회만에찾음\n";
		else cout << n << ":" << "없음\n";
	}

	return 0;
}
```
