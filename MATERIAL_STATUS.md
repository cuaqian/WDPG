# Material status for reviewer inspection

| Category | Status | Files or handling |
|---|---|---|
| Optimized visual prompt | Provided | `prompts/best_prompt.json` |
| DSPy prompt search records | Provided as summary | `prompts/search.summary.json`; `prompts/closed6_selection.summary.json`; `prompts/*.metrics.json`; full candidate prompts are withheld until the maintained repository release |
| Final prescription library | Summary and examples provided | `prescription_library/summary.json`; 35-entry count summary and four representative examples. A controlled item-level copy can be supplied if the editor requests it |
| Direct/base prescription reference | Summary provided | `prescription_library/summary.json`; 24-entry direct/base count summary |
| Expert review protocol | Provided | `prescription_library/expert_review_protocol.md`; de-identified protocol |
| Expert review summary | Provided | `prescription_library/expert_review_summary.json`; de-identified count summary and disagreement-resolution rule |
| Candidate prescription records | Not included in the review MVP | Intermediate construction logs are withheld; count summaries and representative examples are provided |
| Retrieval configuration | Provided | `configs/retrieval_config.json` |
| Agent MVP run configuration | Provided | `configs/env.template.sh`; `mvp_code/run_wdpd_full_agent.sh`; `mvp_code/README.md` |
| Saved predictions and metrics | Provided | `results/predictions/*.jsonl`; `results/metrics/*.json` |
| Metric recomputation | Provided | `mvp_code/recompute_diagnosis_statistics.py` |
| Knowledge graph schema | Provided | `kg_schema/schema.md` |
| Knowledge graph Cypher templates | Provided | `kg_schema/cypher_templates.cypher` |
| Knowledge extraction prompt template | Provided | `kg_schema/extraction_prompt_template.md` |
| Knowledge normalization rules | Provided | `kg_schema/normalization_rules.md` |
| Knowledge graph reconstruction protocol | Provided | `protocols/knowledge_graph_reconstruction_protocol.md` |
| Full Neo4j database dump | Not public in this package | Use schema, Cypher templates, reconstruction protocol, scale queries, and optional four-category subgraph export instead |
| Raw image files | Conditional sharing | Use sample IDs, labels, split metadata, source metadata, and hash records when redistribution is restricted |
| Expert review records | De-identified sharing | Provide protocol now; use a de-identified expert review summary in the formal supplementary upload |
| Private credentials | Excluded | Use `configs/env.template.sh` placeholders |
