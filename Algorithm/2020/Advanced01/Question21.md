# 등수 구하기

## 1. 문제

- 네 명의 이름을 입력 받고, 네 명 중에 1~3등을 뽑아서 상품을 주려 합니다.
- 상품을 줄 수 있는 모든 경우의 수를 출력해주세요.

## 2. 입력

- 네 명의 이름을 입력 받습니다.

## 3. 출력

- 상품을 줄 수 있는 모든 경우의 수를 출력해주세요.

## 4. 입력예제

```
ATKP
```

## 5. 출력예제

```
ATK
ATP
AKT
AKP
APT
APK
TAK
TAP
TKA
TKP
TPA
TPK
KAT
KAP
KTA
KTP
KPA
KPT
PAT
PAK
PTA
PTK
PKA
PKT
```

## 6. 코드

```c++
#include<iostream>
using namespace std;

char vect[5];
char path[4];
int check[1000] = { 0 };
void run(int level) {
	if (level == 3) {
		cout << path << "\n";
		return;
	}

	for (int i = 0; i < 4; i++) {
		if (check[vect[i]] == 0) {
			check[vect[i]] = 1;
			path[level] = vect[i];
			run(level + 1);
			check[vect[i]] = 0;
		}
	}
}

int main() {
	cin >> vect;
	run(0);
	return 0;
}
```
