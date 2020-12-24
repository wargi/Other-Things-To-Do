# 구조체 정렬하기 #

## 1. 문제
- 문자와 숫자로 구성된 값을 n개 입력 받습니다.
- 입력받은 값을 구조체에 넣고, 아래의 조건으로 정렬해주세요.
- 정렬 우선순위
  1. 문자 우선(사전순으로 오름차순)
  2. 같은 문자일시, 숫자를 기준하여 정렬(내림차순)

## 2. 입력
-  첫 줄: 입력 받을 값의 갯수 n
-  다음 줄부터: 한 줄에 문자, 숫자를 입력받습니다.

## 3. 출력
- 입력받은 문자, 숫자를 정렬하여 출력해주세요.

## 4. 예제 입력
```
5
A 3
G 9
H 2
C 1
A 10
```

## 5. 예제 출력

```
A 3
A 10
C 1
G 9
H 2
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    char ch;
    int x;
};

int main()
{
    int n;
    cin >> n;
    Node* nodes = new Node[n];

    for (int i = 0; i < n; i++) {
        char ch;
        int x;
        cin >> ch >> x;

        nodes[i].ch = ch;
        nodes[i].x = x;
    }

    for (int i = 0; i < n - 1; i++) {
        int index;
        for (int j = i + 1; j < n; j++) {
            if (nodes[i].ch > nodes[j].ch) {
                Node temp = nodes[i];
                nodes[i] = nodes[j];
                nodes[j] = temp;
            }
            else if (nodes[i].ch == nodes[j].ch && nodes[i].x > nodes[j].x) {

                Node temp = nodes[i];
                nodes[i] = nodes[j];
                nodes[j] = temp;
            }
        }
    }

    for (int i = 0; i < n; i++) {
        cout << nodes[i].ch << " " << nodes[i].x << "\n";
    }

    return 0;
}
```