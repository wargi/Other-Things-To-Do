# 같은 숫자 제거

## 1. 문제
- 1차원 배열에 숫자를 입력받습니다.
- 입력받은 배열에 연속된 숫자 중에 같은 숫자가 3개가 나온다면 숫자를 제거합니다.
- 숫자를 제거하고, 정렬 후 출력하는 프로그램을 작성해주세요.

## 2. 입력
- 첫 줄에 받을 숫자의 개 수를 입력 받습니다.
- 다음 줄부터 입력 값들이 주어집니다.

## 3. 출력
- 숫자를 제거하고, 정렬 후 출력해주세요.

## 4. 예제 입력
```
17
5 4 5 1 1 1 1 1 2 2 2 3 3 3 3 8 1
```

## 5. 예제 출력
```
1 1 1 3 4 5 5 8
```

## 6. 코드
```c++
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

vector<int> arr;

int main()
{
    int size;
    int n, check = 0, index = 0;
    cin >> n;

    for (int i = 0; i < n; i++) {
        int num;
        cin >> num;

        arr.push_back(num);

        if (i > 0 && arr[index - 1] == arr[index]) check++;
        else check = 0;

        if (check == 2) {
            arr.pop_back();
            arr.pop_back();
            arr.pop_back();
            check = 0;
            index -= 3;
        }

        index++;
    }

    size = arr.size();
    
    sort(arr.begin(), arr.end());

    for (int i = 0; i < arr.size(); i++) cout << arr[i] << " ";
    
    return 0;
}
```
