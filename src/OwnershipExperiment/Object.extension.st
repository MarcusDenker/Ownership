Extension { #name : 'Object' }

{ #category : '*OwnershipExperiment' }
Object >> hasProperty: aKey [
	^ ObjectProperties uniqueInstance hasProperty: aKey for: self
]

{ #category : '*OwnershipExperiment' }
Object >> owner [
	^ self propertyAt: #owner
]

{ #category : '*OwnershipExperiment' }
Object >> owner: owner [
	^ self propertyAt: #owner put: owner
]

{ #category : '*OwnershipExperiment' }
Object >> propertyAt: aKey [
	^ ObjectProperties uniqueInstance propertyAt: aKey for: self
]

{ #category : '*OwnershipExperiment' }
Object >> propertyAt: propertyKey ifAbsent: aBlock [
	^ ObjectProperties uniqueInstance propertyAt: propertyKey ifAbsent: aBlock for: self
]

{ #category : '*OwnershipExperiment' }
Object >> propertyAt: propertyKey put: anObject [
	^ ObjectProperties uniqueInstance propertyAt: propertyKey put: anObject for: self
]

{ #category : '*OwnershipExperiment' }
Object >> removeProperty: aKey [
	^ ObjectProperties uniqueInstance removeProperty: aKey for: self
]

{ #category : '*OwnershipExperiment' }
Object >> removeProperty: propertyKey ifAbsent: aBlock [
	^ ObjectProperties uniqueInstance removeProperty: propertyKey ifAbsent: aBlock for: self
]
