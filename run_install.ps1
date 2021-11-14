$run = "$PWD\install_dependencies.ps1"
Start-Process powershell -ArgumentList "-ExecutionPolicy RemoteSigned -File `"$run`"" -Verb RunAs