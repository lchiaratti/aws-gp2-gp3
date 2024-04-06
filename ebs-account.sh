#! /bin/bash

region='us-east-1'

# Vamos achar todos EBS ainda em gp2, isso na região definida acima.
ebs_ids=$(aws ec2 describe-volumes --region "${region}" --filters Name=volume-type,Values=gp2 | jq -r '.Volumes[].VolumeId')

# Agrupe todos os volumes gp2 e altere seu tipo para gp3
for ebs_id in ${ebs_ids};do
    result=$(aws ec2 modify-volume --region "${region}" --volume-type=gp3 --volume-id "${ebs_id}" | jq '.VolumeModification.ModificationState' | sed 's/"//g')
    if [ $? -eq 0 ] && [ "${result}" == "modifying" ];then
        echo "Em Andamento: EBS ${ebs_id} está sendo modificado para GP3"
    else
        echo "Atenção: não foi possivel mudar o EBS ${ebs_id} para gp3!"
    fi
done