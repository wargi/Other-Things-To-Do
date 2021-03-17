# 단어 공부

## 1. 문제

- 알파벳 대소문자로 된 단어가 주어지면, 이 단어에서 가장 많이 사용된 알파벳이 무엇인지 알아내는 프로그램을 작성하시오.
- 단, 대문자와 소문자를 구분하지 않는다.

## 2. 입력
- 첫째 줄에 알파벳 대소문자로 이루어진 단어가 주어진다.
- 주어지는 단어의 길이는 1,000,000을 넘지 않는다.

## 3. 출력

- 첫째 줄에 이 단어에서 가장 많이 사용된 알파벳을 대문자로 출력한다.
- 단, 가장 많이 사용된 알파벳이 여러 개 존재하는 경우에는 ?를 출력한다.


## 4. 예제 입력
```
Mississipi
```

## 5. 예제 출력
```
?
```

## 6. 예제 입력

```
zZa
```

## 7. 예제 출력

```
Z
```

## 8. 예제 입력

```
z
```

## 9. 예제 출력

```
Z
```

## 10. 예제 입력

```
baaa
```

## 11. 예제 출력

```
A
```

## 12. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main()
{
	int check[200] = { 0 };

	string s;
	cin >> s;

	int max = -1;
	for (int i = 0; i < s.length(); i++) {
		char ch = s[i];

		if (s[i] >= 97) ch -= 32;

		check[ch]++;

		if (check[ch] > max) max = check[ch];
	}

	int cnt = 0, idx;
	for (int i = 0; i < 100; i++) {
		if (check[i] == max) {
			cnt++;
			idx = i;
		}
	}

	if (cnt >= 2) cout << "?";
	else cout << char(idx);

}
```
