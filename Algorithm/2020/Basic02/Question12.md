# 합격자 발표일

## 1. 문제
- 아래에 합격자 명단 1차 배열(1x6)을 하드코딩 해주세요.

```
3 7 4 1 2 6
```

- 수험생 명단을 2차원 배열(2x2)로 입력 받고, 입력 받은 숫자를 합격자 명단과 대조해보고 합격이라면 "OK", 아니라면 "NO"로 출력해주세요.

## 2. 입력
- 2차원 배열(2x2)로 입력 받는다.



## 3. 출력
- 합격 결과를 출력한다.

## 4. 예제 입력
```
1 2
4 8
```

## 5. 예제 출력
```
OK OK
OK NO
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int vect[6] = { 3, 7, 4, 1, 2, 6 };
int univer[2][2];

int main() {

	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 2; j++) {
			cin >> univer[i][j];
		}
	}

	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 2; j++) {
			int flag = 0;
			for (int k = 0; k < 6; k++) {
				if (vect[k] == univer[i][j]) flag = 1;
			}
			if (flag) cout << "OK ";
			else cout << "NO ";
		}
		cout << "\n";
	}

	return  0;
}
```
