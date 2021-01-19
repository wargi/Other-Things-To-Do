# 소문자로 변경

## 1. 문제
- 대문자로 구성된 문장을 총 4개 입력 받습니다.

- 입력된 문장들 중에 가장 긴 문장과 짧은 문장을 소문자로 바꾸고 입력받은 순서대로 출력해주세요.

## 2. 입력
- 대문자로 구성된 문장을 총 4개 입력 받습니다.

## 3. 출력
- 입력된 문장들 중에 가장 긴 문장과 짧은 문장을 소문자로 바꾸고 입력받은 순서대로 출력해주세요.

## 4. 예제 입력

```
BHC
GOOBNE
CHICKEN
NENE
```

## 4. 예제 출력
```
bhc
GOOBNE
chicken
NENE
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int main() {
	string s[4];
	int min = 1000, max = -1, minIdx, maxIdx;
	
	for (int i = 0; i < 4; i++) {
		cin >> s[i];
		int size = s[i].size();
		if (min > size) {
			min = s[i].size();
			minIdx = i;
		}

		if (max < size) {
			max = s[i].size();
			maxIdx = i;
		}
	}

	for (int i = 0; i < 4; i++) {
		if (i == minIdx || i == maxIdx) {
			for (int j = 0; j < s[i].size(); j++) cout << char(s[i][j] + 32);
		}
		else {
			cout << s[i];
		}
		cout << "\n";
	}

	return 0;
}
```
