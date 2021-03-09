# 죄수 번호 판별

## 1. 문제
- **단어와 숫자**들이 번갈아가며 적혀있는 **한문장을 입력** 받습니다. ex) AB154CDEF112F4G5
- **죄수명(대문자)과 사건번호(숫자)가 한세트**로 되어있지만, 띄어쓰기가 없기에 알아보기 힘듭니다.
- 죄수명과 사건번호를 각각 Parsing하고 **사건번호에** **17을 더한 값으로** 출력 해주세요.

## 2. 입력
- 문자열을 입력받습니다.

## 3. 출력
- 죄수명과 사건번호를 각각 Parsing하고 **사건번호에** **17을 더한 값으로** 출력 해주세요.

## 4. 예제 입력
```
AB100CDEF112F4G5
```

## 5. 예제 출력
```
AB#117
CDEF#129
F#21
G#22
```

## 6. 코드
```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main()
{
	string s, num;
	cin >> s;

	for (int i = 0; i < s.length(); i++) {
		if ('A' <= s[i] && 'Z' >= s[i]) {
			if (!num.empty()) cout << stoi(num) + 17 << "\n";
			cout << s[i];
			num = "";
		}
		else {
			if (num.empty()) cout << "#";
			num += s[i];
		}
	}

	cout << stoi(num) + 17;

	return 0;
}

```
