# DFS 탐색하며 대문자 출력

## 1. 문제
- 문자열로 구성된 이진트리를 1차원 배열형태로 입력받습니다.(입력값 중에 '#'은 '노드없음'을 뜻합니다.)
- 입력 받은 이진트리를 DFS로 탐색하며, 대문자를 발견할 때마다 출력해주세요.
- 만약, #WAn#R#I##dG을 입력받았다면,
- <img src="./Tree05.png" alt="Tree" style="zoom:77%;" />

## 2. 입력
- 문자열로 구성된 이진트리를 1차원 배열형태로 입력받는다.

## 3. 출력
- 입력 받은 이진트리를 DFS로 탐색하며, 대문자를 발견할 때마다 출력해주세요.

## 4. 예제 입력
```
#WAn#R#I##dG
```

## 5. 예제 출력
```
WARGI
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

char vect[100];
string s;
void run(int now) {
	if (now >= s.size() || s[now] == '#') return;

	if(s[now] > 64 && s[now] <= 90) cout << s[now];
	run(now * 2);
	run(now * 2 + 1);
}

int main() {
	cin >> s;

	run(1);

	return 0;
}
```
