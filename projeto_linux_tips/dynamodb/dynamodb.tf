resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {
    name = "tf-state-lock-dynamo"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
      name = "LockId"
      type = "S"
    }

    tags = {
      Name = "DynamoDB Terraform State Lock Table"
    }
}