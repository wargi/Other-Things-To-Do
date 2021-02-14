# 거스름돈

## 1. 문제

- 세 종류의 동전이 있습니다.

  1. 10원
  2. 40원
  3. 60원

- 교환할 지폐의 금액을 입력 받아주세요.

- 위 동전으로 최소 몇 개의 동전을 거슬러 줄 수 있는지, 최소 수량을 구해 출력하세요.

  > - 예를들어, 80원을 거슬러 주기 위해서는 40원짜리 동전 2개로 거슬러 줄 수 있습니다.

## 2. 입력
- 교환할 지폐의 금액을 입력 받아주세요.

## 3. 출력
- 위 동전으로 최소 몇 개의 동전을 거슬러 줄 수 있는지, 최소 수량을 구해 출력하세요.

## 4. 예제 입력
```
80
```

## 5. 예제 출력
```
2
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int n, mini = 21e8;
int vect[3] = { 10, 40, 60 };

void run(int level, int sum)
{
	if (sum == n) {
		if (mini > level) mini = level;
		return;
	}

	for (int i = 0; i < 3; i++) {
		if (sum + vect[i] > n) continue;
		run(level + 1, sum + vect[i]);
	}
}

int main() {
	cin >> n;

	run(0, 0);
	cout << mini;

	return 0;
}
```
