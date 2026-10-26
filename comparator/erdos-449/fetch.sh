#!/usr/bin/env bash
# Recopie, au commit epingle, les cinq modules de la preuve de plby et le defi
# qu'il distribue avec elle. Rien n'est modifie : les fichiers sont pris tels quels.
set -euo pipefail
cd -- "$(dirname -- "$0")"

COMMIT=8822f7ddef30fadbd92e1c6ab4ed897af356af5e
BASE="https://raw.githubusercontent.com/plby/lean-proofs/${COMMIT}/src/latest"

get () {  # get <chemin amont> <chemin local>
  mkdir -p "$(dirname -- "$2")"
  curl -sSf "${BASE}/$1" -o "$2"
  printf '  %-52s %7d octets\n' "$2" "$(wc -c < "$2")"
}

echo "Modules de la preuve (cloture d'imports hors Mathlib) :"
get "Util/Density.lean"                             "Util/Density.lean"
get "ErdosProblems/Erdos446/Basic.lean"             "ErdosProblems/Erdos446/Basic.lean"
get "ErdosProblems/Erdos448/Basic.lean"             "ErdosProblems/Erdos448/Basic.lean"
get "ErdosProblems/Erdos448/Prop2Scale448.lean"     "ErdosProblems/Erdos448/Prop2Scale448.lean"
get "ErdosProblems/Erdos449.lean"                   "ErdosProblems/Erdos449.lean"

echo "Defi distribue par plby :"
get "ComparatorChallenges/ErdosProblems/Erdos449.lean" "Challenge.lean"
