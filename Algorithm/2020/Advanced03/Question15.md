# 상하좌우 판별 #

## 1. 문제

```
1. 1, 0으로 구성된 2차원 배열(4x4)을 입력 받습니다.

2. 만약, 1을 입력받은 좌표의 상하좌우에 1이 있다면 "위험한 상태"라고 출력해주시고,
   없다면 "안전한 상태"라고 출력하는 프로그램을 작성해주세요.
```

## 2. 입력
- 1, 0으로 구성된 2차원 배열(4x4)을 입력 받습니다.

## 3. 출력
- 만약, 1을 입력받은 좌표의 상하좌우에 1이 있다면 "위험한 상태"라고 출력해주시고, 없다면 "안전한 상태"라고 출력하는 프로그램을 작성해주세요.

## 4. 예제 입력
```
1 0 0 0
0 1 1 0
0 0 0 1
0 0 0 0
```

## 5. 예제 출력
```
위험한 상태
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int map[4][4];

int getState(int y, int x) {
	int direct[4][2] = {
		-1, 0,
		1, 0,
		0, -1,
		0, 1
	};

	for (int i = 0; i < 4; i++) {
		int dy = y + direct[i][0];
		int dx = x + direct[i][1];

		if (dy >= 0 && dy < 4 && dx >= 0 && dx < 4 && map[dy][dx] == 1) return 0;
	}

	return 1;
}


int main() {

	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			cin >> map[i][j];
		}
	}

	int flag = 1;
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			if (map[i][j] == 1 && !getState(i, j)) {
				flag = 0;
				break;
			}
		}
	}

	if (flag) cout << "안전한 상태";
	else cout << "위험한 상태";

	return 0;
}
```
