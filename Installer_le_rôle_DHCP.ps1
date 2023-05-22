# Installer le rôle DHCP
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# Créer une nouvelle étendue DHCP
# Remplacer les valeurs par celles de votre environnement
$dhcpServer = "localhost"
$scopeName = "MyDHCPScope"
$startRange = "192.168.1.2"
$endRange = "192.168.1.254"
$subnetMask = "255.255.255.0"
$dnsServer = "192.168.1.1"
$defaultGateway = "192.168.1.1"

# Ajouter l'étendue DHCP
Add-DhcpServerv4Scope -ComputerName $dhcpServer -Name $scopeName -StartRange $startRange -EndRange $endRange -SubnetMask $subnetMask

# Définir les options d'étendue (DNS et passerelle par défaut)
Set-DhcpServerv4OptionValue -ComputerName $dhcpServer -ScopeId $startRange -DnsServer $dnsServer -Router $defaultGateway

# Activer l'étendue
Set-DhcpServerv4Scope -ComputerName $dhcpServer -ScopeId $startRange -State Active
