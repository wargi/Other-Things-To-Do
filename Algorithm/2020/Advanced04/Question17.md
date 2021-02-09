# 3000

## 1. 문제
- 숫자카드 4개를 입력 받고, 숫자 카드를 재귀호출을 이용하여 조합해주세요.
- 조합한 숫자가 3000이 넘는 경우가 총 몇개인지 출력 해주세요.

## 2. 입력
- 숫자 4개를 입력 하세요.

## 3. 출력
-  경우의 수가 몇 가지가 있는지 출력하세요.

## 4. 예제 입력
```
2 5 1 6
```

## 5. 예제 출력
```
12
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int cnt = 0;
int arr[4], check[4] = { 0 };

void dfs(int level, int sum) {
    if (level == 4) {
        if (sum > 3000) cnt++;
        return;
    }


    for (int i = 0; i < 4; i++) {
        if(!check[i]) {
            check[i] = 1;
            dfs(level + 1, sum * 10 + arr[i]);
            check[i] = 0;
        }
        
    }
}

int main()
{
    for (int i = 0; i < 4; i++) cin >> arr[i];

    dfs(0, 0);

    cout << cnt;

    return 0;
}
```
