## ▶️ run-servers

1. Configurar las [variables](./variables.env) con las rutas de Java y Maven.
2. Configurar la lista de [servidores](./servers.csv)
3. Ejecutar script

```shell
cd src
./main.sh
```

---
 
> Buscar proceso mediante número de puerto:
> ```
> netstat -ano | findstr :<PORT_NUMBER>
> ```
> 
> Matar proceso por PID:
> ```shell
> taskkill /PID <PID_ID> /F
> ```