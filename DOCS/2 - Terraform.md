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
