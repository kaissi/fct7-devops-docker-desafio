## Code Education | Desenvolvimento de Aplicações Modernas e Escaláveis com Microsserviços

Code Education - Full Cycle Turma 7.  

Simples executável em Go extremamente reduzido em tamanho. Para conseguirmos essa redução, além de removermos as informações de debug, utilizamos UPX para comprimir o executável. **O resultado final é um executável 76% menor que o seu original!**

Este [artigo](https://blog.filippo.io/shrink-your-go-binaries-with-this-one-weird-trick/) esclarece todo o processo utilizado.

Compare os diferentes tamanhos do executável:
* Padrão: **1.23MB**
```bash
    go build -a -installsuffix cgo -o /go/bin/code-education-rocks
```
* Retirando informações de debug: **852kB**
```bash
    go build -ldflags '-w -s' -a -installsuffix cgo -o /go/bin/ code-education-rocks
```
* Retirando informações de debug + comprimindo com UPX: **286kB**
```bash
    go build -ldflags '-w -s' -a -installsuffix cgo -o /go/bin/code-education-rocks \
        && upx --brute /go/bin/code-education-rocks
```

---

## DevOps | Iniciando com Docker - Desafio Docker

Image Docker: [https://hub.docker.com/r/kaissi/codeeducation](https://hub.docker.com/r/kaissi/codeeducation).

## 1. Criando a imagem docker

```bash
docker build . -t kaissi/codeeducation:latest
```

## 2. Criando o container

```bash
docker run --rm --name code-education kaissi/codeeducation:latest
```

Resultado:
> Code.education Rocks!
