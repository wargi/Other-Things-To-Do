# 문장의 일부분 꺼내오기 2 #

## 1. 문제
- 문장들을 입력받고 그 사이에 "[xxxxx]" 이런식으로 구성된 7자리 문장을 추출할려고 합니다.
- 입력 받은 모든 문장에서 "[xxxxx]"를 모두 추출해서 출력해주세요.

## 2. 입력
- 문장을 입력 받습니다.

## 3. 출력
- 입력 받은 모든 문장에서 "[xxxxx]"를 모두 추출해서 출력해주세요.

## 4. 예제 입력
```
3
ABC[89101]
DEF[123][4567]GH
IJ[11213]KL[14151][61718]
```

## 5. 예제 출력
```
[89101]
[11213]
[14151]
[61718]
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main()
{
	int n;
	cin >> n;

	vector<string> s;
	vector<string> k;
	for (int i = 0; i < n; i++) {
		string t;
		cin >> t;

		s.push_back(t);
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < s[i].length(); j++) {
			if (s[i][j] == '[') {
				string sub = s[i].substr(j, 7);
				k.push_back(sub);
			}

		}
	}

	for (int i = 0; i < k.size(); i++) {
		if (k[i].size() != 7) continue;
		if (k[i][6] != ']') continue;

		cout << k[i] << "\n";
	}
}
```
