# appearaance
oh-my-posh init pwsh --config "C:\Users\Mikkel\Documents\PowerShell\catppuccin_frappe.omp.json" | Invoke-Expression

# git related
function cd-git { Set-Location "F:\Git\" }
New-Alias cdgit cd-git

# PC ADDITIONS:
Set-Variable ToolPath -Option Constant -Value "F:\Tools\CLI"
function ToolFolder {
	Start $ToolPath
}
function Build-Install-Binary {
	cargo build --release
	cargo install .
}

# docs
function rust-book { rustup docs --book }
New-Alias rustbook rust-book
# directories
function cd-rust { Set-Location "F:\Git\Rust\" }
function cd-rust-projects { Set-Location "F:\Git\Rust\rust-projects\" }
New-Alias cdrust cd-rust
New-Alias cdrustprojects cd-rust-projects
# applications
function clion { Start-Process "C:\Users\mikke\AppData\Local\JetBrains\Toolbox\apps\CLion\ch-0\222.3345.126\bin\clion64.exe" }
function clion-here { clion . }
New-Alias clionhere clion-here
New-Alias clion clion-here
# building
function clear-run { 
	Clear-Host
	cargo run
}
New-Alias clearrun clear-run
New-Alias crun clear-run
function clear-build {
	Clear-Host
	cargo build
}
New-Alias clearbuild clear-build
New-Alias cbuild clear-build