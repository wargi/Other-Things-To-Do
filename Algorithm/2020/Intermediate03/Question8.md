# 메모장 만들기 #

## 1. 문제

- 첫 번째 줄: 한 문장을 입력 받으세요.
- 두 번째 줄: 커서의 위치를 입력 받으세요.
- 세 번째 줄: 명령어 4개를 입력 받으세요.

```
명령어표
L: 커서를 왼쪽으로 한 칸 이동
R: 커서를 오른쪽으로 한 칸 이동
D: 커서에 위치한 칸 삭제
```

- 명령어들을 수행하고 커서가 있는 위치를 출력해주세요.

## 2. 입력
- 첫 번째 줄: 한 문장을 입력 받으세요.
- 두 번째 줄: 커서의 위치를 입력 받으세요.
- 세 번째 줄: 명령어 4개를 입력 받으세요.

## 3. 출력
- 명령어들을 수행하고 커서가 있는 위치를 출력해주세요.

## 4. 예제 입력
```
ABCDEF
2
RRLD
```

## 5. 예제 출력
```
3
```

## 6. 예제 입력

```
GHIJKL
4
LLLD
```

## 7. 예제 출력

```
1
```

## 8. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

struct Node {
	char data;
	Node* next;
};

Node* head, * last, * current;

void addNode(char data) {
	if (head == NULL) {
		head = new Node({ data });
		last = head;
		current = head;
		return;
	}

	last->next = new Node({ data });
	last = last->next;
}

void moveNode(int level, int limit) {
	if (level == limit) return;
	if (current->next == NULL) return;
	else current = current->next;
	moveNode(level + 1, limit);
}

void backNode(Node* p) {
	if (head == current) return;
	if (p->next == current) {
		current = p;
	}
	else {
		backNode(p->next);
	}
}

int main()
{
	string n, m;
	int idx;

	cin >> n >> idx >> m;

	for (int i = 0; i < n.size(); i++) {
		addNode(n[i]);
	}

	moveNode(0, idx);

	for (int i = 0; i < m.size(); i++) {
		if (m[i] == 'R') moveNode(0, 1);
		if (m[i] == 'L') backNode(head);
		if (m[i] == 'D') {
			if (current->next == NULL) continue;
			if (current->next->next == NULL) current->next = NULL;
			else current->next = current->next->next;
		}
	}

	int cnt = 0;
	for (Node* p = head; current != p; p = p->next) {
		cnt++;
	}

	cout << cnt;
}
```
