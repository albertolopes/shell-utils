#!/bin/sh

#sh dividir_csv.sh -nome <<NOME DO ARQUIVO SEM O .csv>> -quantidade <<TOTAL A SER DIVIDIDO>>

# Valores padrão
NOME=""
QUANTIDADE=1000

# Ler parâmetros
while [ "$#" -gt 0 ]; do
    case $1 in
        -nome) NOME="$2"; shift ;;
        -quantidade) QUANTIDADE="$2"; shift ;;
        *) echo "Parâmetro desconhecido: $1" ;;
    esac
    shift
done

# Verificação se o nome foi passado
if [ -z "$NOME" ]; then
    echo "Erro: você precisa informar o -nome do arquivo (sem .csv)"
    exit 1
fi

# Execução do comando
tail -n +2 "${NOME}.csv" | split -l "$QUANTIDADE" - "parte_" --additional-suffix=.csv

echo "Arquivo ${NOME}.csv dividido em partes de $QUANTIDADE linhas cada."
