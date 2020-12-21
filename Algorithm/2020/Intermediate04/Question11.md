# 문장의 일부분 꺼내오기

## 1. 문제
- 한 문장을 입력 받습니다.
- 그리고, 시작 인덱스와 종료 인덱스, 반복횟수를 입력받고 출력해주세요.

## 2. 입력
- 한 문장을 입력 받는다.
- 시작 인덱스와 종료 인덱스, 반복횟수를 입력 받습니다.

## 3. 출력
- 시작 인덱스와 종료 인덱스, 반복횟수를 입력받고 출력해주세요.

## 4. 예제 입력
```
ABCDEFGHIJKL
3 5 3
```

## 5. 예제 출력
```
DEFDEFDEF
```

## 6. 예제 입력

```
ABSDEFSS
1 3 1
```

## 7. 예제 출력

```
BSD
```

## 8. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
	int s, e, r;
	string t;
	cin >> t;
	cin >> s >> e >> r;

	for (int j = 0; j < r; j++) {
		for (int i = s; i <= e; i++) {
			cout << t[i];
		}
	}
}
```
