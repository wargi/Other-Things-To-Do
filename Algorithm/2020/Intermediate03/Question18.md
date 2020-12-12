# 두 개의 max값 찾기

## 1. 문제

- 9개의 숫자를 입력 받으세요.
- 그 중, 가장 큰 숫자의 좌표와 다음으로 큰 숫자의 좌표를 출력하세요.

## 2. 입력
- 9개의 숫자를 입력 받으세요.

## 3. 출력

- 가장 큰 숫자의 좌표와 다음으로 큰 숫자의 좌표를 출력하세요.

## 4. 예제 입력

```
3 5 1
9 2 7
6 11 3
```

## 5. 예제 출력
```
첫번째:11(2,1)
두번째:9(1,0)
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int map[3][3];

int main() {
	int max[2] = { -1, -1 };
	int x = -1, y = -1, dx = -1, dy = -1;

	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			cin >> map[i][j];
		}
	}

	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			if (max[0] < map[i][j]) {
				max[1] = max[0];
				dx = x;
				dy = y;

				max[0] = map[i][j];
				x = j;
				y = i;
			}
		}
	}

	cout << "첫번째:" << max[0] << "(" << y << "," << x << ")\n";
	cout << "두번째:" << max[1] << "(" << dy << "," << dx << ")";

	return 0;
}
```
