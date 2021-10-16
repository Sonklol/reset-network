:: SCRIPT DISEÑADO PARA CAMBIAR DNS'S A LAS DE GOOGLE, HACER FLUSH DNS Y RENOVAR CONCESIÓN DEL DHCP
title RESTART NETWORK - IES VASCO DE LA ZARZA

:: PING GOOGLE Y DNS'S
set /p pgoogle=¿Quieres hacer ping a Google? [S/n]: 
if %pgoogle% EQU s (
    ping google.es
) else (
    if %pgoogle% EQU S (
    ping google.es
    ) 
)

set /p pdnsgoogle= ¿Quieres hacer ping a las DNS's de Google? [S/n]: 
if %pdnsgoogle% EQU s (
    ping 8.8.8.8
) else (
    if %pdnsgoogle% EQU S (
    ping 8.8.8.8
    ) 
)

:: Ver las interfaces de red
netsh interface show interface

:: Cambiar DNS
set /p interfaz= Escribe el nombre de la interfaz de red que quieres usar TAL CUAL APARECE ARRIBA: 
netsh interface ipv4 set dnsservers %interfaz% static 8.8.8.8 primary
netsh interface ipv4 add dnsservers %interfaz% 8.8.4.4 index=2 

cls

:: Renovar cache DNS
ipconfig /flushdns

cls

:: Renovar concesiones de DHCP
ipconfig /release
ipconfig /renew

cls

ipconfig /all

echo PROCESO COMPLETO
PAUSE