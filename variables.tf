variable "region" {
    description = "Region to create my resources"
    type = string
    default = "us-east-1"
  
}

variable "pub-key" {
    description = "key"
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmiI5beB4XLEYGtJJRoNXazhoCCPcQ575opxp3D2/Ew573OaX7GEwlgUuMKbA87NHAZ3o/Q5FI8l9+DsHcXzt6aHOhFdy8tMWiIofjvkBaDqBLW7cp48awU9ArfeKHWQZzdGt4mRFJU6ScuJA6/FtjwXh9nrJUDjvCeudWhkbZF20nx2G2s+b35H+xz7lVMAYsMDmTam/CWbFL1XcUUtKWXfAhSH9c4PdY8Q57e1jwIDYW0vKi9LlQVrvV91YGR4PtnNwgxBtSwvMwcoNp4F3+RRs4efNaLXLa9vjzkyjARjtRaQgEnFkyumZE5C/7FHbbkIbIZIiRNsVzfu4nxEKe7U8Z1S8uEPl2UjLECv39gscdEZWjbHzDR2OoPVCQxPBTesJVuo312w3kJO5BtexlgwEyYvqtdRmu/jPJ5Jze4m/TPOFUw+1QU1MlHcnuRGYY2qZhVgc0GVCwvoWkiQQhHT+rmeH+i0jIshP4g8G9m5oVBfUjbAS5tq98ONLFLGs= devopslab@loveths-MBP-2.attlocal.net"
  
}

variable "ami" {
    description = "ami to use"
    type = string
    default = "ami-0aa2b7722dc1b5612"
  
}


variable "instance-type" {
    description = "instance type"
    type = string
    default = "t2.micro"
  
}


variable "name" {
    description = "name to use"
    type = string
    default = "github-action"
    
  
}
