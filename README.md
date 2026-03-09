# Protheus Docker 12.1.2410

Imagem Docker para execução do **TOTVS Protheus 12** (AppServer), versão 12.1.2410, em ambiente containerizado.

## Descrição

Este projeto monta uma imagem Docker Protheus 12.1.2410, sobre Oracle Linux 9. A imagem é útil para ambientes de desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

### Características

- **Base:** feliperaposo/protheus-base:24 (Onça Preta)
- **Protheus:** AppServer (porta TCP 1234)
- **REST API:** Habilitada na porta 8080 (`/api`)
- **HTTP Server:** Porta 9995 para conteúdo estático (`/rest`)
- **Configuração dinâmica:** Banco de dados definido via variável de ambiente `APPSERVER_DATABASE`

## Pré-requisitos

- Docker (com BuildKit habilitado para build)

## Build

```bash
# Build local das tags de versão
make build
```

## Publicação da imagem

```bash
# Build e push das tags de versão
make release

# Incluir também a tag latest
make release_latest
```

Gera as tags:

- `feliperaposo/protheus:p12.1.2410`
- `feliperaposo/protheus:latest`

## Estrutura interna (referência)

- **Entrypoint:** `/protheus.sh`
- **APO:** `/protheus12/apo/`
- **AppServer:** Descompactação automática de `appserver.tar.xz` em `/protheus12/bin/appserver` na primeira inicialização
- **Configuração:** `appserver.ini` (parâmetro `{{APPSERVER_DATABASE}}` substituído em runtime)
- **Protheus Data:** `/protheus12/protheus_data/`
- **SystemLoad:** Descompactação automática de `systemload.tar.xz` em `/protheus12/protheus_data/systemload` na primeira inicialização

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
