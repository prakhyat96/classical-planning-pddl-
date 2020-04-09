;Header and description

(define (domain animat)

;remove requirements that are not needed
(:requirements :strips :fluents :adl)

(:predicates ;todo: define predicates here
    (pq0)
    (pq1)
    (pq2)
    (nq0)
    (nq1)
    (nq2)
    (f0)
    (f1)
    (f2)
    (ls)
    (lf)
)


(:functions ;todo: define numeric functions here
 (gridsize)
 (liarx)
 (liary)
 (drinkx)
 (drinky)
 (eatx)
 (eaty)
 (max)
 (xposition)
 (yposition)
 (power)
 (hunger)
 (thirst)
 (reqxposition)
 (reqyposition)
 (reqpower)
 (reqhunger)
 (reqthirst)
)

;define actions here
(:action move_up
    :parameters ()
    :precondition (and (< (yposition) (gridsize))
                        (f0))
    :effect (and (increase (yposition) 1)
                 (increase (hunger) 1)
                 (increase (thirst) 1)
                 (decrease (power) 1)
                 (when (ls) (lf))
                 (not (f0))
                 (f1)
                  )
)

(:action move_down
    :parameters ()
    :precondition (and (> (yposition) 0)
                        (f0))
    :effect (and (decrease (yposition) 1)
                 (increase (hunger) 1)
                 (increase (thirst) 1)
                 (decrease (power) 1)
                 (when (ls) (lf))
                 (not (f0))
                 (f1))
)

(:action move_right
    :parameters ()
    :precondition (and (< (xposition) (gridsize))
                        (f0))
    :effect (and (increase (xposition) 1)
                 (increase (hunger) 1)
                 (increase (thirst) 1)
                 (decrease (power) 1)
                 (when (ls) (lf))
                 (not (f0))
                 (f1))
)

(:action move_left
    :parameters ()
    :precondition (and (> (xposition) 0)
                        (f0))
    :effect (and (decrease (xposition) 1)
                 (increase (hunger) 1)
                 (increase (thirst) 1)
                 (decrease (power) 1)
                 (when (ls) (lf))
                 (not (f0))
                 (f1))
)

(:action drink
    :parameters ()
    :precondition (and (= (xposition) (drinkx))
                       (= (yposition) (drinky))
                       (f0))
    :effect (and (decrease (power) 1)
                 (increase (hunger) 1)
                 (assign (thirst) 0)
                 (when (ls) (lf))
                 (not (f0))
                 (f1))
)


(:action eat
    :parameters ()
    :precondition (and (= (xposition) (eatx))
                       (= (yposition) (eaty))
                       (f0))
    :effect (and (decrease (power) 1)
                (assign (hunger) 0)
                (increase (thirst) 1)
                (when (ls) (lf))
                (not (f0))
                (f1))
)


(:action sleep
    :parameters ()
    :precondition (and (= (xposition) (liarx))
                       (= (yposition) (liary))
                       (f0))
    :effect (and(assign (power) (max))
                (increase (hunger) 1)
                (increase (thirst) 1)
                (when (ls) (lf))
                (not (f0))
                (f1))
)

(:action mv1
    :parameters ()
    :precondition (and (f1)
                        )
    :effect (and (not (f1))
                 (f2)
                 (when (and (< (hunger) (max))
                 (< (thirst) (max))
                 (> (power) 0)
                 (pq0)) (and (not (pq0))
                             (nq0)))
                 
                 (when (and (< (hunger) (max))
                 (< (thirst) (max))
                 (> (power) 0)
                 (not (and (= (xposition) (liarx))
                      (= (yposition) (liary))))
                 (pq0)) (and (not (pq0))
                             (nq1)) ) 
                
                (when (and (< (hunger) (max))
                 (< (thirst) (max))
                 (> (power) 0)
                 (pq1)) (and (not (pq1))
                             (nq1)))         
                
                (when (and (< (hunger) (max))
                 (< (thirst) (max))
                 (> (power) 0)
                 (and (= (xposition) (liarx))
                      (= (yposition) (liary)))
                 (pq1)) (and (not (pq1))
                             (nq2)) )
                
                (when (and (< (hunger) (max))
                 (< (thirst) (max))
                 (> (power) 0)
                 (not (and (= (xposition) (liarx))
                      (= (yposition) (liary))))
                 (pq2)) (and (not (pq2))
                             (nq1)) )
                
                (when (and (< (hunger) (max))
                 (< (thirst) (max))
                 (> (power) 0)
                 (pq2)) (and (not (pq2))
                             (nq0)))     
                )
)

(:action mv2
    :parameters ()
    :precondition (and (f2))
    :effect (and (not (f2))
                (f0)
                (when (nq0) (and (pq0)
                                (not (nq0))))
                (when (nq1) (and (pq1)
                                (not (nq1))))
                (when (nq2) (and (pq2)
                                (not (nq2))))    
            )
)

(:action loopq2
    :parameters ()
    :precondition (and (pq2)
                        (f0)
                        (not (ls)))
    :effect (and (ls)
                 (when (pq0) (not (pq0)))
                 (when (pq1) (not (pq1)))
                 (assign (reqxposition) (xposition))
                 (assign (reqyposition) (yposition))
                 (assign (reqthirst) (thirst))
                 (assign (reqpower) (power))
                 (assign (reqhunger) (hunger)))
)
)