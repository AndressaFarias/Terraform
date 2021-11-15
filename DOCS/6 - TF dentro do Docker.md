# Executar um Terraform dentro de um Docker

docker run -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh 
                  [máquina:container]

ARGUMENTOS
-i : roda de modo interativo, será possivel executar comando na console

-t : dá o acesso ao terminal

-v : adicione um volume, mapeia uma pasta local para dentro do container

$PWD:/app : [DirMáquina:DirContainer], o que estiver a direita se não existir no container é criado

-w : deseigna onde será o diretório de trabalho, a workdir.

--entrypoint "" : sobrescreve o comando inicial que é executado pela imagem, nesse caso substitui o comando `terraform` por `vazio` dessa forma o comando `sh` indicado na execução do docker é executado; 

hashicorp/terraform:light : imagem

sh : comando

