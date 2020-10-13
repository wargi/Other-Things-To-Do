# 범위 값 더하기

## 1. 문제
- 아래의 1차원 배열(1x11)을 하드코딩 해주세요.

```
3 4 1 1 2 6 8 7 8 9 10
```

- 기준점 index를 입력받고 기준점 index부터 5칸의 합을 출력해주세요

## 2. 입력
- 기준점 index를 입력받는다.

## 3. 출력
- index 포함 다섯 칸을 합하여 출력한다.

## 4. 예제 입력
```
0
```

## 5. 예제 출력
```
11
```

## 6. 예제 입력

```
2
```

## 7. 예제 출력

```
18
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int vect[11] = { 3, 4, 1, 1, 2, 6, 8, 7, 8, 9, 10 };

int getSum(int index) {
	int sum = 0;
	for (int i = index; i < index + 5; i++) {
		sum += vect[i];
	}

	return sum;
}

int main() {
	int n;
	cin >> n;

	cout << getSum(n);

	return  0;
}
```
