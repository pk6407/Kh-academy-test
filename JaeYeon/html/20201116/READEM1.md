# 1. Queue 개념

- 선입선출
- 사용
  - 처리 순서가 중요한 이벤트 큐나 메세지 큐 들에서 사용

# 2. 연산

- enqueue
- dequeue

## 2.1. 시나리오

enqueue(10)
enqueue(20)
enqueue(30)
enqueue(40)

dequeue()   //  ??
dequeue()   //  ?? 
dequeue()   //  ??

## 2.2.

r = -1, f = -1
rear: 뒷 부분, 나갈 요소를 가르킴
front: 앞 부분, 들어올 요소 위치를 가르킴

// 1. enqueue(10)
// queue[++r] = 10
[10][][][]
// r : 0

// 2. enqueue(20)
// queue[++r] = 20
[10][20][][][]
// r: 1

// 3. enqueue(30)
// queue[++r] = 30
[10][20][30][][]
// r: 2
--------------------
// 4. dequeue()
// return queue[++f]    // 10
// f: 0

----------------
큐가 꽉찼는지 검사
rear == (배열사이즈 - 1)