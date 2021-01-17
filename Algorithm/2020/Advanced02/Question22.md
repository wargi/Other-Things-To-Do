# 메모리 사용량 구하기

## 1. 문제

- 아래의 Source Code들이 각각 Memory가 얼만큼 사용되는지 계산 하고, 답을 출력하는 프로그램을 작성하시오.
- Level 3의 경로를 하나 입력받고, 해당 경로가 몇번째로 만들어지는지 찾아서 출력하세요.

> - 1번 ~ 4번 Source Code 번호 (ex: 1~4)를 입력받으면 몇 byte인지 출력하면 됩니다.

- 1번 Source Code

```c++
#include <iostream>
using namespace std;

int data[10];

int main()
{
	return 0;
}
```

- 2번 Source Code

```c++
#include <iostream>
using namespace std;

double data[3];
char vect[10];
int dt[10];

int main()
{
	return 0;
}
```

- 3번 Source Code <Padding 포함>

```c++
#include <iostream>
using namespace std;

struct Node
{
	int x;
	char t;
};

Node vect[100];

int main()
{
	return 0;
}
```

- 4번 Source Code <64bit 컴파일 했을 때 & Padding 포함>

```cpp
#include <iostream>
using namespace std;

struct Node
{
	int x;
	char *next;
};

Node vect;

int main()
{
	return 0;
}
```


## 2. 입력

- 1번 ~ 4번 Source Code 번호를 입력받습니다. (1 <= n <= 4)

## 3. 출력

- 1 ~ 4번 Source Code들이 각각 Memory가 얼만큼 사용되는지 Byte로 계산 하고, 답을 출력하세요.


## 4. 예제 입력
```
1
```

## 5. 예제 출력
```
40
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int n;
    cin >> n;
    
    if (n == 1) cout << "40";
    else if (n == 2) cout << "74";
    else if (n == 3) cout << "800";
    else cout << "16";
    
    return 0;
}
```
