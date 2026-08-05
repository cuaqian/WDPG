#!/usr/bin/env bash
set -euo pipefail

# Copy this file to server_env.local.sh and fill in local values.
# Do not commit private API keys, Neo4j passwords, or service tokens.

export OPENAI_BASE_URL="http://localhost:8004/v1"
export OPENAI_API_KEY="EMPTY"
export LLM_MODEL="Qwen3-VL-32B-Instruct-FP8"

export EMBEDDING_API_BASE="http://localhost:8113/v1"
export EMBEDDING_MODEL="qwen3-vl-embedding-2B"

export RERANK_API_BASE="http://localhost:8123/v1"
export RERANK_MODEL="bge-reranker-v2-m3"

export NEO4J_URI="bolt://localhost:8111"
export NEO4J_USER="neo4j"
export NEO4J_PASSWORD="<fill-local-password>"
export NEO4J_DATABASE="wheatdiseases4"

export PRESCRIPTION_LIBRARY_MODE=1
export PRESCRIPTION_LIBRARY_PATH="$(pwd)/prescription_library/deep_all.json"
export CLINIC_MAX_PLANS=1
export ENABLE_WRITEBACK=0
