import pyaccesspoint
import os

# Definir as configurações do ponto de acesso
ssid = "myAP"               # Nome do ponto de acesso
password = "mypassword"     # Senha do ponto de acesso
interface = "wlan0"         # Interface do adaptador sem fio
channel = 6                 # Canal do ponto de acesso

# Criar o objeto AccessPoint com as configurações definidas
ap = pyaccesspoint.AccessPoint(ssid=ssid, password=password, interface=interface, channel=channel)

# Iniciar o ponto de acesso
ap.start()

# Configurar endereço IP estático para a interface WLAN
os.system("sudo ifconfig wlan0 192.168.4.1 netmask 255.255.255.0 up")