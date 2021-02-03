# 데이터 백업하기 #

## 1. 문제
- NxN의 데이터 저장장치가 있습니다.
- 데이터는 '#'으로 표시되며, (0,0)부터 차례로 데이터가 쌓입니다.
- 데이터 백업을 위해서 데이터가 어디까지 쓰여있는 확인할려고 합니다.
- 데이터를 찾는 조건이 있습니다.
- 입력은 O(N), Find속도는 O(2 log N)속도로 데이터를 검색해야 하며 마지막 '#' 데이터의 좌표를 출력해주세요.
  - Hint: BinarySearch를 이용하여 풀어주세요 !

## 2. 입력 

- 첫 줄: N을 입력받습니다.
- 다음 줄부터: 데이터가 기록된 NxN 배열을 입력받습니다.

## 3. 출력

- 마지막 데이터가 적혀 있는 위치를 좌표로 출력 해주세요.

## 4. 입력 예시

```
8
########
########
########
########
########
###00000
00000000
00000000
```

## 5. 출력 예시

```
5 2
```

## 6. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

int n;
vector<vector<char>> arr;

struct Node {
    int y, x;
};

int findCol(int row) {
    int s = 2, e = n - 2;

    while (1) {
        int mid = (s + e) / 2;

        if (arr[row][mid] == '#' && arr[row][mid + 1] == '0') {
            return mid;
        }

        if (arr[row][mid] == '#') s = mid + 1;
        else e = mid - 1;
    }
}

Node findCoordi() {
    int s = 1, e = n - 2;
    int row, col;

    while (1) {
        int mid = (s + e) / 2;

        if (arr[mid][0] == '#' && arr[mid + 1][0] == '0') {
            row = mid;
            break;
        }

        if (arr[mid][0] == '#') s = mid + 1;
        else e = mid - 1;
    }

    if (arr[row][1] == '0') return { row, 0 };
    else if (arr[row][n - 1] == '#') return { row, n - 1 };
    else return { row, findCol(row) };
}

Node find() {
    if (arr[0][0] == '0') return { 0, 0 };
    else if (arr[n - 1][n - 1] == '#') return { n - 1, n - 1 };
    else if (arr[n - 1][0] == '#') return { n - 1, findCol(n - 1) };
    else return findCoordi();
}

int main()
{
    cin >> n;

    for (int i = 0; i < n; i++) {
        vector<char> t;
        for (int j = 0; j < n; j++) {
            char ch;
            cin >> ch;

            t.push_back(ch);
        }
        t.push_back('\0');
        arr.push_back(t);
    }

    Node node = find();

    cout << node.y << " " << node.x;

    return 0;
}
```
