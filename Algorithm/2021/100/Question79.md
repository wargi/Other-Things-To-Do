# 구구단

## 1. 문제

- N을 입력받은 뒤, 구구단 N단을 출력하는 프로그램을 작성하시오. 출력 형식에 맞춰서 출력하면 된다.

## 2. 입력
- 첫째 줄에 N이 주어진다. N은 1보다 크거나 같고, 9보다 작거나 같다.

## 3. 출력

- 출력형식과 같게 N*1부터 N*9까지 출력한다.


## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18
```

## 6. 코드

```c++
#include<stdio.h>
#include<iostream>
using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    
    for(int i = 1; i < 10; i++) {
        printf("%d * %d = %d\n", n, i, n*i);
    }
    
    return 0;
}
```



### 출처

[백준 온라인 저지](https://www.acmicpc.net/problem/2739)
