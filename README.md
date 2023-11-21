# scripts.pub - public scripts

If running on Windows, first set up WSL and install Ubuntu

```powershell
# Powershell
wsl --install -d Ubuntu
```

Run a GitHub bootstrap script (listed below) to set your WSL environment up with SSH via guided installation

- [Debian v2](./provision/github-bootstrap-v2.sh) [(Direct Download, right-click + save-as)](https://raw.githubusercontent.com/jameswilliamknight/scripts.pub/master/provision/github-bootstrap-v2.sh)


Finally, run a further provisioning script from one of your repositories to set up the remaining packages and configure your WSL environment.
