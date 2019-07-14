#!/bin/bash

ArchivoConf=$1

index=0

while read linea ; do
	Datos[$index]="$linea"
	index=$(($index+1))
done < $ArchivoConf

VLAN=${Datos[0]}
IP_NODO=${Datos[1]}
IP_GATEWAY=${Datos[2]}
IP_ALU_CASCADA=${Datos[3]}
IP_RNC=${Datos[4]}

echo $VLAN
vconfig add eth0 ${VLAN}
sudo ifconfig eth0.${VLAN} ${IP_NODO}/29
sudo route add default gw ${IP_GATEWAY}

Fecha=$(date +"%m-%d-%y") 

ifconfig eth0.${VLAN} | tee ${ArchivoConf}-${Fecha}
route | tee >>${ArchivoConf}-${Fecha}

ping -c 1 ${IP_GATEWAY} | tee >>${ArchivoConf}-${Fecha}
ping -c 1 ${IP_ALU_CASCADA} | tee >>${ArchivoConf}-${Fecha} 
ping -c 1 ${IP_RNC} | tee >>${ArchivoConf}-${Fecha}

vconfig rem eth0.${VLAN}

exit
