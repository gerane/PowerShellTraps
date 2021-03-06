
$Version = $PSVersionTable.PSVersion.Major

task Test-1.strict.v2 {
	$r = .\Test-1.strict.v2.ps1
	equals $r $true
}

task Test-2.strict.latest.ps1 {
	($r = try {.\Test-2.strict.latest.ps1} catch {$_})
	if ($Version -eq 2) {
		equals $r $null
	}
	else {
		equals $r.FullyQualifiedErrorId System.Management.ManagementException
	}
}
