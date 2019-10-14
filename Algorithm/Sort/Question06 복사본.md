# 합병정렬 구현하기

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

const int MAX = 100000;
int n, arr[MAX];

void merging(int s1, int e1, int s2, int e2) {
  int tempArr[MAX], temp_idx = 0, p = s1, q = s2;
  
  while(p <= e1 && q <= e2) {
    if(arr[p] <= arr[q]) tempArr[temp_idx++] = arr[p++];
    else tempArr[temp_idx++] = arr[q++];
  }
  
  if (q > e2) for(int i = p; i <= e1; i++) tempArr[temp_idx++] = arr[i];
  else for(int i = q; i <= e2; i++) tempArr[temp_idx++] = arr[i];
  
  for(int i = s1; i <= e2; i++) arr[i] = tempArr[i-s1];
}

void mergeSort(int start, int end) {
  if (start >= end) return;
  else {
    int mid = (start + end) / 2;
  
    mergeSort(start, mid); mergeSort(mid+1,end);
    merging(start,mid,mid+1,end);
  }
}

int main() {
  scanf("%d", &n);
  
  for(int i = 0; i < n; i++) scanf("%d", &arr[i]);
  
  mergeSort(0, n - 1);
  
  for(int i = 0; i < n; i++) printf("%d ", arr[i]);
  
  return 0;
}
```
