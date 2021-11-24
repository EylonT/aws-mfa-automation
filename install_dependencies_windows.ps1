# The script will check if python is installed.
# It'll install choco and python if python doesn't exist. 
# after that the script will install the python script neccessary packages.
# In the end it'll install the aws cli and prompt the user to enter the credentials.

$service = python -V

if (-Not $service){
    Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
    Invoke-Expression -Command "choco install -y python3"
    choco install -y python3
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
    python -m pip install --upgrade pip
    pip install boto3 colorama
    msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qr
    sleep -Seconds 35
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
    aws configure
    }

else{
    python -m pip install --upgrade pip
    pip install boto3
    msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qr
    sleep -Seconds 35
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
    aws configure
}

Read-Host "Press enter to exit"