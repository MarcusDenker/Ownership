Class {
	#name : 'BaselineOfOwnershipExperiment',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOwnershipExperiment',
	#package : 'BaselineOfOwnershipExperiment'
}

{ #category : 'baselines' }
BaselineOfOwnershipExperiment >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec package: #OwnershipExperiment with: [  ].
		spec package: #'OwnershipExperiment-Tests' with: [ spec requires: #('OwnershipExperiment') ]].

	spec 
		group: 'tests' with: #('OwnershipExperiment-Tests');
		group: 'default' with: #( 'OwnershipExperiment' 'tests' ) 
]
