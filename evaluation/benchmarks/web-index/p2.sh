  # sed "s#^#$HOME/wikipedia/#" |
  # xargs cat |
  # iconv -c -t ascii//TRANSLIT |
  # pandoc +RTS -K64m -RTS --from html --to plain --quiet |
  # tr -cs A-Za-z '\n' |
  # tr A-Z a-z |
  # grep -vwFf ../evaluation/scripts/web-index/stopwords.txt |
  # ../evaluation/scripts/web-index/stem-words.js 


  WIKI="$PASH_TOP/evaluation/benchmarks/web-index"

  cat $WIKI/inputs/index_small.txt |
    sed "s#^\./#$WIKI/inputs/articles/#" |
    tr -d '\r'|
    xargs -d '\n' cat  |
    sed 's/[^[:print:]\t]//g'|
    sed 's/<[^>]*>//g' |
    tr -cs A-Za-z '\n' |
    tr A-Z a-z > tmp.txt

  cat tmp.txt |
    grep -vwFf $PASH_TOP/evaluation/benchmarks/web-index/input/stopwords.txt |
    $WIKI/input/stem-words.js 

  rm tmp.txt
