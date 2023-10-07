**Serviços utilizados juntamente com o Terraform**

# S3 
- Serviço de armazenamento de objetos;
- O Bucket funciona como uma pasta dentro do serviço S3;

## Criando um Bucket
- Busca por **S3** no menu de serviços;
- Clicar no botão **Criar bucket**;
    - Nome do bucket: é um nome **único** na AWS;
    * **Marcar** _ Bloquear todo acesso publico_;
    * Criar bucket;

# IAM
- Faz o gerencimento dos acessos;
- Seria um firewall da API;
- É o serviço que vai gerenciar quem pode acessar oquê.

## Criar um user IAM 
- Buscar no menu de Serviço IAM;
- No menu ao lado esquerdo clicar em **Usuários**
- **Adicionar usuário**
- Nome de usuário: único na conta AWS;
- Tipo de acesso:
    - Acesso programatico
- Anexar politicas existentes de forma direta

# Region
- É um conjunto de datacenters;
- Cada Region possui diversas AZs (availability zones).
- Quando um serviço está sendo executado em diversas AZs é conhecido como multiAZ. O recomendado é que os serviços criticos sejam multiRegions.
- Cada Region possui pelo menos três Azs.
