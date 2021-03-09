# 웹 사이트 주소 판별

## 1. 문제

- 뉴스 기사에서 웹사이트 URL만 추출하려고 합니다.
- 띄어쓰기가 없는 한줄의 기사를 입력받고, 아래의 조건에 맞는 URL은 총 몇개인지 출력해주세요.

> - **URL 조건**
>
>   1. 대소문자 구분은 없습니다.
>
>   2. 시작단어는 "http://" 또는 "https://" 입니다.
>
>   3. 끝 단어는 ".com" 또는 ".co.kr" 또는 ".org" 또는 ".net" 입니다.
>
>   4. 시작단어와 끝 단어 사이에는 최소 3글자 이상 있어야 합니다.

## 2. 입력

- 띄어쓰기가 없는 한줄의 기사를 입력받아주세요.

## 3. 출력

- 조건에 맞는 URL은 총 몇개인지 출력해주세요.

## 4. 예제 입력
```
ABHttp://bbq.comhttps://a.co.krBBQhttpS://KFC.org
```

## 5. 예제 출력

```
2개
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int cnt;

void step1(string& str) {
	for (int i = 0; i < str.length(); i++) {
		if (str[i] >= 'A' && str[i] <= 'Z') {
			str[i] += 32;
		}
	}
}

void step2(string& str) {
	int start = 0;
	while (1) {
		int a = str.find("http://", start);
		int b = str.find("https://", start);

		string res;
		if (a != -1 && b != -1) {
			if (a < b) {
				res = str.substr(start, a - start);
				start = a + 7;
			}
			else {
				res = str.substr(start, b - start);
				start = b + 8;
			}
		}
		else if (a != -1) {
			res = str.substr(start, a - start);
			start = a + 7;
		}
		else if (b != -1) {
			res = str.substr(start, b - start);
			start = b + 8;
		}
		else {
			res = str.substr(start, str.length() - start);
		}

		int sum = res.find(".com", 0) + res.find(".co.kr", 0) + res.find(".net", 0) + res.find(".org", 0);
		if (sum >= -1) cnt++;
		
		if (a == -1 && b == -1) return;
	}
}

int main()
{
	string s;
	cin >> s;

	step1(s);
	step2(s);
	
	cout << cnt << "개";

	return 0;
}
```
