Class {
	#name : 'OwnershipTest',
	#superclass : 'TestCase',
	#category : 'OwnershipExperiment-Tests',
	#package : 'OwnershipExperiment-Tests'
}

{ #category : 'tests' }
OwnershipTest >> testOwner [

	| owner object |
	owner := Object new.
	object := Object new.
	object owner: owner.
	self assert: object owner identicalTo: owner
]
