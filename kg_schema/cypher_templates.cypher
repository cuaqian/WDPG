// Count graph scale
MATCH (n)
RETURN labels(n) AS labels, count(*) AS count
ORDER BY count DESC;

// Count relation types
MATCH ()-[r]->()
RETURN type(r) AS relation_type, count(*) AS count
ORDER BY count DESC;

// Count treatment-related threat and pesticide entities
MATCH (t:Threat)
OPTIONAL MATCH (t)-[:CONTROLLED_BY]->(p:Pesticide)
RETURN count(DISTINCT t) AS threat_entities,
       count(DISTINCT p) AS pesticide_entities,
       count(*) AS control_relation_instances;

// Retrieve candidate treatment evidence for one threat
MATCH (t:Threat {canonical_name: $threat})-[:CONTROLLED_BY]->(p:Pesticide)
OPTIONAL MATCH (p)-[:HAS_DOSAGE]->(d:Dosage)
OPTIONAL MATCH (p)-[:HAS_PHI]->(h:PHI)
OPTIONAL MATCH (p)-[:SUPPORTED_BY]->(c:Chunk)<-[:HAS_CHUNK]-(doc:Document)
RETURN t.canonical_name AS threat,
       p.name AS pesticide,
       p.active_ingredient AS active_ingredient,
       d.value AS dosage,
       d.unit AS dosage_unit,
       d.method AS application_method,
       h.days AS phi_days,
       doc.title AS source_title,
       doc.url AS source_url,
       c.chunk_id AS chunk_id
LIMIT 50;

// Reconstruct one document-to-chunk relation
MERGE (doc:Document {doc_id: $doc_id})
SET doc.title = $title,
    doc.source_type = $source_type,
    doc.date = $date,
    doc.url = $url
MERGE (chunk:Chunk {chunk_id: $chunk_id})
SET chunk.text = $text,
    chunk.section = $section,
    chunk.tags = $tags
MERGE (doc)-[:HAS_CHUNK]->(chunk);

// Reconstruct one treatment relation
MERGE (t:Threat {canonical_name: $threat})
SET t.kind = $threat_kind
MERGE (p:Pesticide {name: $pesticide})
SET p.formulation = $formulation,
    p.active_ingredient = $active_ingredient
MERGE (t)-[:CONTROLLED_BY]->(p);

