# Modify EBS-type Gp2-to-Gp3

<!-- <img src="imagem.png" alt="Exemplo imagem"> -->

> Este projeto contém scripts para modificar o tipo dos volumes ebs em uma conta da aws considerando várias regiões.

### Ajustes e melhorias

O projeto ainda está em desenvolvimento e as próximas atualizações serão voltadas nas seguintes tarefas:

- [x] ebs-account.sh : Shell Script;
- [x] ebs-id.sh: Shell Script;
- [x] modify-ebs-type.py: Scritp Python;
- [ ] Multi Account
- [ ] Lambda Function


## 💻 Pré-requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:
- Conhecimento básico sobre volumes EBS na AWS.
- Leitura do artigo `Lucas colocar o link do post do teu texto`.


##### Para usar o script Shell:
- AWS CLI instalado e configurado corretamente.
- Acesso aos volumes EBS que deseja modificar.
##### Para usar o script Python:
- Python 3 Instalado;
- Biblioteca boto3 instalada (`pip install boto3`)
- Credenciais de autenticação da AWS configuradas no ambiente. Para o script em Python configure o AWS SSO escolhendo o profile_name na abertura da Session.
- Caso rode o código via Lambda function: Verificar permissões adequadas para modificar os volumes EBS. Certifique-se de que o usuário ou a role IAM possua permissões para a ação `ec2:ModifyVolume`.



## ☕ Usando o projeto

##### Para usar o script em Shell, siga estas etapas:

Comando para encontrar as EBS GP2
```
"aws ec2 describe-volumes --region "us-east-1" --filters Name=volume-type,Values=gp2 | jq -r '.Volumes[].VolumeId'"
```
1 - Podemos executar o script adicionando manualmente a lista dos IDs encontrados no comando acima (ebs-id.sh)

2 - Se quisermos realizar a mudança em todos automaticamente podemos utilizar o script(ebs-account.sh), ele irá listar os EBS em GP2 e realizar a mudança para GP3, isso na conta e região que foi rodado.



##### Para usar o script em Python, siga estas etapas:
1 - No terminal, navegue até a pasta do projeto;
2 - Execute o python com a versão instalada e o nome do arquivo. Ex.:
```
python3 modify-ebs-type.py
```


## 📫 Contribuindo para o projeto

Para contribuir siga estas etapas:

1. Bifurque este repositório.
2. Crie um branch: `git checkout -b <nome_branch>`.
3. Faça suas alterações e confirme-as: `git commit -m '<mensagem_commit>'`
4. Envie para o branch original: `git push origin <nome_do_projeto> / <local>`
5. Crie a solicitação de pull.

Como alternativa, consulte a documentação do GitHub em [como criar uma solicitação pull](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## 🤝 Colaboradores

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/lchiaratti">
        <img src="https://avatars.githubusercontent.com/u/55640532?v=4" width="100px;" alt="Foto do Lucas Chiaratti no GitHub"/ target="_blanck" ><br>
        <sub>
          <b>
Lucas Chiaratti</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/rendell-arruda">
        <img src="https://avatars.githubusercontent.com/u/89528131?v=4" width="100px;" alt="Foto do Lucas J S no GitHub"/ target="_blanck" ><br>
        <sub>
          <b>Rendell Arruda</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 📝 Licença

Esse projeto é de livre acesso e replicação, só pedimos que deem o credito devido caso ele seja usado de forma comercial, em redes sociais ou em quaisquer outras iniciativas.
