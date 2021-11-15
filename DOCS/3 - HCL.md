
# HCL
É um yaml/yml melhorado/modificado.

## Blocos

É qualquer bloco de código.  Compreendido por chaves.

[tipo][subtipo][nome]{...}
_exemplo:_
    resource "aws_instance" "example"{...}

## Argumento

- Tudo que está dentro de um bloco;
- É constituido por chave e valor;
- Geralmente a chave é preexistente e está associada ao tipo e subtipo do bloco.

## Identificadores

- É o nome (do bloco, do tipo de bloco, ...)
- O primeiro caracter de um identificador **NÃO** pode ser uma digito;

# Comentário

" # "   - Comentário de linha inteira 
" // "  - Comentário de linha inteira
/* e */ - Cometário de multiplas linhas


# Expressions
* string    : "hello"
* number    : 123
* bool      : podem ser `true`ou `false`. valores boleanos podem ser usados condição lógica;
* list      : também conhecido como tupla, é um sequencia de valores ["us-west-1a", "us-west-1c"]. Os elementos de uma lista são identificados por numeros sequenciais, iniciando em zero. Pode ser uma lista de strings, numeros, booleandos...
* map       : ou object, é um grupo de objetos identificados por labels, chave-valor: {name: "Mabel", age = 52}
* null      : é a forma de expressar o inexistente. quando um parâmetro recebe o valor null automaticamente o recurso é removido/omitido do recurso.

# Referencias
referencia faz parte do uso mais elementar do terraform.como funciona:
<RESOURCE_TYPE>.<NAME>
    