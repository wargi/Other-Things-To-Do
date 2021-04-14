# 그룹 단어 체커

## 1. 문제

- 그룹 단어란 단어에 존재하는 모든 문자에 대해서, 각 문자가 연속해서 나타나는 경우만을 말한다.
- 예를 들면,
  - ccazzzzbb는 c, a, z, b가 모두 연속해서 나타나고, kin도 k, i, n이 연속해서 나타나기 때문에 그룹 단어이지만,
  - aabbbccb는 b가 떨어져서 나타나기 때문에 그룹 단어가 아니다.
- 단어 N개를 입력으로 받아 그룹 단어의 개수를 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄에 단어의 개수 N이 들어온다.
- N은 100보다 작거나 같은 자연수이다.
- 둘째 줄부터 N개의 줄에 단어가 들어온다.
- 단어는 알파벳 소문자로만 되어있고 중복되지 않으며, 길이는 최대 100이다.

## 3. 출력

- 첫째 줄에 그룹 단어의 개수를 출력한다.


## 4. 예제 입력
```
3
happy
new
year
```

## 5. 예제 출력
```
3
```

## 6. 예제 입력

```
4
aba
abab
abcabc
a
```

## 7. 예제 출력

```
1
```

## 6. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main()
{
	int n;
	cin >> n;

	int cnt = 0;
	for (int i = 0; i < n; i++) {
		int flag = 1, check[200] = { 0 };
		string s;
		
		cin >> s;
		for (int j = 0; j < s.length(); j++) {
			if (j != 0 && s[j - 1] == s[j]) continue;
			if (check[s[j]]) {
				flag = 0;
				break;
			}

			check[s[j]]++;
		}
		if (flag) cnt++;
	}

	cout << cnt;
  
  return 0;
}
```



### #출처

- [백준 온라인 저지](https://www.acmicpc.net/problem/1316)
