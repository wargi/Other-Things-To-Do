# 인접 행렬 그래프

## 1. 문제

- 아래의 그림 같이 5개의 노드를 가진 그래프를 인접행렬로 하드코딩 하고, 어떤 간선들이 존재하는지 아래의 예제 출력과 같이 출력해주세요.

<img src="./Graph03.png" alt="Graph" style="zoom:80%;" />

- 입력 값은 없습니다.

## 2. 출력
- 위의 문제 설명처럼 출력해주세요.

## 3. 예제 출력

```
A B 1
A C 7
A D 2
B C 8
B E 5
C D 3
C E 6
```

## 4. 코드

```c++
#include <iostream>
using namespace std;

int map[5][5] = {
	0, 1, 7, 2, 0,
	1, 0, 8, 0, 5,
	7, 8, 0, 3, 6,
	2, 3, 0, 0, 0,
	0, 5, 6, 0, 0
};

int main() {
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			if (map[i][j] > 0 && j >= i) {
				cout << char(i + 65) << " " << char(j + 65) << " " << map[i][j] << "\n";
			}
		}
	}

	return 0;
}
```
