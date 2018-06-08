PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?dg ontosnaqa:has_SNA_Value ?deg
}
WHERE{
	SELECT ?p ?net ?dg (count(?rel)+count(?relout) as ?deg)  WHERE {
			?p ontosnaqa:isMemberOf ?net .
			?p ontosnaqa:isTargetOfRelation ?relin .
			?relin ontosnaqa:isRelationOfNetwork ?net .
  		?p ontosnaqa:hasRelation ?relout .
			?relout ontosnaqa:isRelationOfNetwork ?net .
			?dg ontosnaqa:isIndividualDegreeOfPerson ?p .
			?dg ontosnaqa:isIndividualDegreeOfNetwork ?net .
			?relin ontosnaqa:isRelationOf ?q .
			?relout ontosnaqa:isRelationWith ?q
			# FILTER (?p != ?q)
	} GROUP BY ?p ?net ?dg
}
