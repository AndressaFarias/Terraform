# Terraform

O Terraform possui um arquivo de estado, em que ele guarda o ultimo estado - configuração - que foi aplicado.

## Arquivo state
O arquivo de estado é inicialmente salvo localmente na máquina de quem executou o terraform.
Esse arquivo de estado, salvo localmente **não é algo seguro**, sendo então indicado salvar o arquivo em um S3.

## Comandos básico
`terraform init`
    Cria a pasta .terraform, essa pasta possui tudo que será preciso para que o TF seja executado.

   `-upgrade` : atualiza os plugins

`terraform plan`
    Valida o que está no state e o que é solicitado no arquivo descritivo.

   `-out=path` : tranfere para um arquivo o plan que foi apresentado, garantindo o qye será aplicado aqui que foi visto.

`terraform apply`
    aplica o que foi definido no plan 

`terraform destroy`
    destroy udo o qu está no HCL.

# terraform console
para sair `exit`, `ctrl + c` ou `ctrl + d`
e uma ferramenta para interagir com o state, possibilida entender o que está sendo feito ; 

É possivel obnter o map com as informações de cada um dos recurso que é criado.

# Provider
O bloco provider, é um tipo de bloco especial.
Esse bloco informa em qual provider serão criados os os recuros.
Cada provider possui um conjunto de parametros que devem ser informados para realizar a conexão com o provider.

Todos os providers podem receber dois metaargumento:
* `version` : é a versão do plugin de conexão com o provider que sewrá utilizado.

* `alias` : para que seja possivel trabalhar com multiplos providers.
 <tf_project_a1_v5>


 # Variables -  <tf_project_a1_v6>
 Variavel possibilita variar o comportamento da variavel.
    para declarar um vasriavel será utilizado o bloco `variable`e esse bloco não pssui tipo.
        *exemplo:*
        ~~~yaml
        variable "image_id{
            type = string
        }
        ~~~
    dentro de um bloco podem ser usados alguns argumentos:

   * default : possibilita definir um valor padrão
   * type constraints : indica o tipo do valor que é esperado apra aquela variavel; (string, number, bool, listas de tipos primitivos)
   * description : descrição qual o intuioto da variavel 
   * custom validation rules : informa qual a condição de validação para que o valor seja aceito.
   * sensitive : quando definido como true, esse valor não é apresentado na console.

    ~~~yaml
    variable "image_id"{
        default = "ami-12325456"
        type = string
        description = " Esseé o id de uma imagem AMI.

        validation{
            condition   = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
            error_message = "A imagem_id valor não declarado"     
        }
    } 
    ~~~

## USANDO VARIAVEIS
* pode ser declaro na linah de comando:
    terraform plan -var image_id="ami-1234" -out plano

* podem ser informadas através do arquivo .tfvars

* pode ser utilizado o arquivo .auto.tfvars , nesse arquivo as variaves são lidas automaticas

* variavesl de ambinete.

precedencia : export > tfvars > auto > -var-file



# Blocos
## output
   tipo de bloco `output`: permite que um determinado valor seja "printado" na tela.
   _exemplo_ 
   arq: **output.tf**
   ~~~ yaml
    output "ip_address" {
    value = aws_instance.web.public_ip
    }
   ~~~

   vai printar o recurso `public_ip`. esse recurso está sendo criado no arquivo **ec2.tf** no bloco
   ~~~yml
    resource "aws_instance" "web" {
    ami           = "ami-0885b1f6bd170450c"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }
    }
   ~~~
   embora o valor não esteja explicito na declaração do bloco é possível obeter ele. 
   