variable "image_id"{
    default = "ami-0885b1f6bd170450c"
    type = string
    description = "Esse é o id de uma imagem AMI."

    validation {
        condition   = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
        error_message = "A imagem_id valor não declarado"
        }
    }