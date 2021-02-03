# Root 계산기 #

## 1. 문제

- 게임 프로그래머 'P'씨는 3D좌표를 구할 때, 루트 값을 구해야하는 경우가 많아서, 루트를 계산하는 프로그램을 만들려고 합니다.
- 입력 받은 값을 Binary Search를 이용해 루트 값의 정수부를 구해주세요.

```
[Exam]
만약, 16을 입력시에 결과는 4 입니다.
만약, 17을 입력시에 결과는 4.xxx 이므로, 결과는 4 입니다.
만약, 25을 입력시에 결과는 5 입니다.
만약, 35을 입력시에 결과는 5.xxx 이므로, 5입니다.
```

## 2. 입력
- 숫자 하나를 입력 받습니다.

## 3. 출력
- 입력 받은 루트 값을 정수만 출력해주세요.

## 4. 예제 입력
```
36
```

## 5. 예제 출력
```
6
```

## 6. 예제 입력

```
130
```

## 7. 예제 출력

```
11
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int main() {
	int n;
	cin >> n;

	float min = 21e8, idx = 0;
	int start = 1, end = n;

	while (start <= end) {
		int mid = (start + end) / 2;

		float t = float(n) / (mid * mid);

		if (t >= 1.0 && t < 2.0 && min > t) {
			min = t;
			idx = mid;
		}

		if ((mid * mid) > n) end = mid - 1;
		else start = mid + 1;
	}

	cout << idx;

	return  0;
}
```
