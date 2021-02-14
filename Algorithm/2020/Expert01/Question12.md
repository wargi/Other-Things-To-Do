# 마지막 노드들의 합

## 1. 문제
- 2진 트리를 1차원 배열의 형태로 입력받습니다.
- 만약 3, 5, 7, 4, 2, 6, 9를 입력 받았다면, 아래의 그림과 같습니다.
- <img src="./Tree06.png" alt="Tree" style="zoom:77%;" />
- 이제 마지막 경로의 있는 노드들끼리의 합을 DFS를 이용하여 구해주세요.

## 2. 입력
- 7개의 숫자로 구성된 1차원 배열을 입력 받습니다.

## 3. 출력
- 마지막 경로의 있는 노드들끼리의 합을 DFS를 이용하여 구해주세요.

## 4. 예제 입력
```
3 5 7 4 2 6 9
```

## 5. 예제 출력
```
21
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int vect[8] = { 0 };
int sum = 0;

void run(int level, int now) {
	if (now >= 8) return;
	if (level == 2) sum += vect[now];

	run(level + 1, now * 2);
	run(level + 1, now * 2 + 1);
}

int main() {
	for (int i = 1; i < 8; i++) cin >> vect[i];

	run(0, 1);
	cout << sum;

	return 0;
}
```
