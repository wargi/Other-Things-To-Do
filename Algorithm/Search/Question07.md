# NN Table #

## 1. 문제
- 알랩이는 구구단표처럼 NN단표를 만들었다고 한다.
- NN단표는 2차원 배열의 모양으로 곱셈 1단부터 N단까지의 값들을 적어놓은 형태이다.
- NN단표의 배열을 A라고 했을 때, 배열의 들어가는 수 A[i][j]=i*j이다.(즉, 4행 7열에는 28, 7행 5열에는 35가 들어가 있다.)
- 알랩이는 N단까지 나온 숫자들 중에서 K번째로 작은 수를 찾고 싶어한다.
- 이때, 중복되는 여러 수들을 고려한다. 즉 N*N개의 모든 수들 중에서 K번째 수를 구하는 것이다.  

## 2. 입력
- 첫째 줄: 배열의 크기 N이 주어진다. (N <= 100,000)
- 둘째 줄: K가 주어진다. (K <= N*N)

## 3. 출력
- K번째 원소를 출력한다.

## 4. 예제 입력
```
3
7
```

## 5. 예제 출력
```
6
```

## 6. 코드

```c++
#include <stdio.h>

long long int binarySearch(long long int start, long long int end, long long int value, long long int n) {
  if(start >= end) return end;
  else {
    long long int mid = (start + end) / 2;
    long long int sum = 0;
    
    for(int i = 1; i <= n; i++) {
      if((mid / i) >= n) sum += n;
      else sum += (mid / i);
    }
    if(value <= sum) return binarySearch(start,mid,value,n);
    else return binarySearch(mid+1,end,value,n);
  }
}

int main() {
  long long int n, m;
  scanf("%lld %lld", &n, &m);
  
  long long int k = binarySearch(1,n*n,m,n);
  
  
  printf("%lld", k);
  
  return 0;
}
```
