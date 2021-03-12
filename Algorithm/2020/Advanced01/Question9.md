# DFS

## 1. 문제
- 아래의 1차원 배열을 하드코딩 해주세요.

```
0 3 4 2 4 1 0 3
```

- 위의 하드코딩한 1차원 배열은 아래 그림의 이진트리를 나타냅니다.

<img src="./Tree03.png" alt="Tree" style="zoom:77%;" />

- 이제 변경할 인덱스와 값을 입력받습니다.
- 만약, 4와 7을 입력받았다면, 하드코딩한 배열의 4번 인덱스와 값을 7로 바꾼 후에 DFS를 돌리고 결과를 출력해주세요.

## 2. 입력
- 변경할 인덱스와 값을 입력받습니다.

## 3. 출력
- 인덱스와 값을 바꾼 후에 DFS를 돌리고 결과를 출력해주세요.

## 4. 예제 입력
```
4 7
```

## 5. 예제 출력
```
3 4 7 1 2 3
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int map[8] = { 0, 3, 4, 2, 4, 1, 0, 3 };

void run(int now) {
	if (now >= 8) return;
	if (map[now] == 0) return;
	cout << map[now] << " ";
	
	run(now * 2);
	run(now * 2 + 1);
}

int main() {
	int x, n;
	cin >> x >> n;

	map[x] = n;

	run(1);

	return 0;
}
```
