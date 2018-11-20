#!/bin/bash

rm run_py_swarm.sh
while read v1
do 

sed 's/HEPG2/'$v1'/g' integrate_json_beyond_6H_template.py > integrate_json_beyond_6H.$v1.py
chmod +x integrate_json_beyond_6H.$v1.py
sed 's/HEPG2/'$v1'/g' integrate_json_beyond_24H_template.py > integrate_json_beyond_24H.$v1.py
chmod +x integrate_json_beyond_24H.$v1.py
echo " /usr/local/Anaconda/envs/py3.5/bin/python3.5 ./integrate_json_beyond_6H.$v1.py" >> run_py_swarm.sh
echo " /usr/local/Anaconda/envs/py3.5/bin/python3.5 ./integrate_json_beyond_24H.$v1.py" >> run_py_swarm.sh
 
done < cell_names_less1.txt
