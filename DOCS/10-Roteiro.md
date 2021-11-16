1. Criar bucket AWS;

2. Criar usuário programatico AWS;

3. Instalar o Docker;

4. Executar o Terraform no docker;

5. Dentro do container exportar as credenciais: 
    ~~~sh
    export AWS_ACCESS_KEY_ID=<Access key ID>
    export AWS_SECRET_ACCESS_KEY=<Secret access key>
    ~~~

6. Executar o comando `terraform init` 
    Pasta <tf_project_a1_v1>

# tf_project_a1_v2
[//]: # (Mudando de backend remoto para local)
7. No arquivo `main.tf` excluir/comentar o bloco terraform;
    1. Executar o comando `terraform init`
    2. Execute as alterações necessárias.
    3. Executar o comando `terraform plan`

8. Recolocar o bloco terraform
    1. Executar o comando:
        ```sh
            terraform init -upgrade
        ```

9. Executar o comando: 
    `terraform plan -out NomeDoPlano`

10. <tf_project_a1_v3>
- Adicionado o arquivo de output.tf;
- `terraform init`
- `terraform plan -out NomeDoPlano`
- `terraform apply`
- será possivel o o IP da instancia que foi criada.
- o bloco outoput no fim do terraform plan, retorna o IP da instancia.


11. <tf_project_a1_v4>
- adicionado o bloco `data`no arquivo **ec2.tf**;
- muda a declaração da ami de hardcode para usar referencia;
- `terraform init -upgrade`;
- `terraform plan -out plano`;
- como há diferença entre a ami original que a máquina foi criada e a ami que é obtida por referencia, a máquina é indicado que a máquina deve ser destruida e criada novamente.
- `terraform apply plano`;
- `terraform console`;
    - `data.aws_ami.ubuntu` : retorna todo o map de informações desse recursos;
    - `data.aws_ami.ubuntu.id` : retorna o id da ami que eu desejo

12. <tf_project_a1_v5>
- uso de alias e version
- duplicar os blocos:
    - *provider "aws"* e add o alias
    - *resource "aws_instance" "web"* e alterar o reference name, para que não ocorra conflito;
    - *data "aws_ami" "ubuntu"*
- > terraform plan -out plano
- > terraform apply plano

13. 12. <tf_project_a1_v6>
- Adicionar o arquivo variables.tf
- Criar o arquivo arquivo .tfvars
- Criar um arquivo .auto.tfvars
