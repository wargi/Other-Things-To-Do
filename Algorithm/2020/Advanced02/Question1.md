# 가장 긴 단어찾기 #

## 1. 문제
- 두 문장을 입력받습니다.
- 입력 받은 두 문장중에 공통되는 가장 긴 단어를 찾아주세요.

## 2. 입력
-  두 문장을 입력받습니다.(1 <= 문장 <= 15)

## 3. 출력
- 공통되는 가장 긴 단어를 찾아주세요.

## 4. 예제 입력
```
ABCNMBCDESKKJ
```

## 5. 출력

```
MBCDESKOREA
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main() {
	char strL[16], strR[16];
	int length, max = -1, start, end;

	cin >> strL >> strR;
	int lenL = strlen(strL), lenR = strlen(strR);

	if (lenL >= lenR) length = lenR;
	else length = lenL;

	for (int i = 0; i < lenL; i++) {
		int cnt = 0;
		for (int j = 0; j < lenR; j++) {
			if (strL[i + cnt] == strR[j]) {
				cnt++;
				if (max < cnt) {
					max = cnt;
					start = j - cnt + 1;
					end = j;
				}
				
				continue;
			}
			cnt = 0;
		}
	}

	for (int i = start; i <= end; i++) {
		cout << strR[i];
	}

	return 0;
}
```