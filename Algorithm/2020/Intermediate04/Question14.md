# 배열 합치기 #

## 1. 문제
- 아래의 규칙대로 배열을 합쳐 주세요.

  ```
  정렬되어 있는 1차원 배열(1x4)을 두 개 받습니다.
  
  ex)
  input1: 1 3 3 7
  input2: 2 3 4 6
  
  1. 인덱스를 비교하여 더 작은 값을 result 배열에 넣습니다.
  (1) 3 3 7
  (2) 3 4 6
  result = (1)
  
  1 (3) 3 7
  (2) 3 4 6
  result = 1 (2)
  
  2. 인덱스를 비교하여 같은 값 이면 둘 중 아무 배열의 값을 result 배열에 넣습니다.
  1 (3) 3 7
  2 (3) 4 6
  result = 1 2 (3)
  
  1 3 (3) 7
  2 (3) 4 6
  result = 1 2 3 (3)
  
  1 3 3 (7)
  2 (3) 4 6
  result = 1 2 3 3 (3)
  
  1 3 3 (7)
  2 3 (4) 6
  result = 1 2 3 3 3 (4)
  
  1 3 3 (7)
  2 3 4 (6)
  result = 1 2 3 3 3 4 (6)
  
  3. 한 쪽 인덱스를 모두 넣었다면 반대쪽 배열의 남은 값들 모두를 result 배열에 넣습니다.
  1 3 3 (7)
  2 3 4 6
  result = 1 2 3 3 3 4 6 (7)
  
  4. 이렇게 완성된 result 배열을 출력해주세요.
  ```
  

## 2. 입력
- 정렬되어 있는 1차원 배열(1x4)을 두 개 받습니다.

## 3. 출력
- 완성된 result 배열을 출력해주세요.

## 4. 예제 입력
```
1 3 5 7
2 4 6 8
```

## 5. 예제 출력
```
1 2 3 4 5 6 7 8
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int vect1[4], vect2[4];
    int result[8];
    
    for (int i = 0; i < 4; i++) {
        cin >> vect1[i];
    }

    for (int i = 0; i < 4; i++) {
        cin >> vect2[i];
    }

    int indexL = 0, indexR = 0;
    for (int i = 0; i < 8; i++) {
        if (indexL == 4) {
            result[i] = vect2[indexR++];
        }
        else if (indexR == 4) {
            result[i] = vect1[indexL++];
        }
        else {
            if (vect1[indexL] <= vect2[indexR]) {
                result[i] = vect1[indexL++];
            }
            else result[i] = vect2[indexR++];
        }
        cout << result[i] << " ";
    }
}
```
