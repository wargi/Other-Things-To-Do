# ABC

## 1. 문제

- A, B, C의 문자가 있습니다.
- 세 개의 문자 중에 n개의 문자를 선택했을 때, 경우의 수를 출력할려고 합니다.
- 문자가 중복되어도 되지만, 세 개 연속으로 같은 문자가 선택되는 경우는 제외하고 출력해주세요.

## 2. 입력
- 숫자 n을 입력받습니다.

## 3. 출력

- n개의 문자를 선택했을 때, 세 개 연속으로 같은 문자가 선택되는 경우는 제외하고 경우의 수를 출력해주세요.


## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
24
```

## 6. 코드

```c++
#include<iostream>
using namespace std;

int cnt = 0;
char path[3] = { 0 };
void run(int level, int limit, int conti) {
	if (conti >= 2) return;
	if (level == limit) {
		cnt++;
		return;
	}

	for (int i = 'A'; i < 'D'; i++) {
		path[level] = i;
		if (path[level] == path[level - 1]) run(level + 1, limit, conti + 1);
		else run(level + 1, limit, 0);
	}
}

int main() {
	int n;
	cin >> n;

	run(0, n, 0);
	cout << cnt;
	
	return 0;
}
```
