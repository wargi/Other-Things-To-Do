# E-mail 구분하기 #

## 1. 문제

- 여러 개의 메일을 '|'로 구분하여 한 문장에 입력 받습니다.
- 이 메일들을 한 개씩 나누어 아래의 예제 출력에 나온 결과처럼 출력해주세요.

## 2. 입력
- 여러개의 메일 정보가 들어있는 문장 하나를 입력 받습니다.

## 3. 출력
- 입력 받은 문장의 메일들을 구분하여 아래의 예제 출력처럼 나오게 출력해주세요.

## 4. 예제 입력
```
abc@naver.com|def@daum.co.kr|ghij@nate.net
```

## 5. 예제 출력
```
[#abc] naver
[#def] daum
[#ghij] nate
```

## 6. 코드
```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main()
{
	vector<string> v;
	string t, s;
	cin >> s;

	for (int i = 0; i < s.length(); i++) {
		if (s[i] == '|') {
			v.push_back(t);
			t = "";
			continue;
		}

		t += s[i];
	}

	v.push_back(t);
	t = "";

	for (int i = 0; i < v.size(); i++) {
		for (int j = 0; j < v[i].length(); j++) {
			if (v[i][j] == '@') {
				cout << "[#" << t << "] ";
				t = "";
			}
			else if (v[i][j] == '.') {
				cout << t << "\n";
				t = "";
				break;
			}
			else {
				t += v[i][j];
			}
		}
	}

	return 0;
}
```
