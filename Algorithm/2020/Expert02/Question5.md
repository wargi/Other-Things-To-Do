# 스케줄 배정 #

## 1. 문제

- **회의실이 하나인 회사**가 있습니다.
- 예약스케쥴을 입력받고, 최대 몇번의 회의가 가능한지 출력하세요

- 만약 6번의 회의가 있고, 아래의 그림과 같이 스케쥴을 입력받았다면, 최대 3번의 회의가 가능합니다.

<img src="./Array02.png" alt="Array" style="zoom:77%;" />

> - **[힌트]**
> - 가장 일찍 끝나는 회의 먼저 선택하기

## 2. 입력

- 첫번째 입력숫자는 회의의 횟수입니다.
- 그 다음 입력 숫자들은 스케쥴 시작시간과 종료시간 입니다.

## 3. 출력
- 가능한 최대 회의 횟수를 출력하세요

## 4. 예제 입력
```
6
1 6
3 8
8 9
2 4
4 6
7 9
```

## 5. 예제 출력
```
3
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

struct Node {
	int input;
	int data;
};

int main()
{
	vector<Node> vect;
	int n, cnt = 1, start = 0, end = 100000000;
	cin >> n;

	for (int i = 0; i < n; i++) {
		int s, e;
		cin >> s >> e;

		if (e < end) {
			end = e;
			start = s;
		}

		vect.push_back({ s, e });
	}

	while (1) {
		int min = 32e7, index = -1;
		for (int i = 0; i < n; i++) {
			if (end <= vect[i].input && min > vect[i].data) {
				min = vect[i].data;
				index = i;
			}
		}

		if (index == -1) break;

		start = vect[index].input;
		end = vect[index].data;
		cnt++;
	}

	cout << cnt;

	return 0;

}

```
