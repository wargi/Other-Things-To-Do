# 알파벳 찾기

## 1. 문제
```
1. 아래의 2차원 배열(4x4)을 하드코딩 해주세요.
A B C D
B B A B
C B A C
B A A A

2. 2차원 배열(4x4)을 입력받아 주세요.
ex input)
A B B A
B A C B
C B A A
D D A B

3. 입력받은 배열과 하드코딩 배열을 비교합니다. 만약 같은 좌표에 같은 알파벳을 가지고 있다면,
   체크하고 마지막까지 탐색하여, 최종에 체크된 알파벳들 중에 가장 많이 체크된 알파벳을 출력해주세요.
   
위의 예제 입력의 경우 출력은 'B'가 됩니다.
```

## 2. 입력
- 2차원 배열(4x4)을 입력받아 주세요.

## 3. 출력
- 최종에 체크된 알파벳들 중에 가장 많이 체크된 알파벳을 출력해주세요.

## 4. 예제 입력
```
AAAA
BBBB
CCCC
DDDD
```

## 5. 예제 출력
```
B
```

## 6. 코드
```c++
#include<iostream>
using namespace std;

char map[4][5] = {
	"ABCD",
	"BBAB",
	"CBAC",
	"BAAA"
};

int check[26] = { 0 };
char inputMap[4][5];

int main() {
	int cnt = -1, x;
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			cin >> inputMap[i][j];
			if(inputMap[i][j] == map[i][j]) check[inputMap[i][j] - 'A']++;
		}
	}

	for (int i = 0; i < 26; i++) {
		if (cnt < check[i]) {
			x = i;
			cnt = check[i];
		}
	}

	cout << char('A' + x);

	return 0;
}
```
