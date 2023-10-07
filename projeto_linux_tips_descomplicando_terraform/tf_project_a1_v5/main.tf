provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

provider "aws" {
  alias = "west"
  region  = "us-west-2"
  version = "~> 3.0"
}

terraform {
  /*Esse bloco determina que o arquivo tfstate seja salvo na aws
  para que o arquivo seja salvo localmente é só excluir esse bloco */

  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "descomplicando-terraform-afarias"
    key    = "terraform-test.tfstate"
    region = "us-east-1"  // deve ser a mesma região que o bucket foi criado
  }
}