# 짝수 노드까지 DFS 탐색하기 #

## 1. 문제
- 최대 2의 높이를 가진 이진 트리를 1차원 배열로 입력받고, 짝수 노드를 발견하면 탐색을 멈추고 경로를 출력하는 프로그램을 작성하시오.
- 만약, 아래의 그림과 같은 이진트리를 입력받았다면,
- <img src="./Tree04.png" alt="Tree" style="zoom:77%;" />

## 2. 입력
- 1차원 배열로 구성된 이진트리를 입력받습니다.

## 3. 출력
- DFS 탐색 중에, 짝수 노드를 발견하면 탐색을 멈추고 경로를 출력하시오.

## 4. 예제 입력
```
0 3 7 10 5 6 3 6
```

## 5. 예제 출력
```
3 7 6
3 10
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int vect[8];
int path[4];

void run(int level, int now) {
	if (now >= 8 || vect[now] == 0) return;
	if (vect[now] % 2 == 0) {
		for (int i = 0; i < level; i++) cout << path[i] << " ";
		cout << vect[now] << "\n";
		return;
	}

	path[level] = vect[now];
	run(level + 1, now * 2);
	run(level + 1, now * 2 + 1);
	path[level] = 0;
}

int main() {
	for (int i = 0; i < 8; i++) {
		cin >> vect[i];
	}
	
	run(0, 1);

	return 0;
}
```
