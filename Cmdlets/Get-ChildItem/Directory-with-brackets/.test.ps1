
$Version = $PSVersionTable.PSVersion.Major

task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)

	# one item "testdir"
	equals $r.NoRecurse.Name 'testdir'

	if ($Version -eq 2 -or $Version -eq 5) {
		# one item "testdir"
		equals $r.NoRecurse.Name 'testdir'
	}
	else {
		# nothing
		equals $r.Recurse
	}
}
