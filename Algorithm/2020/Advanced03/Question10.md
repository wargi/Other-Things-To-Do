# 5번째 Queue #

## 1. 문제
- 소방관 B I A H 4명이 잇습니다.
- 위의 소방관들 중에 출동할 순서를 뽑아야 하는데 소방관 B를 시작으로 5번째 소방관을 선택합니다.

```
ex)
B -> I -> A -> H -> B (5번째 B 출동)
```

- B 소방관이 출동했으니, 이제 남은 3명의 소방관을 위의 예제처럼 출동시키면 됩니다.
- 출동하는 소방관의 순서대로 출력해주세요.

```
1. B -> I -> A -> H -> B (B 출동)
2. I -> A -> H -> I -> A (A 출동)
3. H -> I -> H -> I -> H (H 출동)
4. 남은 I 출동
```

## 2. 출력
- 위의 예제와 같이 출동하는 순서대로 소방관을 출력해주세요.

## 3. 예제 출력
```
B A H I
```

## 4. 코드
```c++
#include <iostream>
using namespace std;

struct Node {
	char data;
	Node* next;
};

Node* head, * last;

void enQueue(char x) {
	if (head == NULL) {
		head = new Node({ x });
		last = head;
		return;
	}

	last->next = new Node({ x });
	last = last->next;
}

char deQueue() {
	char ch = head->data;
	head = head->next;
	return ch;
}

int main() {
	enQueue('B');
	enQueue('I');
	enQueue('A');
	enQueue('H');

	int i = 1;
	while (head != NULL) {
		char ch = deQueue();
		if (i % 5 == 0) cout << ch << " ";
		else enQueue(ch);
		i++;
	}

	return 0;
}
```
