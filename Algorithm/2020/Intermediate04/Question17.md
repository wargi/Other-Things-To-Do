# 유효성 검사

## 1. 문제
- 문장을 입력받고, 아래의 조건을 부합하는 프로그램을 작성하시오.

```
[유효성 검사 조건]
1. 입력받은 문장에 "bad", "no", "puck"가 없어야합니다.
2. '_'가 6개 이상 연속되면 안됩니다.
3. 문장에 나오는 알파벳들 중에 같은 알파벳이 5개 이하가 되어야합니다.
4. 문장에 숫자가 없어야합니다.
```

- 위의 조건에 부합한다면 "pass"를 출력하고, 아니라면 "fail"을 출력해주세요.

## 2. 입력
- 첫 줄: 문장 하나를 입력 받습니다.

## 3. 출력
-  위의 유효성 조건에 부합한다면 "pass"를 출력하고, 아니라면 "fail"을 출력해주세요.

## 4. 예제 입력
```
_____abc_____e_f_g_
```

## 5. 예제 출력
```
pass
```

## 6. 코드
```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

bool isOk(string s) {
	int a = s.find("bad");
	int b = s.find("no");
	int c = s.find("puck");

	if ((a + b + c) >= 0) return false;
	
	return true;
}

bool isUnder(string s) {
	int cnt = 0;

	for (int i = 0; i < s.length(); i++) {
		if (s[i] == '_') cnt++;
		else cnt = 0;
		
		if (cnt > 5) return false;
	}

	return true;
}

bool check(string s) {
	int check[200] = { 0 };

	for (int i = 0; i < s.length(); i++) {
		if (s[i] == '_') continue;
		check[s[i]]++;
		if (check[s[i]] > 5) return false;
	}

	return true;
}

bool isNumber(string s) {
	for (int i = 0; i < s.length(); i++) {
		if (s[i] >= '0' && s[i] <= '9') return false;
	}

	return true;
}

int main()
{
	string s;
	cin >> s;

	if (isOk(s) && isUnder(s) && check(s) && isNumber(s)) cout << "pass";
	else cout << "fail";

	return 0;
}
```
