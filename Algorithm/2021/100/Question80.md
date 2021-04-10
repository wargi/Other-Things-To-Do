# N 찍기

## 1. 문제

- 자연수 N이 주어졌을 때, 1부터 N까지 한 줄에 하나씩 출력하는 프로그램을 작성하시오.


## 2. 입력
- 첫째 줄에 100,000보다 작거나 같은 자연수 N이 주어진다.

## 3. 출력

- 첫째 줄부터 N번째 줄 까지 차례대로 출력한다.


## 4. 예제 입력
```
5
```

## 5. 예제 출력
```
1
2
3
4
5
```

## 6. 코드

```c++
#include<stdio.h>
#include<iostream>

using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    
    for(int i = 0; i < n; i++)
        printf("%d\n", i+1);
    
    return 0;
}
```



### #출처

[백준 온라인 저지](https://www.acmicpc.net/problem/2741)
