# 무인도 사이즈

## 1. 문제

- 지효는 땅이 얼마나 큰지 알아내는 드론을 띄웠습니다.
- ↑ ↓ ← → 으로 땅이 붙어있는 경우는 하나의 땅입니다

## 2. 입력
- 4x4 땅 상태를 입력 받아 주세요.

## 3. 출력

- (0, 0) 부터 상, 하, 좌, 우 네 방향으로 붙어있는 육지의 크기를 출력해주세요.
- 아래 예제입력의 사이즈는 5 입니다.


## 4. 예제 입력
```
1 1 0 1
0 1 0 1
0 1 1 0
1 0 0 0
```

## 5. 예제 출력
```
5
```

## 6. 코드

```c++
#include<iostream>
using namespace std;

struct Node {
	int y, x;
};

int maxi = -21e8;
int map[4][4] = { 0 };
int visited[4][4] = { 0 };
int direct[4][2] = { -1, 0, 1, 0, 0, -1, 0, 1 };

int run(int sy, int sx) {
	Node vect[20];
	int cnt = 1;
	int head = 0, tail = 1;
	vect[head] = { sy, sx };
	
	while (head != tail) {
		Node now = vect[head++];

		for (int i = 0; i < 4; i++) {
			int dy = now.y + direct[i][0];
			int dx = now.x + direct[i][1];

			if (dy >= 0 && dx >= 0 && dy < 4 && dx < 4 && map[dy][dx] && !visited[dy][dx]) {
				cnt++;
				visited[dy][dx] = 1;
				vect[tail++] = { dy, dx };
			}
		}
	}

	return cnt;
}

int main() {
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			cin >> map[i][j];
		}
	}

	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			if (map[i][j] && !visited[i][j]) {
				visited[i][j] = 1;
				int t = run(i, j);
				if (t > maxi) maxi = t;
			}
		}
	}

	cout << maxi;

	return 0;
}
```
