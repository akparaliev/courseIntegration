[QueryGroup="new group"] @collection [[
[QueryItem="1"]
PREFIX : <http://www.semanticweb.org/tema/ontologies/2018/11/spotify-ontology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

select ?musicName ?musicDuration where { 
  ?music rdf:type :Music .
  ?music :musicName ?musicName . 
  ?music :musicDuration ?musicDuration . 
}

[QueryItem="2"]
PREFIX : <http://www.semanticweb.org/tema/ontologies/2018/11/spotify-ontology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

select ?singerName ?singerBiography where { 
  ?singer rdf:type :Singer .
  ?singer :singerName ?singerName . 
  ?music :singerBiography ?singerBiography . 
}

[QueryItem="3"]
PREFIX : <http://www.semanticweb.org/tema/ontologies/2018/11/spotify-ontology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

select ?singerName ?musicName where { 
  ?singer rdf:type :Singer .
  ?music rdf:type :Music .
  ?singer :singerName ?singerName . 
  ?music :musicName ?musicName .
  ?singer :performed ?music . 
}
]]
