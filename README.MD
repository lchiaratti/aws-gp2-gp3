## Como converter EBS de GP2 para GP3

Temos duas opções para converter os EBS de GP2 para GP3

### COmo rodar e diferença dos Scripts.

Comando para encontrar as EBS GP2

"aws ec2 describe-volumes --region "us-east-1" --filters Name=volume-type,Values=gp2 | jq -r '.Volumes[].VolumeId'"

Podemos executar o script adicionando manualmente a lista dos IDs encontrados no comando acima (ebs-id.sh)

Se quisermos realizar a mudança em todos automaticamente podemos utilizar o script(ebs-account.sh), ele irá listar os EBS em GP2 e realizar a mudança para GP3, isso na conta e região que foi rodado.
