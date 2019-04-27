# Find The Kth Largest Number #

## 1. 문제
- N개의 자연수가 주어질 때, 이 자연수들 중에서 k번째로 큰 수를 찾는 프로그램을 작성하시오.
- 만약 k=1 이라면, 가장 큰 수를 찾으면 된다.

## 2. 입력
- 첫째 줄: 자연수 N, k가 주어진다. (1 ≤ N ≤ 100,000, 1 ≤ k ≤ 10) 
- 둘째 줄: N개의 자연수가 주어진다.

## 3. 출력
- 첫 번째 줄에 k번째 수를 출력한다.

## 4. 예제 입력
```
10 3
1 5 2 3 8 4 7 3 2 10
```

## 5. 예제 출력
```
7
```

## 6. 예제 입력

```
5 4
5 5 1 2 3
```

## 7. 예제 출력

```
2
```

## 8. 코드

```c++
#include <stdio.h>

int main() {
  int size, k, idx, temp;
  scanf("%d %d", &size, &k);
  int numArr[size];
  
  for(int i = 0; i < size; i++) {
    scanf("%d", &numArr[i]);
  }
  
  for(int i = 0; i < k; i++) {
    idx = i;
    for(int j = i + 1; j < size; j++) {
      if(numArr[idx] < numArr[j]) {
        idx = j;
      }
    }
    temp = numArr[idx];
    numArr[idx] = numArr[i];
    numArr[i] = temp;
  }
  
  printf("%d", numArr[k - 1]);

  return 0;
}
```
