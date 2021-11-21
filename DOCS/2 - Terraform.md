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
    aplica o que foi definido no plan  e cria o arquivo de estado;

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


# Expressions
* string    : "hello"
* number    : 123
* bool      : podem ser `true`ou `false`. valores boleanos podem ser usados condição lógica;
* list      : também conhecido como tupla, é um sequencia de valores ["us-west-1a", "us-west-1c"]. Os elementos de uma lista são identificados por numeros sequenciais, iniciando em zero. Pode ser uma lista de strings, numeros, booleandos...
* map       : ou object, é um grupo de objetos identificados por labels, chave-valor: {name: "Mabel", age = 52}
* null      : é a forma de expressar o inexistente. quando um parâmetro recebe o valor null automaticamente o recurso é removido/omitido do recurso.



# Referencias
referencia faz parte do uso mais elementar do terraform.os tipos de referencimanto:
referencia um outro recurso qe foi definido no terraform.

##  <RESOURCE_TYPE>.<NAME> 
referencia um tipo de recurso e o nome que foi dado a esse recurso. aponta para recursos.

_exemplo_:
    output "ip_address" {
        *value = aws_instance.web.public_ip*
    }

## var.<NAME>

## local.<NAME>

## module.<MODULE_NAME>.<OUTPUT_NAME>

## data.<DATA_TYPE>.<NAME>
`data` olha para o provider que foi definido e pede um dado especifico.

`most_recente=true`traz a imagem mais recente;
`filter{}` filtros para localizar um informação especifica;

* path.module

* path.root

* path.cwd

* terraform.workspace
 


# Variables>
<tf_project_a1_v6>.

Para declarar um variavel será utilizado o bloco `variable` e esse bloco não possui tipo.
    *exemplo:*
    ~~~yaml
        variable "image_id{
        type = string
      }
    ~~~
    dentro de um bloco podem ser usados alguns argumentos:

   * default : possibilita definir um valor padrão; oferece uma valor padrão para uma variavel, se o default, não for declarado é obrigatório que o valor seja informado;

   * type constraints : indica o tipo do valor que é esperado para aquela variavel declarada; (string, number, bool, listas de tipos primitivos);

   * description : descrição de qual o intuito pelo qual a variavel foi criada;

   * custom validation rules - condition : informa qual a condição de validação para que o valor seja aceito.

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
* pode ser declarado na linha de comando:
    `terraform plan -var image_id="ami-1234" -out plano`

* Pode ser feita a referencia para a variavel.
    Para isso o bloco da variavel deve ser referenciado
    Por exemplo, no bloco `resource "aws_instance" "web"`a ami era obtida com a referencia ao recurso `data.aws_ami.ubuntu.id` ao declarar a ami como variavel, e tendo um valor default o ami pode ser referenciado com o comando `var.image_id`

* podem ser informadas através do arquivo .tfvars

* pode ser utilizado o arquivo .auto.tfvars , nesse arquivo as variaves são lidas automaticas

* variavesl de ambinete.

precedencia : export < tfvars < auto < linha de comando (`-var-file` ou `-var`)



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
   
# MODULOS   