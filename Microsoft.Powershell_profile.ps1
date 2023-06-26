# appearaance
oh-my-posh init pwsh --config "C:\Users\mikke\Documents\PowerShell\catppuccin_frappe.omp.json" | Invoke-Expression

# // git related //
function cd-git { cd "C:\Users\mikke\Desktop\repos\" }
New-Alias cdgit cd-git

# // rust related //
# docs
function rust-book { rustup docs --book }
# function rust-book { Start "C:\Users\mikke\Desktop\Git\Rust\the-book\book\index.html" }
New-Alias rustbook rust-book
# directories
function cd-rust { cd "C:\Users\mikke\Desktop\repos\rust\" }
function cd-rust-projects { cd "C:\Users\mikke\Desktop\repos\rust\rust-projects\" }
New-Alias cdrust cd-rust
New-Alias cdrustprojects cd-rust-projects
# applications
function clion { Start "C:\Users\mikke\AppData\Local\JetBrains\Toolbox\apps\CLion\ch-0\222.3345.126\bin\clion64.exe" }
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