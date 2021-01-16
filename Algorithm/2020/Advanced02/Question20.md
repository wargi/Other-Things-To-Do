# 시간복잡도 구하기

## 1. 문제

- 아래의 4개의 소스코드들을 보고, 시간복잡도를 판별하여 아래의 기준 점수로 계산하였을 때, 몇 점이 나오는지 출력해주세요.
- 빠를 수록 점수가 높습니다.

```
- O(N^3) = 1 점

- O(N^2) = 2 점

- O(N log N) = 10 점

- O(N) = 11점

- O(log N) = 20점

- O(1) = 21점
```

- 1 ~ 4번의 소스코드 중 하나를 입력하면 해당 소스코드의 점수를 출력해주세요.
- 1번 Source Code

```cpp
#include <iostream>
using namespace std;

int main()
{
	for (int i = 0; i < 10000; i++) {
		cout << "#";
	}

	return 0;
}
```

- 2번 Source Code

```cpp
#include <iostream>
using namespace std;

int main()
{
	int n;
	cin >> n;

	for (int y = 0; y < n; y++) {
		for (int x = 0; x <= y; x++) {
			cout << "#";
		}
	}

	return 0;
}
```

- 3번 Source Code

```c++
#include <iostream>
using namespace std;

int n;

void abc()
{
	for (int i = 0; i < n; i++) {
		cout << "#";
	}
}

int main()
{
	cin >> n;

	for (int y = 0; y < n; y++) {
		abc();
		abc();
		abc();
	}

	return 0;
}

```

- 4번 Source Code

```c++
#include <iostream>
using namespace std;

int main()
{
	cin >> n;

	for (int y = 0; y < n; y++) {

		for (int x = 0; x < 5; x++) {

			for (int z = 0; z < n; z++) {
				cout << "#";
			}
		}
	}

	return 0;
}
```

## 2. 입력

- 1 ~ 4번의 소스코드 중 하나를 입력받아주세요. (1 <= n <= 4)

## 3. 출력

- 해당 소스코드의 점수를 출력해주세요.

## 4. 예제 입력
```
1
```

## 5. 예제 출력

```
21
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int n;
    cin >> n;

    if (n == 1) cout << "21";
    else if (n == 2) cout << "2";
    else if (n == 3) cout << "2";
    else cout << "2";
}
```
