; version 1.05
; date : 2025-04-01
; https://github.com/canitbeing/CanItBe_Lib

(defun canitbe ()

    ; (qr:shift '(1 2 3 4)) => (2 3 4)
    (defun qr:shift ( lst )

        (if (= 'list (type lst))

            (cdr lst)
            "fail:It is not a list type"
        )
    )

    ; (qr:unshift 5 '(1 2 3 4)) => (5 1 2 3 4)
    (defun qr:unshift ( new lst / typelst typeNew )

        (setq typeLst (type lst)
            typeNew (type new)
        )

        (cond
            (  (= nil typeLst)

                (if (= 'LIST typeNew)
                    new
                    (list new)
                )
            )
        (  (= 'LIST typeLst)

            (if (= 'LIST typeNew)
                (append new lst)
                (append (list new) lst)
            )
        )
        (  t

            (if (= 'LIST typeNew)
                (append new (list lst))
                (append (list new) (list lst))
                )
            )
        )
    )

    ; (qr:push 5 '(1 2 3 4)) => (1 2 3 4 5)
    (defun qr:push ( new lst / typelst typeNew )

        (setq typeLst (type lst)
            typeNew (type new)
        )

        (cond
            (  (= nil typeLst)

                (if (= 'LIST typeNew)
                    new
                    (list new)
                )
            )
            (  (= 'LIST typeLst)

                (if (= 'LIST typeNew)
                    (append lst new)
                    (append lst (list new))
                )
            )
            (  t

                (if (= 'LIST typeNew)
                    (append (list lst) new)
                    (append (list lst) (list new))
                )
            )
        )
    )

    ; (qr:pop '(1 2 3 4)) => (1 2 3)
    ; (qr:pop "123456") => "It is not a list type"
    (defun qr:pop (lst)

        (if (= 'LIST (type lst))
            (reverse (cdr (reverse lst)))
            "fail:It is not a list type"
        )
    )

    ; (qr:slice 1 4 '(0 1 2 3 4 5 6 7 8)) => (1 2 3 4)
    ; (qr:slice nil 4 '(0 1 2 3 4 5 6 7 8)) => (0 1 2 3 4)
    ; (qr:slice 3 nil '(0 1 2 3 4 5 6 7 8)) => (3 4 5 6 7 8)
    ; (qr:slice 2 5 "0123456") => "It is not a list type"
    (defun qr:slice ( begin end lst / index )

        (if (= 'LIST (type lst))

            (progn

                (setq index -1)

                (if (/= 'int (type begin))

                    (setq begin 0)
                )

                (if (/= 'int (type end))

                    (setq end (- (length lst) 1))
                )

                (vl-remove-if-not
                    '(lambda ( element )
                        (setq index (1+ index))
                        (<= begin index end)
                    ) lst
                )
            )
            "fail:It is not a list type"
        )
    )

    ; (qr:at 1 '("a" "b" "c" "f")) => "b"
    ; (qr:at -1 '("a" "b" "c" "f")) => "f"
    (defun qr:at ( index lst / result )

        (if (= 'int (type index))

            (if (= 'LIST (type lst))

                (if (< index 0)

                    (nth (abs (1+ index)) (reverse lst))
                    (nth index lst)
                )
                "fail:The type of the second argument is incorrect"
            )
            "fail:The type of the first argument is incorrect"
        )
    )

    ; (qr:concat (list 1 2 3) (list 4 5 6)) => (1 2 3 4 5 6)
    (defun qr:concat ( old new )

        (if (= 'list (type old)(type new))

            (apply 'append (list old new))
            "fail:The type of argument is incorrect"
        )
    )

    ; (qr:concat '("a" "b" "c")) => ((0 "a") (1 "b") (2 "c"))
    (defun qr:entries ( lst )

        (if (= 'list (type lst))

            (progn

                (setq index -1)

                (mapcar
                    '(lambda ( var )

                        (setq index (1+ index))

                        (list index var)

                    ) lst
                )
            )
            "fail:The type of argument is incorrect"
        )
    )

    ; (qr:fill "a" (list 1 2 3)) => ("a" "a" "a")
    (defun qr:fill ( value lst )

        (if (= 'list (type lst))

            (mapcar
                '(lambda ( element )

                    value

                ) lst
            )
            "fail:The type of argument is incorrect"
        )
    )

    ; (qr:findLastIndex "a" (list "a" "b" "b" "a" "b")) => 3
    (defun qr:findLastIndex ( value lst / index result)

        (setq index (length lst))

        (mapcar
            '(lambda ( var )

                (setq index (1- index))

                (if (= var value)

                    (if (= nil result)

                        (setq result index)
                    )
                )

            ) (reverse lst)
        )

        result
    )

    ; (qr:flat (list "a" (list "b" (list "c" (list "d"))))) => ("a" "b" ("c" ("d")))
    (defun qr:flat ( lst )

        (apply 'append
            (mapcar
                '(lambda ( var )

                    (if (= 'list (type var))

                        var
                        (list var)
                    )

                ) lst
            )
        )
    )
)