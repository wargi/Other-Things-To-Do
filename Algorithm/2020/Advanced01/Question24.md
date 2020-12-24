# 그룹 만들기

## 1. 문제

- 문자 'B', 'T', 'S', 'K', 'R' 이 있습니다.
- 이 중에 그룹으로 묶을 n명을 입력 받고, 경우의 수를 출력하려고 합니다.
- 그룹에 첫번째가 리더, 이후 각각 위치가 있습니다.(ABC, CBA도 된다는 뜻)
- 단, 그룹에는 꼭 'S'가 포함되어야합니다.
- 위의 조건들을 생각하여 n을 입력받고 경우의 수를 출력해주세요.

## 2. 입력
- 숫자 n을 입력받습니다.

## 3. 출력

- 경우의 수를 출력해주세요.


## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
36
```

## 6. 예제 입력

```
1
```

## 7. 예제 출력

```
1
```

## 8. 코드

```c++
#include<iostream>
using namespace std;


int cnt = 0;
int check[1000] = { 0 };
char path[6];
char map[6] = "BTSKR";
void run(int level, int limit) {
	if (level == limit && check[int('S')] == 1) {
		cnt++;
		return;
	}

	for (int i = 0; i < 5; i++) {
		if (check[map[i]] == 0) {
			path[level] = map[i];
			check[map[i]] = 1;
			
			run(level + 1, limit);

			check[map[i]] = 0;
			path[level] = 0;
		}
	}
}

int main() {
	int n;
	cin >> n;

	run(0, n);
	cout << cnt;

	return 0;
}
```
