PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?oudg ontosnaqa:has_SNA_Value ?deg
}
WHERE{
	SELECT ?p ?net ?oudg (count(?rel) as ?deg)  WHERE {
			?p ontosnaqa:isMemberOf ?net .
			?p ontosnaqa:hasRelation ?rel .
			?rel ontosnaqa:isRelationOfNetwork ?net .
			?oudg ontosnaqa:isIndividualOutDegreeOfPerson ?p .
			?oudg ontosnaqa:isIndividualOutDegreeOfNetwork ?net .
			?rel ontosnaqa:isRelationWith ?q
			# FILTER (?p != ?q)
	} GROUP BY ?p ?net ?oudg
}
