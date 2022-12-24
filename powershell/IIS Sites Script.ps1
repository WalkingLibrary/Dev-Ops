#Import WebAdministration to manage IIS contents
Import-Module WebAdministration

#define a variable that will hold your html code
$html = "<html>`n<body>`n<div style='display:flex; flex-flow:column;'>`n<h1>SITES:</h1>"

# Get the IP address of the current system
$ip = (Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "IPv4"}).IPAddress

# Use the IP address in the root folder variable
$rootFolder = "http://$ip"



$Websites = Get-ChildItem IIS:\Sites

#loop on all websites inside IIS
foreach($Site in $Websites)
{
    $VDirs = Get-WebVirtualDirectory -Site $Site.name
    $WebApps = Get-WebApplication -Site $Site.name

    #loop on all virtual directories
    foreach ($vdir in $VDirs )
    {
    $html += "`n<a href='" + $rootFolder + $vdir.path +"'>" + $vdir.path + "</a><br/>"
    }
    #loop on all web applications
    foreach ($WebApp in $WebApps)
    {
    $html += "`n<a href='" + $rootFolder + $WebApp.path +"'>" + $WebApp.path + "</a><br/>"
    }
}
#add final tags to html
$html += "`n</div>`n</body>`n</html>"

#write html code to file
$html > "C:\inetpub\wwwroot\home.html"