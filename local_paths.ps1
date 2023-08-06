Set-Variable UserPath -Option Constant -Value 'C:\Users\mikke'
Set-Variable DesktopPath -Option Constant -Value ($UserPath + '\Desktop')

Set-Variable GitPath -Option Constant -Value ($DesktopPath + '\repos')
Set-Variable RustPath -Option Constant -Value ($GitPath + '\rust')

Set-Variable ToolPath -Option Constant -Value ($DesktopPath + '\cli-tools')
Set-Variable WorkspaceBonusSamplePath -Option Constant -Value ($ToolPath + '\bonus.code-workspace')