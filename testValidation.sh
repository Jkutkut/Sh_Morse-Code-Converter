#!/bin/bash

#colors:
NC='\033[0m'; # No Color
RED='\033[0;31m';
GREEN='\033[0;32m';
LRED='\033[1;31m';
LGREEN='\033[1;32m';
YELLOW='\033[1;33m';
LBLUE='\033[1;34m';



tests=(
    "abcdefghijklmnopkrstuvwxyz 0123456789"
    "-r hey there"
);

results=(
    '.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. -.- .-. ... - ..- ...- .-- -..- -.-- --..   ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----.'
    ". . . .   .   - . - -       -   . . . .   .   . - .   ."
);


echo "Starting test";


i=0;
while [[ $i < ${#tests[@]} ]]; do
    printf "Testing $i:\n    ./ttM.sh ${tests[$i]}\n\t";

    ( . ./ttM.sh ${tests[$i]}) > outputTemp.txt;

    if [ ! "$(cat outputTemp.txt)" == "${results[$i]}" ]; then
        printf "${RED}Error on test $i${NC}\n";
    else
        printf "${GREEN}Done${NC}\n";
    fi

    i=$((i+1));
done


rm outputTemp.txt;
printf "${GREEN}End of testing${NC}\n";