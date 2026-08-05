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

// Link one evidence chunk to an extracted threat
MATCH (chunk:Chunk {chunk_id: $chunk_id})
MERGE (t:Threat {canonical_name: $threat})
SET t.name = coalesce($threat_name, t.name),
    t.kind = coalesce($threat_kind, t.kind),
    t.aliases = coalesce($threat_aliases, t.aliases)
MERGE (chunk)-[:MENTIONS]->(t);

// Reconstruct one symptom relation
MERGE (t:Threat {canonical_name: $threat})
MERGE (s:Symptom {name: $symptom})
SET s.description = coalesce($symptom_description, s.description)
MERGE (t)-[:HAS_SYMPTOM]->(s)
WITH t, s
MATCH (chunk:Chunk {chunk_id: $chunk_id})
MERGE (s)-[:SUPPORTED_BY]->(chunk);

// Reconstruct one pesticide-dosage relation
MERGE (p:Pesticide {name: $pesticide})
SET p.formulation = coalesce($formulation, p.formulation),
    p.active_ingredient = coalesce($active_ingredient, p.active_ingredient)
MERGE (d:Dosage {
    value: $dosage_value,
    unit: $dosage_unit,
    method: $application_method
})
SET d.water_volume = $water_volume,
    d.evidence_text = $evidence_text
MERGE (p)-[:HAS_DOSAGE]->(d)
WITH p, d
MATCH (chunk:Chunk {chunk_id: $chunk_id})
MERGE (d)-[:SUPPORTED_BY]->(chunk);

// Reconstruct one pesticide-PHI relation
MERGE (p:Pesticide {name: $pesticide})
MERGE (h:PHI {days: $phi_days})
SET h.note = $phi_note
MERGE (p)-[:HAS_PHI]->(h)
WITH p, h
MATCH (chunk:Chunk {chunk_id: $chunk_id})
MERGE (h)-[:SUPPORTED_BY]->(chunk);

// Reconstruct one pesticide-growth-stage relation
MERGE (p:Pesticide {name: $pesticide})
MERGE (g:GrowthStage {name: $growth_stage})
SET g.description = $growth_stage_description
MERGE (p)-[:APPLIES_AT]->(g)
WITH p, g
MATCH (chunk:Chunk {chunk_id: $chunk_id})
MERGE (g)-[:SUPPORTED_BY]->(chunk);
