# Merge Sort

## 1. 문제

- 2개의 정렬된 1차원 배열(1x4)를 받고 Merge sort방식으로 동작하게 프로그램을 작성하시오.
- 최종 정렬된 배열(1x8)을 출력하시오.

## 2. 입력

- 2개의 정렬된 1차원 배열(1x4)를 입력 받습니다.

## 3. 출력

- 최종 정렬된 배열(1x8)을 출력하시오.

## 4. 입력예제

```
1 5 7 9
3 4 5 6
```

## 5. 출력예제

```
1 3 4 5 5 6 7 9
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main() {
	int vect1[4], vect2[4], result[8];

	int lx = 0, rx = 0;

	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 4; j++) {
			if (i == 0) cin >> vect1[j];
			else cin >> vect2[j];
		}
	}


	for (int i = 0; i < 8; i++) {
		if (lx == 4) {
			result[i] = vect2[rx++];
		}
		else if (rx == 4) {
			result[i] = vect1[lx++];
		}
		else {
			if (vect1[lx] <= vect2[rx]) {
				result[i] = vect1[lx++];
			}
			else {
				result[i] = vect2[rx++];
			}
		}
	}

	for (int i = 0; i < 8; i++) cout << result[i] << " ";

	return 0;
}
```
