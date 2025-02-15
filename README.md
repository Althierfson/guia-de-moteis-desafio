# Guia de Motéis - Desafio Técnico Flutter

## 📌 Sobre o Projeto
Este projeto foi desenvolvido como parte do desafio técnico para a empresa **Guia de Motéis**. O objetivo foi avaliar minhas habilidades em **Flutter, Dart, gerenciamento de estado, consumo de API e testes unitários**.

O desafio consistiu em criar uma réplica da aba **"Ir Agora"** da listagem de motéis do aplicativo **Guia de Motéis GO**, consumindo dados de APIs mock.

## 📽️ Video de apresentação do APP

Assista ao vídeo demonstrativo do app e suas funcionalidades no YouTube: [🔗 Link para o vídeo](https://youtu.be/yn_OFNeleaM)

## 📷 Capturas de tela

<div align="center">
  <img src="https://github.com/Althierfson/guia-de-moteis-desafio/blob/main/screenshots/screenshot-2025-02-15_16.01.08.014.png?raw=true", width="250px"/>
  <img src="https://github.com/Althierfson/guia-de-moteis-desafio/blob/main/screenshots/screenshot-2025-02-15_16.01.18.079.png?raw=true", width="250px"/>
  <img src="https://github.com/Althierfson/guia-de-moteis-desafio/blob/main/screenshots/screenshot-2025-02-15_16.01.43.102.png?raw=true", width="250px"/>
</div>

## 🚀 Tecnologias Utilizadas
- **Flutter** e **Dart** para desenvolvimento mobile
- **Flutter Modular** para modularização do app
- **HTTP package** para consumo de APIs
- **Bloc** para gerenciamento de estado
- **Flutter Test** para implementação de testes unitários

## 📂 Estrutura do Projeto
O projeto segue a estrutura baseada em **Dart Clean Architecture**, garantindo organização e escalabilidade:

```
/lib
│-- /app                  # Configurações globais do app
|   |-- /theme            # Definições de temas e estilos globais
|   |-- app_modular.dart  # Configuração do Flutter Modular
|   |-- app_widget.dart   # Widget raiz do app
│-- /modules              # Módulos independentes da aplicação
|   |-- /{module_name} 
|   |   |-- /domain       # Regras de negócio e entidades
|   |   |-- /ext          # Extensões e helpers específicos do módulo
|   |   |-- /infra        # Implementações de repositórios e acesso a dados
|   |   |-- /presentation # Camada de UI e lógica de apresentação
│-- /utils                # Funções auxiliares e utilitários globais
│-- main.dart             # Ponto de entrada da aplicação

/test                     # Testes unitários
```

## 🎯 Funcionalidades Implementadas
✅ Listagem de motéis com **nome, preço e imagem** \
✅ Consumo da API para obter os dados dinâmicos \
✅ Uso de **Flutter Modular** para modularização do app \
✅ Uso de **gerenciamento de estado eficiente (bloc)** \
✅ **Testes unitários** cobrindo os principais componentes \
✅ Código modularizado e seguindo **boas práticas de Flutter** 

## 🧪 Testes
Foram implementados testes unitários para garantir o funcionamento correto da listagem. A cobertura de testes está em **mais de 80%**.

Para rodar os testes, utilize o comando:
```sh
flutter test
```

## 🚀 Como Executar o Projeto
1. Clone este repositório:
   ```sh
   git clone https://github.com/Althierfson/guia-de-moteis-desafio.git
   ```
2. Acesse a pasta do projeto:
   ```sh
   cd guia-de-moteis-desafio
   ```
3. Instale as dependências:
   ```sh
   flutter pub get
   ```
4. Execute o app:
   ```sh
   flutter run
   ```

## Sdk Flutter
- `Flutter`: 3.27.3
- `Dart`: 3.6.1

## 🔗 Contato & Projetos Relacionados

- **Meu LinkedIn**: [🔗 linkedin.com](https://www.linkedin.com/in/althierfson/)
- **Meu github**: [🔗 github.com](https://github.com/Althierfson)
- **Outros Projetos Interessantes**:
  - [🔗 Meu Canal no Youtube](https://www.youtube.com/@cajucode)


