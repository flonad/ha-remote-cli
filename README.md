haproxy-remote
--------------

#### Qu'est ce que c'est?

Ce script se connecte a une socket TCP sur laquelle est exposé la socket d'administration HAproxy.

On peut le faire par exemple avec socat

```
EXPOSED_PORT=4001
HAPROXY_SOCKET=/var/run/haproxy.socket
socat TCP-LISTEN:$EXPOSED_PORT,reuseaddr,fork UNIX-CLIENT:$HAPROXY_SOCKET
```

#### Comment ca marche?

En exposant la socket à distance, on peut s'y connecter et passer directement des commandes. Elles permettent par exemple d'afficher les statistiques ou de passer des commandes d'administration sur les serveurs.

#### Configuration

Il est nécessaire d'avoir les flux vers le port exposé par socat sur le haproxy.

Positionner les variables d'environnement suivantes pour définir l'instance de HAproxy à administrer 

```
HA_HOST
HA_PORT
```
