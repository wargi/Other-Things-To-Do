# 트리의 높이

## 1. 문제
- 트리의 높이는 루트로부터 가장 멀리 떨어진 노드와의 거리로 정의된다.
- 예를 들어, 아래의 트리에서 0번 노드가 루트라고 하면, 7번 노드까지의 거리가 가장 멀고, 그 거리는 3이다.
- 따라서 이 트리의 높이는 3이 된다.

![그림](./image/tree_height.png)

- 트리가 주어질 때, 그 트리의 높이를 출력하는 프로그램을 작성하시오.

## 2. 입력

- 첫 번째 줄에 트리의 노드 개수 n, 그리고 루트노드의 번호 r이 주어진다.
- ( 1 ≤ n ≤ 100, 0 ≤ r ≤ n - 1 )
- 두 번째 줄부터 트리의 간선 정보가 주어진다.
- 각 줄은 2개의 숫자 a, b로 이루어지며, 이는 a번 노드와 b번 노드가 연결되어 있다는 뜻이다.
- 각 노드의 번호는 0 ~ n-1까지 존재한다. 또한, 연결이 되지않은 노드는 없다. 

## 3. 출력
- 트리의 높이를 출력한다.

## 4. 예제 입력
```
8 0
0 1
0 2
1 3
1 4
1 5
2 6
6 7
```

## 5. 예제 출력
```
3
```

## 6. 코드

```c++
#include <stdio.h>

const int MAX = 10000;
int size, root;
int max = -2141245125;

struct Tree {
  int connect[1000];
  int count = 0;
  int height;
  int parent;
};

Tree t[1000];

void getTreetHeight(int n, int height) {
  if (t[n].count == 0) {
    return;
  }
  
  if(height > max) max = height;
  for(int i = 0; i < t[n].count; i++) {
    if (t[n].parent != t[n].connect[i]) {
      t[t[n].connect[i]].parent = n;
      getTreetHeight(t[n].connect[i], height + 1);
    }
  }
}

int main() {
  scanf("%d %d", &size, &root);
  
  for(int i = 0; i < size - 1; i++) {
    int left, right;
    scanf("%d %d", &left, &right);
    t[left].connect[t[left].count++] = right;
    t[right].connect[t[right].count++] = left;
  }
  if (size == 1) max = 0;
  else getTreetHeight(root, 0);
  
  printf("%d", max);
}
```
