# Box Coloring #

## 1. 문제
![box](./image/box.png)

- 면이 6개인 상자가 있다.
- 이를 여러 가지 색으로 칠하려 하는데, 단 조건이 있다.
- 인접한 면에 같은 색깔을 칠하면 안 된다는 것이다.
- 여러 가지 색깔이 주어졌을 때, 그 색깔들로 조건을 만족하여 상자의 모든 면을 칠할 수 있는지 판별하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄: 색깔의 개수 N ( 1 <= N <= 1,000 )
- 둘째 줄: 색깔을 나타내는 N개의 숫자가 주어진다.
- 색깔은 양의 정수로 이루어져 있고, 1부터 N까지의 범위의 수이다.

## 3. 출력
- 조건을 만족하면서 상자를 칠할 수 있으면 “YES”, 아니면 “NO”를 출력한다.

## 4. 예제 입력
```
6
1 2 1 2 1 3
```

## 5. 예제 출력
```
NO
```

## 6. 예제 입력

```
6
1 2 3 4 5 6
```

## 7. 예제 출력

```
YES
```

## 8. 예제 입력

```
8
1 2 2 2 1 1 1 3
```

## 9. 예제 출력

```
NO
```

## 10. 코드

```c++
#include <stdio.h>

int main() {
  
  int size, box[6], count = 0, cnt = 0;
  
  
  scanf("%d", &size);
  int color[size];
  int colorN[size];
  
  for(int i = 0; i < size; i++) {
    scanf("%d", &color[i]);
    colorN[i] = 0;
  }
  
  for(int i = 0; i < size; i ++) {
    colorN[color[i] - 1] += 1;
  }
  
  
  
  for(int i = 0; i < size; i++) {
    if(colorN[i] > 0) {
      count++;
      if(colorN[i] > 1) {
        cnt++;
      }
    }
  }
  
  if (count > 5 || cnt > 2 || (cnt > 1 && count == 4) || (cnt > 0 && count == 5)) {
    printf("YES");
  } else {
    printf("NO");
  }
  
  return 0;
}
```
