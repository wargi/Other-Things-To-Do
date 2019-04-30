# Sort Strings

## 1. 문제

- n개의 문자열이 주어질 때, 이 문자열을 사전순으로 빠른 순서대로 정렬하는 프로그램을 작성하시오. 

## 2. 입력
- 첫 번째 줄: 문자열의 개수 n이 주어진다 ( 1 ≤ n ≤ 100 )
- 그 후 n개의 줄에 대하여 정렬하고자 하는 문자열이 주어진다 ( 1 ≤ 문자열의 길이 ≤ 100 )  

## 3. 출력

- 문자열을 사전순으로 빠른 순서대로 정렬한 결과를 출력한다.


## 4. 예제 입력
```
9
acid
apple
banana
acquire
cat
crop
crab
power
cat
```

## 5. 예제 출력
```
acid
acquire
apple
banana
cat
cat
crab
crop
power
```

## 6. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {
  int size;
  scanf("%d", &size);
  char arr[size][100];
  
  for(int i = 0; i < size; i++) {
    scanf("%s", arr[i]);
  }

  for(int i = 0; i < size; i++) {
    for(int j = i + 1; j < size; j++) {
      if(strcmp(arr[i],arr[j]) > 0) {
        char temp[100];
        strcpy(temp, arr[i]);
        strcpy(arr[i], arr[j]);
        strcpy(arr[j], temp);
      }
    }
  }
  
  for(int i = 0; i < size; i++) {
    printf("%s\n", arr[i]);
  }
  
  return 0;
}
```
