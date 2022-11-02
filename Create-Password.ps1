function Create-Password {

    # Symbols
    $SymbolsArray = @()
    33,35,36,37,38,40,41,47 | % { $SymbolsArray += [char][byte]$_ }

    # Lower case
    $LowerCaseArray = @()
    97..122 | % { $LowerCaseArray += [char][byte]$_ }

    # Upper case
    $UpperCaseArray = @()
    65..90 | % { $UpperCaseArray += $_ }

    # Lower case vowel. letter o is removed
    $LowerCaseVowelArray = @()
    97,101,105,117,121 | % { $LowerCaseVowelArray += [char][byte]$_ }

    # Lower case consonant
    $LowerCaseConsonantArray = @()
    98,99,100,102,103,104,106,107,108,109,110,112,113,114,115,116,118,119,120,122 | % { $LowerCaseConsonantArray += [char][byte]$_ }

    # Upper case vowel
    $UpperCaseVowelArray = @()
    65,69,73,85,89 | % { $UpperCaseVowelArray += [char][byte]$_ }

    # Upper case consonant
    $UpperCaseConsonantArray = @()
    66,67,68,70,71,72,74,75,76,77,78,80,81,82,83,84,86,87,88,90 | % { $UpperCaseConsonantArray += [char][byte]$_ }

    # Numbers
    $NumbersArray = @()
    48..57 | % { $NumbersArray += [char][byte]$_ }



    $Combinations = "nn,nn,ss,lc,lc,lc,uc,uc,uv,lc,lc,ss,uc,uc,uc,uc","ss,uc,uc,uc,lc,lc,lc,lc,uv,ss,nn,nn,uc,uc,uc,uc","ss,uc,uc,uc,lc,lc,uv,uc,uc,ss,nn,nn,uc,uc,uc,uc"
    $UseCombination = Get-Random $Combinations

    $PWOutput = $null

    $UseCombination.split(',') | ForEach-Object { 

        if($_ -eq 'nn'){
            $PWOutput += Get-Random -InputObject $NumbersArray -Count 1
        }
        elseif($_ -eq 'ss'){
            $PWOutput += Get-Random -InputObject $SymbolsArray -Count 1
        }
        elseif($_ -eq 'lv'){
            $PWOutput += Get-Random -InputObject $LowerCaseVowelArray -Count 1
        }
        elseif($_ -eq 'uv'){
            $PWOutput += Get-Random -InputObject $UpperCaseVowelArray -Count 1
        }
        elseif($_ -eq 'lc'){
            $PWOutput += Get-Random -InputObject $LowerCaseConsonantArray -Count 1
        }
        elseif($_ -eq 'uc'){
            $PWOutput += Get-Random -InputObject $UpperCaseConsonantArray -Count 1
        }
        else{

        }
    }
    Write-output $PWOutput
}
