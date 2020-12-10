# 다른 종류의 알파벳 찾기 #

## 1. 문제
- 한 문장을 입력 받고, 몇 가지 종류의 알파벳이 존재하는지 출력해주세요.


## 2. 입력
- 문장 한 개를 입력 받아 주세요.

## 3. 출력
- 몇 가지 종류의 알파벳이 존재하는지 출력해주세요.

## 4. 예제 입력
```
ABCDREHGE
```

## 5. 예제 출력
```
8종류
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main() {
	string s;
	cin >> s;
	int check[26] = { 0 }, cnt = 0;

	for (int i = 0; i < s.size(); i++) check[s[i] - 'A']++;

	for (int i = 0; i < 26; i++) {
		if (check[i] > 0) cnt++;
	}

	cout << cnt << "종류";

	return 0;
}
```
