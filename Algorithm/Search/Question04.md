# Two Solutions #

## 1. 문제
- KOI 부설 과학연구소에서는 많은 종류의 산성 용액과 알칼리성 용액을 보유하고 있다.
- 각 용액에는 그 용액의 특성을 나타내는 하나의 정수가 주어져있다.
- 산성 용액의 특성값은 1부터 1,000,000,000까지의 양의 정수로 나타내고, 알칼리성 용액의 특성값은 -1부터 -1,000,000,000까지의 음의 정수로 나타낸다.
- 같은 양의 두 용액을 혼합한 용액의 특성값은 혼합에 사용된 각 용액의 특성값의 합으로 정의한다.
- 이 연구소에서는 같은 양의 두 용액을 혼합하여 특성값이 0에 가장 가까운 용액을 만들려고 한다.
- 예를 들어, 주어진 용액들의 특성값이 [-2, 4, -99, -1, 98]인 경우에는 특성값이 -99인 용액과 특성값이 98인 용액을 혼합하면 특성값이 -1인 용액을 만들 수 있고, 이 용액이 특성값이 0에 가장 가까운 용액이다.
- 참고로, 두 종류의 알칼리성 용액만으로나 혹은 두 종류의 산성 용액만으로 특성값이 0에 가장 가까운 혼합 용액을 만드는 경우도 존재할 수 있다.
- 산성 용액과 알칼리성 용액의 특성값이 주어졌을 때, 이 중 두 개의 서로 다른 용액을 혼합하여 특성값이 0에 가장 가까운 용액을 만들어내는 두 용액을 찾는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄: 전체 용액의 수 N이 입력된다. ( 2 <= N <= 100,000 )
- 둘째 줄: 용액의 특성값을 나타내는 N개의 정수가 빈칸을 사이에 두고 주어진다. ( -1,000,000,000 <= 정수 <= 1,000,000,000 )
- N개의 용액들의 특성값은 모두 다르고, 산성 용액만으로나 알칼리성 용액만으로 입력이 주어지는 경우도 있을 수 있다. 

## 3. 출력
- 첫째 줄에 특성값이 0에 가장 가까운 용액을 만들어내는 두 용액의 특성값을 출력한다.
- 출력해야하는 두 용액은 특성값의 오름차순으로 출력한다.
- 특성값이 0에 가장 가까운 용액을 만들어내는 경우가 두 개 이상일 경우에는 특성값의 최솟값이 가장 작은 숫자를 출력한다.
- 해당 경우에서 특성값의 최솟값이 같은 경우는 없다고 가정한다.  

## 4. 예제 입력
```
5
-2 4 -99 1 98
```

## 5. 예제 출력
```
-99 98
```

## 6. 코드

```c++
#include <stdio.h>
#include <cmath>

void merging(int arr[], int s1, int e1, int s2, int e2) {
  int temp[100000];
  int idxCnt = 0;
  int p = s1, q = s2;
  
  while(p <= e1 && q <= e2) {
    if(arr[p] <= arr[q]) temp[idxCnt++] = arr[p++];
    else temp[idxCnt++] = arr[q++];
  }
  
  if(p > e1) {
    for(int i = q; i <= e2; i++) temp[idxCnt++] = arr[i];
  } else {
    for(int i = p; i <= e1; i++) temp[idxCnt++] = arr[i];
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

void binarySearch(int arr[], int start, int end, int bArr[], int value) {
  if(start >= end) return ;
  else {
    int temp;
    int v = arr[start] + arr[end];
    
    if(v < 0) temp = v * -1;
    else temp = v;
    
    if(temp < value) {
      bArr[0] = arr[start];
      bArr[1] = arr[end];
      value = temp;
    } else if(v == value && bArr[0] > start) {
      bArr[0] = arr[start];
      bArr[1] = arr[end];
      value = temp;
    }
    
    if(v <= 0) binarySearch(arr,start+1,end,bArr,value);
    else binarySearch(arr,start,end-1,bArr,value);
  }
}

int main() {
  int n;
  int numArr[100000];
  int bottle[2];
  bottle[0] = 2000000000;
  
  scanf("%d", &n);
  for(int i = 0; i < n; i++) scanf("%d", &numArr[i]);

  mergeSort(numArr,0,n-1);
  binarySearch(numArr,0,n-1,bottle,2000000000);
  
  for(int i = 0; i < 2; i++) printf("%d ", bottle[i]);
  
  return 0;
}
```
