# 그룹만들기 2

## 1. 문제

- E / W / A / B / C 문자가 있습니다.
- 이 중에 4명을 그룹으로 묶어야 해서 한명은 제외시켜야합니다.
- 제외시키는 문자를 입력받고, 제외한 경우의 모든 순열을 출력해주세요.

## 2. 입력
- 제외시키는 문자를 입력받아 주세요.

## 3. 출력

- 제외한 경우의 모든 순열을 출력해주세요.


## 4. 예제 입력
```
E
```

## 5. 예제 출력
```
WABC
WACB
WBAC
WBCA
WCAB
WCBA
AWBC
AWCB
ABWC
ABCW
ACWB
ACBW
BWAC
BWCA
BAWC
BACW
BCWA
BCAW
CWAB
CWBA
CAWB
CABW
CBWA
CBAW
```

## 6. 코드

```c++
#include<iostream>
#include<string>
using namespace std;

string friends = "EWABC";
int check[1000] = { 0 };
char path[5];
void run(int level, char e) {
	if (level == 4) {
		cout << path << "\n";
		return;
	}

	for (int i = 0; i < 5; i++) {
		if (check[friends[i]] != 0) continue;

		check[friends[i]] = 1;
		path[level] = friends[i];
		run(level + 1, e);
		path[level] = 0;
		check[friends[i]] = 0;
	}
}

int main() {
	char except;
	cin >> except;

	check[except] = 1;
	run(0, except);

	return 0;
}
```
