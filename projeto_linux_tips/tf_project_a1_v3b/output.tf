output "ip_address" {
  value = "${aws_instance.web[*].public_ip}"
}

# quando há mais de um recurso, é preciso informar o indice do recurso que está sendo criado
# caso for necessário acessar todos, utilizamos o *