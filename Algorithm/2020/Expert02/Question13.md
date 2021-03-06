## 고결하고 완벽한 문자열 판단

## 1. 문제
- 고결한 문자열은 중복된 문자가 없는 문자열을 뜻합니다.
- 예를들어 ABCDEF은 고결한 문자열이며, ARQRA 는 고결하지 않은 문자열 입니다.
- < > 괄호를 포함한 문자열을 입력받습니다.
- 적어도 < > 이 괄호 안에 있는 문자열은 반드시 고결한 문자열로 구성되어야 합니다.

```
예를들어, <A>AA<ABC>BBC<BC> 는 완벽한 문자열 입니다.
괄호 안에있는 문자열은 모두 고결한 문자열이기 때문입니다.

예를들어, BTS<BTC>K<KKK> 은 완벽한 문자열이 아닙니다.
괄호 안에있는 문자열 중, 고결하지 않은 문자열이 존재하기 때문입니다. (KKK)
```

> **[세부사항]**
>
> 1. 문자열에는 대, 소문자, 숫자 등 나올 수 있습니다.
>
> 2. 잘못된 괄호 형태는 입력으로 주어지지 않습니다.
>
> 3. 특수문자는 주어지지 않습니다.

## 2. 입력

- n개의 문자열을 입력 받습니다. (1 <= n <= 100)
- 문자열의 길이는 (<= 200)

## 3. 출력
- 모두 고결한 문자열로 구성된 완벽한 문자열인지 O X 로 출력 해 주세요.

## 4. 예제 입력
```
5
AB<ASDF>BB<B>BB<B>KK
QWE<ASDASD><BTS>
<BBQ>WORLD
<B><A><K1>
<AFTER><SCH><O><O>L
```

## 5. 예제 출력

```
OXXOO
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

bool check(string s) {
	int checkArr[2000] = { 0, };

	for (int i = 0; i < s.length(); i++) {
		checkArr[s[i]]++;
		if (checkArr[s[i]] > 1) return false;
	}
	return true;
}

char find(string s) {
	int sIndex = 0, eIndex = 0;

	while (1) {
		sIndex = s.find('<', eIndex);
		eIndex = s.find('>', sIndex);

		if (sIndex == -1 || eIndex == -1) break;

		string res = s.substr(sIndex + 1, eIndex - sIndex - 1);

		if (!check(res)) return 'X';
	}
	return 'O';
}

int main()
{
	int n;
	string result = "";
	cin >> n;

	for (int i = 0; i < n; i++) {
		string s;
		cin >> s;
		result += find(s);
	}

	cout << result;

	return 0;
}

```
