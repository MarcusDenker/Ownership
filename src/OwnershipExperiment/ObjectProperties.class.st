"
This is a singleton so we can easily load it (adding a class variable to Object would be nicer)
"
Class {
	#name : 'ObjectProperties',
	#superclass : 'Object',
	#instVars : [
		'properties'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'OwnershipExperiment',
	#package : 'OwnershipExperiment'
}

{ #category : 'accessing' }
ObjectProperties class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : 'properties' }
ObjectProperties >> ensureProperties: anObject [
	^ properties at: anObject ifAbsentPut: WeakKeyDictionary new
]

{ #category : 'testing' }
ObjectProperties >> hasProperty: aKey for: anObject [
	self propertyAt: aKey ifAbsent: [ ^ false ] for: anObject.
	^ true
]

{ #category : 'initialization' }
ObjectProperties >> initialize [
	super initialize.
	self initializeProperties
]

{ #category : 'initialization' }
ObjectProperties >> initializeProperties [
	properties := WeakIdentityKeyDictionary new
]

{ #category : 'testing' }
ObjectProperties >> propertiesFor: anObject [
	^ properties at: anObject ifAbsent: nil
]

{ #category : 'testing' }
ObjectProperties >> propertyAt: propName for: anObject [
	^ self
		propertyAt: propName
		ifAbsent: [ nil ]
		for: anObject
]

{ #category : 'testing' }
ObjectProperties >> propertyAt: propName ifAbsent: aBlock for: anObject [
	(self propertiesFor: anObject) ifNil: [^aBlock value].
	^ (self propertiesFor: anObject)
		at: propName
		ifAbsent: aBlock
]

{ #category : 'testing' }
ObjectProperties >> propertyAt: propName put: propValue for: anObject [
	^ (self ensureProperties: anObject)
		at: propName
		put: propValue
]

{ #category : 'testing' }
ObjectProperties >> removePropertiesIfEmpty: anObject [
	^ properties at: anObject ifPresent: [ :dict |
		dict ifEmpty: [ properties removeKey: anObject ] ]
]

{ #category : 'testing' }
ObjectProperties >> removeProperty: propName for: anObject [
	^ self
		removeProperty: propName
		ifAbsent: [ nil ]
		for: anObject
]

{ #category : 'testing' }
ObjectProperties >> removeProperty: propName ifAbsent: aBlock for: anObject [
	| property |
	(self propertiesFor: anObject)  ifNil: [^aBlock value].
	property := 	(self propertiesFor: anObject)
		removeKey: propName
		ifAbsent: aBlock.
	self removePropertiesIfEmpty: anObject.
	^ property
]
