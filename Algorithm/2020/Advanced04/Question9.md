# Heap Sort 구현

## 1. 문제
- Heap: Data를 이진트리 형태로 저장해두고, 우선순위가 높은 값을 빠르게 찾아주는 자료구조 입니다.
- 띄어쓰기를 제외하고 대소문자, 특수문자가 섞인 한 문장을 입력받아주세요.
- Max Heap에 문자열을 구성하는 알파벳들을 넣어두고, 아스키코드 순서대로 내림 차순으로 정렬하는 프로그램을 작성해주세요.

```c++
// 1
// [STL : Max Heap]
//priority_queue<int, vector<int>, less<int>> t; 을 간략하게 표현한 것이다.
#include <queue>
priority_queue<int> t;

// 2
// [STL : Min Heap]
#include <queue>
priority_queue<int, vector<int>, greater<int>> t;

#include <queue>
struct Node { int a, b };

// 3
// [STL : 다중 조건 우선순위 큐]
// 연산자 오버로딩, 첫 번째 인자값의 우선순위가 더 낮다면 True 리턴한다. (주의)
bool operator<(Node t1, Node t2) 
{
    if (t1.a < t2.a) return true;
    if (t1.a > t2.a) return false;
    return t1.b < t2.b;
}

priority_queue<Node> t;
```



## 2. 입력
- 띄어쓰기를 제외하고 대소문자, 특수문자가 섞인 한 문장을 입력 받습니다.

## 3. 출력
- Max Heap에 문자열을 구성하는 알파벳들을 넣어두고, 아스키코드 순서대로 내림 차순으로 정렬하여 출력해주세요. (최대 50글자)

## 4. 예제 입력
```
DoYouWannaBuildASnowMan?
```

## 5. 예제 출력
```
wuuooonnnnlidaaaYWSMDBA?
```

## 6. 코드

```c++
#include<iostream>
#include<string>
#include<queue>
using namespace std;

priority_queue<char> q;
char vect[1000];

int main() {
	string s;
	cin >> s;

	for (int i = 0; i < s.length(); i++) {
		q.push(s[i]);
	}

	for (int i = 0; i < s.length(); i++) {
		cout << q.top();
		q.pop();
	}

	return 0;
}
```
