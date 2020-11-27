# 떨어지는 빗방울 세기 #

## 1. 문제
- 2차원 배열(4x4)을 입력받고('#'은 빈칸을 의미), 각 세로줄마다 몇개의 문자가 있는지 출력해주세요.

  ```
  예를 들어)
  아래와 같이 입력받는다면,
  #ABC
  D##E
  ###F
  #G##
  
  아래와 같이 출력한다.
  1 2 1 3
  ```

## 2. 입력
- 2차원 배열(4x4)을 입력받습니다. ('#'은 빈칸을 의미)

## 3. 출력
- 각 세로줄마다 몇개의 문자가 있는지 출력해주세요.

## 4. 예제 입력
```
#H#E
L#L#
O##S
#WI#
```

## 5. 예제 출력
```
2 2 2 2
```

## 6. 예제 입력

```
##FT
HI##
WARG
I###
```

## 7. 예제 출력

```
3 2 2 2
```

## 8. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
	int result[4] = { 0 };

	char map[4][5];

	for (int i = 0; i < 4; i++) {
		cin >> map[i];
	}

	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			if (map[i][j] != '#') result[j]++;
		}
	}

	for (int i = 0; i < 4; i++) {
		cout << result[i] << " ";
	}
}
```
