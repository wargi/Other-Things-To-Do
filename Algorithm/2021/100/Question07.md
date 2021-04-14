# 단어의 개수

## 1. 문제

- 영어 대소문자와 띄어쓰기만으로 이루어진 문자열이 주어진다.
- 이 문자열에는 몇 개의 단어가 있을까?
- 이를 구하는 프로그램을 작성하시오.
- 단, 한 단어가 여러 번 등장하면 등장한 횟수만큼 모두 세어야 한다.

## 2. 입력
- 첫 줄에 영어 대소문자와 띄어쓰기로 이루어진 문자열이 주어진다.
- 이 문자열의 길이는 1,000,000을 넘지 않는다. 
- 단어는 띄어쓰기 한 개로 구분되며, 공백이 연속해서 나오는 경우는 없다. 
- 또한 문자열의 앞과 뒤에는 공백이 있을 수도 있다.

## 3. 출력

- 첫째 줄에 단어의 개수를 출력한다.


## 4. 예제 입력
```
The Curious Case of Benjamin Button
```

## 5. 예제 출력
```
6
```

## 6. 예제 입력

```
 Mazatneunde Wae Teullyeoyo
```

## 7. 예제 출력

```
3
```

## 8. 예제 입력

```
Teullinika Teullyeotzi 
```

## 9. 예제 출력

```
2
```

## 10. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main()
{
	string s;
	getline(cin, s);

	int cnt = 0, flag = 1;
	for (int i = 0; i < s.length(); i++) {
		if (s[i] == ' ') {
			flag = 1;
			continue;
		}
		if (flag && (s[i] >= 65 && s[i] <= 123)) {
			cnt++;
			flag = 0;
		}
	}

	cout << cnt;
  
  return 0;
}
```



### #출처

- [백준 온라인 저지](https://www.acmicpc.net/problem/1152)
