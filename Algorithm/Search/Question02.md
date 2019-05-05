# Number Box #

## 1. 문제
- 숫자박스에는 자연수들이 적혀있는 종이들이 N장 들어있다.
- 숫자 M개가 주어졌을 때, 이 숫자가 적혀있는 숫자가 상자 안에 있는지 아닌지를 구하는 프로그램을 작성하시오.  

## 2. 입력
- 첫째 줄: 윤성이가 가지고 있는 숫자 정보의 개수 N (1 ≤ N ≤ 300,000)
- 둘째 줄: 숫자 정보들이 주어진다.
- 숫자는 1,000,000이하의 정수이다.
- 두 숫자 카드에 같은 숫자가 적혀있는 경우는 없다.
- 셋째 줄: M (1 ≤ M ≤ 500,000)이 주어진다.
- 넷째 줄: 윤성이가 숫자 박스에 있는지 아닌지를 구해야 할 M개의 숫자가 주어지며, 이 숫자는 공백으로 구분되어져 있다.
- 이숫자도 1,000,000이하의 정수이다. 

## 3. 출력
- 첫째 줄에 입력으로 주어진 M개의 숫자에 대해서, 각 숫자가 숫자 상자안에 있으면 1, 아니면 0을 개행으로 구분해 출력한다.

## 4. 예제 입력
```
5
6 3 2 10 -10
8
10 9 -5 2 3 4 5 -10
```

## 5. 예제 출력
```
1
0
0
1
1
0
0
1
```

## 6. 코드

```c++
#include <stdio.h>

bool binarySearch(int arr[], int start, int end, int value) {
  if(start > end) return false;
  else if(start == end) {
    if(arr[start] == value) return true;
    return false;
  } else {
    int mid = (start + end) / 2;
    if(arr[mid] == value) return true;
    else if(arr[mid] > value) return binarySearch(arr,start,mid-1,value);
    else return binarySearch(arr,mid+1,end,value);
  }
}

int getLeft(int arr[], int s, int e, int pivot, int result[]) {
  int cnt = 0;
  for(int i = s; i <= e; i++) {
    if(arr[i] <= pivot) result[cnt++] = arr[i];
  }
  return cnt;
}

int getRight(int arr[], int s, int e, int pivot, int result[]) {
  int cnt = 0;
  for(int i = s; i <= e; i++) {
    if(arr[i] > pivot) result[cnt++] = arr[i];
  }
  return cnt;
}

void quickSort(int arr[], int start, int end) {
  if(start >= end) return;
  else {
    int left[300000], right[300000];
    int pivot = arr[start];
    
    int leftIdxCnt = getLeft(arr,start+1,end,pivot,left);
    int rightIdxCnt = getRight(arr,start+1,end,pivot,right);
    
    for(int i = 0; i < leftIdxCnt; i++) arr[i+start] = left[i];
    arr[start+leftIdxCnt] = pivot;
    for(int i = 0; i < rightIdxCnt; i++) arr[i+start+leftIdxCnt+1] = right[i];
    
    quickSort(arr,start,start+leftIdxCnt-1);
    quickSort(arr,start+leftIdxCnt+1,end);
  }
}

int main() {
  int n, m;
  int boxArr[300000], yoonArr[500000];
  
  scanf("%d", &n);
  for(int i = 0; i < n; i++) scanf("%d", &boxArr[i]);
  
  quickSort(boxArr,0,n-1);
  
  scanf("%d", &m);
  for(int i = 0; i < m; i++) scanf("%d", &yoonArr[i]);
  
  for(int i = 0; i < m; i++) {
    bool isHave = binarySearch(boxArr,0,n-1,yoonArr[i]);
    if (isHave) printf("1\n");
    else printf("0\n");
  }

  return 0;
}
```
