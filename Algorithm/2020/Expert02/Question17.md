# 영어 단어장

## 1. 문제
- 태평이는 영어공부를 위해 단어들만 모아서 암기장을 만들어 보려고 합니다.
- _(언더바)를 제외한 모든 단어들을 배열에 저장하고자 합니다.
- **각 칸에 ' _ ' 를 기준으로 단어들을 string 배열에 parsing 해주세요.**

## 2. 입력
- 문자열을 입력받습니다.

## 3. 출력
- n각 칸에 ' _ ' 를 기준으로 단어들을 string 배열에 parsing 하고, 아래의 출력예제 포맷처럼 출력해주세요.

## 4. 예제 입력
```
HOT_FRIED____CHICKEN_KFC_IS_BEST
```

## 5. 예제 출력
```
1#HOT
2#FRIED
3#CHICKEN
4#KFC
5#IS
6#BEST
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main()
{
	string s;
	cin >> s;

	int cnt = 1;
	string word = "";
	for (int i = 0; i < s.length(); i++) {
		if ('_' == s[i]) {
			if (!word.empty()) cout << cnt++ << "#" << word << "\n";
			word = "";
		}
		else {
			word += s[i];
		}
	}

	if (!word.empty()) cout << cnt++ << "#" << word;

	return 0;
}
```

