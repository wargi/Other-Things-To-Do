# n개의 주사위

## 1. 문제

- n개의 주사위를 던져서 나올 수 있는 모든 경우를 출력해주세요.

## 2. 입력

- 주사위 개수 n을 입력 받습니다.

## 3. 출력
- n개의 주사위를 던져서 나올 수 있는 모든 경우를 출력해주세요.

## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
11
12
13
14
15
16
21
22
23
24
25
26
31
32
33
34
35
36
41
42
43
44
45
46
51
52
53
54
55
56
61
62
63
64
65
66
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int n;
char *path = new char[n + 1];
void run(int level, int limit) {
	if (level == limit) {
		path[limit] = 0;
		cout << path << "\n";
		return;
	}

	for (int i = 0; i < 6; i++) {
		path[level] = '1' + i;
		run(level + 1, limit);
		path[level] = 0;
	}
}

int main()
{
	cin >> n;

	run(0, n);
}
```
