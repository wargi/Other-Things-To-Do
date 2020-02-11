# 합병정렬 #

## 1. 문제
- n개의 정수가 주어질 때, 이를 합병정렬을 이용하여 오름차순으로 정렬하는 프로그램을 작성하시오.

## 2. 입력
- 첫 번째 줄에 n이 주어진다.
- ( 1 ≤ n ≤ 100,000 )
- 두번째 줄에 n개의 정수가 주어진다.

## 3. 출력
- 첫 번째 줄에 n개의 숫자를 합병정렬을 이용하여 오름차순으로 정렬한 결과를 출력한다.

## 4. 예제 입력
```
10
2 5 3 4 8 7 -1 9 10 2
```

## 5. 예제 출력
```
-1 2 2 3 4 5 7 8 9 10
```

## 6. 코드

```c++
#include <stdio.h>

int n;

int binarySearch(int arr[][2], int start, int end, long long int value) {
  if(start >= end) return end;
  else {
    int mid = (start + end) / 2;
    long long int sum = 0;
    for(int i = 0; i < n; i++) {
      if(arr[i][1] < mid) sum += arr[i][1] - arr[i][0] + 1;
      else if(arr[i][0] <= mid) sum += mid - arr[i][0] + 1;
    }
    if(sum == value) return mid;
    else if(sum > value) return binarySearch(arr,start,mid,value);
    else return binarySearch(arr,mid+1,end,value);
  }
}

int main() {
  int max = -1, min = 1000000001;
  long long int m;
  scanf("%d", &n);
  int arr[n][2];
  
  for(int i = 0; i < n; i++) {
    scanf("%d %d", &arr[i][0], &arr[i][1]);
    if(max < arr[i][1]) max = arr[i][1];
    if(min > arr[i][0]) min = arr[i][0];
  }
  
  scanf("%lld", &m);
  int k = binarySearch(arr,min,max,m+1);
  printf("%d", k);

  return 0;
}
```
