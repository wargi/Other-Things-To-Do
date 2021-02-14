# DFS 2 #

## 1. 문제
- Node 안에 들어갈 문자 5개를 입력 받습니다.
- 만약, ABCDE를 입력 받으면, 아래와 같이 저장됩니다.(트리 모양은 고정)
- <img src="./Tree08.png" alt="Tree" style="zoom:77%;" />
- 위의 트리를 인접행렬로 저장하고, DFS를 돌려 탐색 순서대로 출력해주세요.


## 2. 입력
- Node 안에 들어갈 문자 5개를 입력 받습니다.

## 3. 출력
- DFS를 돌려 탐색 순서대로 출력해주세요.

## 4. 예제 입력
```
ABCDE
```

## 5. 예제 출력
```
ABDEC
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

char vect[7];

void run(int now) {
	if (now >= 6) return;

	cout << vect[now];
	run(now * 2);
	run(now * 2 + 1);
}

int main() {

	vect[0] == '_';
	for (int i = 1; i < 6; i++) {
		cin >> vect[i];
	}

	run(1);

	return 0;
}
```
