# 줄 세우기

## 1. 문제

- 동물병원 원장님은 동물들에게 밥을 주려고 합니다.
- 여섯 마리의 동물이 밥을 먹기 위해 줄을 섭니다.
- 강아지 태평이는 a등, 또는 b등이 되는 것을 싫어 합니다. 
- 태평이가 a등 또는 b등을 할 경우를 제외하고, 동물들이 줄을 설 수 있는 경우가 총 몇개인지
- Backtracking 으로 Counting 해주세요.

## 2. 입력
- 태평이가 피하고자 하는 등수 a, b가 입력 됩니다.

## 3. 출력

- 태평이가 a, b 등수가 되는 경우를 제외한 나머지의 경우의 수를 출력해주세요.


## 4. 예제 입력
```
1 6
```

## 5. 예제 출력
```
480
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int check[6] = { 0 };
int n, m, cnt = 0;

void run(int level) {
	if (level == 6) {
		cnt++;
		return;
	}

	for (int i = 0; i < 6; i++) {
		if (i == 4 && ((level + 1) == n || (level + 1) == m)) continue;
		if (check[i]) continue;
		check[i] = 1;
		run(level + 1);
		check[i] = 0;
	}
}

int main() {
	cin >> n >> m;

	run(0);
	cout << cnt;

	return  0;
}
```
