%%
%% classe original: `coppe.cls',
%% The original source files were:
%% coppe.dtx  (with options: `class')
%%
%% ***************************************************
%% ***************************************************
%% ***************************************************
%% Essa classe foi alterada em 2010 pelo professor Lucas Molina
%% para ser usada como modelo para os trabalhos de conclusão
%% de curso do DEL da Universidade Federal de Sergipe.
%% ***************************************************
%% ***************************************************
%% ***************************************************

%% ***************************************************
%% ***************************************************
%% ***************************************************
%% Com a mudança no projeto pedagógico dos cursos do DEL-UFS,
%% foi feita uma nova alteração pelo professor Lucas Molina
%% em 2013 para adequar a classe para servir como modelo
%% para os textos das disciplinas TCC1 e TCC2.
%% ***************************************************
%% ***************************************************
%% ***************************************************


%%
%% This is the `coppe' document class used for composition of LaTeX
%% monographs (master and PhD thesis, and PhD qualifying exams)
%% satisfying the requirements of the Coordination of Research and
%% Graduate Courses in Engineering at the Federal University of
%% Rio de Janeiro.
%%
%% Copyright (C) 2008 Vicente Helano and George Ainsworth Jr.
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License version 3 as
%% published by the Free Software Foundation.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
%% GNU General Public License version 3 for more details.
%%
%% You should have received a copy of the GNU General Public License
%% version 3 along with this package (see COPYING file).
%% If not, see <http://www.gnu.org/licenses/>.
%%
%% Original Author(s): Vicente Helano,
%%                     George Ainsworth
%%
%% Alterado por: Lucas Molina
%%
%%
%% \CheckSum{1391}
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\def\filename{coppe.dtx}
\def\fileversion{v2.1.1}
\def\filedate{2009/11/17}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{coppe}[\filedate\ \fileversion\ COPPE Dissertations and Thesis]
\LoadClass[12pt,a4paper,oneside]{bookufs}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{hyphenat}
\RequirePackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
\RequirePackage{lastpage}
\RequirePackage{hyperref}
\RequirePackage[english,brazil]{babel}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{tabularx}
\RequirePackage{eqparbox}
\RequirePackage[a4paper,bindingoffset=0.0cm,vcentering=true,%
top=3cm,bottom=2cm,left=3cm,right=2cm]{geometry}
\def\CoppeTeX{{\rm C\kern-.05em{\sc o\kern-.025em p\kern-.025em
p\kern-.025em e}}\kern-.08em
T\kern-.1667em\lower.5ex\hbox{E}\kern-.125emX\spacefactor1000}
\newboolean{isdraft}
\newboolean{maledoc}
\setboolean{maledoc}{false}
\setboolean{isdraft}{false}
\DeclareOption{msc}{%
  \newcommand{\@degree}{M.Sc.}
  \newcommand{\@degreename}{Mestrado}
  \newcommand{\local@degname}{Mestre}
  \newcommand{\foreign@degname}{Master}
  \newcommand\local@doctype{Disserta{\c c}{\~ a}o}
  \newcommand\foreign@doctype{Dissertation}
}
\DeclareOption{tcc1}{%
  \newcommand{\@degree}{Eng.}
  \newcommand{\@degreename}{Graduação}
  \newcommand{\local@degname}{Graduado}
  \newcommand{\foreign@degname}{Graduate}
  \setboolean{maledoc}{true}
  \newcommand\local@doctype{Trabalho de Conclusão de Curso I}
  \newcommand\foreign@doctype{Graduation Project I}
}
\DeclareOption{tcc2}{%
  \newcommand{\@degree}{Eng.}
  \newcommand{\@degreename}{Graduação}
  \newcommand{\local@degname}{Graduado}
  \newcommand{\foreign@degname}{Graduate}
  \setboolean{maledoc}{true}
  \newcommand\local@doctype{Trabalho de Conclusão de Curso II}
  \newcommand\foreign@doctype{Graduation Project II}
}
\DeclareOption{dscexam}{%
  \newcommand{\@degree}{D.Sc.}
  \newcommand{\@degreename}{Doutorado}
  \newcommand{\local@degname}{Doutor}
  \newcommand{\foreign@degname}{Doctor}
  \setboolean{maledoc}{true}
  \newcommand\local@doctype{Exame de Qualifica{\c c}{\~ a}o}
  \newcommand\foreign@doctype{Qualifying Exam}
}
\DeclareOption{dsc}{%
  \newcommand{\@degree}{D.Sc.}
  \newcommand{\@degreename}{Doutorado}
  \newcommand{\local@degname}{Doutor}
  \newcommand{\foreign@degname}{Doctor}
  \newcommand\local@doctype{Tese}
  \newcommand\foreign@doctype{Thesis}
}
\DeclareOption{draft}{%
  \setboolean{isdraft}{true}
  \ClassWarning{coppe}{draft mode is ON}%
}
\DeclareOption{numbers}{%
  \PassOptionsToPackage{numbers}{natbib}
}
\DeclareOption{pdftex}{%
  \PassOptionsToPackage{pdftex}{hyperref,graphicx}
  \PassOptionsToPackage{plainpages=false,pdfpagelabels}{hyperref}
}
\DeclareOption{dvips}{%
  \PassOptionsToPackage{dvips}{hyperref,graphicx}
}
\onehalfspacing
\DeclareOption{doublespacing}{%
  \doublespacing
}
\ProcessOptions\relax
\newcommand\university[1]{%
  \renewcommand\local@universityname{#1}
}
\newcommand\department[1]{%
  \ifthenelse{\equal{#1}{PEB}}
    {\global\def\local@deptname{Engenharia Biom{\' e}dica}
     \global\def\foreign@deptname{Biomedical Engineering}}{}
  \ifthenelse{\equal{#1}{PEC}}
    {\global\def\local@deptname{Engenharia Civil}
     \global\def\foreign@deptname{Civil Engineering}}{}
  \ifthenelse{\equal{#1}{DEL}}
    {\global\def\local@deptname{Engenharia El{\' e}trica}
     \global\def\foreign@deptname{Electrical Engineering}}{}
  \ifthenelse{\equal{#1}{PEM}}
    {\global\def\local@deptname{Engenharia Mec{\^ a}nica}
     \global\def\foreign@deptname{Mechanical Engineering}}{}
  \ifthenelse{\equal{#1}{PEMM}}
    {\global\def\local@deptname{Engenharia Metal{\' u}rgica e de Materiais}
\global\def\foreign@deptname{Metallurgical and Materials Engineering}}{}
  \ifthenelse{\equal{#1}{PEN}}
    {\global\def\local@deptname{Engenharia Nuclear}
     \global\def\foreign@deptname{Nuclear Engineering}}{}
  \ifthenelse{\equal{#1}{PENO}}
    {\global\def\local@deptname{Engenharia Oce{\^ a}nica}
     \global\def\foreign@deptname{Ocean Engineering}}{}
  \ifthenelse{\equal{#1}{PPE}}
    {\global\def\local@deptname{Planejamento Energ{\' e}tico}
     \global\def\foreign@deptname{Energy Planning}}{}
  \ifthenelse{\equal{#1}{PEP}}
    {\global\def\local@deptname{Engenharia de Produ{\c c}{\~ a}o}
     \global\def\foreign@deptname{Production Engineering}}{}
  \ifthenelse{\equal{#1}{PEQ}}
    {\global\def\local@deptname{Engenharia Qu{\' i}mica}
     \global\def\foreign@deptname{Chemical Engineering}}{}
  \ifthenelse{\equal{#1}{PESC}}
    {\global\def\local@deptname{Engenharia de Sistemas e Computa{\c c}{\~ a}o}
     \global\def\foreign@deptname{Systems Engineering and Computer Science}}{}
  \ifthenelse{\equal{#1}{PET}}
    {\global\def\local@deptname{Engenharia de Transportes}
     \global\def\foreign@deptname{Transportation Engineering}}{}
}
\renewcommand\title[1]{%
  \global\def\local@title{#1}%
}
\newcommand\foreigntitle[1]{%
  \global\def\foreign@title{#1}%
}
\newcount\@advisor\@advisor0
\newcommand\advisor[4]{%
  \global\@namedef{CoppeAdvisorTitle:\expandafter\the\@advisor}{#1}
  \global\@namedef{CoppeAdvisorName:\expandafter\the\@advisor}{#2}
  \global\@namedef{CoppeAdvisorSurname:\expandafter\the\@advisor}{#3}
  \global\@namedef{CoppeAdvisorDegree:\expandafter\the\@advisor}{#4}
  \global\advance\@advisor by 1
  \ifnum\@advisor>0
    \renewcommand\local@advisorstring{Orientador}
    \renewcommand\foreign@advisorstring{Advisor}
  \fi
}
\newcount\@examiner\@examiner0
\newcommand\examiner[3]{%
  \global\@namedef{CoppeExaminer:\expandafter\the\@examiner}{#1\ #2, #3}
  \global\advance\@examiner by 1
}
\renewcommand\author[2]{%
  \global\def\@authname{#1}
  \global\def\@authsurn{#2}
}
\renewcommand\date[2]{%
  \month=#1
  \year=#2
}
\newcommand\local@monthname{\ifcase\month\or
  Janeiro\or Fevereiro\or Mar{\c c}o\or Abril\or Maio\or Junho\or
  Julho\or Agosto\or Setembro\or Outubro\or Novembro\or Dezembro\fi}
\newcommand\foreign@monthname{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
\newcommand\place[3]{%
  \renewcommand\local@cityname{#1}
  \renewcommand\local@statename{#2}
  \renewcommand\local@countryname{#3}
}
\newcounter{keywords}
\newcommand\keyword[1]{%
  \global\@namedef{CoppeKeyword:\expandafter\the\c@keywords}{#1}
  \global\addtocounter{keywords}{1}
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \thispagestyle{empty}
  \setcounter{page}{2}
  \makefrontpage
  \clearpage
  \pagestyle{plain}
  \ifthenelse{\boolean{maledoc}}{}{\makecatalog}%
}
\renewcommand\mainmatter{%
  \immediate\write\@auxout{%
    \string\newlabel{front:pageno}{{}{\Roman{page}}{}{page.\roman{page}}{}}}
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{plain}
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi}
\renewcommand\maketitle{%
\pagenumbering{alph}
\config@hypersetup
  \begin{titlepage}
  \begin{center}
  \setlength\baselineskip{0pt}
  \setlength\parskip{1mm}
  { \large \centering UNIVERSIDADE FEDERAL DE SERGIPE \\ PRÓ-REITORIA DE PÓS-GRADUAÇÃO E PESQUISA \\ COORDENAÇÃO DE PESQUISA \\}
\vspace{1cm}
  \end{center}
  
\begin{center}
{  
\centering Programa Institucional de Bolsas de Iniciação Científica (PIBIC)\\}
\end{center}

\noindent\fbox{ \parbox{\textwidth}{
\begin{center}
\nohyphens{\textbf{\local@title}}\par

\end{center}
}
}%
    
  \begin{center}
  \vspace*{10mm}
  Área de Conhecimento: Engenharias \\ 
  \vspace*{10mm}
  Bolsista: \nohyphens{\@authname\ \@authsurn}\par
  \vspace*{10mm}
 
  \nohyphens{%
      \begin{tabularx}{100mm}[b]{c@{}c@{ }c@{}}
        \local@advisorstring: &
        \count1=0
        \toks@={}
        \@whilenum \count1<\@advisor \do{%
        \ifcase\count1 % same as \ifnum0=\count1
          \toks@=\expandafter{\csname CoppeAdvisorName:\the\count1%
          \expandafter\endcsname\expandafter\space%
          \csname CoppeAdvisorSurname:\the\count1\endcsname\\}
        \else
          \toks@=\expandafter\expandafter\expandafter{%
            \expandafter\the\expandafter\toks@
            \expandafter&\expandafter\space
            \csname CoppeAdvisorName:\the\count1\expandafter\endcsname%
            \expandafter\space\csname CoppeAdvisorSurname:\the\count1\endcsname\\
          }%
        \fi
        \advance\count1 by 1}
        \the\toks@
      \end{tabularx}}\par
      
       \end{center}
  
  %\begin{center}
  %\nohyphens{\MakeUppercase\local@title}\par
  %\vspace*{28mm}
  %\nohyphens{\@authname\ \@authsurn}\par
  %\end{center}
  %\vspace*{16mm}
 
  \vspace*{\fill}
  %\begin{center}
  %\local@cityname\par
  %\local@monthname\ de \number\year
  %\end{center}
  
 \begin{center}
 \large{ Relatório Parcial \\}
  Este projeto foi desenvolvido com bolsa de iniciação científica \\ PIBIC/CNPq \\
  2017-2018
  \end{center}
  
  
  \end{titlepage}
 \global\let\maketitle\relax%
  \global\let\and\relax}
  
  
  
  
\newcommand\makefrontpage{%
  \begin{center}
    \sloppy\nohyphens{\textbf{\local@title}}\par
    \vspace*{7mm}
    {\@authname\ \@authsurn}\par
  \end{center}\par
  \vspace*{4mm}
  \frontpage@maintext
  \vspace*{8mm}
  \noindent\local@approvedname:\par
     \begin{center}
  \begin{flushright}
        \count1=0
        \@whilenum \count1<\@examiner \do {
            \vskip26\p@ \baselineskip12pt
        \eqparbox{signture@list}{\hrulefill}\\
       \eqparbox{signture@list}{\protect\centering%
            \ \ \ \csname CoppeExaminer:\the\count1 \endcsname\ \ \ }\\
           \advance\count1 by 1}
  \end{flushright}
     \end{center}
  \vspace*{\fill}
  \frontpage@bottomtext}
\newcommand\config@hypersetup{%
\begingroup
  % changes to \toks@ and \count@ are kept local;
  % it's not necessary for them, but it is usually the case
  % for \count1, because the first ten counters are written
  % to the DVI file, thus you got lucky because of PDF output
  \toks@={}% in this special case not necessary
  \count@=0 %
  \@whilenum\count@<\value{keywords}\do{%
    % * a keyword separator is not necessary,
    %    if there is just one keyword
    % * \csname CoppeKeyword:\the\count@\endcsname must be expanded
    %    at least once, to get rid of the loop depended \count@
    \ifcase\count@ % same as \ifnum0=\count@
      \toks@=\expandafter{\csname CoppeKeyword:\the\count@\endcsname}%
    \else
      \toks@=\expandafter\expandafter\expandafter{%
        \expandafter\the\expandafter\toks@
        \expandafter;\expandafter\space
        \csname CoppeKeyword:\the\count@\endcsname
      }%
    \fi
    \advance\count@ by 1 %
  }%
  \edef\x{\endgroup
    \noexpand\hypersetup{%
      pdfkeywords={\the\toks@}%
    }%
  }%
\x
\hypersetup{%
  pdfauthor={\@authname\ \@authsurn},
  pdftitle={\local@title},
 pdfsubject={\local@doctype\ de \@degreename\ em \local@deptname\ do DEL/CCET/UFS},
  pdfcreator={LaTeX with CoppeTeX toolkit},
  breaklinks={true},
  raiselinks={true},
  pageanchor={true},
}}
\newcommand\makecatalog{%
  \vspace*{\fill}
  \begin{center}
    \setlength{\fboxsep}{5mm}
    \framebox[120mm][c]{\makebox[5mm][c]{}%
      \begin{minipage}[c]{105mm}
      \setlength{\parindent}{5mm}
      \noindent\sloppy\nohyphens\@authsurn,
      \nohyphens\@authname\par
      \nohyphens{\local@title/\@authname\ \@authsurn. -- \local@cityname:
      DEL/CCET/UFS, \number\year.}\par
      \pageref{front:pageno},
      \pageref{LastPage}
      p.\@ifundefined{r@cat:lofflag}{}{\pageref{cat:lofflag}} $29,7$cm.\par
      % There is an issue here. When the last entry must be split between lines,
      % the spacing between it and the next paragraph becomes smaller.
      % Should we manually introduce a fixed space? But how could we know that
      % a name was split? Is this happening yet?
      \nohyphens{%
      \begin{tabularx}{100mm}[b]{@{}l@{ }X@{}}
        \local@advisorstring: &
        \count1=0
        \toks@={}
        \@whilenum \count1<\@advisor \do{%
        \ifcase\count1 % same as \ifnum0=\count1
          \toks@=\expandafter{\csname CoppeAdvisorName:\the\count1%
          \expandafter\endcsname\expandafter\space%
          \csname CoppeAdvisorSurname:\the\count1\endcsname\\}
        \else
          \toks@=\expandafter\expandafter\expandafter{%
            \expandafter\the\expandafter\toks@
            \expandafter&\expandafter\space
            \csname CoppeAdvisorName:\the\count1\expandafter\endcsname%
            \expandafter\space\csname CoppeAdvisorSurname:\the\count1\endcsname\\
          }%
        \fi
        \advance\count1 by 1}
        \the\toks@
      \end{tabularx}}\par
      \nohyphens{\local@doctype\ ({\MakeLowercase\@degreename}) --
      UFS/CCET/Departamento de \local@deptname, \number\year.}\par
      \bibname: p. \pageref{bib:begin} -- \pageref{bib:end}.\par
      \count1=0
      \count2=1
      \nohyphens{\@whilenum \count1<\value{keywords} \do {%
        \number\count2. \csname CoppeKeyword:\the\count1 \endcsname.
        \advance\count1 by 1
        \advance\count2 by 1}
      I. \csname CoppeAdvisorSurname:0\endcsname,%
      \ \csname CoppeAdvisorName:0\endcsname%
      \ifthenelse{\@advisor>1}{\ \emph{et~al.}{}}.
      II. \local@universityname, DEL, Departamento de \local@deptname.
      III. T{\' i}tulo.}
    \end{minipage}}
  \end{center}
  \vspace*{\fill}}
\newcommand\dedication[1]{
  \gdef\@dedic{#1}
    \cleardoublepage
    \vspace*{\fill}
    \begin{flushright}
      \begin{minipage}{60mm}
        \raggedleft \it \normalsize \@dedic
      \end{minipage}
    \end{flushright}}

\newenvironment{abstract}{%
  \clearpage
  \thispagestyle{plain}
  \abstract@toptext\par
  \vspace*{8.6mm}
  \vspace*{7mm}}{\vspace*{\fill}}
\newenvironment{foreignabstract}{%
  \clearpage
  \thispagestyle{plain}
  \begin{otherlanguage}{english}
  \foreignabstract@toptext\par
  \vspace*{8.6mm}
  \begin{center}
    \sloppy\nohyphens{\textbf{\local@title}}\par
    \vspace*{13.2mm}
    \@authname\ \@authsurn \par
    \vspace*{7mm}
    \foreign@monthname/\number\year
  \end{center}\par
  \vspace*{\fill}
  \noindent%
  \begin{tabularx}{\textwidth}[b]{@{}l@{ }X@{}}
    \foreign@advisorstring: &
    \count1=0
    \toks@={}
    \@whilenum \count1<\@advisor \do{%
    \ifcase\count1 % same as \ifnum0=\count1
      \toks@=\expandafter{\csname CoppeAdvisorName:\the\count1%
      \expandafter\endcsname\expandafter\space%
      \csname CoppeAdvisorSurname:\the\count1\endcsname\\}
    \else
      \toks@=\expandafter\expandafter\expandafter{%
        \expandafter\the\expandafter\toks@
        \expandafter&\expandafter\space
        \csname CoppeAdvisorName:\the\count1\expandafter\endcsname%
        \expandafter\space\csname CoppeAdvisorSurname:\the\count1\endcsname\\
      }%
    \fi
    \advance\count1 by 1}
    \the\toks@
  \end{tabularx}\par
  \vspace*{2mm}
  \noindent\foreign@deptstring: \foreign@deptname \hbox{ } (DEL/CCET/UFS)\par
  \vspace*{7mm}}{%
  \end{otherlanguage}
  \vspace*{\fill}
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\foreign@title\@empty
  \global\let\foreign@title\relax
  \global\let\local@title\@empty
  \global\let\local@title\relax
  \global\let\author\relax
  \global\let\author\relax
  \global\let\date\relax}
\renewcommand\listoffigures{%
  \immediate\write\@auxout{%
  \string\newlabel{cat:lofflag}{{}{:~il.;}{}{page.\roman{page}}{}}}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\newcommand\printlosymbols{%
\renewcommand\glossaryname{\listsymbolname}%
\@input@{\jobname.los}}
\def\makelosymbols{%
  \newwrite\@losfile
  \immediate\openout\@losfile=\jobname.syx
  \def\symbl{\@bsphack\begingroup
             \@sanitize
             \@wrlos}\typeout
  {Writing index of symbols file \jobname.syx}%
  \let\makelosymbols\@empty
}
\@onlypreamble\makelosymbols
\AtBeginDocument{%
\@ifpackageloaded{hyperref}{%
  \def\@wrlos#1#2{%
    \protected@write\@losfile{}%
      {\string\indexentry{[#1] #2|hyperpage}{\thepage}}%
    \endgroup
    \@esphack}}{%
  \def\@wrlos#1#2{%
    \protected@write\@losfile{}%
      {\string\indexentry{[#1] #2}{\thepage}}%
    \endgroup
    \@esphack}}}
\newcommand\printloabbreviations{%
\renewcommand\glossaryname{\listabbreviationname}%
\@input@{\jobname.lab}}
\def\makeloabbreviations{%
  \newwrite\@labfile
  \immediate\openout\@labfile=\jobname.abx
  \def\abbrev{\@bsphack\begingroup
              \@sanitize
              \@wrlab}\typeout
  {Writing index of abbreviations file \jobname.abx}%
  \let\makeloabbreviations\@empty
}
\@onlypreamble\makeloabbreviations
\AtBeginDocument{%
\@ifpackageloaded{hyperref}{%
  \def\@wrlab#1#2{%
    \protected@write\@labfile{}%
      {\string\indexentry{[#1] #2|hyperpage}{\thepage}}%
    \endgroup
    \@esphack}}{%
  \def\@wrlab#1#2{%
    \protected@write\@labfile{}%
      {\string\indexentry{[#1] #2}{\arabic{page}}}%
    \endgroup
    \@esphack}}}
\newdimen\bibindent%
\setlength\bibindent{1.5em}%
\renewenvironment{thebibliography}[1]%
     {\chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
      \immediate\write\@auxout{%
      \string\newlabel{bib:begin}{{}{\arabic{page}}{}{page.\arabic{page}}{}}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\setlength{\labelwidth}{0ex}%
            \setlength{\leftmargin}{9.0ex}%
            \setlength{\itemindent}{-9.0ex}%
            \advance\leftmargin\labelsep%
            \@openbib@code%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty%
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy%
      \clubpenalty4000%
      \@clubpenalty \clubpenalty%
      \widowpenalty4000%
      \sfcode`\.\@m}%
     {\def\@noitemerr%
       {\@latex@warning{Empty `thebibliography' environment}}%
      \immediate\write\@auxout{%
      \string\newlabel{bib:end}{{}{\arabic{page}}{}{page.\arabic{page}}{}}}%
      \endlist}
\newenvironment{theglossary}{%
  \if@twocolumn%
    \@restonecoltrue\onecolumn%
  \else%
    \@restonecolfalse%
  \fi%
  \@mkboth{\MakeUppercase\glossaryname}%
  {\MakeUppercase\glossaryname}%
  \chapter*{\glossaryname}%
  \addcontentsline{toc}{chapter}{\glossaryname}
  \list{}
  {\setlength{\listparindent}{0in}%
   \setlength{\labelwidth}{1.0in}%
   \setlength{\leftmargin}{1.5in}%
   \setlength{\labelsep}{0.5in}%
   \setlength{\itemindent}{0in}}%
   \sloppy}%
  {\if@restonecol\twocolumn\fi%
\endlist}
\renewenvironment{theindex}{%
  \if@twocolumn
    \@restonecolfalse
  \else
    \@restonecoltrue
  \fi
  \twocolumn[\@makeschapterhead{\indexname}]%
  \@mkboth{\MakeUppercase\indexname}%
  {\MakeUppercase\indexname}%
  \thispagestyle{plain}\parindent\z@
  \addcontentsline{toc}{chapter}{\indexname}
  \parskip\z@ \@plus .3\p@\relax
  \columnseprule \z@
  \columnsep 35\p@
  \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\glossaryname{Glossary}
\newcommand\listabbreviationname{Lista de Abreviaturas}
\newcommand\listsymbolname{Lista de S{\' i}mbolos}
\newcommand\local@advisorstring{}
\newcommand\foreign@advisorstring{Advisor}
\ifthenelse{\boolean{maledoc}}{%
  \newcommand\local@approvedname{Examinado por}%
}{%
  \newcommand\local@approvedname{Examinada por}%
}
\newcommand\foreign@universityname{Federal University of Sergipe}
\newcommand\local@universityname{Universidade Federal de Sergipe}
\newcommand\local@universitysigla{UFS}
\newcommand\local@deptstring{Departamento}
\newcommand\foreign@deptstring{Department}
\newcommand\local@cityname{São Cristóvão}
\newcommand\local@statename{SE}
\newcommand\local@countryname{Brasil}
\newcommand\frontcover@maintext{
  \sloppy\nohyphens{\local@doctype\ de \@degreename\
  \ifthenelse{\boolean{maledoc}}{apresentado}{apresentada}
  ao Departamento de \local@deptname {\ } (DEL) da \local@universityname, como parte dos requisitos
  necess{\' a}rios {\` a} obten{\c c}{\~ a}o do t{\' i}tulo de
  \local@degname\ em \local@deptname.}
}
\newcommand\frontpage@maintext{
  \noindent {\MakeUppercase\local@doctype}
  \ifthenelse{\boolean{maledoc}}{SUBMETIDO}{SUBMETIDA}
  \sloppy\nohyphens{AO CORPO DOCENTE DO DEPARTAMENTO DE ENGENHARIA ELÉTRICA (DEL) DA
  UNIVERSIDADE FEDERAL DE SERGIPE COMO PARTE DOS REQUISITOS
  NECESS{\' A}RIOS PARA A OBTEN{\c C}{\~ A}O DO GRAU DE
  {\MakeUppercase\local@degname} EM
  {\MakeUppercase\local@deptname.\par}}%
}
\newcommand\frontpage@bottomtext{%
  \begin{center}
  {\MakeUppercase{\local@cityname, \local@statename\ -- \local@countryname}}\par
  {\MakeUppercase\local@monthname\ DE \number\year}
  \end{center}%
}
\newcommand\abstract@toptext{%
  \centering{\huge \textbf{Resumo}}%
}
\newcommand\foreignabstract@toptext{%
  \centering{\huge \textbf{Abstract}}%
}
%%
%%
%% End of file `coppe.cls'.
