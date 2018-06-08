PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?noa ontosnaqa:has_SNA_Value ?tot
}
WHERE{
	SELECT ?net ?noa (count(distinct ?p) as ?tot)  WHERE {
		?net  a ontosnaqa:SNANetwork .
		?net ontosnaqa:hasNumberOfActorsInvolvedInARelation ?noa .
		?p ontosnaqa:isMemberOf ?net .
		?rel ontosnaqa:isRelationOfPerson ?q .
		?rel ontosnaqa:isRelationWith ?p .
		?rel ontosnaqa:isRelationOfNetwork ?net
		# FILTER(?p != ?q)

	}  GROUP BY ?net ?noa
}
