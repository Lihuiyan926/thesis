%%
%% This is file `ustcthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ustcthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2015-2017 by Zeping Lee <zepinglee AT gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ustcthesis}
    [2017/05/04 v2.2.3 USTC thesis template]
\RequirePackage{kvoptions}
%\usepackage{fancyhdr}
\SetupKeyvalOptions{family=ustc@opt, prefix=ustc@opt@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{doctor}
\DeclareBoolOption[false]{master}
\DeclareBoolOption[false]{bachelor}
\DeclareBoolOption[false]{pdf}
\DeclareComplementaryOption{print}{pdf}
\DeclareBoolOption[false]{english}
\DeclareComplementaryOption{chinese}{english}
\SetupKeyvalOptions{family=ustc@page, prefix=ustc@page@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{oneside}
\DeclareComplementaryOption{twoside}{oneside}
\DeclareBoolOption[false]{openany}
\DeclareComplementaryOption{openright}{openany}
\DeclareBoolOption[true]{pageouter}
\DeclareComplementaryOption{pagecenter}{pageouter}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions{ustc@opt}
\ifustc@opt@bachelor
    \ustc@page@onesidetrue
    \ustc@page@pageouterfalse
\fi
\ifustc@opt@pdf
    \ustc@page@onesidetrue
    \ustc@page@pageouterfalse
\fi
\ifustc@opt@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\ProcessKeyvalOptions*\relax
\ifustc@page@oneside
    \PassOptionsToClass{oneside}{ctexbook}
\fi
\ifustc@page@openany
    \PassOptionsToClass{openany}{ctexbook}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper, UTF8, zihao=-4]{ctexbook}[2015/05/14]
\@ifclasslater{ctexbook}{2015/05/14}{}{%
    \ClassError{ustcthesis}{%
        Requiring ctex 2.0 or later version!\MessageBreak
        Please update the package using your\MessageBreak
        TeX package manager or from CTAN
    }{%
        See ustcthesis.pdf for more detailed update guide.
    }
}
\setmainfont{Times New Roman}
\setsansfont{Arial}[BoldFont=Arial Black]
\setmonofont{Courier New}
\newfontfamily\abstitlefont{Times New Roman}[BoldFont=Times New Roman Bold]
% \setCJKmainfont{\songti}
% \renewcommand*{\songti}{\CJKfamily{zhsong}}
\RequirePackage{hyperref}
\hypersetup{
    bookmarksopen=true,
    bookmarksnumbered=true,
    bookmarksopenlevel=1,
    CJKbookmarks=true,
    pdfborder=0 0 0,
    unicode=true,
    linktoc=all,
}
\urlstyle{rm}
\ifustc@opt@pdf
    \hypersetup{
        colorlinks=true,
        allcolors=blue,
    }
\fi
\AtBeginDocument{
    \hypersetup{
        pdftitle={\ustc@title},
        pdfauthor={\ustc@author}
    }
}
\RequirePackage{xparse}
\DeclareDocumentCommand\setfontsize{mo}{\IfValueTF{#2}{\fontsize{#1}{#2}}{\fontsize{#1}{2\dimexpr#1}}\linespread{1}\selectfont\relax}
\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}
\newcommand\ustc@underline[2][6em]{%
    \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt\relax
}
\def\ustc@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname ustc@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\ustc@define@term{title}
\ustc@define@term{secrettext}
\ustc@define@term{author}
\ustc@define@term{depart}
\ustc@define@term{major}
\ustc@define@term{advisor}
\ustc@define@term{coadvisor}
\ustc@define@term{submitdate}
\ustc@define@term{entitle}
\ustc@define@term{ensecrettext}
\ustc@define@term{enauthor}
\ustc@define@term{enmajor}
\ustc@define@term{enadvisor}
\ustc@define@term{encoadvisor}
\ustc@define@term{ensubmitdate}
\ifustc@opt@english
  \newcommand\ustc@contentsname{\contentsname}
  \newcommand\ustc@pdf@contentsname{\contentsname}
  \renewcommand\figurename{Fig.}
  \newcommand\ustc@notesname{\textbf{Notes}: }
  \newcommand\ustc@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@pdf@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@publicationsname{Publications}
  \newcommand\ustc@notationname{Notation}
\else
  \renewcommand\contentsname{%
  \vspace*{19.85bp}% 段前间距19.85磅(1bp≈1/72英寸)
  {\sffamily\zihao{3}目\zhspace 录}% 黑体3号字
  \vspace{-5pt}% 段后间距0cm
  }
  \newcommand\ustc@pdf@contentsname{目录}
  \renewcommand\listfigurename{图\zhspace 录}
  \renewcommand\listtablename{表\zhspace 录}
  \newcommand\ustc@notesname{\textbf{注}：}
  \newcommand\ustc@acknowledgementsname{致\hspace{\ccwd}谢}
  \newcommand\ustc@pdf@acknowledgementsname{致谢}
  \newcommand\ustc@publicationsname{在读期间发表的学术论文与取得的研究成果}
  \newcommand\ustc@notationname{符号说明}
  \def\equationautorefname~#1\null{公式~(#1)\null}%
  \def\footnoteautorefname{脚注}%
  \def\itemautorefname~#1\null{第~#1~项\null}%
  \def\figureautorefname{图}%
  \def\tableautorefname{表}%
  \def\partautorefname~#1\null{第~#1~部分\null}%
  \def\appendixautorefname{附录}%
  \def\chapterautorefname~#1\null{第~#1~章\null}%
  \def\sectionautorefname~#1\null{第~#1~节\null}%
  \def\subsectionautorefname~#1\null{第~#1~小节\null}%
  \def\subsubsectionautorefname~#1\null{第~#1~小小节\null}%
  \def\paragraphautorefname~#1\null{第~#1~段\null}%
  \def\subparagraphautorefname~#1\null{第~#1~小段\null}%
  \def\theoremautorefname{定理}%
  \def\pageautorefname~#1\null{第~#1~页\null}%
\fi
\RequirePackage{geometry}
\geometry{
    paper=a4paper,
    top=3.5cm, bottom=2.5cm,
    left=3.0cm, right=3.0cm,
    headsep=0.3cm, headheight=2.5cm,
    footskip=0.75cm}
\RequirePackage[pagestyles]{titlesec}
\RequirePackage[justification=centering]{caption}
\RequirePackage{bicaption}
\DeclareCaptionFont{ks}{\kaishu}
\DeclareCaptionFont{tmr}{\abstitlefont}
\captionsetup[figure][bi-first]{name=图,font={small,ks,stretch=1}}
\captionsetup[figure][bi-second]{name=Fig.,font={small,stretch=1}}

% 2. 配置双语标题


\captionsetup[table][bi-first]{name=表,font={small,ks,stretch=1}}
\captionsetup[table][bi-second]{name=Table,font={small,stretch=1}}
\usepackage{fancyhdr}
%自定义命令 固定长度下划线
\newcommand\ful[2][4cm]{\uline{\makebox[#1][c]{#2}}}

\ifustc@opt@bachelor
    \newcommand\ustc@header@size{\zihao{-5}}
    \newcommand\ustc@main@header{中国原子能科学研究院硕士学位论文}
\else
    \newcommand\ustc@header@size{\zihao{-5}}
    \newcommand\ustc@main@header{%
        \if@mainmatter\CTEXthechapter\quad\fi%
        \chaptertitle}
\fi
\newpagestyle{front}[]{
        \setfoot{}{\thepage}{}
        \pagestyle{fancy}
        % \lhead{\zihao{5} \textbf{CIAE}}
        % \rhead{\zihao{5} \thepage}
        \fancyhf{} % 先清空所有页眉页脚

        \fancyhead[CE]{\zihao{-5} 中国原子能科学研究院博（硕）士学位论文}
        \fancyhead[CO]{\zihao{-5} 中国原子能科学研究院博（硕）士学位论文}

        \fancyfoot[CE,CO]{\thepage}
        \renewcommand{\headrule}{%
        \hrule height2.25pt width\headwidth%
        \vskip 1pt%
        \hrule height0.75pt width\headwidth}%
}

\newpagestyle{main}[]{
        %\sethead{}{\ustc@main@header}{}
        \setfoot[\thepage][][]{}{}{\thepage}
        \pagestyle{fancy}
        \fancyhead[CE]{\zihao{-5} 中国原子能科学研究院博（硕）士学位论文}
        \fancyhead[CO]{\zihao{-5} 中国原子能科学研究院博（硕）士学位论文}
        \renewcommand{\headrule}{%
        \hrule height2.25pt width\headwidth%
        \vskip 1pt%
        \hrule height0.75pt width\headwidth}%
        \fancyfoot[CE,CO]{\abstitlefont\selectfont% Times New Roman
        \zihao{-5}% 小五字号
        \raisebox{0.02ex}{-}~\thepage~\raisebox{0.02ex}{-}}
}
\renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \ifustc@opt@bachelor
        \pagenumbering{gobble}%
    \else
        \pagenumbering{Roman}%
    \fi
    \pagestyle{front}%
}%
\renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \ifustc@opt@bachelor
        \relax
    \else
        \pagenumbering{arabic}%
    \fi
    \pagestyle{main}%
}%
\renewcommand\chapter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \global\@topnum\z@
    \@afterindenttrue
    \secdef\@chapter\@schapter
}
\renewcommand\maketitle{%
    \newgeometry{
        top=3.5cm, bottom=2.5cm,
        left=3.0cm, right=3.0cm,
        headheight=2.5cm, headsep=0.3cm,
        footskip=0.75cm}
    \pagestyle{empty}
    \pdfbookmark[-1]{\ustc@title}{title}
    \make@cntitle \cleardoublepage
    % \make@entitle \cleardoublepage
    \restoregeometry
    \ifustc@opt@bachelor\relax\else
        \ifustc@opt@pdf\relax\else%
            \make@statement \cleardoublepage
        \fi
    \fi
    \pagestyle{main}%
}
\ifustc@opt@doctor
    \newcommand\ustc@thesisname{学\zhspace 位\zhspace 论\zhspace 文}%
    \newcommand\ustc@enthesisname{A dissertation for doctor's degree}%
\else
    \ifustc@opt@master
        \newcommand\ustc@thesisname{学\hspace{10pt} 位\hspace{10pt} 论\hspace{10pt}文}
        \newcommand\ustc@enthesisname{A dissertation for master's degree}
    \else
        \newcommand\ustc@thesisname{学位论文}
        \newcommand\ustc@enthesisname{A dissertation for bachelor's degree}
    \fi
\fi
\RequirePackage{tikz}
\newcommand\vpostext[2]{%
    \tikz[remember picture,overlay]%
        \node [yshift=-#1] at (current page.north) [below,align=flush center]%
            {\parbox{\textwidth}{\centering#2}};}
\newcommand\make@cntitle{%
    \begin{titlepage}%
        % \tikz[remember picture,overlay]%
        %     \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
        %         {\parbox{\textwidth}{\raggedleft\fangsong\setfontsize{14bp}\ustc@secrettext}};
        \headrule
        \noindent
        \hspace{-4pt}
        \makebox[3em][r]{\songti\zihao{-4}\textbf{分类号}}%
        \rule[-3pt]{0.6\textwidth}{0.7pt}%
        \hspace{-15pt}
        \makebox[3em][r]{\songti\zihao{-4} \textbf{密级}}%
        \rule[-3pt]{112pt}{0.6pt} 
        
        \noindent
        \hspace{-12pt}
        \makebox[3em][r]{\abstitlefont\zihao{-4}\textbf{UDC}}%
        \rule[-3pt]{0.62\textwidth}{0.7pt}

        % \vpostext{5.2cm}{\includegraphics[height=65bp]{figures/ciae_logo_text.jpg}}%
        \vpostext{8.5cm}{\songti\bfseries\setfontsize{36pt}\ustc@thesisname}%
        % \vpostext{11cm}{\includegraphics[height=5cm]{figures/ciae_logo_fig.jpg}}%
        \begin{spacing}{1.5}
        \vpostext{11cm}{\songti\bfseries\zihao{2}\uline{\ustc@title}}%
        \end{spacing}
        \vpostext{15cm}{\songti\bfseries\zihao{3}\uline{\ustc@author}}
        \begin{spacing}{1.5}
        \tikz[remember picture,overlay]%
        \node [yshift=-17cm] at (current page.north) [below,align=flush center]%
            {\parbox{\linewidth}{{\songti\zihao{4}\textbf{指导教师姓名}}\quad \ful[11.6cm]{ \songti\zihao{4}\textbf{\ustc@advisor}\qquad \songti\zihao{4}\textbf{\ustc@depart}\qquad \songti\zihao{4}\textbf{中国原子能科学研究院}}}\\
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{申请学位级别}}\quad \ful[3.13cm]{ \songti\zihao{4}\textbf{硕士}} \songti\zihao{4}\textbf{专业名称}\uline{\qquad \songti\zihao{4}\textbf{\ustc@major}\quad}}\\
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{论文提交日期}}\quad \ful[3.13cm]{ \songti\zihao{4}\textbf{2025.5}} \songti\zihao{4}\textbf{论文答辩日期}\ful[5.4cm]{\qquad \songti\zihao{4}\textbf{2025.6}\quad}}\\
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{学位授予单位和日期}}\quad \ful[10.15cm]{\songti\zihao{4}\textbf{中国原子能科学研究院}\quad \songti\zihao{4}\textbf{2025.7} }}
            };
        \end{spacing}
        \begin{spacing}{1.5}
            \tikz[remember picture,overlay]%
            \node [yshift=-22cm] at (current page.north) [below,align=flush center]%
                {\parbox{\linewidth}{{\hfill \songti\zihao{4}\textbf{答辩委员会会主席}}\quad \ful[5em]{}}\\
                \parbox{\linewidth}{{\hfill \songti\zihao{4}\textbf{评阅人}}\quad \ful[10.8em]{}}\\
                };
        \end{spacing}
    \end{titlepage}}
\newcommand\make@entitle{%
    \begin{titlepage}%
        \tikz[remember picture,overlay]%
            \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
                {\parbox{\textwidth}{\raggedleft\setfontsize{14bp}\ustc@ensecrettext}};%
        \vpostext{5cm}{\sffamily\setfontsize{20bp}[30bp]%
            China Institute of Atomic Energy}%
        \vpostext{6cm}{\sffamily\setfontsize{26bp}[30bp]\ustc@enthesisname}%
        \vpostext{8.2cm}{\includegraphics[height=7cm]{figures/ciae_logo_fig.jpg}}%
        \vpostext{16cm}{\sffamily\bfseries\setfontsize{26bp}[30bp]\ustc@entitle}%
        \tikz[remember picture,overlay]%
            \node [xshift=6cm,yshift=5cm] at (current page.south west)%
            [above right,align=left] {%
                \setfontsize{16bp}[30bp]%
                \begin{tabular}{@{}lc@{}}%
                    Author's Name: & \ustc@enauthor \\%
                    Speciality:    & \ustc@enmajor \\%
                    Supervisor:    & \ustc@enadvisor \\%
                    Finished Time: & \ustc@ensubmitdate%
                \end{tabular}};%
    \end{titlepage}}
\newcommand{\ustc@declaretext} {
本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。
除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过
的研究成果。与我一同工作的同志对本研究所做的贡献均已在论文中作了明确的说明。
}
\newcommand{\ustc@authorization}{
作为申请学位的条件之一，学位论文著作权拥有者授权中国原子能科学研究院拥有
学位论文的部分使用权，即：学校有权按有关规定向国家有关部门或机构送交
论文的复印件和电子版，允许论文被查阅和借阅，可以将学位论文编入《中国
学位论文全文数据库》等有关数据库进行检索，可以采用影印、缩印或扫描等
复制手段保存、汇编学位论文。本人提交的电子文档的内容和纸质论文的内容
相一致。

保密的学位论文在解密后也遵守此规定。
}
\newcommand\make@statement{
    \setfontsize{12bp}[20bp]
    \vspace*{-0.15cm}
    \begin{center}
      \setfontsize{16bp}\textbf{中国原子能科学研究院学位论文原创性声明}
    \end{center}
    \vskip 0.3cm

    \ustc@declaretext\par

    \vskip 0.7cm
    \begin{tabular}{p{7cm}p{7cm}}
      作者签名：\ustc@underline[7.4em]{} & 签字日期：\ustc@underline[7.4em]{}
    \end{tabular}
    \vskip 2.6cm

    \begin{center}
      \setfontsize{16bp}\textbf{中国原子能科学研究院学位论文授权使用声明}
    \end{center}
    \vskip 0.3cm

    \ustc@authorization\par
    \vskip 0.5cm
    $\square$公开 \hspace{0.4cm} $\square$保密（\ustc@underline[2em]{}年）

    \vskip 0.5cm

    {\renewcommand{\arraystretch}{2.0}
    \begin{tabular}{p{7cm}p{7cm}}
      作者签名：\ustc@underline[7.4em]{} & 导师签名：\ustc@underline[7.4em]{} \\
      签字日期：\ustc@underline[7.4em]{} & 签字日期：\ustc@underline[7.4em]{} \\
    \end{tabular}}
}
\newenvironment{abstract}{%
    \ifustc@opt@bachelor
        \ctexset{chapter/format += \zihao{-2}}
    \fi
    \chapter[摘\zhspace 要]{摘\zhspace 要}
    \songti\zihao{4}% 宋体四号
    \linespread{1.5}\selectfont % 1.5倍行距
    \setlength{\parindent}{2em} % 首行缩进2字符
    }{}
\newenvironment{enabstract}{%
    \ifustc@opt@bachelor
        \ctexset{chapter/format += \zihao{-2}}
        \chapter{Abstract}
    \else
    \chapter[ABSTRACT]{
    \begin{center} 
    \abstitlefont\bfseries\zihao{3}\selectfont ABSTRACT
    \end{center} 
    }
    \vspace*{-4pt}% 标题与内容间空一行
    \setlength{\parindent}{2em}% 英文段落缩进(4字符)
    \abstitlefont\zihao{4}\linespread{1.25}\selectfont% 正文格式
    \fi}{}
\newcommand\keywords[1]{\par\phantom{关键词}\par\noindent\hangindent=4\ccwd\relax
{\sffamily\zihao{4} 关键词：}#1}
\newcommand\enkeywords[1]{\vspace{1\baselineskip}\par\phantom{KEY WORDS}\par\noindent\hangindent=5.3em\relax
    \textbf{KEY WORDS:} #1}
\let\ustc@save@tableofcontents=\tableofcontents
\renewcommand\tableofcontents{%
    \cleardoublepage%
    
    \ifustc@opt@bachelor
        \pagenumbering{arabic}%
    \fi
    \pdfbookmark[0]{\ustc@pdf@contentsname}{ustctoc}%
    \ustc@save@tableofcontents}
\RequirePackage{titletoc}

\newcommand\ustc@leaders{\titlerule*[0.5pc]{.}}
\ifustc@opt@bachelor
    \titlecontents{chapter}
        [0bp]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hskip\ccwd}
        {}{\ustc@leaders\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hskip\ccwd}
        {}{\ustc@leaders\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel}
        {}{\ustc@leaders\contentspage}
\else
    \titlecontents{chapter}
        [0bp]
        % {\addvspace{6bp}\setfontsize{10.5bp}[20bp]}
        {\addvspace{0bp}\sffamily\zihao{-4}\selectfont}  % 章标题：黑体小4，1.25行距
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\songti\zihao{-4}\selectfont}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\songti\zihao{-4}\selectfont}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
\fi
\titlecontents{figure}
    [\ccwd]
    {\addvspace{0pt}\setlength{\baselineskip}{1.25\baselineskip}\fontspec{SimSun}\fontsize{12pt}{15pt}\selectfont} % 设置宋体小4号，行距为1.25倍
    {图\abstitlefont\zihao{-4} \thecontentslabel\hspace*{0.2em}}
    {}{\ustc@leaders\contentspage}
\titlecontents{table}
    [\ccwd]
    {\addvspace{0pt}\setlength{\baselineskip}{1.25\baselineskip}\fontspec{SimSun}\fontsize{12pt}{15pt}\selectfont} % 设置宋体小4号，行距为1.25倍
    {表\abstitlefont\zihao{-4}\thecontentslabel\hspace*{0.2em}}
    {}{\ustc@leaders\contentspage}
\ifustc@opt@bachelor
    \let\ustc@save@chapter=\chapter
    \let\ustc@save@mainmatter=\mainmatter
    \let\ustc@save@backmatter=\backmatter
    \let\ustc@save@appendix=\appendix
    \renewcommand\mainmatter{%
        \ustc@save@mainmatter
        \renewcommand\chapter{%
            \addtocontents{toc}{\protect\addvspace{12bp}}%
            \ustc@save@chapter
        }%
    }%
    \renewcommand\backmatter{%
        \ustc@save@backmatter
        \renewcommand\chapter{\ustc@save@chapter}%
    }%
    \renewcommand\appendix{%
        \ustc@save@appendix
        \renewcommand\chapter{\ustc@save@chapter}%
    }%
\fi
\setcounter{secnumdepth}{3}
\ctexset{
    chapter = {
        format = \centering\sffamily\setfontsize{16bp}[16pt],
        nameformat = {},
        titleformat = {},
        number = \chinese{chapter},
        aftername = \quad,
        beforeskip = 19.85bp, % 24bp - 31bp
        afterskip = 19.85bp, % 18bp - 10bp
        % fixskip = true, % will be used in future version
    },
    section = {
        format = \sffamily\setfontsize{14bp}[14bp],
        numberformat = \abstitlefont\selectfont, % 序号用Times New Roman
        nameformat = \sffamily, % 汉字用黑体
        beforeskip = 13bp,
        afterskip = 13bp,
        aftername = \hspace{5pt}
    },
    subsection = {
        format = \sffamily\setfontsize{13bp}[13bp],
        numberformat = \abstitlefont\selectfont, % 序号用Times New Roman
        nameformat = \sffamily, % 汉字用黑体
        beforeskip = 8.5bp,
        afterskip = 8.5bp,
        aftername = \hspace{5pt}
    },
    subsubsection = {
        format = \sffamily\setfontsize{12bp},
        beforeskip = 12bp,
        afterskip = 6bp,
    },
}
\ifustc@opt@bachelor
    \setcounter{secnumdepth}{4}
    \ctexset{
        chapter={
            number = \chinese{chapter},
        },
        section = {
            format = \centering\sffamily\bfseries\setfontsize{15bp},
            name = {第,节},
            number = \chinese{section},
        },
        subsection = {
            format = \sffamily\setfontsize{14bp},
            number = \chinese{subsection},
            aftername = {、},
        },
        subsubsection = {
            format = {},
            number = \arabic{subsubsection},
            aftername = {.\ },
            indent = \ccwd,
        },
        paragraph = {
            name = {(,)},
            format = {},
            number = \arabic{paragraph},
            aftername = {\ },
            indent = 2\ccwd,
        },
    }
\fi
\ifustc@opt@bachelor
    \renewcommand\normalsize{\setfontsize{12bp}[22bp]}
\else
\renewcommand{\normalsize}{%
\@setfontsize\normalsize{12bp}{15bp}% 小四号1.25倍行距
\abovedisplayskip 6bp \@plus 1bp \@minus 1bp
\abovedisplayshortskip 6bp \@plus 1bp \@minus 1bp
\belowdisplayskip \abovedisplayskip
\belowdisplayshortskip \abovedisplayshortskip
}
\setlength{\parindent}{2em} % 首行缩进2字符
\fi
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{0bp}
\RequirePackage{caption}
\RequirePackage{calc}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\DeclareCaptionLabelSeparator{shortk}{\hspace{1pt}}
\captionsetup{
    format = hang,
    labelsep = shortk,
}
\ifustc@opt@bachelor
    \captionsetup{font = normalsize}
\else
    \captionsetup{
        font = small,
        % labelfont+={bf},
    }
\fi
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = {12bp-\intextsep},
}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp,
}
\newcommand\note[1]{%
    \captionsetup{position = bottom}
    \caption*{\hangindent=2\ccwd\relax\ustc@notesname#1}}
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}
\newenvironment{notation}{%
    \ctexset{chapter/format += \rmfamily\setfontsize{10.5bp}}
    \chapter{\ustc@notationname}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}
\usepackage[numbers,sort&compress]{natbib}
\newcommand\bibstyle@ustcnumerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@ustcinline{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@ustcauthoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{1em}
\ifustc@opt@bachelor
    \newcommand\ustcjournal{\textit}
\else
    \newcommand\ustcjournal{\relax}
\fi
\renewenvironment{thebibliography}[1]{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \ifustc@opt@bachelor\ctexset{chapter/format += \zihao{-2}}\fi
    \chapter{\bibname}%
    \parindent\z@
    \bibpreamble
    \abstitlefont\zihao{-4}\linespread{1.25}\selectfont
    \list{\@biblabel{\the\c@NAT@ctr}}{\@bibsetup{#1}\global\c@NAT@ctr\z@}%
    \ifNAT@openbib
        \renewcommand\newblock{\par}%
    \else
        \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \fi
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.\@m
    \let\NAT@bibitem@first@sw\@firstoftwo
        \let\citeN\cite \let\shortcite\cite
        \let\citeasnoun\cite
}{%
    \bibitem@fin
    \bibpostamble
    \def\@noitemerr{%
        \PackageWarning{natbib}{Empty `thebibliography' environment}%
    }%
    \endlist
    \bibcleanup
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
}%
\newenvironment{acknowledgements}{%
    \ifustc@opt@bachelor
        \ctexset{chapter/format += \zihao{-2}}%
        \chapter*{\ustc@acknowledgementsname}%
    \else
        \chapter[\ustc@pdf@acknowledgementsname]{\ustc@acknowledgementsname}%
    \fi}{}
\newenvironment{publications}{\chapter{\ustc@publicationsname}}{}
\endinput
%%
%% End of file `ustcthesis.cls'.
