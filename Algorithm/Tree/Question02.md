# 공통 조상 찾기

## 1. 문제
- 트리의 노드 X에 대하여 “조상"을 정의할 수 있다.
- X의 “조상"이란, 루트까지 올라가는 중에 만나는 모든 노드를 말한다.
- 예를 들어, 아래와 같이 트리가 주어질 경우, 노드 8의 “조상"은 노드 0, 노드 2, 노드 6이 된다.

![그림](./image/tree_distance.png)

- 두 노드 X, Y의 공통 조상이란, X와 Y가 공통으로 갖는 조상을 말한다.
- 예를 들어, 노드 7과 노드 10의 공통조상은 노드 2, 노드 0이 된다.
- 가장 가까운 공통 조상이란, X와 Y가 공통으로 갖는 조상들 중에서 X, Y와 가장 가까운 조상을 말한다.
- 예를 들어, 노드 7과 노드 10의 가장 가까운 공통 조상은 노드 2가 된다.
- 트리가 주어지고, 두 노드 X, Y가 주어질 때, 가장 가까운 공통 조상을 찾는 프로그램을 작성하시오.

## 2. 입력

- 첫 번째 줄에 트리의 노드 개수 n, 두 노드 X, Y의 번호가 주어진다.
- ( 1 ≤ X, Y ≤ n ≤ 1000 )
- 두 번째 줄부터 트리의 간선 정보가 주어진다.
- 각 줄은 2개의 숫자 a, b로 이루어지며, 이는 노드 a가 노드 b의 부모노드라는 것을 의미한다.
- 루트는 노드 0이라고 가정한다.  

## 3. 출력
- 두 노드 X, Y의 공통 조상을 출력한다.

## 4. 예제 입력
```
11 7 10
0 1
0 2
1 3
1 4
1 5
2 6
2 10
6 7
6 8
6 9
```

## 5. 예제 출력
```
2
```

## 6. 코드

```c++
#include <stdio.h>

const int MAX = 5000;

int par[1111];
int height[1111];

int findh(int n){
  int ret=0;
  while(n!=par[n]){
    n=par[n];
    ret++;
  }
  return ret;
}

int main(){
  int n, x, y;
  scanf("%d %d %d",&n,&x,&y);
  for(int i=0;i<n-1;i++){
    int a,b;
    scanf("%d %d",&a,&b);
    par[b]=a;
  }
  par[0]=0;
  for(int i=0;i<n;i++){
    height[i] = findh(i);
  }
  
  if(height[x]>height[y]){
    while(height[x]!=height[y]){
      x=par[x];
    }
  }
  else if(height[y]>height[x]){
    while(height[x]!=height[y]){
      y=par[y];
    }
  }
  
  while(x!=y){
    x=par[x];
    y=par[y];
  }
  printf("%d",x);
}
```
