# Tobin

## 1. 문제

- 두 정수 n, k를 입력받아 k개의 1을 가진 n자리 이진 패턴을 출력하는 프로그램을 작성하세요.

## 2. 입력
- 두 정수 n, k가 입력으로 주어진다. ( 0 < n <= 30, 0 <= k < 8 , n >= k ) 

## 3. 출력

- 결과를 내림차순으로 출력한다.


## 4. 예제 입력
```
2 1
```

## 5. 예제 출력
```
10
01
```

## 6. 예제 입력

```
2 0
```

## 7. 예제 출력

```
00
```

## 8. 예제 입력

```
4 2
```

## 9. 예제 출력

```
1100
1010
1001
0110
0101
0011
```

## 10. 코드

```c++
#include <stdio.h>

void getTobin(int d, int s, int max, int* arr, int sum) {
  if (sum > s) return;
  if (d < max) {
    arr[d] = 1;
    getTobin(d + 1, s,max,arr,sum+1);
    arr[d] = 0;
    getTobin(d + 1, s,max,arr,sum);
  } else if (d == max && sum == s) {
    for(int i = 0; i < max; i++) {
      printf("%d", arr[i]);
    }
    printf("\n");
  }
}

int main() {
  int d, s;
  scanf("%d %d", &d, &s);
  int arr[d];
  
  getTobin(0, s, d, arr, 0);

  return 0;
}
```
