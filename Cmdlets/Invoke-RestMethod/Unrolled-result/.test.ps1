
if ($PSVersionTable.PSVersion.Major -eq 2) {task skip; return}

task Test-1.Issue {
	($r = .\Test-1.Issue.ps1)
	equals $r 'Object[]'
}

task Test-2.Workaround {
	($r = .\Test-2.Workaround.ps1)
	assert ($r.Count -ge 2)
	equals $r[0] PSCustomObject
	equals $r[-1] PSCustomObject
}
