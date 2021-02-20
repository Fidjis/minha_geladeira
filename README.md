# Minha Geladeira

Projeto feito em Flutter, com conceitos de clean code, clean architecture, persistência com Firebase Firestore e gerência de estado utilizando MobX

## Proposta

Aplicativo para gerenciar os itens disponíveis na geladeira e monitorar o consumo.

Menu lateral com os botões:
    - Minha geladeira (tela inicial)
    - Histórico
    - Top 5 mais consumidos

[Tela] Minha geladeira
    - Lista com os produtos disponíveis e suas quantidades
    - Botão para adicionar novos itens na geladeira.
        - Ao clicar, abrir um modal para informar nome do item e sua quantidade.
        - Se o item já existir, deve-se somar com a quantidade atual.
    - Cada item da lista deve ter um botão para consumir
        - Ao clicar, abrir um modal para escolher a quantidade a ser consumida.

[Tela] Histórico da geladeira
    Essa tela deve mostrar uma lista com as movimentações da geladeira (adições e consumo dos produtos).
    - Ordenar do mais recente para o mais antigo
    - Filtro para exibir apenas adições ou apenas consumo
    - Cada registro deve informar se foi adição/consumo, quantidade adicionada/consumida e a data/hora do registro

[Tela] Top 5 mais consumidos
    - Exibir a lista dos 5 itens mais consumidos historicamente
        - Exibir o nome do item e a quantidade total consumida.


Observações:
- Os dados podem ser persistidos em memória, em um banco local ou em um banco remoto.
- Deixar o projeto disponível num repositório GIT público (github, gitlab, bitbucket, etc)

* As unidades de medidas podem ser abstraídas, você pode considerar tudo como unidade.
Ex:
- Leite: 3
- Ovo: 12
- Queijo: 2
- Alface: 1
- Cebola: 4


Requisitos opcionais, mas interessantes para ter:
    - Testes
    - Gerência de estado
    - Clean Code
    - Clean Architecture
    - Persistência com Firebase Firestore
    - Widgets customizados
