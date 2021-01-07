# 바람개비 #

## 1. 문제
```
1. 아래의 문자로 구성된 2차원 배열(3x3)을 하드코딩 하세요.
_ 5 4
3 _ _
_ _ 1

2. 하드 코딩한 배열을 회전시킬 횟수 n을 입력받아주세요.

3. 입력받은 n만큼 오른쪽으로 회전하고 난 후 결과를 출력해주세요.

ex)
3을 입력 받았다고 생각하고,

1회 회전 상태)
_ 3 _
_ _ 5
1 _ 4

2회 회전 상태)
1 _ _
_ _ 3
4 5 _

3회 회전 최종상태)
4 _ 1
5 _ _
_ 3 _
```

## 2. 힌트
- 오른쪽으로 회전 시킬때 마다 좌표가 어떻게 바뀌는지 생각해보세요 :)

## 3. 입/출력
- 입력: 배열을 회전시킬 횟수 n을 입력받습니다.
- 출력: 회전하고 난 후 결과를 출력해주세요.

## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
1__
__3
45_
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
	int input[3][3] = {
		0, 5, 4,
		3, 0, 0,
		0, 0, 1
	};

	int n;
	cin >> n;

	int result[3][3] = { 0 };

	

	for (int i = 0; i < n; i++) {
		int result[3][3] = { 0 };

		for (int y = 0; y < 3; y++) {
			for (int x = 0; x < 3; x++) {
				int dy = 0 - y + x;
				int dx = 2 - y - x;

				result[y + dy][x + dx] = input[y][x];
			}
		}

		for (int y = 0; y < 3; y++) {
			for (int x = 0; x < 3; x++) {
				input[y][x] = result[y][x];
			}
		}
	}

	for (int y = 0; y < 3; y++) {
		for (int x = 0; x < 3; x++) {
			if (input[y][x] == 0) cout << "_";
			else cout << input[y][x];
		}
		cout << "\n";
	}
}
```
