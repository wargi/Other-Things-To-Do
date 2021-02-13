# 문장 만들기

## 1. 문제

- 아래 단어들을 적절히 사용해서, 문장을 구성해 주세요.
- 사용할 수 있는 단어들은 다음과 같습니다.

```
"BTS", "SBS", "BS", "CBS", "SES"
```

- 위 단어들을 최소로 사용하여 입력받은 문장을 만드려고 합니다.
- 단어를 중복 사용할 수 있습니다.

## 2. 입력

- 문장을 입력 해주세요. (<= 30글자)

## 3. 출력

- 문장을 만들 수 있는 단어의 사용 최소 개수를 출력하세요.


## 4. 예제 입력
```
CBSSES
```

## 5. 예제 출력
```
2
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int cnt = 0, mini = 21e8, check[5] = { 0 };
string s, p[5] = { "BTS", "SBS", "BS", "CBS", "SES" };

void run(int level, string w) {
	if (s == w) {
		if (mini > level) mini = level;
		return;
	}

	if (level == 5) return;

	for (int i = 0; i < 5; i++) {
		run(level + 1, w + p[i]);
	}
}

int main() {
	cin >> s;
	run(0, "");
	cout << mini;


	return  0;
}
```
