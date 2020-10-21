# 구조체 익혀보기 2

## 1. 문제
```c++
//아래의 코드를 하드 코딩해주세요.
struct Train {
    int win;
    char name[10];
}

Train trains[7] = {
  {15, "summer"},
  {33, "cloe"},
  {24, "summer"},
  {28, "niki"},
  {32, "jenny"},
  {20, "summer"},
  {40, "coco"}
};
```

- 이름(name)과 나이(win)를 입력받고, 몇 번째에 있는지 인덱스를 출력해주세요.

## 2. 입력
- 이름(name)과 나이(win)를 입력받아주세요.

## 3. 출력
-  입력 받은 값이 몇 번째에 있는지 인덱스를 출력해주세요.

## 4. 예제 입력
```
cloe
33
```

## 5. 예제 출력
```
1
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

struct Train {
    int win;
    char name[10];

    int size() {
        return strlen(name);
    }
};

int main()
{
    int age;
    char name[8];

    cin >> name >> age;

    Train trains[7] = {
        {15, "summer"},
        {33, "cloe"},
        {24, "summer"},
        {28, "niki"},
        {32, "jenny"},
        {20, "summer"},
        {40, "coco"}
    };

    for (int i = 0; i < 7; i++) {
        if (trains[i].size() == strlen(name) && trains[i].win == age) {
            int flag = 1;
            for (int j = 0; j < trains[j].size(); j++) {
                if (trains[i].name[j] != name[j]) {
                    flag = 0;
                    break;
                }
            }
            if (flag) {
                cout << i;
                break;
            }
        }
    }
}
```
