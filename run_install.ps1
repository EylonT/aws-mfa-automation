$run = "$PWD\install_dependencies_windows.ps1"
Start-Process powershell -ArgumentList "-ExecutionPolicy RemoteSigned -File `"$run`"" -Verb RunAs