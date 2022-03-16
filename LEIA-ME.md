# ematUFRB.cls

> Template em LaTeX2e para V Emat

## Para ler esse texto

Esse texto para leitura foi escrito em Markdown.
Para que a saída seja mais agradável, você pode lê-lo em alguma IDE que renderiza
tal linguagem, ou no _link_ : 
"https://github.com/icaro-freire/ematUFRB/blob/main/LEIA-ME.md"

## Do que se trata?

O `V Emat` é a 5º edição do Encontro de Matemática do Centro de Formação de 
Professores, da Universidade Federal do Recôncavo da Bahia.

Esse repositório servirá para versões da classe `ematUFRB`, em LaTeX2e, para 
_template_ de resumo para esse encontro de Matemática.

## Como estão distribuídos os arquivos nesse diretório?

A árvore abaixo expressa os subdiretórios e arquivos que se encontram nesse
diretório (por nome `v-emat`).

<pre>
📦v-emat
 ┣ 📂bib
 ┃ ┗ 📜referencias.bib
 ┣ 📂cls
 ┃ ┗ 📜ematUFRB.cls
 ┣ 📂figs
 ┃ ┣ 📜logo_v-emat.jpg
 ┃ ┗ 📜ufrb.png
 ┣ 📂tex
 ┃ ┣ 📜01_secao.tex
 ┃ ┣ 📜02_secao.tex
 ┃ ┗ 📜03_secao.tex
 ┣ 📜.gitignore
 ┣ 📜README.md
 ┗ 📜main.tex
</pre>

O que segue são explicações sobre essa estrutura.

- **main.tex**. Esse é o arquivo onde deve ocorrer a "compilação" do documento.
A compilação deve ser realizada em LuaLaTeX (ou XeLaTeX). Também nesse arquivo 
encontram-se os locais para inserir o Título e os nomes dos autores;
- **README.md**. Descrição inicial do repositório no GitHub;
- **.gitignore**. Arquivo especial para indicar outros arquivos que não devem ser
versionados pelo Git.
- **tex/**. Nesse diretório (pasta), deve-se conter as seções do texto que será
enviado para avaliação. Se houver mudança nos nomes do arquivo, também deverá ser
mudado no respectivo comando (`input{}`) dentro do arquivo `main.tex`;
- **figs/**. Aqui deve-se colocar todas as possíveis figuras do texto. Nela já
se encontram duas figuras: `logo_v-emat.jpg` e `ufrb.png`; que são usadas no 
cabeçalho da classe;
- **cls/**. Nesse diretório encontra-se o arquivo `.cls` da classe `ematUFRB`.
Não deverá ser modificado!
- **bib/**. Aqui se encontra o arquivo `referencias.bib`. Como o próprio nome 
sugere, as referências bibliagráficas devem ser colocadas nele. É usado o formato
`biblatex`. É altamente recomendado ler o manual do pacote [biblatex-abnt][BIB]
para conhecer as estruturas das referências nesse formato, usando o padrão da 
ABNT. Você pode gerenciar suas referências com o [JabRef][JAB]

[BIB]: https://github.com/abntex/biblatex-abnt/blob/dev/doc/biblatex-abnt.pdf
[JAB]: https://www.jabref.org/

## Dicas para compilação

Documentos com _links_ ou referências bibliográficas, exigem mais de um processo
de compilação.
Se você não quiser fazer isso manualmente, é possível utilizar ferramentas como
o `latexmk` ou o `arara`.

A classe foi construída com o auxílio do `arara`, uma ferramenta de automação 
TeX baseada em regras e diretivas.
Se você olhar o arquivo `main.tex`, haverá as seguintes diretivas (marcadas com
os comentários mágicos):

```
% arara: lualatex
% arara: biber
% arara: lualatex
% arara: lualatex if found('log', 'undefined references')
%% arara: clean: {extensions: [aux, bbl, bcf, blg, log, run.xml, pdf]}
```

Uma diretiva no arara inicia-se com o símbolo para comentário no LaTeX: `%`;
junto com o nome `arara:` (separado por espaço simplex) e um comando.

1. **% arara: lualatex** diz para que o arara compile o documento com `lualatex`, 
ou seja, usa o motor LuaTeX na composição tipográfica;
2. **% arara: biber** diz para o arara compilar as referências bibliográficas com
`biber` ;
3. **% arara: lualatex** novamente compila com `lualatex`. Isso é necessário para
que as referências seja inseridas no texto (no item 2 elas foram apenas geradas);
4. **% arara: lualatex if found('log', 'undefined references')** compila novamente
com `lualatex`, caso as referências dos links não estejam no arquivo `.log`.
5. **%% arara: clean: {extensions: [aux, bbl, bcf, blg, log, run.xml, pdf]}** 
esse comando faz uma "limpeza" dos arquivos gerados (inclusive do pdf). Note que
há duas `%`: isso suspende esse comando. Se você quer apagar os arquivos gerados,
deixe apenas com uma porcentagem.

Para que essa mágica aconteça, configure seu Editor de Texto de LaTeX para compilar
com o `arara` ou rode pelo terminal, em sitemas GNU/Linux; ou pelo `cmd`( _prompt de comando_ ), no Windows o comado:

```
arara -L pt-BR main.tex
```

O terminal deve ser aberto no diretório onde se encontra o arquivo `main.tex`.
A parte "-L pt-BR" serve para que a saída do terminal seja em Português Brasileiro.

Para mais informações sobre essa ferramenta veja aqui: [https://github.com/islandoftex/arara](https://github.com/islandoftex/arara).