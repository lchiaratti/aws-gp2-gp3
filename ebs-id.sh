#!/bin/bash

region='us-east-1'

# Aqui você vai colocar o ID dos volumes
ebs_ids_array=( "id-1" "id-2")

# Aqui vai ser mudado os ID colocados acima
for ebs_id in "${ebs_ids_array[@]}"; do
    # Vamos colocar para mudar o volume para gp3
    result=$(aws ec2 modify-volume --region "${region}" --volume-type=gp3 --volume-id "${ebs_id}" | jq '.VolumeModification.ModificationState' | sed 's/"//g')
    
    if [ $? -eq 0 ] && [ "${result}" == "modifying" ]; then
        echo "Em Andamento: EBS ${ebs_id} está sendo modificado para GP3"
    else
        echo "Atenção: não foi possivel mudar o EBS ${ebs_id} para gp3!"
    fi
done