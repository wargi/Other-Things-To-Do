# 최적의 숫자 구하기 #

## 1. 문제
- 5개의 항에 숫자를 채우려고 합니다.

- 숫자 5개를 입력받고, 최고의 위치를 선정해 주세요. (-10 <= 숫자 <= 10)

- 만들어질 수 있는 최댓값과 최솟값을 Backtracking을 이용하여 구해주세요.

  > - 연산자 우선순위를 지켜주세요, 곱셈은 뺄셈보다 우선합니다.

```
* 만약 1 2 3 4 5를 입력받았다면
최댓값 = (5 x 4) - (2 x 1) + 3 = 21
최솟값 = (3 x 1) - (5 x 4) + 2 = -15
```

## 2. 입력
-  숫자 5개를 입력받습니다. (-10 <= 숫자 <= 10)

## 3. 출력
- 만들어질 수 있는 최댓값과 최솟값을 Backtracking을 이용하여 구한 후에 출력해주세요.

## 4. 예제 입력
```
1 2 3 4 5
```

## 5. 예제 출력

```
21
-15
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int vect[5], path[5], check[5] = { 0 };
int maxi = -21e8, mini = 21e8;
void run(int level) {
	if (level == 5) {
		int value = (path[0] * path[1]) - (path[2] * path[3]) + path[4];

		if (value > maxi) maxi = value;
		if (value < mini) mini = value;

		return;
	}

	for (int i = 0; i < 5; i++) {
		if (check[i]) continue;
		check[i] = 1;
		path[level] = vect[i];
		run(level + 1);
		path[level] = 0;
		check[i] = 0;
	}
}

int main() {
	for (int i = 0; i < 5; i++) {
		cin >> vect[i];
	}

	run(0);

	cout << maxi << "\n" << mini;

	return  0;
}
```