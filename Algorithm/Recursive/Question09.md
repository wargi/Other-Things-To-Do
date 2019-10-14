# Good Seq

## 1. 문제

- 숫자 1, 2, 3으로만 이루어지는 수열이 있다.

- 임의의 길이의 인접한 두 개의 부분 수열이 동일한 것 이 있으면, 그 수열을 나쁜 수열이라고 부른다.

- 그렇지 않은 수열은 좋은 수열이다.

- 다음은 나쁜 수열의 예이다.

  **33**

  3**2121**323

  **123123**213

  다음은 좋은 수열의 예이다.

  2

  32

  32123

  1232123

- 길이가 N인 좋은 수열들을 N자리의 정수로 보아 그중 가장 작은 수를 나타내는 수열을 구하는 프로그램 을 작성하라.

- 예를 들면, 1213121과 2123212는 모두 좋은 수열이지만 그 중에서 작은 수를 나타내는 수 열 1213121이다.

## 2. 입력
- 입력은 숫자 N하나로 이루어진다. N은 1 이상 80 이하이다.

## 3. 출력

- 첫 번째 줄에 1, 2, 3으로만 이루어져 있는 길이가 N인 좋은 수열들 중에서 가장 작은 수를 나타내 는 수열만 출력한다.
- 수열을 이루는 1, 2, 3들 사이에는 빈칸을 두지 않는다.


## 4. 예제 입력
```
7
```

## 5. 예제 출력
```
1213121
```

## 6. 코드

```c++
#include <stdio.h>
#include <string.h>

int n;
int arr[100000];
bool isPrint = false;

bool goodseq(int size) {
  int start = size - 1, end = size;
  bool isSame = true;
  
  for(int i = 1; i <= size / 2; i++) {
    int left[100], right[100], count = 0;
    int leftValue = 0, rightValue = 0;
    
    for(int j = start - i; j < end - i; j++) {
      left[count++] = arr[j];
    }
    
    count = 0;
    
    for(int j = start; j < end; j++) {
      right[count++] = arr[j];
    }
    
    for(int j = 0; j < count; j++) {
      leftValue = (10 * leftValue)  + left[j];
      rightValue = (10 * rightValue) + right[j];
    }
    
    if(leftValue == rightValue) return false;
    start--;
  }
  return true;
}

void createGoodSeq(int idx) {
  if (n == idx) {
    isPrint = true;
    return;
  }
  
  for(int i = 1; i <= 3; i++) {
    arr[idx] = i;
    if(goodseq(idx+1)) {
      createGoodSeq(idx+1);
    }
    if (isPrint) return;
  }
}

int main() {
  
  scanf("%d", &n);
  
  arr[0] = 1;
  
  createGoodSeq(1);
  
  for(int i = 0; i < n; i++) printf("%d", arr[i]);

  return 0;
}
```
