# Number Count #

## 1. 문제
- n개의 숫자가 주어지고, q개의 질문이 주어진다.
- 각각의 질문은 n개의 숫자 중에서 특정 숫자가 몇개나 있는지를 묻는다.
- q개의 질문에 모두 답하는 프로그램을 작성하시오.

## 2. 입력
- 첫 번째 줄: 숫자의 개수 n, 그리고 질문의 개수 q가 주어진다 ( 1 ≤ n ≤ 100,000, 1 ≤ q ≤ 100,000)
- 두 번째 줄: n개의 숫자가 주어진다
- 세 번째 줄: q개의 질문이 주어진다.
- 주어지는 q개의 질문에 해당하는 숫자 범위는 100,000,000이하이다.  

## 3. 출력
- 각 질문에 대하여 숫자의 개수를 한 줄에 하나씩 출력한다. 

## 4. 예제 입력
```
10 4
1 3 4 3 2 3 1 2 5 10
1 3 9 10
```

## 5. 예제 출력
```
2
3
0
1
```

## 6. 코드

```c++
#include <stdio.h>

int binarySearch(int arr[], int start, int end, int value) {
  if(start > end) return start;
  else if(start == end) return start;
  else {
    int mid = (start+end) / 2;
    if(arr[mid] == value) return binarySearch(arr,start,mid-1,value);
    else if(arr[mid] > value) return binarySearch(arr,start,mid-1,value);
    else return binarySearch(arr,mid+1,end,value);
  }
}

void merging(int arr[], int s1, int e1, int s2, int e2) {
  int p = s1, q = s2;
  int temp[100000];
  int tempIdxCnt = 0;
  
  while(p <= e1 && q <= e2) {
    if(arr[p] <= arr[q]) temp[tempIdxCnt++] = arr[p++];
    else temp[tempIdxCnt++] = arr[q++];
  }
  
  if(p > e1) {
    for(int i = q; i <= e2; i++) temp[tempIdxCnt++] = arr[i];
  } else {
    for(int i = p; i <= e1; i++) temp[tempIdxCnt++] = arr[i];
  }
  
  for(int i = s1; i <= e2; i++) arr[i] = temp[i-s1];
}

void mergeSort(int arr[], int start, int end) {
  if(start >= end) return;
  else {
    int mid = (start + end) / 2;
    mergeSort(arr,start,mid); mergeSort(arr,mid+1,end);
    merging(arr,start,mid,mid+1,end);
  }
}

int main() {
  int n, m;
  scanf("%d %d", &n, &m);
  
  int qArr[100000], aArr[100000];
  
  for(int i = 0; i < n; i++) scanf("%d", &qArr[i]);
  for(int i = 0; i < m; i++) scanf("%d", &aArr[i]);
  
  mergeSort(qArr,0,n-1);
  
  for(int i = 0; i < m; i++) {
    int cnt = 0;
    int idx = binarySearch(qArr,0,n-1,aArr[i]);
    for(int j = idx; j < n; j++) {
      if(qArr[j] > aArr[i]) break;
      else if(qArr[j] == aArr[i]) cnt++;
    }
    printf("%d\n", cnt);
  }
  
  return 0;
}
```
