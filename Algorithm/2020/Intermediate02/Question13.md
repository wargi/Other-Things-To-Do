# 동명이인 #

## 1. 문제
- 두 명의 이름을 입력받고, 이름이 같으면 "동명", 아니라면 "남남"으로 출력해주세요.

## 2. 입력
- 두 명의 이름을 입력받습니다.

## 3. 출력
- 이름이 같으면 "동명", 아니라면 "남남"으로 출력해주세요.

## 4. 예제 입력
```
park
sang
```

## 5. 예제 출력
```
남남
```

## 6. 예제 입력

```
wargi
wargi
```

## 7. 예제 출력

```
동명
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

bool isSame(char lv[100], char rv[100]) {
	if (!strcmp(lv, rv)) return true;
	else return false;
}

int main() {
	char leftX[100];
	char rightX[100];
	cin >> leftX >> rightX;

	if (isSame(leftX, rightX)) cout << "동명";
	else cout << "남남";

	return  0;
}
```
