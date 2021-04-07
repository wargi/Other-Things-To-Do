# 단지번호붙이기

## 1. 문제

- <그림 1>과 같이 정사각형 모양의 지도가 있다.
- 1은 집이 있는 곳을, 0은 집이 없는 곳을 나타낸다.
- 철수는 이 지도를 가지고 연결된 집의 모임인 단지를 정의하고, 단지에 번호를 붙이려 한다.
- 여기서 연결되었다는 것은 어떤 집이 좌우, 혹은 아래위로 다른 집이 있는 경우를 말한다.
- 대각선상에 집이 있는 경우는 연결된 것이 아니다.
- <그림 2>는 <그림 1>을 단지별로 번호를 붙인 것이다.
- 지도를 입력하여 단지수를 출력하고, 각 단지에 속하는 집의 수를 오름차순으로 정렬하여 출력하는 프로그램을 작성하시오.

![img](https://www.acmicpc.net/upload/images/ITVH9w1Gf6eCRdThfkegBUSOKd.png)


## 2. 입력
- 첫 번째 줄에는 지도의 크기 N(정사각형이므로 가로와 세로의 크기는 같으며 5≤N≤25)이 입력되고, 그 다음 N줄에는 각각 N개의 자료(0혹은 1)가 입력된다.

## 3. 출력

- 첫 번째 줄에는 총 단지수를 출력하시오.
- 그리고 각 단지내 집의 수를 오름차순으로 정렬하여 한 줄에 하나씩 출력하시오.


## 4. 예제 입력
```
7
0110100
0110101
1110101
0000111
0100000
0111110
0111000
```

## 5. 예제 출력
```
3
7
8
9
```

## 6. 코드

```c++
#include <iostream>
#include <algorithm>
using namespace std;

int n, m, cnt = 0;
int check[1000][1000] = { 0 };
char map[1000][1000];
int vect[10000] = { 0 };

int direct[4][2] = {
	-1, 0,
	1, 0,
	0, -1,
	0, 1
};

void dfs(int y, int x) {
	cnt++;

	for (int i = 0; i < 4; i++) {
		int dy = y + direct[i][0];
		int dx = x + direct[i][1];

		if (dy >= 0 && dx >= 0 && dy < n && dx < n && !check[dy][dx] && map[dy][dx] == '1') {
			check[dy][dx] = 1;
			dfs(dy, dx);
		}
	}
}

int main()
{
	cin >> n;

	for (int i = 0; i < n; i++) {
		cin >> map[i];
	}

	int idx = 0;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			if (map[i][j] == '1' && !check[i][j]) {
				check[i][j] = 1;
				dfs(i, j);
				vect[idx++] = cnt;
				cnt = 0;
			}
		}
	}

	if(idx > 1) sort(vect, vect + idx);
	cout << idx << "\n";
	if (idx > 0) for (int i = 0; i < idx; i++) cout << vect[i] << "\n";
  
  return 0;
}
```



### #출처

[백준 온라인 저지](https://www.acmicpc.net/problem/2667)
