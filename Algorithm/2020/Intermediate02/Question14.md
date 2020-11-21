# 보물 찾기 #

## 1. 문제
- 2차원 배열(2x3)을 하드코딩하여 채워주세요.

  ```
  G K T
  P A C
  ```
  
- 문자 두 개를 입력 받고, 문자 두 개가 모두 하드코딩 배열(2x3)에 존재한다면 "대발견",

- 문자 한 개가 하드코딩 배열(2x3)에 존재한다면 "중발견",

- 아무 문자도 발견되지 않는다면 "미발견"을 출력해주세요.

## 2. 입력
- 문자 두 개를 입력 받아 주세요.

## 3. 출력
- 입력 받은 문자 두 개가 모두 하드코딩 배열(2x3)에 존재한다면 "대발견",
- 문자 한 개가 하드코딩 배열(2x3)에 존재한다면 "중발견",
- 아무 문자도 발견되지 않는다면 "미발견"을 출력해주세요.

## 4. 예제 입력
```
G K
```

## 5. 예제 출력
```
대발견
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

char vect[2][4] = {
	"GKT",
	"PAC"
};

int isExist(char lx, char rx) {
	int lt = 0, rt = 0;

	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 3; j++) {
			if (vect[i][j] == lx) lt = 1;
			if (vect[i][j] == rx) rt = 1;
		}
	}

	return lt + rt;
}
int main() {
	char a, b;
	cin >> a >> b;

	int result = isExist(a, b);

	if (result == 2) {
		cout << "대발견";
	}
	else if (result == 1) {
		cout << "중발견";
	}
	else {
		cout << "미발견";
	}

	return  0;
}
```
