\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gepa}[2026/08/25 v1.1 GÉPA version 3]

\newif\ifgepa@strictfont
\DeclareOption{strictfont}{\gepa@strictfonttrue}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper]{article}

\RequirePackage{fontspec}
\IfFileExists{fonts/times.ttf}{%
  \setmainfont[
    Path=fonts/,
    UprightFont=times.ttf,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf
  ]{Times New Roman}%
}{%
  \IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{%
    \ifgepa@strictfont
      \ClassError{gepa}{Times New Roman est introuvable}{Téléversez les quatre fichiers de police dans fonts/ ou retirez l'option strictfont.}%
    \else
      \IfFontExistsTF{TeX Gyre Termes}{%
        \ClassWarningNoLine{gepa}{Times New Roman introuvable; TeX Gyre Termes est utilisée comme solution de repli}%
        \setmainfont{TeX Gyre Termes}%
      }{%
        \ClassWarningNoLine{gepa}{Times New Roman et TeX Gyre Termes introuvables; Nimbus Roman est utilisée comme solution de repli}%
        \IfFileExists{/usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf}{%
          \setmainfont[
            Path=/usr/share/fonts/opentype/urw-base35/,
            UprightFont=NimbusRoman-Regular.otf,
            BoldFont=NimbusRoman-Bold.otf,
            ItalicFont=NimbusRoman-Italic.otf,
            BoldItalicFont=NimbusRoman-BoldItalic.otf
          ]{Nimbus Roman}%
        }{\setmainfont{Nimbus Roman}}%
      }%
    \fi
  }%
}

\RequirePackage[provide=*,main=french]{babel}
\RequirePackage{csquotes}
\RequirePackage[letterpaper,margin=2.5cm,headheight=14pt,headsep=.5cm,footskip=1cm]{geometry}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{chngcntr}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}

\hypersetup{hidelinks,pdfborder={0 0 0}}
\onehalfspacing
\justifying
\setlength{\parindent}{0pt}
\setlength{\parskip}{.75\baselineskip}
\emergencystretch=2em
\frenchspacing

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\fontsize{12}{14}\selectfont\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\titleformat{\section}{\normalfont\bfseries\fontsize{12}{14}\selectfont}{\thesection.}{.5em}{}
\titleformat{\subsection}{\normalfont\bfseries\fontsize{12}{14}\selectfont}{\thesubsection}{.5em}{}
\titleformat{\subsubsection}{\normalfont\bfseries\fontsize{12}{14}\selectfont}{\thesubsubsection}{.5em}{}
\titlespacing*{\section}{0pt}{1.5\baselineskip}{.5\baselineskip}
\titlespacing*{\subsection}{0pt}{\baselineskip}{.35\baselineskip}
\titlespacing*{\subsubsection}{0pt}{\baselineskip}{.35\baselineskip}

\renewcommand{\contentsname}{Table des matières}
\renewcommand{\listfigurename}{Table des figures}
\renewcommand{\listtablename}{Table des tableaux}
\renewcommand{\refname}{Références bibliographiques}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\renewcommand{\cfttoctitlefont}{\normalfont\bfseries\fontsize{12}{14}\selectfont}
\renewcommand{\cftloftitlefont}{\normalfont\bfseries\fontsize{12}{14}\selectfont}
\renewcommand{\cftlottitlefont}{\normalfont\bfseries\fontsize{12}{14}\selectfont}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{\baselineskip}
\setlength{\cftbeforeloftitleskip}{0pt}
\setlength{\cftafterloftitleskip}{\baselineskip}
\setlength{\cftbeforelottitleskip}{0pt}
\setlength{\cftafterlottitleskip}{\baselineskip}

\counterwithin{figure}{section}
\counterwithin{table}{section}
\captionsetup{font=normalsize,labelfont=bf,labelsep=space,justification=raggedright,singlelinecheck=false}
\newcommand{\source}[1]{\par\vspace{.5\baselineskip}{\raggedright\fontsize{10}{12}\selectfont Source : #1\par}}

\makeatletter
\renewcommand\footnoterule{\kern-3pt\hrule width .4\columnwidth\kern 2.6pt}
\long\def\@makefntext#1{\parindent=0pt\raggedright\singlespacing\fontsize{10}{12}\selectfont\makebox[1.6em][r]{\@makefnmark\,}#1}
\makeatother

\renewenvironment{quote}
  {\begin{list}{}{\setlength{\leftmargin}{2.5cm}\setlength{\rightmargin}{2.5cm}}\item\relax\singlespacing\justifying}
  {\end{list}}
\newenvironment{gepacitationlongue}{\begin{quote}}{\end{quote}}

\makeatletter
\newcommand{\GEPATitre}[1]{\def\gepa@titre{#1}}
\newcommand{\GEPASousTitre}[1]{\def\gepa@soustitre{#1}}
\newcommand{\GEPAAuteur}[1]{\def\gepa@auteur{#1}}
\newcommand{\GEPADestinataire}[1]{\def\gepa@destinataire{#1}}
\newcommand{\GEPACours}[1]{\def\gepa@cours{#1}}
\newcommand{\GEPALieu}[1]{\def\gepa@lieu{#1}}
\newcommand{\GEPADate}[1]{\def\gepa@date{#1}}
\GEPATitre{Titre du travail}
\GEPASousTitre{}
\GEPAAuteur{Prénom Nom}
\GEPADestinataire{Destiné à la professeure ou au professeur Prénom Nom}
\GEPACours{Dans le cadre du cours POL000 Titre du cours}
\GEPALieu{Sherbrooke}
\GEPADate{Le \today}

\newcommand{\maketitlegepa}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \centering
    \setlength{\parskip}{0pt}
    \vspace*{1.2cm}
    École de politique appliquée\par
    Faculté des lettres et sciences humaines\par
    Université de Sherbrooke\par
    \vfill
    {\itshape \gepa@titre\par}
    \ifx\gepa@soustitre\@empty\else{\itshape\gepa@soustitre\par}\fi
    \vfill
    Par \gepa@auteur\par
    \vfill
    \gepa@destinataire\par
    \gepa@cours\par
    \vfill
    \gepa@lieu\par
    \gepa@date\par
    \vspace*{1.2cm}
  \end{titlepage}
  \setcounter{page}{2}
}
\makeatother

\newcommand{\geparesume}[1]{\section*{Résumé}\addcontentsline{toc}{section}{Résumé}#1\clearpage}
\newcommand{\geparemerciements}[1]{\section*{Remerciements}\addcontentsline{toc}{section}{Remerciements}#1\clearpage}
\newcommand{\gepadeclarationia}[1]{%
  \section*{Déclaration d'utilisation de l'intelligence artificielle générative}%
  \addcontentsline{toc}{section}{Déclaration d'utilisation de l'intelligence artificielle générative}%
  #1\clearpage}
\newcommand{\gepatableofcontents}{\phantomsection\addcontentsline{toc}{section}{Table des matières}\tableofcontents\clearpage}
\newcommand{\gepalistoftables}{\phantomsection\addcontentsline{toc}{section}{Table des tableaux}\listoftables\clearpage}
\newcommand{\gepalistoffigures}{\phantomsection\addcontentsline{toc}{section}{Table des figures}\listoffigures\clearpage}
\newcommand{\gepaacronymes}[1]{\section*{Liste des acronymes et des abréviations}\addcontentsline{toc}{section}{Liste des acronymes et des abréviations}#1\clearpage}

\newcommand{\GEPANumerotationSansSections}{\setcounter{secnumdepth}{0}}
\newcommand{\GEPAReinitialiserNotesParSection}{\counterwithin*{footnote}{section}}
\AtBeginDocument{\renewcommand{\refname}{Références bibliographiques}}
