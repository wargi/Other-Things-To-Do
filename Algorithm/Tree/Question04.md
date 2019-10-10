# 트리에서의 거리

## 1. 문제
- 트리가 주어지고, 두 노드 X, Y가 주어질 때, 이 두 노드 사이의 거리를 출력하는 프로그램을 작성하시오.
- 트리에서는 두 노드를 잇는 경로가 유일하기 때문에, 정답은 항상 유일하다는 것을 참고한다.
- 예를 들어, 다음과 같은 트리에서 노드 3, 노드 6 사이의 거리는 4이다.

![그림](./image/tree_distance2.png)

## 2. 입력

- 첫 번째 줄에 트리의 노드 개수 n, 두 노드 X, Y의 번호가 주어진다.
- ( 0 ≤ X, Y ≤ n < 1000 )
- 두 번째 줄부터 트리의 간선 정보가 주어진다.
- 각 줄은 2개의 숫자 a, b로 이루어지며, 이는 노드 a가 노드 b의 부모노드라는 것을 의미한다.
- 루트는 노드 0이라고 가정한다.  

## 3. 출력
- 두 노드 X, Y 사이의 거리를 출력한다.

## 4. 예제 입력
```
11 3 6
0 1
0 2
1 3
1 4
1 5
2 6
2 10
6 7
6 8
6 9
```

## 5. 예제 출력
```
4
```

## 6. 코드

```c++
#include <stdio.h>

const int MAX = 10000;

struct Tree {
  int parent;
  int height;
};

Tree t[MAX];

int main() {
  int size, left, right, count = 0;
  scanf("%d %d %d", &size, &left, &right);
  
  for(int i = 0; i < size; i++) {
    int parent, value;
    
    if (i == 0) { t[0].height = 0; }
    else {
      scanf("%d %d", &parent, &value);
      t[value].height = t[parent].height + 1;
      t[value].parent = parent;
    }
  }
  
  if (left == 0) {
    printf("%d", t[right].height);
    return 0;
  } else if(right == 0) {
    printf("%d", t[left].height);
    return 0;
  }
  
  while (t[left].parent != t[right].parent) {
    if (t[left].height == t[right].height) {
      left = t[left].parent; right = t[right].parent;
      count += 2;
    } else if(t[left].height > t[right].height) {
      left = t[left].parent;
      count ++;
    } else {
      right = t[right].parent;
      count ++;
    }
  }
  
  if (left == right) printf("%d", count);
  else printf("%d", count + 2);  
}
```
