# A-B

## 1. 문제

- 두 정수 A와 B를 입력받은 다음, A-B를 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)

## 3. 출력

- 첫째 줄에 A-B를 출력한다.


## 4. 예제 입력
```
3 2
```

## 5. 예제 출력
```
1
```

## 6. 코드

```c++
#include<stdio.h>

void main()
{
  int a, b;
    
	scanf("%d %d",&a,&b);
	printf("%d",a-b);
  
  return 0;
}
```



### #출처

- [백준 온라인 저지](https://www.acmicpc.net/problem/1001)
