# Steak House #

## 1. 문제
- 1번에서 K번의 품목 번호를 가진 고기들은 A에서 F까지 각각의 등급을 가지고 있습니다.
- 직원들은 어떤 품목들이 들어왔는지 품목리스트에 작성해둡니다.
- 고기의 납품 이력이 적혀있는 리스트의 내용들을 적절한 자료구조에 저장시키고, 각 번호의 고기들이 각각 무슨 등급인지 순차적으로 출력하는 프로그램을 작성하시오.

```
[Exam]
- 품목 리스트에 다음과 같이 적혀있다고 가정합니다.
3 2 // 3 번과 2 번 고기는 같은 등급입니다.
B 4 // 4 번 고기는 B 등급 입니다.
1 A // 1 번 고기는 A 등급 입니다.
3 4 // 3 번과 4 번 고기는 같은 등급 입니다.

2, 3, 4번 고기 등급은 B 입니다.
```

## 2. 입력

-  첫 줄: 품목 리스트의 개수 N, 레스토랑에서 받은 고기 개수 K를 먼저 입력 받습니다. (1 <= N <= 20 / 1 <= K <= 9)
-  다음 줄부터: N개의 품목 리스트를 입력 받습니다.
-  품목리스트는 숫자 2개 또는 1개 문자 + 1개의 숫자로 구성되어 있습니다.

## 3. 출력
- 1번부터 K번까지 각각 몇 등급인지 순서대로 출력해주세요.
- 등급을 알 수 없는 데이터는 주어지지 않습니다.

## 4. 예제 입력
```
6 4
3 2
B 4
1 A
3 4
3 B
A 1
```

## 5. 출력

```
ABBA
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int vect[10] = { 0 };
int grade[20] = { 0 };

int getBoss(int val) {
	if (vect[val] == 0) return val;

	int ref = getBoss(vect[val]);
	vect[val] = ref;
	return ref;
}

void setGroup(int lv, int rv) {
	int lb = getBoss(lv);
	int rb = getBoss(rv);

	if (lb == rb) return;

	vect[rv] = lb;
}

int main() {
	int n, m;
	cin >> n >> m;

	for (int i = 0; i < n; i++) {
		char x, y;
		cin >> x >> y;

		if (x >= 'A' && x <= 'Z' && y >= '0' && y <= '9')
		{
			int t = getBoss(y - '0');
			grade[t] = x;
		}
		else if (y >= 'A' && y <= 'Z' && x >= '0' && x <= '9')
		{
			int t = getBoss(x - '0');
			grade[t] = y;
		}
		else if (getBoss(x - '0') != getBoss(y - '0')) {
			setGroup(x - '0', y - '0');
		}
	}

	for (int i = 1; i <= m; i++) {
		if (grade[i] < 'A') continue;
		int t = getBoss(i);
		grade[t] = grade[i];
	}

	for (int i = 1; i <= m; i++)
		cout << char(grade[getBoss(i)]);

	return 0;
}
```