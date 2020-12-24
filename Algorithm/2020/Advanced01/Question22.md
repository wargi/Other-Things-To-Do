# B & T

## 1. 문제

- 네 글자를 입력받으세요.(무조건 B와 T가 포함됩니다.)
- 네 글자를 조합하여 나타낼 수 있는 경우의 수를 출력하고합니다.
- 하지만 B와 T가 붙어 있는 경우에는 출력할 수 없습니다.
- 위의 조건에 맞춰 최종 결과를 출력해주세요.


## 2. 입력

- 첫 번째 줄: 네 글자를 입력받으세요.(무조건 B와 T가 포함됩니다.)

## 3. 출력

- 위의 조건에 맞춰 최종 결과를 출력해주세요.


## 4. 예제 입력
```
BOTT
```

## 5. 예제 출력
```
120
```

## 6. 코드

```c++
#include<iostream>
#include<string.h>
using namespace std;

char name[5];
char path[5];
int cnt = 0;

int run(int level) {
	if (level == 4) {
		cnt++;
		return 0;
	}

	for (int i = 0; i < 4; i++) {
		if (name[i] == 'B' && path[level - 1] == 'T') continue;
		if (name[i] == 'T' && path[level - 1] == 'B') continue;

		path[level] = name[i];
		run(level + 1);
	}
}

int main() {
	cin >> name;

	run(0);
	cout << cnt;

	return 0;
}
```
