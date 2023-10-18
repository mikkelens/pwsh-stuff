Set-Variable PSPath -Option Constant (Split-Path $PROFILE -Parent)

# 'dot scoping' more stuff in
. ($PSPath + '.\local_paths.ps1')
. ($PSPath + '\rust_completions.ps1')
Set-Variable OMPPath -Option Constant ($PSPath + '.\catppuccin_frappe.omp.json')

oh-my-posh init pwsh --config $OMPPath | Invoke-Expression

Set-Variable GlazeWMFolder -Option Constant -Value ($LocalUserPath + '\.glaze-wm')
function Open-CLIPath {
	Start-Process $CLIPath
}
function Start-GlazeWM {
	Start-Process ($ToolPath + '\GlazeWM_x64_2.0.3')
}

New-Alias bib Build-Install-Binary
function Build-Install-Binary ($specifiedPath) {
	if ($specifiedPath) {
		$path = $specifiedPath
	}
	else {
		$path = '.'
	}
	cargo build --release
	cargo install $path
}
function Start-Code-New {
	code --new-window @args
}
function Start-Code-Bonus {
	$name = (Get-Item -Path .).BaseName
	$target = '.\' + $name + '-bonus.code-workspace'
	if (-not(Test-Path -Path $target)) {
		# Workspace file missing
		$type = '*.code-workspace'
		$local_workspace = Get-ChildItem -Filter $type | Select-Object -First 1
		if ($local_workspace.Exists) {
			# Use different (existing) local workspace file
			Copy-Item -Path $local_workspace -Destination $target
			$create_msg = 'Found local workspace ' + $local_workspace + ' and copied it.'
		}
		else {
			# Need to create new workspace file
			$settings_source = '.\.vscode\settings.json'
			if (Test-Path -Path $settings_source) {
				# Use settings for new workspace file
				$settings = Get-Content -Path $settings_source -Raw
				$content = "{`"folders`": [{ `"path`": `".`" }], `"settings`": " + $settings + '} // AUTOGENERATED BY POWERSHELL COMMAND'
				New-Item -Path $target -Value $content | Out-Null # Don't show created file
				$create_msg = 'Created from ' + $settings_source + '.'
			}
			else {
				# Copying template file
				Copy-Item -Path $WorkspaceBonusSamplePath -Destination $target
				$create_msg = 'Copied ' + $WorkspaceBonusSamplePath + '.'
			}
		}
		Write-Output $create_msg
	}
	$succes_msg = 'Opening ' + $target + ' in new window!'
	Write-Output $succes_msg
	code --new-window $target
}

# docs
function Open-RustBook { rustup docs --book }
New-Alias rustbook Open-RustBook

# directories
function  Set-Location-Rust { Set-Location $RustPath }
Set-Variable RustProjectsPath -Option Constant -Value ($RustPath + '\rust-projects')
function Set-Location-RustProjects { Set-Location $RustProjectsPath }
New-Alias cdrust Set-Location-Rust
New-Alias cdr Set-Location-Rust
New-Alias cdrustprojects Set-Location-RustProjects
New-Alias cdrp Set-Location-RustProjects

function Set-Location-Git { Set-Location $GitPath }
New-Alias cdgit Set-Location-Git
New-Alias cdg Set-Location-Git

# cargo shorthands
function Invoke-Cargo-Run { cargo run @args }
function Invoke-Cargo-Run-Release { cargo run --release @args }
function Invoke-Cargo-Build { cargo build }
function Invoke-Cargo-Build-Release { cargo build --release @args }
function Invoke-Cargo-Test { cargo test }
function Invoke-Cargo-Test-Release { cargo test --release @args }
New-Alias cr Invoke-Cargo-Run
New-Alias crr Invoke-Cargo-Run-Release
New-Alias cb Invoke-Cargo-Build
New-Alias cbr Invoke-Cargo-Build-Release
New-Alias ct Invoke-Cargo-Test
New-Alias ctr Invoke-Cargo-Test-Release

function Clear-Run { 
	Clear-Host
	Invoke-Cargo-Run @args
}
function Clear-Run-Release { 
	Clear-Host
	Invoke-Cargo-Run-Release @args
}
function Clear-Build {
	Clear-Host
	Invoke-Cargo-Build @args
}
function Clear-Build-Release {
	Clear-Host
	Invoke-Cargo-Build-Release @args
}
function Clear-Test {
	Clear-Host
	Invoke-Cargo-Test @args
}
function Clear-Test-Release {
	Clear-Host
	Invoke-Cargo-Test-Release @args
}
New-Alias clr Clear-Run
New-Alias clrr Clear-Run-Release
New-Alias clb Clear-Build
New-Alias clbr Clear-Build-Release
New-Alias clt Clear-Test
New-Alias cltr Clear-Test-Release

Set-Variable ClippyConfig -Option Constant -Value '-Wclippy::pedantic', '-Aclippy::uninlined_format_args', '-Aclippy::wildcard_imports'
function Fix_Clippy_With_Config {
	cargo clippy --fix -- $ClippyConfig
}
function Use_Clippy_With_Config {
	cargo clippy -- $ClippyConfig
}

function Start-Powershell-Window {
	Start-Process pwsh
}
New-Alias sps Start-Powershell-Window