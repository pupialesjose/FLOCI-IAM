$env:AWS_ENDPOINT_URL = "http://localhost:4566"
$env:AWS_ACCESS_KEY_ID = "test"
$env:AWS_SECRET_ACCESS_KEY = "test"
$env:AWS_DEFAULT_REGION = "us-east-1"

$usuario = "dev-lectura"
$politica = "S3SoloLectura"
$arn = "arn:aws:iam::000000000000:policy/$politica"

Write-Host "1. Creando usuario..."
aws iam create-user --user-name $usuario

Write-Host "2. Creando política..."
aws iam create-policy --policy-name $politica --policy-document file://politica-s3-lectura.json

Write-Host "3. Asociando política al usuario..."
aws iam attach-user-policy --user-name $usuario --policy-arn $arn

Write-Host "4. Creando access key..."
aws iam create-access-key --user-name $usuario

Write-Host "5. Verificación:"
aws iam list-attached-user-policies --user-name $usuario