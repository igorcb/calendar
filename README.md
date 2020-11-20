## **Passo a passo para rodar o projeto em localhost**

**1- Primeiro passo é colonar o projeto**

```bash
git clone git@github.com:igorcb/calendar.git
```

**2- Entrar na pasta do projeto**

```bash
cd calendar
```

**3 - Configurar Banco de Dados, abara o arquivo config/database.yml, observe que o username e password está vindo de um arquivo de credênciais,**
**então vamos editar nossa credencial com o comando**

```bash
EDITOR='code --wait' 
```

**Pode acontecer de ser criado uma nova chave master.key e vc não abrir o editor, então vc deve apagar o config/master.key e config/credentials.yml.enc**

```bash
rm config/master.key
rm config/credentials.yml.enc
```

**4 - Vamos configurar o username e password no modo de desenvolvimento e test, coloque esse conteúdo e mude para o ser o username e password do seu**
**banco de dados.**

```ruby
development:
  postgres_username: seuusuario
  postgres_password: suasenha

test:
  postgres_username: seuusuario
  postgres_password: suasenha

```

**5 - Vamos instalar as gems**

```bash
bundle install
```

**6 - Rode o comando yarn para checar as dependèncias**

```bash
yarn install --check-files
```

**7 - Agora vamos criar o banco de dados e gerar as migrações**

```bash
rails db:create && rails db:migrate
```

**9 - Finalmente vamos subir o servidor local**

```bash
rails s
```

**Visite a url localhost:3000**
