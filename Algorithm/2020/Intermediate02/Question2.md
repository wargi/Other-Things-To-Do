# 1차원 배열 이동시키기

## 1. 문제
```
아래의 배열을 하드코딩 해주세요.
3 5 1 9 7

명령어 L or R을 입력 받습니다.

만약 R을 입력받으면,
배열의 숫자를 오른쪽으로 한 칸씩 이동시킵니다.(맨 뒤 숫자는 맨 앞로 보냅니다.)
이런식으로 위 하드코딩 배열에 R을 입력받으면 7 3 5 1 9 로 배열이 변경됩니다.

만약 L을 입력받으면,
배열의 숫자를 왼쪽으로 한 칸씩 이동시킵니다.(맨 앞 숫자는 맨 뒤로 보냅니다.)
이런식으로 위 하드코딩 배열에 L을 입력받으면 5 1 9 7 3 로 배열이 변경됩니다.

명령어를 총 4개를 입력받고, 변경된 배열결과를 출력해주세요.
```

## 2. 입력
- 명령어를 총 4개를 입력받는다.

## 3. 출력
- 변경된 배열결과를 출력해주세요.

## 4. 예제 입력
```
R
R
R
L
```

## 5. 예제 출력
```
9 7 3 5 1
```

## 6. 코드
```c++
#include<iostream>
using namespace std;

int vect[5] = { 3, 5, 1, 9, 7 };

void rMove() {
	int temp = vect[0];
	vect[0] = vect[4];

	for (int i = 1; i < 5; i++) {
		int x = vect[i];
		vect[i] = temp;
		temp = x;
	}
}

void lMove() {
	int temp = vect[0];
	vect[0] = vect[4];

	for (int i = 4; i >= 0; i--) {
		int x = vect[i];
		vect[i] = temp;
		temp = x;
	}
}

int main() {
	for (int i = 0; i < 4; i++) {
		char ch;
		cin >> ch;
		if (ch == 'R') rMove();
		if (ch == 'L') lMove();
	}
	
	for (int i = 0; i < 5; i++) cout << vect[i] << " ";
}
```
