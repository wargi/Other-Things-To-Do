# 치킨이 좋아

## 1. 문제
- 4 x 6 사이즈의 맵에 있는 모든 치킨을 먹으려고 합니다.
- 지혁이는 [0, 0]에서 출발하고, **↑↓ ← →** 방향으로 이동할 수 있습니다.
- 1은 **벽이라** 이동할 수없습니다. 
- 2는 **고기** 입니다. 
- 0으로 표시된 지역만 이동할 수 있습니다. 

## 2. 입력
- 2차원 배열 정보(4 X 6)를 입력 받으세요.

## 3. 출력
- 치킨을 총 몇 마리 먹을 수 있는지 출력하세요.

## 4. 예제 입력
```
0 0 1 2 1 2
1 0 0 1 0 1
0 0 1 2 0 0
2 0 0 0 0 0
```

## 5. 예제 출력
```
2
```

## 6. 코드
```c++
#include<iostream>
using namespace std;

struct Node {
	int y, x;
};

Node vect[100];
int cnt = 0;
int map[4][6];
int visited[4][6] = { 1, };
int direct[4][2] = { -1, 0, 1, 0, 0, -1, 0, 1 };

int main() {
	int head = 0, tail = 1;
	vect[head] = { 0, 0 };
	
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 6; j++) cin >> map[i][j];
	}
	
	while (head != tail) {
		Node now = vect[head++];

		for (int t = 0; t < 4; t++) {
			int dy = now.y + direct[t][0];
			int dx = now.x + direct[t][1];

			if (dy >= 0 && dx >= 0 && dy < 4 && dx < 6 && !visited[dy][dx] && map[dy][dx] != 1) {
				if (map[dy][dx] == 2) cnt++;
				visited[dy][dx] = 1;
				
				vect[tail++] = { dy, dx };
			}
		}
	}

	cout << cnt;

	return 0;
}
```
