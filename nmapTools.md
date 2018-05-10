# nmap tools

> **-D** 
> 
> Allows you to hide your IP between many, in order to confuse attempts to identify the source...

**-sU** > scan UDP ports as well as TCP ports

**-iL** > scan List *listname.txt*

**-oN** > save output to *thefile.txt*

````
nmap -sS 192.168.89.191 -D 10.0.0.1,10.0.0.2,10.0.0.4
````

