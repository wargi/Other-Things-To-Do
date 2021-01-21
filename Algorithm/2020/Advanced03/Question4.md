# 삽입 정렬 #

## 1. 문제

- 숫자와 문자가 한 쌍인 n개의 구조체배열에 입력받고, 우선 순위에 맞춰 삽입 정렬로 정렬 후 출력해주세요.
- [우선 순위]

1. 작은 숫자가 더 앞에 위치합니다(오름차순)
2. 같은 숫자라면, 더 작은 문자가 앞에 배치됩니다.

```
[정렬 전]
4T 4F 5E 5F 4A 1C

[정렬 후]
1C 4A 4F 4T 5E 5F
```

## 2. 입력
- 숫자와 문자가 한 쌍인 n개의 구조체배열에 입력받습니다. (1 <= n <= 100)

## 3. 출력

- 삽입 정렬로 정렬 후 출력해주세요.

## 4. 예제 입력

```
6
4 T
4 F
5 E
5 F
5 A
1 C
```

## 5. 예제 출력
```
1 C
4 F
4 T
5 A
5 E
5 F
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

struct Node {
    int x;
    char ch;
};

int compare(Node a, Node b) {
    if (a.x > b.x) return 1;
    if (a.x == b.x && a.ch > b.ch) return 1;
    return 0;
}

int main()
{
    int n;
    cin >> n;

    Node* result = new Node[n];
    Node* nodes = new Node[n];

    for (int i = 0; i < n; i++) cin >> nodes[i].x >> nodes[i].ch;

    for (int i = 0; i < n; i++) {
        result[i] = nodes[i];

        for (int j = i; j > 0; j--) {
            if (compare(result[j - 1], result[j])) swap(result[j - 1], result[j]);
            else break;
        }
    }

    for (int i = 0; i < n; i++) cout << result[i].x << " " << result[i].ch << "\n";

    return 0;
}
```
