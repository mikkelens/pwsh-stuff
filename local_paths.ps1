Set-Variable LocalUserPath -Option Constant -Value 'C:\Users\mikke'
Set-Variable ExternalDrivePath -Option Constant -Value 'F:'

Set-Variable GitPath -Option Constant -Value ($ExternalDrivePath + '\repos')
Set-Variable RustPath -Option Constant -Value ($GitPath + '\rust')

Set-Variable ToolPath -Option Constant -Value ($ExternalDrivePath + '\tools')
Set-Variable CLIPath -Option Constant -Value ($ToolPath + '\cli')
Set-Variable WorkspaceBonusSamplePath -Option Constant -Value ($CLIPath + '\bonus.code-workspace')