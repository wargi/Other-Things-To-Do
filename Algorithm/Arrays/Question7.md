# Number Pyramid #

## 1. 문제
- N과 시작 숫자 S가 주어지면 숫자 피라미드를 만드는 프로그램을 작성하시오.

## 2. 입력
- 입력의 첫 번째 줄에 N과 시작 숫자 S가 주어진다. ( 1 ≤ N ≤ 100, 1 ≤ S ≤ 9 )

## 3. 출력
- 첫 번째 줄부터 숫자 피라미드를 출력한다.

## 4. 예제 입력
```
5 3
```

## 5. 예제 출력
```
    3
   456
  21987
 3456789
987654321
```

## 6. 코드
```c++
#include <stdio.h>

int main() {
  int n, s, l;
  scanf("%d %d", &n, &s);
  
  int numArr[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  s -= 1;
  
  //Please Enter Your Code Here
  for(int i = 0; i < n; i++) {
    if(i % 2 == 0 && i > 0) {
      s = s + (i * 2);
      s = s % 9;
      l = s;
    }
    if(i % 2 == 1 && i > 2) s = l + 1;
    for(int j = 0; j < n + i; j++) {
      if(j >= n - i - 1) {
        printf("%d", numArr[s]);
        if(i % 2 == 0 && i != 0) {
          s--;
        } else {
          s++;
        }
      } else {
        printf(" ");
      }
      if (s == -1) {
        s = 8;
      } else if (s == 9) {
        s = 0;
      }
    }
    printf("\n");
  }

  return 0;
}
```
