Class {
	#name : 'OwnershipTests',
	#superclass : 'TestCase',
	#category : 'OwnershipExperiment-Tests',
	#package : 'OwnershipExperiment-Tests'
}

{ #category : 'tests' }
OwnershipTests >> testOwner [

	| owner object |
	owner := Object new.
	object := Object new.
	object owner: owner.
	self assert: object owner identicalTo: owner
]
