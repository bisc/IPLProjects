(define-sort ArchElem () Int)


; Components
(declare-fun isSystem(ArchElem) Bool)
(declare-fun ismultiproc(ArchElem) Bool)
(declare-fun iscpu(ArchElem) Bool)
(declare-fun isProcessor(ArchElem) Bool)
(declare-fun isArchElem(ArchElem) Bool)
(declare-fun ismycpu(ArchElem) Bool)
(declare-fun ismultiproc_impl(ArchElem) Bool)
(declare-fun ismycpu_impl2(ArchElem) Bool)
(declare-fun isProcess(ArchElem) Bool)
(declare-fun ispro(ArchElem) Bool)
(declare-fun iscpu_impl(ArchElem) Bool)

(assert (forall ((x ArchElem)) (= (isSystem x) (or (= x 0)) )))
(assert (forall ((x ArchElem)) (= (ismultiproc x) (or (= x 0)) )))
(assert (forall ((x ArchElem)) (= (iscpu x) (or (= x 2) (= x 3) (= x 4) (= x 5)) )))
(assert (forall ((x ArchElem)) (= (isProcessor x) (or (= x 2) (= x 3) (= x 4) (= x 5)) )))
(assert (forall ((x ArchElem)) (= (isArchElem x) (or (= x 0) (= x 1) (= x 2) (= x 3) (= x 4) (= x 5)) )))
(assert (forall ((x ArchElem)) (= (ismycpu x) (or (= x 4) (= x 5)) )))
(assert (forall ((x ArchElem)) (= (ismultiproc_impl x) (or (= x 0)) )))
(assert (forall ((x ArchElem)) (= (ismycpu_impl2 x) (or (= x 4) (= x 5)) )))
(assert (forall ((x ArchElem)) (= (isProcess x) (or (= x 1)) )))
(assert (forall ((x ArchElem)) (= (ispro x) (or (= x 1)) )))
(assert (forall ((x ArchElem)) (= (iscpu_impl x) (or (= x 2) (= x 3)) )))


; Properties and subcomponents
(declare-fun cpuC (ArchElem) ArchElem)
(declare-fun Processor_Capacity (ArchElem) Real)
(declare-fun Synchronized_Component (ArchElem) Bool)
(declare-fun prop2 (ArchElem) Real)
(declare-fun Runtime_Protection (ArchElem) Bool)
(declare-fun cpuB (ArchElem) ArchElem)
(declare-fun pr1 (ArchElem) ArchElem)
(declare-fun cpuD (ArchElem) ArchElem)
(declare-fun prop3 (ArchElem) Bool)
(declare-fun cpuA (ArchElem) ArchElem)

(assert (= (cpuC 0) 4))
(assert (= (Processor_Capacity 2) 500.0))
(assert (= (Processor_Capacity 3) 500.0))
(assert (= (Synchronized_Component 0) true))
(assert (= (Synchronized_Component 1) true))
(assert (= (prop2 1) 5.1))
(assert (= (Runtime_Protection 1) true))
(assert (= (cpuB 0) 3))
(assert (= (pr1 0) 1))
(assert (= (cpuD 0) 5))
(assert (= (prop3 2) false))
(assert (= (prop3 3) false))
(assert (= (prop3 4) true))
(assert (= (prop3 5) true))
(assert (= (cpuA 0) 2))

; isSubcomponentOf
(declare-fun isSubcomponentOf (ArchElem ArchElem) Bool)
(assert (forall ((x ArchElem)) (= (isSubcomponentOf 0 x) (or (= x 1) (= x 2) (= x 3) (= x 4) (= x 5)))))

; Rigid IPL
(assert (forall ((c ArchElem)) (=> (ismultiproc_impl c) (> (Processor_Capacity c) 300000))))
(assert true)

(check-sat)
