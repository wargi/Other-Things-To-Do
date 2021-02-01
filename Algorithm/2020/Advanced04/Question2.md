# 국가 전쟁

## 1. 문제
- N개의 국가가 존재하고, 각 국가들은 인구수를 갖고 있습니다.
- 각 국사를 입력받고, 각 국가의 인구수를 입력 받습니다.
- 그리고 동맹을 맺고, 전쟁을 일으키는 상황을 입력받고, 살아남은 국가의 수를 출력하는 프로그램을 작성하시오.

```
[Exam]
input)
7 // 7개의 국가
10 20 30 40 50 60 70 // 각 국가의 인구수
5 // 5개의 상황
alliance A C // A와 C 동맹
alliance F C // F와 C 동맹
alliance D B // D와 B 동맹
alliance A F // A와 F 동맹, 하지만 이미 동맹이 되어있으므로 무시
war D F // D 동맹국들과 F 동맹국들의 전쟁

A + C + F 동맹국의 인구수(ACF: 100 / DB: 60)가 더 많으므로, D와 B국가는 멸망합니다.
따라서, 총 5개의 국가가 살아 남았으므로 출력결과는 5 입니다.

output: 5

[세부조건]
1. 같은 동맹끼리 전쟁을 일으키지 않습니다.
2. 동맹을 파기하는 일은 없습니다.
```

## 2. 입력
- 첫 줄: 국가의 개수 N을 입력받는다.
- 두 번째 줄: 각 국가의 인구수를 입력받는다.
- 세 번째 줄: 일어나는 상황의 개 수를 입력받는다.
- 다음 줄부터: 상황들을 입력받는다.

## 3. 출력
- 살아남은 국가의 수를 출력해주세요.

## 4. 예제 입력
```
7
10 20 30 40 50 60 70
5
alliance A C
alliance F C
alliance D B
alliance A F
war D F
```

## 5. 예제 출력
```
5
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int n, m;
int point[100] = { 0 };
int vect[100] = { 0 };

char getBoss(char ch) {
	if (vect[ch] == 0) return ch;

	char ref = getBoss(vect[ch]);
	vect[ch] = ref;
	return ref;
}

void setGroup(char lv, char rv) {
	char lb = getBoss(lv);
	char rb = getBoss(rv);

	if (lb == rb) return;

	vect[rb] = lb;
}

void war(char lv, char rv) {
	int cntL = 1, cntR = 1;
	int tPersonL = 0, tPersonR = 0;

	for (int i = 0; i < n; i++) {
		char ch = 'A' + i;
		if (ch != lv && getBoss(ch) == lv) {
			cntL++;
			tPersonL += point[i];
		}
		if (ch != rv && getBoss(ch) == rv) {
			cntR++;
			tPersonR += point[i];
		}
	}

	if (tPersonL >= tPersonR) {
		n -= cntR;
	}
	else {
		n -= cntL;
	}
}

int main() {
	
	cin >> n;

	for (int i = 0; i < n; i++) {
		int t;
		cin >> t;
		point[i] = t;
	}

	cin >> m;

	for (int i = 0; i < m; i++) {
		string t1;
		char t2, t3;
		cin >> t1 >> t2 >> t3;

		if (t1 == "alliance") setGroup(t2, t3);
		else war(t2, t3);
	}

	cout << n;

	return 0;
}
```
