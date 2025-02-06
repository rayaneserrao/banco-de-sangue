# Banco de Sangue - Backend

O projeto tem como objetivo facilitar a gestão de dados de candidatos para doação de sangue por meio de um sistema móvel digital, com as seguintes funcionalidades:

- Fazer upload de arquivos jsons com dados dos candidatos para doação de sangue;
- Listar os possíveis doadores de sangue;
- Informar quantos candidatos existem em cada estado do Brasil;
- Informar o IMC médio em cada faixa de idade de dez em dez anos;
- Informar o percentual de obesos entre os homens e entre as mulheres;
- Informar a média de idade para cada tipo sanguíneo;
- Informar a quantidade de possíveis doadores para cada tipo sanguíneo receptor.

Por fim, nesse repositório foi desenvolvido o frontend mobile do projeto.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Em seguida, pegue o ip de internet cabeada usb entre o seu smartphone e a sua máquina e adicione na baseUrl: 

[baseUrl](./lib/src/constants/api_constant.dart)

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- Baixar e instalar dependências:
    - flutter pub get
  
- Esolher o dispositivo:
    - flutter devices

- Rodar o aplicativo:
  - flutter run -d _nome_do_dispositivo_

## Autor

Olá, sou o Lázaro Alexandre, um desenvolvedor full stack e futuro analista de sistemas apaixonado por transformar vidas através da inovação tecnológica.

Para mais informações, acesse o meu portifólio: https://homolazarus.netlify.app/

Estarei te aguardando ^-^
