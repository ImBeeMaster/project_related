#! /usr/bin/env/ bash
check_num = 1
re='^[0-9]+$'
while [[ ${check_num} != 0 ]]
do
check_num = nan
$commit_hash=$(git rev-parse --verify HEAD)
cp ../docker-compose.yml ./
docker-compose -p developdev -f ./docker-compose.yml up maven 2>&1 > tmp_log.txt
check_num=$(tail -n 1 tmp_log.txt | grep -Po "\d+$" tmp_log.txt)

if [[ ! ${check_num} =~ $re ]]; then
exit 15
fi


iteration_breakup = 1

iteration_breakup=$((iteration_breakup+1))

if [[ iteration_breakup -eq 15 ]]; then
test=$(echo "Fuck")
break
fi
done

if [[ ${test} = 'Fuck' ]]; then
echo "We failed"
exit 16
else
echo "We found guilty commit $commit_hash"
fi

