# 3차원 배열 5

## 1. 문제

```
아래의 3차원 배열(4x5x3)을 하드코딩 해주세요.
 # 
# #
###
# #
# #

###
# #
###
# #
###

###
# #
#  
# #
###

## 
# #
# #
# #
## 
```

- 숫자를 한 개 입력받고, 위의 3차원 배열중에 해당하는 index의 2차원 배열을 출력해주세요.

## 2. 입력
- 숫자를 한 개 입력받아주세요.

## 3. 출력

- 위의 3차원 배열중에 해당하는 index의 2차원 배열을 출력해주세요.


## 4. 예제 입력
```
1
```

## 5. 예제 출력
```
###
# #
###
# #
###
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char map[4][5][4] = {
        {
            " # ",
            "# #",
            "###",
            "# #",
            "# #",
        },
        {
            "###",
            "# #",
            "###",
            "# #",
            "###",
        },
        {
            "###",
            "# #",
            "#  ",
            "# #",
            "###",
        },
        {
            "## ",
            "# #",
            "# #",
            "# #",
            "## ",
        }
    };
    
    int n;
    cin >> n;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            cout << map[n][i][j];
        }
        cout << "\n";
    }
}
```
