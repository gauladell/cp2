# Requisitos

## Crear archivo azr_vars.yml dentro del directorio vars con los siguientes parámetros:

```yaml
AZR_TOKEN: ""
AZR_USER: ""
AZR_REGISTRY: ""
AZR_IMAGE: ""
AZR_TAG: ""
```

## Crear archivo inventory en el que añadir:

```yaml
[podman]
<lista de hosts en los que queremos ejecutar los procesos de podman>
```
