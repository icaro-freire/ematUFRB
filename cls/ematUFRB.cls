%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ematUFRB.cls, v0.1.0                                                      %%
%% Copyright 2020 Ícaro Vidal Freire                                         %%
%%---------------------------------------------------------------------------%%
%% Sobre                                                                     %%
%%   - Consiste no arquivo 'ematUFRB.cls' que é derivado da classe padrão    %%
%%     'article.cls';                                                        %%
%%   - Diz respeito a uma classe para confecção de resumos de trabalhos para %%
%%     o Emat (Encontro de Matemática) da Universidade Federal do Recôncavo  %%
%%     da Bahia, no Centro de Formação de Professores, campus de Amargosa.   %%
%%---------------------------------------------------------------------------%%
%% Licença                                                                   %%
%%   - Esta classe está licenciada com 'The MIT License';                    %%
%%   - Veja aqui os detalhes: https://opensource.org/licenses/MIT            %%
%%   - Basicamente você pode fazer o que quiser, desde que cite a fonte.     %%
%%     Também não traz garantias sobre o funcionamento da mesma ao longo do  %%
%%     tempo, ou seja, use por sua conta em risco.                           %%
%%---------------------------------------------------------------------------%%
%% Atualizações                                                              %%
%%   - Para possíveis atualizaçoes, acesse:                                  %%
%%                https://github.com/icaro-freire/ematUFRB                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% identificação da classe ematUFRB ============================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ematUFRB}[2022/02/25 v.0.1.0 'Classe para o EMAT da UFRB']

\LoadClass[12pt]{article}

% pacotes carregados ==========================================================
\RequirePackage{Alegreya, Alegreya Sans} %--------> fonte serifada e sem serifa
\RequirePackage{mathtools, amssymb, amsthm} %  pacotes matemáticos fundamentais
\RequirePackage{eulervm} %------------------> fonte para expressões matemáticas
\RequirePackage{fontspec} %------------> seleciona corretamente as fontes e CIA

\RequirePackage{lipsum} % -----------------> para testes de textos tipográficos

\RequirePackage[a4paper]{geometry} %---------------------> configura as margens 
  \geometry{
    top        = 3cm, 
    left       = 3cm,
    bottom     = 2cm, 
    right      = 2cm, 
    headheight = 2.7cm, 
    headsep    = 0.5cm
  }

\RequirePackage{graphicx} %-------> para inserção de figuras (.pdf, .jpg, .png)
  \graphicspath{{figs/}} %------> define o diretório/pasta onde está as figuras

\RequirePackage{setspace} %---------------------> para espaçamento entre linhas
\RequirePackage{indentfirst} %----------------> indenta os primeiros parágrafos

\RequirePackage{titlesec} %---------> configura título, seções, subseções, etc.

\RequirePackage{microtype} %----------> melhora o espaçamento entre as palavras

\RequirePackage{quoting} %-------------------------------> para citações longas

\RequirePackage[style=abnt, justify]{biblatex} %------------> para bibliografia
  \addbibresource{bib/referencias.bib} %---> adiciona o arquivo da bibliografia
                                       %   - deve ter o nome referencias.bib
                                       %   - deve estar no diretório/pasta figs      

\RequirePackage{fancyhdr} %---------------> configura os cabeçalhos das páginas

% configurações ===============================================================
%% novos comandos --------------------------------------------------------------
%%% texto do meio do cabeçalho
\newcommand{\meio}{
  \textsf{\textbf{V Encontro de Matemática da UFRB}} \\
  {\footnotesize \sffamily FORMAÇÃO DO PROFESSOR} \\
  {\footnotesize \sffamily Diálogos e Práticas do Ensino da Matemática \par}
}

%%% comando para aramazenar o logo da universidade
\newcommand{\logoUFRB}{\includegraphics[width = 4cm]{ufrb}}

%%% criação do título com as especificações do EMAT
\def\tituloDoTrabalho#1{\gdef\@tituloDoTrabalho{#1}}
\def\instituicaoDoAutor#1{\gdef\@instituicaoDoAutor{#1}}
\def\emailDoAutor#1{\gdef\@emailDoAutor{#1}}
\def\autorDoTrabalho#1{\gdef\@autorDoTrabalho{#1}}

\newcommand{\titulo}
{
  \vspace*{0.08cm}
  \begin{center}
    \sffamily \bfseries \@tituloDoTrabalho
  \end{center}
  \vspace*{0.08cm}
}


%%% comando (inicial) para os autores
\newcommand{\autores}[1]{
  \begin{flushright}
    #1    
  \end{flushright}
}

%% sangria de parágrafos ------------------------------------------------------
\setlength{\parindent}{1.25cm}

%% configurações de seções ----------------------------------------------------
%%% seções com fonte 12pt, negrito sem serifa
\titleformat{\section}
{\normalsize \bfseries \sffamily}
{}
{}
{}
[]

%% configurando o cabeçalho ----------------------------------------------------
\pagestyle{fancy}
\fancyhead[L]{\logoUFRB}
\fancyhead[C]{\meio}
\fancyhead[R]{\logoUFRB}
\fancyfoot[L, C, R]{}
\renewcommand{\headrulewidth}{0pt}

%% novos ambientes ------------------------------------------------------------
%%% ambiente para citações longas
\newenvironment{citalonga}
{ 
  \begin{quoting}[rightmargin = 0cm, leftmargin = 4cm]
  \singlespacing
  \footnotesize
}
{
  \end{quoting}
}

