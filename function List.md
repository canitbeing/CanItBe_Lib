## shift
리스트에서 첫 번째 요소를 **제거**합니다.
Removes the first element from the list.
  > (qr:shift '(1 2 3 4)) => (2 3 4)

## unshift
리스트에 새로운 요소를 **앞**에 **추가**합니다.
Adds a new element to the front of the list.
  > (qr:unshift 5 '(1 2 3 4)) => (5 1 2 3 4)
  > (qr:unshift 5 nil) => (5)

## push
리스트에 새로운 요소를를 **뒤**에 **추가**합니다.
Adds a new element to the end of the list
  > (qr:push 5 '(1 2 3 4)) => (1 2 3 4 5)
  > (qr:push 5 nil) => (5)

## pop
리스트에서 **마지막 요소**를 **제거**합니다.
Removes the last element from the list
  > (qr:pop '(1 2 3 4)) => (1 2 3)

## slice
begin 부터 end 까지의 리스트를 반환합니다.
Returns the list from begin to end
- begin과 end를 포함합니다.
- Includes both begin and end.
  > (qr:slice 1 4 '(0 1 2 3 4 5 6 7 8)) => (1 2 3 4)
  > (qr:slice nil 4 '(0 1 2 3 4 5 6 7 8)) => (0 1 2 3 4)
  > (qr:slice 3 nil '(0 1 2 3 4 5 6 7 8)) => (3 4 5 6 7 8)

## at
index에 있는 값을 반환합니다.
Returns the value at the index
  > (qr:at 1 '("a" "b" "c" "f")) => "b"
  > (qr:at -1 '("a" "b" "c" "f")) => "f"

## concat
두 개의 리스트를 하나로 합친다.
Combines two lists into one
  > (qr:concat '(1 2) '(3 4)) => (1 2 3 4)