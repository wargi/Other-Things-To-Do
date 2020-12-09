# Enqueue & Dequeue 3

## 1. 문제
- Size가 4인 Queue를 링크드리스트로 만들어주세요.
- 그리고 아래의 예제들처럼 입력 받았을때, 최종 Queue의 결과를 출력해주세요.

```
E는 Enqueue를 뜻하고, 옆의 숫자를 Queue에 넣습니다.
D는 Dequeue를 뜻하고, Dequeue를 수행합니다.(D옆의 숫자 0은 의미가 없습니다.)

ex 1)
input)
3
E 5
E 6
E 9

output: 5 6 9

ex 2)
input)
4
E 2
D 0
E 9
E 11

output: 9 11

ex 3)
3
E 5
D 0
D 0

output: Error

ex 4)
5
E 6
E 7
E 1
E 2
E 3

output: Error
```

## 2. 입력
- 첫 줄: 받을 명령어 갯수 n이 주어진다.
- 다음줄부터 n개의 명령어들이 입력된다.

## 3. 출력
- Queue의 최종상태를 출력하세요.

## 4. 예제 입력
```
2
E 1
E 2
```

## 5. 예제 출력
```
1 2
```

## 6. 예제 입력

```
1
D 0
```

## 7. 예제 출력

```
Error
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
	int data;
	Node* next;
};

Node* head, * last;
int cnt = 0;

int enQueue(int x) {
	if (cnt == 4) return 0;
	if (head == NULL) {
		head = new Node({ x });
		last = head;
		return 1;
	}

	last->next = new Node({ x });
	last = last->next;

	return 1;
}

int deQueue() {
	if (cnt == 0) return 0;

	head = head->next;

	return 1;
}

void print() {
	for (Node* p = head; p != NULL; p = p->next) cout << p->data << " ";
}


int main() {
	int n, m, flag = 1;
	cin >> n;

	for (int i = 0; i < n; i++) {
		char ch;
		cin >> ch;

		if (ch == 'E') {
			cin >> m;

			if (!enQueue(m)) {
				flag = 0;
				break;
			}
		}
		else {
			cin >> m;

			if (!deQueue()) {
				flag = 0;
				break;
			}
		}
	}

	if (flag) print();
	else cout << "Error";
	
	return 0;
}
```
