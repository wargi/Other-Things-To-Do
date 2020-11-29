# min & max 찾기

## 1. 문제
- 첫 줄에 숫자로 구성된 1차원 배열(1x6) 입력받고,
- 다음 줄에 'm'과 'x'로 구성된 1차원 배열(1x6)를 입력받습니다.
- m은 min값, x는 max값을 의미합니다.
- 문자배열을 처음부터 탐색하며, 만약 처음 탐색한 m이라면 제일 작은 값을 출력하고(2번째 만난 m이라면 2번째로 작은 값을 출력),
- 만약 처음 탐색한 x이라면 제일 큰 값을 출력해서 최종결과를 출력해주세요.(2번째 만난 x라면 2번째로 큰 값을 출력)

```
ex)
input)
1 3 5 7 9 2
xxmmxm

output: 971355
```

## 2. 입력
- 첫 줄에 숫자로 구성된 1차원 배열(1x6) 입력받고,
- 다음 줄에 'm'과 'x'로 구성된 1차원 배열(1x6)를 입력받습니다.

## 3. 출력
- 문자 배열을 탐색하여 최종결과를 출력해주세요.

## 4. 예제 입력
```
3 7 4 0 9 6
mxmmxx
```

## 5. 예제 출력
```
093476
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int number[6], check[100] = { 0 };

int findMin() {
	int min = 10000;
	
	for (int i = 0; i < 6; i++) {
		if (check[number[i]] == 0 && min > number[i]) {
			min = number[i];
		}
	}

	check[min]++;
	return min;
}

int findMax() {
	int max = -1;

	for (int i = 0; i < 6; i++) {
		if (check[number[i]] == 0 && max < number[i]) {
			max = number[i];
		}
	}

	check[max]++;
	return max;
}

int main()
{
	
	char command[7];

	for (int i = 0; i < 6; i++) {
		cin >> number[i];
	}

	cin >> command;

	for (int i = 0; i < 6; i++) {
		if (command[i] == 'm') cout << findMin();
		else cout << findMax();
	}
}
```
