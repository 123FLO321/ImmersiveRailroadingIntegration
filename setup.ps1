param (
	[string]$branch = "forge_1.12.2"
)

if(Test-Path -Path TrackAPI ){
		Remove-Item -Recurse -Force ./TrackAPI
}

git clone --branch $branch git@github.com:TeamOpenIndustry/TrackAPI.git

Add-Content -Path settings.gradle -Value "include 'TrackAPI'" 

(Get-Content src/main/java/cam72cam/immersiverailroading/Mod.java) -replace 'required-before:modcore', "required-before:modcore; required-after:trackapi@[1.1,)" | Set-Content src/main/java/cam72cam/immersiverailroading/Mod.java

(Get-Content build.gradle) -replace '^dependencies {', "apply from: 'ImmersiveRailroadingIntegration/dependencies.gradle'`r`ndependencies {" | Set-Content build.gradle 
