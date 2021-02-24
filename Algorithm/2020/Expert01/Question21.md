# 집배원 with BFS

## 1. 문제

- 배달맨은 배달지역 가장 가까운 숫자를 향해 달려 갑니다.
- 여러개의 1 ~ 4번 배달지역이 있고, 배달맨은 순서대로 하나의 1, 2, 3, 4 번 지역을 한 번씩 들리면 됩니다.
- 각 배달지역은 중복되어 주어질 수 있습니다. 여러개의 배달지역 중 같은 숫자의 배달지역은 한 번만 들려도 됩니다.
- 배달맨의 출발 위치는 (0, 0) 입니다. 출발점 > 1 > 2 > 3 > 4 순서로 배달을 완료해야 합니다.
- 배달맨이 배달을 가장 빨리 끝낼 수 있는 시간을 출력해주세요.

> **[배달 규칙]**
>
> - 배달맨은 배달 위치를 선택할때 현재 위치에서 가장 가까운 곳을 선택해야 합니다.
> - (0, 0) 에서 가장 가까운 1번 지역에 도착합니다.
> - 그리고 도착한 1번 지역에서 가장 가까운 2번 지역에 도착합니다.
> - 2번 지역에 도착하면, 가장 가까운 3번 지역에 도착합니다.
> - 3번 지역에 도착하면, 가장 가까운 4번 지역에 도착합니다.
> - *** 거리가 같은 경우는 입력으로 주어지지 않습니다.**

## 2. 입력

- 맵을 입력 받아 주세요. (3 x 5)
- "숫자"는 지나갈 수 있는 지역이고 '#' 은 이동할 수 없는 벽 입니다.

## 3. 출력

- 배달맨이 가장 빠르게 배달을 완료할 수 있는 시간을 출력 해주세요.

## 4. 입력예제

```
30002
##4##
01024
```

## 5. 출력예제

```
15회
```

## 6. 코드

```c++
#include<iostream>
using namespace std;

struct Node {
	int y, x;
	int level;
};

char map[3][6];
int direct[4][2] = { -1, 0, 1, 0, 0, -1, 0, 1 };

Node run(int sy, int sx, char target) {
	Node vect[20];
	int head = 0, tail = 1;
	int visited[3][5] = { 0 };
	vect[head] = { sy, sx, 0 };

	while (head != tail) {
		Node now = vect[head++];

		for (int t = 0; t < 4; t++) {
			int dy = now.y + direct[t][0];
			int dx = now.x + direct[t][1];

			if (dy >= 0 && dx >= 0 && dy < 3 && dx < 5 && map[dy][dx] != '#' && !visited[dy][dx]) {
				if (map[dy][dx] == target) return { dy, dx, now.level + 1 };
				
				visited[dy][dx] = 1;
				vect[tail++] = { dy, dx, now.level + 1 };
			}
		}
	}
}

int main() {
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 5; j++) cin >> map[i][j];
	}

	int sum = 0;
	Node input = { 0, 0, 0 };
	for (int i = '1'; i <= '4'; i++) {
		input = run(input.y, input.x, i);
		sum += input.level;
	}

	cout << sum << "회";

	return 0;
}
```
