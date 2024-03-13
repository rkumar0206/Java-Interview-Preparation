function Start-Stopwatch {
    $global:StartTime = Get-Date
    $global:Running = $true
    while ($global:Running) {
        if (-not (IsScreenOn)) {
            Pause-Stopwatch
        }
        Update-Time
        Start-Sleep -Seconds 1
    }
}

function Pause-Stopwatch {
    $global:Running = $false
}

function Update-Time {
    $elapsedTime = (Get-Date) - $global:StartTime
    $hours = $elapsedTime.Hours
    $minutes = $elapsedTime.Minutes
    $seconds = $elapsedTime.Seconds
    Write-Host ("{0:D2}:{1:D2}:{2:D2}" -f $hours, $minutes, $seconds)
}

function IsScreenOn {
    $powerStatus = Get-WmiObject -Class Win32_PowerStatus
    return $powerStatus.PowerOnLine -eq $true
}

# Example usage:
Start-Stopwatch
