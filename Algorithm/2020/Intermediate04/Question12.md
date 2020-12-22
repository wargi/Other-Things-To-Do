# 문장 내용 수정하기

## 1. 문제
```
[문자표]
KFC -> #BBQ#
MC -> #BBQ#
BICMAC -> #MACBOOK#
SHACK -> #SHOCK#
SONY -> #NONY#
```

- 한 문장을 입력 받고, 해당 문장에서 위의 문자표의 왼쪽에 있는 단어가 있다면 오른쪽 단어로 바꾸어 출력해주세요.

## 2. 입력
- 한 문장을 입력 받는다.

## 3. 출력
- 입력받은 문장에서 위의 문자표의 왼쪽에 있는 단어가 있다면 오른쪽 단어로 바꾸어 출력해주세요.

## 4. 예제 입력
```
ILOVESONY
```

## 5. 예제 출력
```
ILOVE#NONY#
```

## 6. 예제 입력

```
KFCANDMC
```

## 7. 예제 출력

```
#BBQ#AND#BBQ#
```

## 8. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
	string b[5] = { "KFC", "MC", "BICMAC", "SHACK", "SONY" };
	string a[5] = { "#BBQ#", "#BBQ#", "#MACBOOK#", "#SHOCK#", "#NONY#" };

	string t;
	cin >> t;

	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < t.length(); j++) {
			int n = t.find(b[i], j);

			if (n >= 0) {
				t.replace(n, b[i].size(), a[i]);
				j = n;
			}
			else {
				break;
			}
		}
	}

	cout << t;
}
```
