Set-Variable UserPath -Option Constant -Value 'C:\Users\Mikkel'
Set-Variable DesktopPath -Option Constant -Value ($UserPath + '\Desktop')

Set-Variable ExternalDrivePath -Option Constant -Value 'F:'
Set-Variable GitPath -Option Constant -Value ($ExternalDrivePath + '\Git')
Set-Variable RustPath -Option Constant -Value ($GitPath + '\Rust')

Set-Variable ToolPath -Option Constant -Value ($ExternalDrivePath + '\Tools')
Set-Variable CLIPath -Option Constant -Value ($ToolPath + '\CLI')
Set-Variable WorkspaceBonusSamplePath -Option Constant -Value ($CLIPath + '\bonus.code-workspace')