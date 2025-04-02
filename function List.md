## shift
Removes the first element from the list.
  > (qr:shift '(1 2 3 4)) => (2 3 4)

## unshift
Adds a new element to the front of the list.
  > (qr:unshift 5 '(1 2 3 4)) => (5 1 2 3 4)
  > (qr:unshift 5 nil) => (5)

## push
Adds a new element to the end of the list
  > (qr:push 5 '(1 2 3 4)) => (1 2 3 4 5)
  > (qr:push 5 nil) => (5)

## pop
Removes the last element from the list
  > (qr:pop '(1 2 3 4)) => (1 2 3)

## slice
Returns the list from begin to end
- Includes both begin and end.
  > (qr:slice 1 4 '(0 1 2 3 4 5 6 7 8)) => (1 2 3 4)
  > (qr:slice nil 4 '(0 1 2 3 4 5 6 7 8)) => (0 1 2 3 4)
  > (qr:slice 3 nil '(0 1 2 3 4 5 6 7 8)) => (3 4 5 6 7 8)

## at
Returns the value at the index
  > (qr:at 1 '("a" "b" "c" "f")) => "b"
  > (qr:at -1 '("a" "b" "c" "f")) => "f"

## concat
Combines two lists into one
  > (qr:concat '(1 2) '(3 4)) => (1 2 3 4)

## entries
Returns a new list containing key/value pairs for each index
  > (qr:concat '("a" "b" "c")) => ((0 "a") (1 "b") (2 "c"))

## fill
Change all elements to static values
  > (qr:fill "a" (list 1 2 3)) => ("a" "a" "a")

## qr:findLastIndex
Reverse iterate list and return the index of the first element
  > (qr:findLastIndex "a" (list "a" "b" "b" "a" "b")) => 3