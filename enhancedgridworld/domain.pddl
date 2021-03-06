;Header and description

(define (domain gridworld)

(:requirements :typing :action-costs :negative-preconditions)
(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    agent position - object
    agent1 agent2 - agent
    gatherposition - position
    gatherposition1 gatherposition2 gatherposition3 gatherposition4 - gatherposition
)

(:predicates
    (robot1loopstart ?p - position)
    (robot2loopstart ?p - position)
    (connection ?n1 - position ?n2 - position)
    (robotat ?a - agent ?p - position)
    (datagatheredfromstation ?g - gatherposition)
    (pq0)
    (pq1)
    (pq2)
    (pq3)
    (pq4)
    (f0)
    (f1)
    (ls)
    (lf)
    (missioncomplete)
)


(:functions ;todo: define numeric functions here
 (total-cost)- number
)

(:action move
    :parameters (?a - agent ?n1 - position ?n2 - position ?g1 - gatherposition1 ?g2 - gatherposition2 ?g3 - gatherposition3 ?g4 - gatherposition4)
    :precondition (and (f0)
                       (not (ls))
                       (robotat ?a ?n1)
                       (connection ?n1 ?n2)
    )
    :effect (and (not (robotat ?a ?n1))
                 (robotat ?a ?n2)
                 (not (f0))
                 (f1)
                 (not (datagatheredfromstation ?g1))
                 (not (datagatheredfromstation ?g2))
                 (not (datagatheredfromstation ?g3))
                 (not (datagatheredfromstation ?g4))
    )
)

(:action move_loopstart
    :parameters (?a - agent ?n1 - position ?n2 - position ?g1 - gatherposition1 ?g2 - gatherposition2 ?g3 - gatherposition3 ?g4 - gatherposition4)
    :precondition (and (f0)
                       (ls)
                       (robotat ?a ?n1)
                       (connection ?n1 ?n2)
    )
    :effect (and (not (robotat ?a ?n1))
                 (robotat ?a ?n2)
                 (lf)
                 (not (f0))
                 (f1)
                 (increase (total-cost) 1)
                 (not (datagatheredfromstation ?g1))
                 (not (datagatheredfromstation ?g2))
                 (not (datagatheredfromstation ?g3))
                 (not (datagatheredfromstation ?g4))
    )
)

(:action gather_data
    :parameters (?a - agent ?g - gatherposition)
    :precondition (and (f0)
                       (robotat ?a ?g)
                       )
    :effect (and (not (f0))
                 (f1)
                 (datagatheredfromstation ?g))
)

(:action mv1
    :parameters ()
    :precondition (and (f1) 
                       (pq0)
    )
    :effect (and (not (f1))
                 (f0)
                 (pq0)

    )
)

(:action mv2
    :parameters (?g1 - gatherposition1 ?g2 - gatherposition2)
    :precondition (and (f1) 
                       (pq0)
                       (datagatheredfromstation ?g1)
                       (datagatheredfromstation ?g2)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq0))
                 (pq4)

    )
)

(:action mv3
    :parameters (?g1 - gatherposition1)
    :precondition (and (f1) 
                       (pq0)
                       (datagatheredfromstation ?g1)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq0))
                 (pq1)

    )
)

(:action mv4
    :parameters ()
    :precondition (and (f1) 
                       (pq1)
    )
    :effect (and (not (f1))
                 (f0)
                 (pq1)
    )
)

(:action mv5
    :parameters (?g - gatherposition2)
    :precondition (and (f1) 
                       (pq1)
                       (datagatheredfromstation ?g)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq1))
                 (pq4)
    )
)

(:action mv6
    :parameters (?g2 - gatherposition2 ?g3 - gatherposition3)
    :precondition (and (f1) 
                       (pq1)
                       (datagatheredfromstation ?g2)
                       (datagatheredfromstation ?g3)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq1))
                 (pq2)
    )
)

(:action mv7
    :parameters ()
    :precondition (and (f1) 
                       (pq2)
    )
    :effect (and (not (f1))
                 (f0)
                 (pq2)
    )
)

(:action mv8
    :parameters (?g4 - gatherposition4)
    :precondition (and (f1) 
                       (pq2)
                       (datagatheredfromstation ?g4)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq2))
                 (pq3)
    )
)

(:action mv9
    :parameters (?g1 - gatherposition1)
    :precondition (and (f1) 
                       (pq3)
                       (datagatheredfromstation ?g1)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq3))
                 (pq1)
    )
)
(:action mv10
    :parameters ()
    :precondition (and (f1) 
                       (pq3)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq3))
                 (pq0)
    )
)

(:action mv11
    :parameters (?g1 - gatherposition1 ?g2 - gatherposition2)
    :precondition (and (f1) 
                       (pq3)
                       (datagatheredfromstation ?g1)
                       (datagatheredfromstation ?g2)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq3))
                 (pq4)
    )
)

(:action mv12
    :parameters (?g3 - gatherposition3)
    :precondition (and (f1) 
                       (pq4)
                       (datagatheredfromstation ?g3)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq4))
                 (pq2)
    )
)

(:action mv13
    :parameters ()
    :precondition (and (f1) 
                       (pq4)
    )
    :effect (and (not (f1))
                 (f0)
                 (pq4)
    )
)

(:action mv14
    :parameters (?g3 - gatherposition3 ?g4 - gatherposition4)
    :precondition (and (f1) 
                       (pq4)
                       (datagatheredfromstation ?g3)
                       (datagatheredfromstation ?g4)
    )
    :effect (and (not (f1))
                 (f0)
                 (not (pq4))
                 (pq3)
    )
)

(:action infiniteloopstart
    :parameters (?a1 - agent1 ?a2 - agent2 ?p1 - position ?p2 - position)
    :precondition (and  (robotat ?a1 ?p1)
                        (robotat ?a2 ?p2)
                        (f0)
                        (pq3)
                        (not (ls)))
    :effect (and (ls)
                 (not (pq0))
                 (not (pq1))
                 (not (pq2))
                 (not (pq4))
                 (robot1loopstart ?p1)
                 (robot2loopstart ?p2)
)
)         


(:action mission_over
    :parameters (?a1 - agent1 ?a2 - agent2 ?p1 - position ?p2 - position)
    :precondition (and (lf)
                       (pq3)
                       (f0)
                       (robot1loopstart ?p1)
                       (robot2loopstart ?p2)
                       (robotat ?a1 ?p1)
                       (robotat ?a2 ?p2)
                       )
    :effect (and (missioncomplete))
)

)