# Queue 구조체

## 1. 문제
- int x와 char y로 Queue로 구성된 구조체 배열을 만들어주세요.
- 첫 줄에 Enqueue 갯수를 입력받습니다.
- 다음 줄부터 입력 값들이 주어집니다.
- 모두 Dequeue하고 Dequeue하며 나오는 값을 출력해주세요.

## 2. 입력
- 첫 줄에 Enqueue 갯수를 입력받습니다.
- 다음 줄부터 입력 값들이 주어집니다.

## 3. 출력
- 모두 Dequeue하고 Dequeue하며 나오는 값을 출력해주세요.

## 4. 예제 입력
```
3
1 A
2 B
3 C
```

## 5. 예제 출력
```
1 A
2 B
3 C
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

struct Node {
	int x;
	char y;
	Node* next;
};

Node* head, * last;

void push(int x, char y) {
	if (head == NULL) {
		head = new Node({ x, y });
		last = head;
		return;
	}

	last->next = new Node({ x, y });
	last = last->next;
}

void pop() {
	cout << head->x << " " << head->y << "\n";
	head = head->next;
}

int main()
{
	int n;
	cin >> n;

	for (int i = 0; i < n; i++) {
		int x;
		char y;
		cin >> x >> y;

		push(x, y);
	}

	for (int i = 0; i < n; i++) {
		pop();
	}
}
```
