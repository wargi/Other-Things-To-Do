# 채널 선택

## 1. 문제

- 현재 채널에서 목표 채널로 이동할 수 있는 최소 버튼 클릭 회수를 출력해주세요.
- 리모콘에는 채널을 변경할 수 있는 4개의 버튼이 있습니다.
  1. 버튼1: /2
  2. 버튼2: x2
  3. 버튼3: +1
  4. 버튼4: -1
- 목표채널로 이동하기 위해서 최소 몇 번의 버튼을 눌러야 하는지 알려주는 프로그램을 BFS를 이용하여 작성 해 주세요.

```
Ex)
현재 3번 채널이고, 9번 채널로 이동하기 위해서는
버튼을 순서대로 [+1], [x2], [+1] 3번 누르면, 최소의 클릭 횟수로 목표 채널로 이동할 수 있습니다.
```

## 2. 입력
- 현재 채널과 목표 채널을 입력해주세요.

## 3. 출력

- 현재 채널에서 목표 채널까지 이동하는데 누르는 버튼의 최소 횟수를 출력해주세요.


## 4. 예제 입력
```
3
9
```

## 5. 예제 출력
```
3
```

## 6. 예제 입력

```
1 5
```

## 7. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    int value;
    int level;
};

int current, destination;

int bfs(int cur) {
    int head = 0, tail = 1;

    Node arr[1000] = { { cur, 0 }, };

    while (head != tail) {
        Node now = arr[head++];

        for (int t = 0; t < 4; t++) {
            int temp;
            if (t == 0) temp = now.value / 2;
            if (t == 1) temp = now.value * 2;
            if (t == 2) temp = now.value + 1;
            if (t == 3) temp = now.value - 1;
            
            if (temp == destination) return now.level + 1;
            arr[tail++] = { temp, now.level + 1 };
        }
    }
}

int main()
{
    cin >> current >> destination;

    cout << bfs(current);

    return 0;
}
```
