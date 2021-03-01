# 블럭 채우기

## 1. 문제

- 막대 블럭들을 넣을 수 있는 100 cm 크기의 길다란 홈이 있습니다.
- n개의 막대 블럭이 있을때 일부 막대블럭을 선택하여, **최대 몇개를 넣을 수 있을지** 출력하세요.

```
[예시]
20cm, 57cm, 13cm, 40cm, 33cm, 8cm 막대 블럭이 있을때 최대 4개를 넣을 수 있습니다. 
```

## 2. 입력
- 첫 줄에 막대 블럭의 개 수 n을 입력받습니다. (1 <= n <= 10)
- 다음 줄에 블럭들을 입력 받습니다.

## 3. 출력
- **최대 몇개를 넣을 수 있을지** 출력하세요.

## 4. 예제 입력
```
6
20 57 13 40 33 8
```

## 5. 예제 출력
```
4
```

## 6. 코드
```c++
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

int main()
{
	int n;
	int vect[100] = { 0 };

	cin >> n;

	for (int i = 0; i < n; i++) {
		cin >> vect[i];
	}

	sort(vect, vect + n);

	int sum = 0, cnt = 0;
	for (int i = 0; i < n; i++) {
		sum += vect[i];
		if (sum <= 100) cnt++;
		else break;
	}

	cout << cnt;
}

```
