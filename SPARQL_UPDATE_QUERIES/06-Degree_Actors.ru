PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?deg ontosnaqa:has_SNA_Value ?val
}
WHERE{
	SELECT ?p ?net ?deg (count(?rel) as ?val)  WHERE {
			?p ontosnaqa:isMemberOf ?net .
			?p ontosnaqa:hasRelation ?rel .
			?rel ontosnaqa:isRelationWith ?q .
			?deg ontosnaqa:isIndividualDegreeOfPerson ?p .
      ?deg ontosnaqa:isIndividualDegreeOfNetwork ?net .
			?rel ontosnaqa:isRelationOfNetwork ?net
		#	FILTER (?p != ?q)
	} GROUP BY ?p ?net ?deg
}
