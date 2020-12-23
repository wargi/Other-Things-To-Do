# 단어 꺼내오기 #

## 1. 문제
- 한 문장을 입력받고, 문장에 '_'를 제외한 단어들을 모두 저장하고 출력하는 프로그램을 작성하시오.


## 2. 입력
- 한 문장을 입력받습니다.

## 3. 출력
- '_' 제외하여 각각의 단어를 아래의 예시처럼 출력해주세요.

## 4. 예제 입력
```
Apple_Swift_____iOS__iPhone___iMAC____iCloud
```

## 5. 예제 출력
```
1#Apple
2#Swift
3#iOS
4#iPhone
5#iMAC
6#iCloud
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main()
{
	int cnt = 1;
	string t;
	string s;
	cin >> s;

	for (int i = 0; i < s.length(); i++) {
		if (s[i] == '_' && t.size() != 0) {
			cout << cnt++ << "#" << t << "\n";
			t = "";
		}
		else if (s[i] != '_') {
			t += s[i];
		}
		else {
			continue;
		}
	}

	if (t.size() != 0) cout << cnt++ << "#" << t;
}
```
