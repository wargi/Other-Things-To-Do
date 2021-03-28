# 2007년

## 1. 문제

- 오늘은 2007년 1월 1일 월요일이다.
- 그렇다면 2007년 x월 y일은 무슨 요일일까? 이를 알아내는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄에 빈 칸을 사이에 두고 x(1 ≤ x ≤ 12)와 y(1 ≤ y ≤ 31)이 주어진다.
- 참고로 2007년에는 1, 3, 5, 7, 8, 10, 12월은 31일까지, 4, 6, 9, 11월은 30일까지, 2월은 28일까지 있다.

## 3. 출력

- 첫째 줄에 x월 y일이 무슨 요일인지에 따라 SUN, MON, TUE, WED, THU, FRI, SAT중 하나를 출력한다.


## 4. 예제 입력
```
1 1
```

## 5. 예제 출력
```
MON
```

## 6. 예제 입력

```
3 14
```

## 7. 예제 출력

```
WED
```

## 8. 예제 입력

```
9 2
```

## 9. 예제 출력

```
SUN
```

## 10. 예제 입력

```
12 25
```

## 11. 예제 출력

```
TUE
```

## 12. 코드

```c++
#include<stdio.h>

int main() {
    int n, m, sum = 0;
    int arr[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    
    scanf("%d %d", &n, &m);

    for (int i = 0; i < n - 1; i++) {
        sum += arr[i];
    }

    sum = (sum + m) % 7;

    if (sum == 1) printf("MON");
    else if (sum == 2) printf("TUE");
    else if (sum == 3) printf("WED");
    else if (sum == 4) printf("THU");
    else if (sum == 5) printf("FRI");
    else if (sum == 6) printf("SAT");
    else printf("SUN");
}
```
