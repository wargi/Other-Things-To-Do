# 카드 뽑기 #

## 1. 문제
- 0 ~ 9의 카드 중 5개를 입력받습니다.
- 입력 받은 다섯 장의 카드 중에 4장을 뽑을려고 합니다.
- 단, 카드를 뽑는 규칙이 있습니다.
- 2번째 카드를 뽑을 때부터 이전카드와 3이하로 차이나는 카드만 뽑을려고 합니다.
- 위의 조건을 만족시킨 경우의 수를 출력해주세요.

## 2. 입력
-  0 ~ 9의 카드 중 5개를 입력받습니다.

## 3. 출력
- 위의 조건을 만족시킨 경우의 수를 출력해주세요.

## 4. 예제 입력
```
12345
```

## 5. 출력

```
497
```

## 6. 코드

```c++
#include<iostream>
#include<string>
using namespace std;

char s[6];
char path[6];
int cnt = 0;

int absC(int a) {
	
	if (a < 0) a *= -1;
	return a;
}

void run(int level) {
	if (level > 1 && absC(path[level - 2] - path[level - 1]) > 3) return;

	if (level == 4) {
		cnt++;
		return;
	}

	for (int i = 0; i < 5; i++)
	{
		path[level] = s[i];
		run(level + 1);
		path[level] = 0;
	}
}

int main() {
	cin >> s;
	run(0);
	cout << cnt;

	return 0;
}
```