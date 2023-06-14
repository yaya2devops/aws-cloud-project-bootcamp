output "PubSubIds" {
  value = [for k, v in aws_subnet.public_subnet : v.id]
}

output "vpc_id" {
  value = aws_vpc.cruddur_vpc.id
}