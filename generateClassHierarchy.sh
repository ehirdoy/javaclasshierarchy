#!/bin/bash
echo 'digraph code {' > code.dot;
find . -name "*.java" | xargs grep -h '^public class ' | grep -E ' implements | extends ' | sed 's/^public class //' |  sed 's/<[^>]\+>//g' |sed 's/ {//' | sed 's/ extends / -> /' | sed 's/ implements / -> /'  | sort >> code.dot
echo '}' >> code.dot;
fdp -Tpng -ocode.png code.dot
echo "OK";
