<# 
    form creator: poshgui.com
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

Function Display-Test{
    return 'This is a test'
}

Function Create-Gui{
    $EnvPrep                         = New-Object system.Windows.Forms.Form
    $EnvPrep.ClientSize              = '400,400'
    $EnvPrep.text                    = "EnvPrep"
    $EnvPrep.TopMost                 = $false

    $EnvInput                        = New-Object system.Windows.Forms.TextBox
    $EnvInput.multiline              = $false
    $EnvInput.width                  = 100
    $EnvInput.height                 = 20
    $EnvInput.Location               = New-Object System.Drawing.Point(12,12)
    $EnvInput.Font                   = 'Microsoft Sans Serif,10'

    $Env                             = New-Object system.Windows.Forms.Label
    $Env.text                        = "Env"
    $Env.AutoSize                    = $true
    $Env.width                       = 25
    $Env.height                      = 10
    $Env.location                    = New-Object System.Drawing.Point(124,14)
    $Env.Font                        = 'Microsoft Sans Serif,10'

    $Run                             = New-Object system.Windows.Forms.Button
    $Run.text                        = "Run"
    $Run.width                       = 60
    $Run.height                      = 30
    $Run.location                    = New-Object System.Drawing.Point(12,56)
    $Run.Font                        = 'Microsoft Sans Serif,10'



    $EnvPrep.controls.AddRange(@($EnvInput,$Env,$Run))

    $Run.Add_Click({ $Env.text = Display-Test })

    [void]$EnvPrep.ShowDialog()
}

Create-Gui
