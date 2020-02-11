# Merge Sort #

## 1. 개념
- 하나의 리스트를 정렬하기 위해서 해당 리스트를 n개의 서브리스트로 분할하여 각각을 정렬한 수, 정렬된 n개의 서브리스트로 합병시켜서 정렬시키는 방법.

## 2. 동작 과정
- 합병 정렬은 다음과 같이 작동한다.
  1. 리스트의 길이가 0 또는 1이면 이미 정렬된 것으로 본다. 그렇지 않은 경우에는
  2. 정렬되지 않은 리스트를 절반으로 잘라 비슷한 크기의 두 부분 리스트로 나눈다.
  3. 각 부분 리스트를 [재귀](https://ko.wikipedia.org/wiki/재귀함수)적으로 합병 정렬을 이용해 정렬한다.
  4. 두 부분 리스트를 다시 하나의 정렬된 리스트로 [합병](https://ko.wikipedia.org/w/index.php?title=합병_알고리즘&action=edit&redlink=1)한다.

## 3. 코드
```c++
#include <stdio.h>

// 나눈 배열을 합쳐주는 함수
// 나눈 배열 두개를 받는다(s1 -> e1 | s2 -> e2)
void merging(int arr[], int s1, int e1, int s2, int e2) {
  // 임시로 저장할 배열을 생성
  int temp[1000000];
  // 임시 배열의 인덱스 카운트를 생성
  int temp_idx = 0;
  // 서로의 값을 비교할 값을 저장한다.
  int p = s1, q = s2;
  
  // 서로의 값을 비교(p = q)하다가 한개의 값이 끝 값(e1, e2)을 넘어 갈 때 종료.
  while(p <= e1 && q <= e2) {
    // arr[p]가 arr[q]보다 작거나 같다면 temp에 arr[p]값을 넣어주고 p++
    if(arr[p] <= arr[q]) temp[temp_idx++] = arr[p++];
    // arr[q]가 arr[p] 작다면 temp에 arr[q]값을 넣어주고 q++
    else temp[temp_idx++] = arr[q++];
  }
  
  // p, q 중에 한가지를 모두에 템프에 넣었을 때
  // 이제 비교하지않고 남은 내용을 넣으면 되기에
  // p, q 중 끝나지 않은 부분을 템프에 넣준다.
  // p가 e1보다 크면 p가 끝났는지 확인하고 끝났다면 q의 남은 배열을 temp에 넣어준다.
  // 아니라면 p가 끝나지 않았기 때문에 temp에 p의 남은 배열을 넘겨준다.
  if(p > e1) {
    for(int i = q; i <= e2; i++)
      temp[temp_idx++] = arr[i];
  } else {
    for(int i = p; i <= e1; i++)
      temp[temp_idx++] = arr[i];
  }
  
  // temp에 arr의 인자값들이 정렬되어 들어갔기 때문에 그 값을 다시 arr에 넣어준다.
  // arr에 s1부터 넣는 이유는 가지고 올 때 s1부터 가지고 왔기 때문에 하지만 temp는 0부터
  // 들어가 있기 때문에 i - s1을 해서 0~e2 까지 값을 넣어준다.
  for(int i = s1; i <= e2; i++) 
    arr[i] = temp[i-s1] ;
  
}

// merge sort func
void mergeSort(int arr[], int start, int end) {
  //기저 조건: 시작 인덱스와 끝나는 인덱스가 같을때 리턴(start == end)
  if(start >= end) return;
  // 아닐 경우 아직 인덱스가 2개 이상 있기 때문에 배열을 나눠 준다.
  else {
    // 배열을 나눠 주기 위해 mid값을 구한다.
    int mid = (start + end) / 2;
    // 배열을 두개로 나눠 보내준다.
    mergeSort(arr,start,mid); mergeSort(arr,mid+1,end);
    // 나눈 배열을 합쳐준다.
    merging(arr,start,mid,mid+1,end);
  }
}

int main() {
  int n;
  int numArr[100000];
  
  // 받아 올 배열의 크기를 설정  
  scanf("%d", &n);
  
  // 배열의 값을 입력
  for(int i = 0; i < n; i++)
    scanf("%d", &numArr[i]);
  
  // 정렬한 배열을 넣고, 시작 인덱스와, 끝나는 인덱스를 넣어준다.
  mergeSort(numArr, 0, n-1);
  
  // 정렬된 배열을 출력
  for(int i = 0; i < n; i++)
    printf("%d ", numArr[i]);
  
  return 0;
}
```

## 4. 시간 복잡도

-  Θ (n log n) 
