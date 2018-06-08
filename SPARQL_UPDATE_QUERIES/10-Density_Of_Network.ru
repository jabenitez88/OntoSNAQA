PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>
INSERT{
	?don ontosnaqa:has_SNA_value ?tot
}
WHERE{
	SELECT ?net ?don (count(distinct ?rel) as ?tot) (count(distinct ?p) * (count(distinct ?p)-1) as ?totactors)  (?tot/?totactors as ?density)
	WHERE {
		?net  a ontosnaqa:SNANetwork .
		?net ontosnaqa:hasDensityOfNetwork ?don
	{
		?rel ontosnaqa:isRelationOfNetwork ?net

	}  UNION {
		?p ontosnaqa:isMemberOf ?net

	}
	}GROUP BY ?net ?don
}
