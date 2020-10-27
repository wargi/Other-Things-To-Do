# 햄버거 주문하기 #

## 1. 문제
- 아래의 구조체를 만들어주세요.

  ```
  구조체명: MC
  멤버 변수
  burger1(char[9])
  burger2(char[9])
  
  MC bob, tom을 만들어주세요 :)
  ```
  
- 네 개의 문장을 입력 받습니다.

- bob부터 입력받고, 그 다음 tom을 입력받습니다.

## 2. 입력
- 문장 네 개를 입력 받아 주세요.

## 3. 출력
- 입력 받은 문장의 글자의 length를 출력해주세요.

## 4. 예제 입력
```
sanghai
bulgogi
1955
bigmac
```

## 5. 예제 출력
```
bob.burger1=7
bob.burger2=7
tom.burger1=4
tom.burger2=6
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

struct MC {
    char burger1[9];
    char burger2[9];
};

int main()
{
    MC bob, tom;
    cin >> bob.burger1 >> bob.burger2;
    cin >> tom.burger1 >> tom.burger2;

    cout << "bob.burger1=" << strlen(bob.burger1) << "\n";
    cout << "bob.burger2=" << strlen(bob.burger2) << "\n";
    cout << "tom.burger1=" << strlen(tom.burger1) << "\n";
    cout << "tom.burger2=" << strlen(tom.burger2);
}
```
