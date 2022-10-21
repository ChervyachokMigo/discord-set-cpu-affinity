$ProcessName = "discord";

$processors = [Int]$env:NUMBER_OF_PROCESSORS;
$newAffinity=[int][Math]::Pow(2, $processors) - 1;
$newAffinity -= 3;

$process = Get-Process $ProcessName;
foreach ($p in $process){$p.ProcessorAffinity = $newAffinity;}
Get-Process $ProcessName | Format-List ProcessorAffinity;
