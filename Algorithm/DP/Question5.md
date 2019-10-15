# 카드 놀이

## 1. 문제

- N개의 카드가 주어지고, 각각은 자연수의 점수를 가진다.
- 철수는 이제 이 카드를 가져감으로써 카드에 적혀있는 수 만큼의 점수를 얻는다.
- 단, 카드를 가져갈 때 한가지 규칙이 있는데, 이는 연속하여 3개의 카드는 가져갈 수 없다는 것이다.
- 예를 들어, 6개의 카드 “1 3 5 2 7 3”가 주어질 경우, 3+5+7+3 = 18 만큼의 점수를 얻는 것이 최대이다.
- N개의 카드가 주어질 때, 얻을 수 있는 점수의 최댓값을 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫 번째 줄에 N이 주어진다.
- ( 1 ≤ N ≤ 100,000 )
- 두 번째 줄에 N개의 숫자가 주어지며, 이는 각 카드의 점수를 나타낸다. 

## 3. 출력

- 얻을 수 있는 점수의 최댓값을 출력한다.


## 4. 예제 입력
```
6
1 3 5 2 7 3
```

## 5. 예제출력

```
18
```

## 6. 코드

```c++
#include <stdio.h>
#include <algorithm>
#include <vector>
using namespace std;

const int MAX = 1000000;
int arr[MAX];
int n, sum, t[MAX];

int card(int idx) {

}

int main() {
  scanf("%d", &n);
  for(int i = 0; i < n; i++) {
    scanf("%d", &arr[i]);
  }
  
  t[0] = arr[0];
  t[1] = arr[1] + arr[0];
  t[2] = max(t[1], arr[1] + arr[2]);
  t[2] = max(t[2], arr[0] + arr[2]);
  
  sum = 2;
  
  for(int i = 3; i < n; i ++) {
    t[i] = max(t[i-1], t[i-3] + arr[i] + arr[i-1]);
    t[i] = max(t[i], t[i-2] + arr[i]);
  }
  
  printf("%d", t[n-1]);
  
  return 0;
}
```
