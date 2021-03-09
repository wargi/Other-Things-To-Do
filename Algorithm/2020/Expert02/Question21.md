# 가장 긴 공통 문자열 찾기

## 1. 문제

- 두 문자열을 입력받고, 가장 긴 같은 문자열을 찾으려고 합니다.
- string class의 find 메서드와 substr을 활용하여 가장 긴 공통 문자열을 출력 해 주세요.

```
[예시]
예를들어, ABCDEF와 OOBCDEOOAB에서 가장 긴 공통 문자열은 "BCDE" 입니다.
예를들어, QQQABQQQ 와 ABQQTT 에서 가장 긴 공통 문자열은 "ABQQ" 입니다.
```

> - **[힌트]**
> - 두 문자열 중 긴 문장을 A 문자열로두고, 짦은 문자열을 B 문자열로 둡니다.
> - 먼저 B문자열 전체로 A 문자열에서 검색 해보고, B문자열 일부로 A 문자열에서 검색을 시도해보면 됩니다.
> - B문자열을 한글자씩 줄여서 검색해 보다가, 발견되면 정답을 출력하면 됩니다.

## 2. 입력

- 두 문자열을 입력받습니다.

## 3. 출력

- 가장 긴 공통 문자열을 출력 해 주세요.

## 4. 입력 예시

```
ABCDEF
OOBCDEOOAB
```

## 5. 출력 예시

```
BCDE
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;


int main()
{
	string lVal, rVal;
	cin >> lVal >> rVal;

	int sizeL = lVal.size();
	int sizeR = rVal.length();

	if (sizeL <= sizeR) {
		swap(lVal, rVal);
		swap(sizeL, sizeR);
	}

	int maxi = -1;
	string maxString = "";
	for (int i = 0; i <= sizeL - sizeR; i++) {
		string res = "";
		for (int j = 0; j < sizeR; j++) {
			if (lVal[i + j] == rVal[j]) {
				res += rVal[j];
			}
			else {
				int size = res.length();
				if (maxi < size) {
					maxi = size;
					maxString = res;
				}
			}
		}
		int size = res.length();
		if (maxi < size) {
			maxi = size;
			maxString = res;
		}
	}

	cout << maxString;

	return 0;
}
```
