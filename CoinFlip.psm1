function Get-CoinFlip {
    param (
        [Parameter(Mandatory=$true)]
        [int]$FlipCount
    )
    $now = Get-Date
    $headsCount = 0
    $tailsCount = 0

    for ($i = 1; $i -le $flipCount; $i++) {
        $coin = Get-Random -Minimum 0 -Maximum 2
        if ($coin -eq 0) {
            $headsCount++
        }
        else {
            $tailsCount++
        }
    }

    $headsPct = $headsCount / $flipCount * 100
    $tailsPct = $tailsCount / $flipCount * 100

    Write-Host "Heads count: $headsCount ($([math]::Round($headsPct,3))%)"
    Write-Host "Tails count: $tailsCount ($([math]::Round($tailsPct,3))%)"

    $majority = [math]::Abs($headsCount - $tailsCount)
    $majorityPct = $majority / $flipCount * 100
    if ($headsCount -gt $tailsCount) {
        Write-Host "Heads wins, majority of $($headsCount - $tailsCount) ($([math]::Round($majorityPct,3))%)!"
    } else {
        Write-Host "Tails wins, majority of $($tailsCount - $headsCount) ($([math]::Round($majorityPct,3))%)!"
    }
    $now2 = Get-Date
    Write-Host "A coin was flipped $flipCount times in $([math]::round(((($now2 - $now).Ticks)/10000000),4)) seconds"

    Clear-Variable headsCount
    Clear-Variable tailsCount
    Clear-Variable headsPct
    Clear-Variable tailsPct
    Clear-Variable majority
    Clear-Variable flipCount
    Clear-Variable coin
    Clear-Variable now
    Clear-Variable now2
}

# Export the function so it's available when the module is imported
Export-ModuleMember -Function Get-CoinFlip
