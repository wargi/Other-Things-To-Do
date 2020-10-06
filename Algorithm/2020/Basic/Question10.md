# Favorite Menu #

## 1. 문제
```T
아래의 1차원(1x4) 배열을 하드코딩 해주세요.
M T K C
```

- 문자 하나를 입력 받고, 해당 문자가 하드코딩 배열에 있으면 "발견", 없으면 "미발견"

## 2. 입력
- 문자 하나를 입력받는다.

## 3. 출력
- 입력받은 문자가 하드코딩 배열에 있으면 "발견", 없으면 "미발견"

## 4. 예제 입력
```
K
```

## 5. 예제 출력
```
발견
```

## 6. 예제 입력

```
F
```

## 7. 예제 출력

```
미발견
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

char vect[5] = "MTKC";

bool isExit(char ch) {
	for (int i = 0; i < ch; i++) {
		if (ch == vect[i]) return true;
	}
	return false;
}

int main() {
	char ch;
	cin >> ch;

	if (isExit(ch)) cout << "발견";
	else cout << "미발견";

	return  0;
}
```
