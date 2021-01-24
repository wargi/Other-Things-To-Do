# 농작물 피해 #

## 1. 문제
- 2차원 배열(3x3)에 농작물이 자라고 있습니다.
- 어느날 갑자기 태풍이 불어 농작물들이 피해를 입었습니다.
- 태풍이 한번 불면, 가장 위에 작물만, 태풍의 세기만큼 내구도 깍입니다.
- 만약, 태풍의 세기가 가장 위에 있는 농작물의 내구도보다 크다면, 맨 위의 농작물은 사라집니다.
- 태풍이 모두 끝나고 최종 남은 농작물의 개 수를 출력하는 프로그램을 작성해주세요.

```
ex)
input)
4 // 입력 좌표 수
0 0 852
0 2 51
1 1 5
2 0 3
2 // 태풍 횟수
4 2 // 태풍의 세기 

[태풍전 배열의 상태]
[8, 5, 2], [], [5, 1],
[], [5], [],
[3], [], []

[처음 태풍 후 상태(세기: 4)]
[8, 5], [], [5],
[], [1], [],
[], [], []

[마지막 태풍 후 최종 상태(세기: 2)]
[8, 3], [], [3],
[], [], [],
[], [], []

* 농작물이 총 3개 남았으므로 3을 출력한다.

output: 3
```

## 2. 입력
- 첫 줄: 농작물이 심어져 있는 좌표의 수 n개를 입력받는다.
- n개의 줄: 좌표를 입력받고, 해당 좌표의 농작물들을 입력받는다.
- n개의 줄 다음: 태풍의 횟 수를 입력받는다.
- 마지막 줄: 태풍들의 세기를 입력받는다.

## 3. 출력

- 태풍이 모두 끝나고 최종 남은 농작물의 개 수를 출력해주세요.

## 4. 예제 입력
```
4
0 0 852
0 2 51
1 1 5
2 0 3
2
4 2
```

## 5. 예제 출력

```
3
```

## 6. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

struct Node {
    vector<int> val;
};

int main() {
    Node arr[3][3];

    int n;
    cin >> n;

    for(int i = 0; i < n; i++) {
        int y, x;
        string num;
        cin >> y >> x >> num;

        int size = num.length();
        for (int i = 0; i < size; i++)
        {
            arr[y][x].val.push_back(num[i] - '0');
        }
    }

    int m;
    cin >> m;

    for(int i = 0; i < m; i++) {
        int wind;
        cin >> wind;

        for(int j = 0; j < 3; j++) {
            for(int k = 0; k < 3; k++) {
                int size = arr[j][k].val.size();

                if(size == 0) continue;

                if((arr[j][k].val[size-1] - wind) > 0) arr[j][k].val[size-1] -= wind;
                else arr[j][k].val.pop_back();
            }
        }
    }

    int cnt = 0;
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++) {
            int size = arr[i][j].val.size();
            if (size == 0) continue;
            cnt += size;
        }
    }

    cout << cnt;

    return 0;
}
```
