PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?nor ontosnaqa:has_SNA_Value ?tot
}
WHERE{
	SELECT ?net ?nor (count(distinct ?rel) as ?tot)  WHERE {
		?net  a ontosnaqa:SNANetwork .
		?net ontosnaqa:hasNumberOfRelations ?nor .
		?rel ontosnaqa:isRelationOfNetwork ?net
		?rel ontosnaqa:isRelationOfPerson ?p .
		?rel ontosnaqa:isRelationWith ?q
		# FILTER (?p != ?q)

	}  GROUP BY ?net ?nor
}
