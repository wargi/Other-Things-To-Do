# Chebyshev Theorem

## 1. 문제

- 베르트랑-체비쇼프 정리는 임의의 자연수 n에 대하여, n보다 크고, 2n보다 작거나 같은 소수는 적어도 하나 존재한다는 내용을 담고 있다.
- 이 명제는 조제프 베르트랑(Joseph Louis François Bertrand, 1822–1900)이 1845년에 추측했고, 파프누티 체비쇼프(Пафнутий Львович Чебышёв, 1821–1894)가 1850년에 증명했다.
- 예를 들어, 10보다 크고, 20보다 작거나 같은 소수는 4개가 있다. (11, 13, 17, 19) 또, 14보다 크고, 28보다 작거나 같은 소수는 3개가 있다. (17, 19, 23)
- n이 주어졌을 때, n보다 크고, 2n보다 작거나 같은 소수의 개수를 구하는 프로그램을 작성하시오.  

## 2. 입력
- 입력은 여러 개의 테스트 케이스로 이루어져 있다.
- 각 케이스는 n을 포함하며, 한 줄로 이루어져 있다. (n ≤ 123,456)
- 입력의 마지막에는 0이 주어진다.

## 3. 출력

- 각 테스트 케이스에 대해서, n보다 크고, 2n보다 작거나 같은 소수의 개수를 출력한다.


## 4. 예제 입력
```
1
10
13
100
1000
10000
100000
0
```

## 5. 예제 출력
```
1
4
3
21
135
1033
8392
```

## 6. 코드

```c++
#include <stdio.h>

int main() {
  int num, cnt = 0, max = -1, n = 1;
  int arr[10000], sosu[220000];

  while(true) {
    scanf("%d", &num);
    if(num == 0) break;
    if(max < num) max = num;
    arr[cnt] = num;
    cnt++;
  }
  sosu[0] = 2;
  for(int i = 2; i <= 123456*2; i++) {
    
    int count = 0;
    for(int j = 0; j < n; j++) {
      if(i % sosu[j] != 0) count++;
      else break;
    }
    if(count == n) {
      sosu[n] = i;
      n++;
    }
  }
  
  for(int i = 0; i < cnt; i++) {
    int count = 0;
    if(arr[i] == 0) break;
    for(int j = 0; j < n; j++) {
      if (arr[i] < sosu[j] && arr[i] * 2 >= sosu[j]) count++;
      else if(arr[i] * 2 < sosu[j]) break;
    }
    printf("%d\n", count);
  }
    
  return 0;
}
```
