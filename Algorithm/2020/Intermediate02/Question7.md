# 자기 위치 찾기 #

## 1. 문제
```
1. 8개의 숫자를 배열에 입력받아주세요.

2. 숫자를 입력받고, 가장 앞쪽에 있는 숫자를 피벗이라 정합니다.

3. a, b를 두고 배열을 탐색하여,
	 a는 배열의 앞부터 탐색하여 피벗보다 큰 수를 찾고,
   b는 배열 뒤부터 탐색하여 피벗보다 작은 수를 찾습니다.

* 예제 *
만약,
4 1 7 9 6 3 3 6 입력받고,
a는 앞에서 가장 가까운 큰 수인 7을 찾고,
b는 뒤에서 가장 가까운 작은 수인 3을 찾습니다.

둘 다 탐색했으니 swap해주면, 아래 처럼 배열이 변경 됩니다.
4 1 3 9 6 3 7 6

이런식으로 계속이어서 진행하면,
a는 앞에서 가장 가까운 큰 수인 9을 찾고,
b는 뒤에서 가장 가까운 작은 수인 3을 찾습니다.

둘 다 탐색했으니 swap해주면, 아래 처럼 배열이 변경 됩니다.
4 1 3 3 6 9 7 6

이런식으로 계속이어서 진행하면,
a는 앞에서 가장 가까운 큰 수인 9을 찾고,
b는 뒤에서 가장 가까운 작은 수인 3을 찾습니다.
하지만 이번의 경우엔 a와 b가 엇갈리게 되면서,
a의 index가 b보다 커지게 됩니다.

이런경우 둘다 탐색했다고 b와 pivot을 교체하고 끝납니다.
최종결과: 3 1 3 4 6 9 7 6
```

## 2. 입력
- 8개의 숫자를 배열에 입력받는다.

## 3. 출력
- 위의 예제처럼 작동하는 프로그램을 만들어서 최종결과를 출력해주세요.

## 4. 예제 입력
```
4 1 7 9 6 3 3 6
```

## 5. 예제 출력
```
3 1 3 4 6 9 7 6
```

## 6. 예제 입력

```
5 4 3 9 2 1 6 7
```

## 7. 예제 출력

```
2 4 3 1 5 9 6 7
```

## 8. 코드

```c++
#include<iostream>
using namespace std;

int vect[8], pivot;

int greatThen(int start) {
	for (int i = start; i < 8; i++) {
		if (pivot < vect[i]) return i;
	}
	return start;
}

int lessThen(int start) {
	for (int i = start; i >= 0; i--) {
		if (pivot > vect[i]) return i;
	}
	return start;
}

int main() {
	for (int i = 0; i < 8; i++) {
		cin >> vect[i];
	}

	pivot = vect[0];
	int a = greatThen(1);
	int b = lessThen(7);

	while (a < b) {
		int temp = vect[a];
		vect[a] = vect[b];
		vect[b] = temp;

		a = greatThen(++a);
		b = lessThen(--b);
	}

	int temp = vect[b];
	vect[b] = pivot;
	vect[0] = temp;

	for (int i = 0; i < 8; i++) {
		cout << vect[i] << " ";
	}

	return 0;
}
```
