PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX ontosnaqa: <http://www.jabenitez.com/ontologies/ontosnaqa#>

DELETE { ?isol ontosnaqa:has_SNA_Value ?val}
INSERT { ?isol ontosnaqa:has_SNA_Value '1' }
WHERE{
	SELECT ?p ?net
	WHERE{
	 		?p a ontosnaqa:Person .
	  	?p ontosnaqa:isMemberOf ?net .
			?isol ontosnaqa:isIsolateInstanceOfNetwork ?net .
			?isol ontosnaqa:isIsolateInstanceOfPerson ?p .
			?isol ontosnaqa:has_SNA_Value ?val

			FILTER NOT EXISTS {
	        ?rel ontosnaqa:isRelationOfNetwork ?net .
	        ?rel ontosnaqa:isRelationOfPerson|ontosnaqa:isRelationWith ?p
	    }

	}group by ?p ?net 
}
