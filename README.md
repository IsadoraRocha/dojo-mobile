# Meu primeiro Dojo
- Este dojo tem como objetivo ensinar e melhorar a automação de aplicativos android.

# Configuração de ambiente

## Gemfile
- Para todo arquivo de automação em ruby é necessário um Gemfile. Arquivo que contém lista de gems que serão utilizadas ao longo do projeto.
- Para instalar as gems listadas no Gemfile é necessário realizar os seguintes passos:
    1. Abra o pront de comando no local do projeto que contém a automação.
    2. Instale o bundle com o comando:
    ```
      > gem install bundle
    ```
    3. Rode o seguinte comando para instalar as gems do Gemfile:
    ```
      > bundle install
    ```
    4. Desinstale o eventmachine:
    ```
      > gem uninstall eventmachine
    ```
    5. Instale novamente o eventmachine da seguinte maneira: 
    ```
      > gem isntall eventmachine --platform ruby
    ```

## env.rb
- Arquivo env.rb usa o require para chamar as gems listadas no Gemfile.
- Inicializa o Appium de acordo com o "Perfil" selecionado pela linha de comando.

## emulators.yml
- Contém as capabilities do aplicativo que será testado na automação.
- Essas capabilities são as informações necessárias para que o Appium consiga achar e abrir o aplicativo no dispositivo selecionado.

## cucumber.yml
- Contém os "Perfis" de aplicativos que serão usados na automação.
- Para cada perfil são definidas quais pastas ou arquivos que poderão ser acessadas.
- Esse perfil é selecionado por meio da linha de comando ao inicializar a automação com o seguinte comando: 
```   
   > cucumper -p <perfil>
```

# Objetivo do DOJO
- Fluxo principal:
    * Criar uma nova hora de despertador.

- Fluxos que poderão ser implementados:
    * Desabilitar o despertador.
    * Deletar o despertador.

# Regras do DOJO
- Deve ser criado um arquivo nome.feature dentro de specification, onde será criado o BDD com o cenário a ser automatizado.
- <b>Exemplo</b>:
    ```feature
    # language: pt
    # utf-8

    Funcionalidade:
        Eu como usuário...
        Quero...
        Para...

        Contexto: Realizar acao
            Dado que ...
        
        Cenario: Cenario de teste
            Quando...
            Entao...
    ```
- Deve ser criado um arquivo nome_screen.rb dentro da pasta screen. Esse deve conter:
    * Uma classe que possui o caminho de cada elemento da tela que será utilizado na automação.
    * Essa classe deve chamar o mesmo arquivo equivalente em modules.
    * <b>Exemplo</b>:
    ```ruby
    require_relative '../local1/nome_objects'

    class NomeClasse < Appium::Driver
      include NomeObjects
      def initialize
          # variaveis de instância que contenham o caminho do elemnto na tela
          @variavel_um = '//android.widget.TexteView'
      end
    end
    ```

- Deve ser criado um arquivo nome_object.rb dentro da pasta modules. Esse deve conter:
    * Um módulo com todas as funções que serão chamadas dentro dos steps.
    * <b>Exemplo</b>:
    ```ruby
    module ModulObjects
      def funcao_um
        #codigo da funcao
      end

      def funcao_dois
        #codigo da funcao
      end

      .
      .
      .
        
    end
    ```

- Deve ser criado um arquivo nome_steps.rb dentro de step_definitions que conterá cada linha escrita no BDD com as respectivas funções necessárias para a realização daquele step.
- <b>Exemplo</b>:
    ```ruby
    Dado("acao do dado") do 
      @var = Objetos.isntanciar :Classe
      @var.funcao_um
    end

    Quando("acao com {string}") do |variavel|
      @var.funcao_dois
    end

    Entao("validacao do teste") do
      @var.validacao
    end
    ```

## Informações importantes
- Variáveis em ruby:
  * Variável local: nome_variavel 
  * Variável global: $nome_variavel
  * Constante:  NOME_VARIAVEL
  * Variáveis de instância que implementam os atributos de uma classe: @nome_variavel 

- Criando uma função:
    ```ruby
    def nome_função
        ...
    end
    ```

- Criando uma classe:
    ```ruby
    class nome_classe
        ...
    end
    ```

- Criando um módulo:
    ```ruby
    module nome_modulo
        ...
    end
    ```

    * <b>O que são módulos </b>: Módulos Ruby são similares a classes, pois também armazenam uma coleção de métodos, constantes e outras definições de módulos e classes. Entretanto, diferente das classes, você não pode criar objetos baseados em módulos nem pode criar módulos que herdam desse módulo. Ao invés disso, você especifica qual funcionalidade de um módulo específico você deseja adicionar a uma classe ou a um objeto específico. Módulos permanecem sozinhos, não há hierarquia de módulos ou herança. Módulos são um bom lugar para armazenar constantes em um local centralizado.

    * Um dos principais objetivos do Módulo é permitir que você defina métodos cujos nomes não irão colidir com aqueles definidos em outras partes de um programa.

- Comandos do selenium:
    * Achar o elemento pelo xpath:
      >  find_elements(:xpath, '//caminho') ou xpath('//caminho') 
    * Achar o elemento pelo id:
      > find_elements(:id, 'id_elemento') ou id('id_elemento')
    * Clicar no elemento de id indicado:
      > id(id_elemento).click
    * Escrever o que foi informado:
      > id(id_elemento).send_keys('12345')
    * Esperar até que o elemento apareça na tela para executar a próxima linha de código:
      > wait { driver.xpath('//caminho').displayed? }
    * Validar se o elemento contém o texto esperado:
      > expect(id(id_element).text).to eq('teste') 
    * Validar se o elemento existe:
      > expect(id(id_elemnt)).to be_truthy 
    * Para mais expect: https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/contain-exactly-matcher
    * sleep 2 : faz com que o programa pare por 2 segundos
    * scroll_to('texto') : desliza a tela para cima ou para baixo até encontrar aquele texto.

## Mapeando os elementos
Existem duas formas de mapear os elementos. Pelo uiautomatorviewer ou pelo appium.
Neste Dojo usaremos o uiautomatorviewer.
1. Para abrir o uiautomatorviewer tenha o android studio e o SDK instalados
2. Abra o cmd e dê o seguinte comando como ilustra o exemplo abaixo
````
    > uiautomatorviewer
````
![uiautomatorviewer cmd](https://user-images.githubusercontent.com/32463533/74679751-769df480-519d-11ea-88e5-3f5c36c899cf.png)

4. Quando o programa se abrir esteja com o dispositivo móvel aberto na tela que deseja mapear e clique no icone verde no canto superior esquerdo. 
5. Você obetrá um screenshot da tela mostrando as informações de cada elemento presente naquela tela
![uiautomatorviewer](https://user-images.githubusercontent.com/32463533/74679771-861d3d80-519d-11ea-8a73-04e11e22c58a.gif)

## Fontes
- https://medium.com/@rogeriozambon/escopo-de-vari%C3%A1veis-do-ruby-cd3952c8f738
- https://medium.com/@dticed/o-gemfile-e-o-bundler-27195db20b04
- https://guru-sp.github.io/tutorial_ruby/modulos-mixins.html
- http://www.automationtestinghub.com/apppackage-and-appactivity-name/
- https://github.com/eventmachine/eventmachine
