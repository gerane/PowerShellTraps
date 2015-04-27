
$Version = $PSVersionTable.PSVersion

task missing.command.1 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.1.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : CommandNotFoundException*Continued after missing-command*')
}

task missing.command.2 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.2.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught CommandNotFoundException')
}

task missing.command.3 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.3.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught CommandNotFoundException')
}

task test.2.1.division.by.zero {
	($r = PowerShell -Version $Version -NoProfile .\test.2.1.division.by.zero.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : RuntimeException*Continued after error*')
}

task test.2.2.division.by.zero {
	($r = PowerShell -Version $Version -NoProfile .\test.2.2.division.by.zero.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught RuntimeException')
}

task test.3.1.method.arguments {
	($r = PowerShell -Version $Version -NoProfile .\test.3.1.method.arguments.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : MethodCountCouldNotFindBest*Continued after error*')
}

task test.3.2.method.arguments {
	($r = PowerShell -Version $Version -NoProfile .\test.3.2.method.arguments.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught MethodCountCouldNotFindBest')
}
