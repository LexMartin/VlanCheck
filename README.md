# Script para pruebas End to End
Script en bash para realizar pruebas de comunicación mediante Vlans.

### Prerrequisitos
* Tener activado el modulo 802.1q
```bash
$ modprobe 8021q
```
* Archivo con los datos a configurar un parámetro por línea
```
Vlan
ip_nodo
IP_Gateway
iP_ALU
IP_RNC
```
### USO

```Bash
$ ./vlancheck.sh [archivo_config]
```
