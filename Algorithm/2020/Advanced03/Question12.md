# 구조체 Pointer

## 1. 문제
- 아래의 구조체를 하드코딩 해주세요.

```c++
struct ABC {
  int data[4];
  int x;
};

ABC a = { { 1, 2, 3, 4 }, 10 };
ABC b = { { 7, 8, 9, 10 }, 15 };
```

- p와 g의 ABC 구조체 포인터를 만들고, p -> a를, g -> b를 가르키게 만들어주세요.
- 그리고 p, g가 가르키는 곳의 값을 출력해주세요.

## 2. 출력
- p, g가 가르키는 곳의 값을 출력해주세요.

## 3. 예제 출력
```
1 2 3 4
10
7 8 9 10
15
```

## 4. 코드

```c++
#include <iostream>
using namespace std;

struct ABC {
	int data[4];
	int x;
};

int main() {
	ABC a = { { 1, 2, 3, 4 }, 10 };
	ABC b = { { 7, 8, 9, 10 }, 15 };
	ABC* p = &a, * g = &b;

	for (int i = 0; i < 4; i++) {
		cout << p->data[i] << " ";
	}

	cout << "\n" << p->x << "\n";

	for (int i = 0; i < 4; i++) {
		cout << g->data[i] << " ";
	}

	cout << "\n" << g->x << "\n";

	return 0;
}
```
