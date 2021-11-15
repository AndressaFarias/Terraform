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

   


