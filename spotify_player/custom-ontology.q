[QueryGroup="custom"] @collection [[
[QueryItem="1"]
PREFIX custom: <http://www.semanticweb.org/tema/ontologies/2018/11/custom-ontology#>

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

select  ?musicName where { 
  ?music rdf:type custom:Music .
  ?music custom:musicName ?musicName .
}

[QueryItem="2"]
PREFIX : <http://www.semanticweb.org/tema/ontologies/2018/11/custom-ontology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

select  ?albumName ?albumCreationYear where { 
  ?album rdf:type :Album . 		
  ?album :albumName  ?albumName .
  ?album :albumCreationYear ?albumCreationYear .	
    
  
}

[QueryItem="3"]
PREFIX : <http://www.semanticweb.org/tema/ontologies/2018/11/custom-ontology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

select  ?albumName ?musicName where { 
  ?album rdf:type :Album . 
  ?music rdf:type :Music . 			
   ?album :albumName ?albumName .
   ?music :musicName ?musicName .
   ?album :contains  ?music 			
}
]]
