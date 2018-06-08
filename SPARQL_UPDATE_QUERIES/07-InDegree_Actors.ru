PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?indg ontosnaqa:has_SNA_Value ?val
}
WHERE{
	SELECT ?p ?net ?indg (count(?rel) as ?val)  WHERE {
			?p ontosnaqa:isMemberOf ?net .
			?p ontosnaqa:isTargetOfRelation ?rel .
			?rel ontosnaqa:isRelationOfNetwork ?net .
			?indg ontosnaqa:isIndividualInDegreeOfPerson ?p .
			?indg ontosnaqa:isIndividualInDegreeOfNetwork ?net .
			?rel ontosnaqa:isRelationOf ?q
			# FILTER (?p != ?q)
	} GROUP BY ?p ?net ?indg
}
