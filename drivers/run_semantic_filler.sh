#!/bin/bash
# Semantic-but-unrelated filler (LB: novel excerpt, KB: Python source excerpt) on N-hop / 15-op arithmetic / AIME-HMMT.
# Matched comparators (B0, CB 300/1000, XB 300) already exist in results/nhop and results/greenblatt.
# Usage: run_semantic_filler.sh "<models>" <conc>
set -u
R="$(cd "$(dirname "$0")/.." && pwd)"
MODELS="$1"; CONC="$2"
for t in "nhop|2 3 4 5 6 7|150" "arith|15|100" "aime|1|218"; do
  task=${t%%|*}; rest=${t#*|}; depths=${rest%%|*}; n=${rest##*|}
  $R/drivers/run_until_done.sh --tag semantic_filler --models $MODELS --tasks $task --depths $depths --n $n \
    --concurrency $CONC --log-every 500 --arms B LB KB --ks 0 300 1000
done
echo "$(date +%T) ALL DONE semantic_filler for $MODELS"
