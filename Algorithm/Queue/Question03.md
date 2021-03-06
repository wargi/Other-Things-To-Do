# Parentheses #

## 1. 문제
- 철수네 마을에는 갑자기 전염병이 유행하기 시작하였다.
- 이 전염병은 전염이 매우 강해서, 이웃한 마을끼리는 전염되는 것을 피할 수 없다.
- 철수네 마을은 1번부터 N번까지 번호가 매겨져 있다. 
- 철수네 마을의 구조는 꽤나 복잡한데, i번 마을에서 출발하면 i * 2 번 마을에 갈 수 있고, 또한 i / 3(i를 3으로 나눈 몫) 번째 마을에도 갈 수 있다.
- 전염병은 사람에 의하여 옮는 것으로 알려져 있다.
- 따라서 i번 마을에 전염병이 돌게 되면, i * 2 번 마을과 i / 3(i를 3으로 나눈 몫) 번 마을 역시 전염병이 돌게 된다.
- K번 마을이 가장 처음으로 전염병이 돌기 시작했을 때, 전염병이 돌지 않는 마을의 개수를 구하는 프로그램을 작성하시오.

## 2. 입력

- 첫째 줄에 전체 마을의 개수 N과, 처음으로 전염병이 돌기 시작한 마을 번호 K가 주어진다.
- ( 1 ≤ N, K ≤ 100,000 )  

## 3. 출력
- 전염병이 돌지 않는 마을의 개수를 출력한다.

## 4. 예제 입력
```
10 3
```

## 5. 예제 출력
```
4
```

## 6. 코드

```c++
#include <stdio.h>

const int MAX = 500000;

void queue(int arr[], int start, int size) {
  if (start >= size || arr[start] == 1) {
    return;
  } else if (start > 0) {
    arr[start] = 1;
    int mok = start / 3;
    
    queue(arr, start * 2, size);
    queue(arr, mok, size);
    return;
  }
}

int main() {
  int size, start, count = 0;
  int arr[MAX];
  
  scanf("%d %d", &size, &start);

  queue(arr, start, size + 1);
  
  for(int i = 1; i <= size; i++) {
    if (arr[i] == 0) {
      count++;
    }
  }
  
  printf("%d", count);

  return 0;
}
```
