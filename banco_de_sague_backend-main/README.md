# Banco de Sangue - Backend

O projeto tem como objetivo facilitar a gestão de dados de candidatos para doação de sangue por meio de um sistema móvel digital, com as seguintes funcionalidades:

- Fazer upload de arquivos jsons com dados dos candidatos para doação de sangue;
- Listar os possíveis doadores de sangue;
- Informar quantos candidatos existem em cada estado do Brasil;
- Informar o IMC médio em cada faixa de idade de dez em dez anos;
- Informar o percentual de obesos entre os homens e entre as mulheres;
- Informar a média de idade para cada tipo sanguíneo;
- Informar a quantidade de possíveis doadores para cada tipo sanguíneo receptor.

Por fim, nesse repositório foi desenvolvido o backend do projeto.

## Tecnologias usadas

- Spring - Java
- MySql - SQL

## Configurações em localhost
    
  - instale o JDK21; 
  - Instale o Maven na sua máquina;
  - Instale o MySQL na sua máquina;
  - Crie um usuário chamado root no MySQL, se não houver;
  - Altere a senha de usuário para vazia também, se não estiver vazio;
  - Crie um banco de dados chamado "banco_de_sangue";

## Dependências implantadas

- Spring Web
- Spring Data JPA
- Lombok
- Spring Boot DevTools
- MySQL Driver

## Inicialização

### No Linux
        
  - Execute o comando para limpar e reconstruir o projeto spring no linux:
    - mvn clean package
    
  - Execute o comando para rodar o projeto no linux:
    - mvn spring-boot:run


### No Windows

  - Execute o comando para limpar e reconstruir o projeto spring no windows:
    -  ./mvnw clean package
        
  - Execute o comando para rodar o projeto no windows:
    - ./mvnw spring-boot:run

## Endpoints

[endpoints.json](./endpoints.json)
    
## Observação

Caso queira fazer a integração localmente entre esse backend e o frontend criado, você deve:

- Ver e copiar o ip de rede usb que conecta seu smartphone ao seu computador;
- Rodar o spring assim:
  - mvn spring-boot:run -Dserver.address=_ip-de-rede-usb-do-seu-celular_ -Dserver.port=8080


## Autor

Olá, sou o Lázaro Alexandre, um desenvolvedor full stack e futuro analista de sistemas apaixonado por transformar vidas através da inovação tecnológica.

Para mais informações, acesse o meu portifólio: https://homolazarus.netlify.app/

Estarei te aguardando ^-^