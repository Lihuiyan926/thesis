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
\LoadClass[a4paper, UTF8, zihao=-4, AutoFakeBold=2.5]{ctexbook}[2015/05/14]
\@ifclasslater{ctexbook}{2015/05/14}{}{%
    \ClassError{ustcthesis}{%
        Requiring ctex 2.0 or later version!\MessageBreak
        Please update the package using your\MessageBreak
        TeX package manager or from CTAN
    }{%
        See ustcthesis.pdf for more detailed update guide.
    }
}
% 西文字体：优先使用 Windows 原版，回退到 TeX Live 内置等宽替代
\IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
    \newfontfamily\abstitlefont{Times New Roman}[BoldFont=Times New Roman Bold]
}{
    \setmainfont{TeX Gyre Termes}
    \newfontfamily\abstitlefont{TeX Gyre Termes}[BoldFont=TeX Gyre Termes Bold]
}
\IfFontExistsTF{Arial}{
    \setsansfont{Arial}[BoldFont=Arial Black]
}{
    \setsansfont{TeX Gyre Heros}
}
\IfFontExistsTF{Courier New}{
    \setmonofont{Courier New}
}{
    \setmonofont{TeX Gyre Cursor}
}
% 中文主字体：优先使用 Windows 原版，回退到 TeX Live 内置 Fandol
% 其余字族（黑体、仿宋、楷体）由 ctex fontset=auto 自动处理
\IfFontExistsTF{SimSun}{
    \setCJKmainfont{SimSun}[AutoFakeBold=2.5]
    \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.5]
}{
    \setCJKmainfont{FandolSong}[AutoFakeBold=2.5]
    \setCJKfamilyfont{zhsong}{FandolSong}[AutoFakeBold=2.5]
}
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
\ustc@define@term{degree}
\ifustc@opt@doctor\degree{博士}\else\degree{硕士}\fi
\ustc@define@term{advisor}
\ustc@define@term{coadvisor}
\ustc@define@term{codepart}
\ustc@define@term{submitdate}
\ustc@define@term{defensedate}
\ustc@define@term{grantdate}
\ustc@define@term{chairman}
\ustc@define@term{reviewer}
\ustc@define@term{classnum}
\ustc@define@term{secretlevel}
\ustc@define@term{coverdate}
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
  {\heiti\zihao{3}目\zhspace 录}% 黑体3号字
  \vspace{-5pt}% 段后间距0cm
  }
  \newcommand\ustc@pdf@contentsname{目录}
  \renewcommand\listfigurename{图\zhspace 录}
  \renewcommand\listtablename{表\zhspace 录}
  \newcommand\ustc@notesname{\textbf{注}：}
  \newcommand\ustc@acknowledgementsname{致\hspace{\ccwd}谢}
  \newcommand\ustc@pdf@acknowledgementsname{致谢}
  \newcommand\ustc@publicationsname{攻读博（硕）士学位期间已发表或录用的论文}
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
\RequirePackage{subcaption}
\RequirePackage[list=off]{bicaption}
% 分图编号格式：a)、b)（labelformat=simple 避免 subcaption 再套括号）
\renewcommand\thesubfigure{\alph{subfigure})}
\captionsetup[subfigure]{labelformat=simple}
\DeclareCaptionFont{ks}{\kaishu}
\DeclareCaptionFont{tmr}{\abstitlefont}
\DeclareCaptionFont{wuhao}{\zihao{5}}
\captionsetup[figure][bi-first]{name=图,font={wuhao,ks,stretch=1}}
\captionsetup[figure][bi-second]{name=Fig.,font={wuhao,stretch=1}}
\captionsetup[table][bi-first]{name=表,font={wuhao,ks,stretch=1}}
\captionsetup[table][bi-second]{name=Table,font={wuhao,stretch=1}}
\usepackage{fancyhdr}
%自定义命令 固定长度下划线
\newcommand\ful[2][4cm]{\uline{\makebox[#1][c]{#2}}}

\ifustc@opt@doctor
    \newcommand\ustc@degree@header{中国原子能科学研究院博士学位论文}
\else
    \newcommand\ustc@degree@header{中国原子能科学研究院硕士学位论文}
\fi
\ifustc@opt@bachelor
    \newcommand\ustc@header@size{\zihao{-5}}
    \newcommand\ustc@main@header{\ustc@degree@header}
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

        \fancyhead[CE]{\zihao{-5} \ustc@degree@header}
        \fancyhead[CO]{\zihao{-5} \ustc@degree@header}

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
        \fancyhead[CE]{\zihao{-5} \ustc@degree@header}
        \fancyhead[CO]{\zihao{-5} \ustc@degree@header}
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
            % \make@statement \cleardoublepage  % print 模式下不输出原创性声明和授权使用声明
        \fi
    \fi
    \pagestyle{main}%
}
\ifustc@opt@doctor
    \newcommand\ustc@thesisname{学\hspace{10pt}  位\hspace{10pt}  论\hspace{10pt}  文}%
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
% 评阅人多行下划线：逐行绘制，确保每行（含最后一行）都有下划线
\newdimen\ustc@ul@depth
\newdimen\ustc@ul@thick
\newcommand{\ustc@reviewer@box}[1]{%
    \begingroup\songti\zihao{4}\bfseries%
    \ustc@ul@depth=8pt%
    \setlength\ustc@ul@thick{\ULthickness}%
    \setbox\z@=\hbox{一}%
    \dimen@=\ht\z@\advance\dimen@\dp\z@\advance\dimen@\ustc@ul@depth% 第一条线距顶部距离
    \setbox\@tempboxa=\vtop{%
        \hsize=#1\parindent=\z@\parskip=\z@%
        \noindent\ustc@reviewer\par%
    }%
    \@tempdima=\ht\@tempboxa\advance\@tempdima\dp\@tempboxa%
    % 计算行数：floor(总高/行距) + 1
    \@tempcnta=\@tempdima%      总高（sp）
    \@tempcntb=\baselineskip%   行距（sp）
    \divide\@tempcnta by\@tempcntb%
    \advance\@tempcnta\@ne%
    \leavevmode%
    \hbox{%
        \lower\dp\@tempboxa\vbox to\@tempdima{%
            \vskip\dimen@%
            \hrule height\z@ depth\ustc@ul@thick width#1%
            \advance\@tempcnta-\@ne% 已画第一条，剩余行数
            \loop\ifnum\@tempcnta>\z@%
                \vskip\dimexpr\baselineskip-\ustc@ul@thick\relax%
                \hrule height\z@ depth\ustc@ul@thick width#1%
                \advance\@tempcnta-\@ne%
            \repeat%
            \vss%
        }%
        \hskip-#1%
        \copy\@tempboxa%
    }%
    \endgroup%
}
\newcommand\make@cntitle{%
    \begin{titlepage}%
        \renewcommand{\ULthickness}{1.2pt}% 封面下划线加粗
        % \tikz[remember picture,overlay]%
        %     \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
        %         {\parbox{\textwidth}{\raggedleft\fangsong\setfontsize{14bp}\ustc@secrettext}};
        \headrule
        \vspace{-0.45cm}%
        \noindent
        \hspace{-4pt}
        \makebox[3em][r]{\songti\zihao{-4}\textbf{分类号}}%
        \ful[10cm]{\songti\zihao{4}\textbf{\ustc@classnum}}
        % \rule[-3pt]{0.6\textwidth}{0.7pt}%
        \hspace{-15pt}
        \makebox[3em][r]{\songti\zihao{-4} \textbf{密级}}%
        % \rule[-3pt]{112pt}{0.6pt} 
        \ful[2cm]{\songti\zihao{-4}\textbf{\ustc@secretlevel}}

        \noindent
        \hspace{-12pt}
        \makebox[3em][r]{\abstitlefont\zihao{-4}\textbf{UDC}}%
        \ful[\dimexpr10cm+8pt\relax]{}%

        % \vpostext{5.2cm}{\includegraphics[height=65bp]{figures/ciae_logo_text.jpg}}%
        \vpostext{8cm}{\songti\bfseries\setfontsize{36pt}\ustc@thesisname}%
        % \vpostext{11cm}{\includegraphics[height=5cm]{figures/ciae_logo_fig.jpg}}%
        \begin{spacing}{1.5}
        \vpostext{11cm}{\songti\bfseries\zihao{2}\uline{\ustc@title}}%
        \end{spacing}
        \vpostext{15cm}{\songti\bfseries\zihao{3}\uline{\ustc@author}}
        \tikz[remember picture,overlay]%
        \node [yshift=-17cm] at (current page.north) [below,align=flush center]%
            {\parbox{\linewidth}{{\songti\zihao{4}\textbf{指导教师姓名}}\quad \ful[11.6cm]{ \songti\zihao{4}\textbf{\ustc@advisor}\qquad \songti\zihao{4}\textbf{\ustc@depart}\qquad \songti\zihao{4}\textbf{中国原子能科学研究院}}}%
            \ifx\ustc@coadvisor\@empty\else\\[7pt]%
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{\phantom{指导教师姓名}}}\quad \ful[11.6cm]{ \songti\zihao{4}\textbf{\ustc@coadvisor}\qquad \songti\zihao{4}\textbf{\ustc@codepart}\qquad \songti\zihao{4}\textbf{中国原子能科学研究院}}}\fi\\[7pt]
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{申请学位级别}}\quad \ful[3.13cm]{ \songti\zihao{4}\textbf{\ustc@degree}} \songti\zihao{4}\textbf{专业名称}\uline{\qquad \songti\zihao{4}\textbf{\ustc@major}\quad}}\\[7pt]
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{论文提交日期}}\quad \ful[3.13cm]{ \songti\zihao{4}\textbf{\ustc@submitdate}} \songti\zihao{4}\textbf{论文答辩日期}\ful[5.4cm]{\qquad \songti\zihao{4}\textbf{\ustc@defensedate}\quad}}\\[7pt]
            \parbox{\linewidth}{{\songti\zihao{4}\textbf{学位授予单位和日期}}\quad \ful[10.15cm]{\songti\zihao{4}\textbf{中国原子能科学研究院}\quad \songti\zihao{4}\textbf{\ustc@grantdate} }}
            };
        \tikz[remember picture,overlay]%
        \node [yshift=-22.5cm] at (current page.north) [below,align=flush center]%
            {\parbox{\linewidth}{\raggedleft\songti\zihao{4}%
                \begin{tabular}[t]{@{}l@{\enspace}p{\dimexpr6cm-7.5em\relax}@{}}
                    \textbf{答辩委员会主席} & \ful[\dimexpr6cm-7.5em\relax]{\textbf{\ustc@chairman}}
                \end{tabular}\\[7pt]%
                \begin{tabular}[t]{@{}l@{\enspace}l@{}}
                    \textbf{评阅人} & \ustc@reviewer@box{\dimexpr6cm-3.5em\relax}
                \end{tabular}%
            }%
            };
        \vpostext{26cm}{\songti\bfseries\zihao{4}{\ustc@coverdate}}
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
    \ctexset{%
        chapter/format     += \heiti\zihao{3}\linespread{1.0}\selectfont,% 黑体三号单倍行距
        chapter/afterskip   = 0pt,% 段后0行（空行由下方\vspace手动插入）
    }%
    \chapter[摘\zhspace 要]{摘\zhspace 要}%
    \songti\zihao{4}\linespread{1.5}\selectfont% 宋体四号1.5倍行距
    \setlength{\parindent}{2em}% 首行缩进2字符
    \vspace{\baselineskip}% 标题与正文间空一行
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
{\heiti\zihao{4} 关键词：}#1}
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

% 消除图/表目录中章节间的额外间距，保持条目等间距
\AtBeginDocument{%
    \let\ustc@orig@listoffigures\listoffigures
    \let\ustc@orig@listoftables\listoftables
    \renewcommand{\listoffigures}{%
        \begingroup\let\addvspace\@gobble\ustc@orig@listoffigures\endgroup}
    \renewcommand{\listoftables}{%
        \begingroup\let\addvspace\@gobble\ustc@orig@listoftables\endgroup}
}

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
        {\addvspace{0bp}\heiti\zihao{-4}\linespread{1.25}\selectfont}  % 黑体小4，1.25倍行距，段前0
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\addvspace{0bp}\songti\zihao{-4}\linespread{1.25}\selectfont}  % 宋体小4，1.25倍行距，段前0
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\addvspace{0bp}\songti\zihao{-4}\linespread{1.25}\selectfont}  % 宋体小4，1.25倍行距，段前0
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
\fi
\titlecontents{figure}
    [\ccwd]
    {\addvspace{0bp}\songti\setfontsize{12bp}[18bp]}  % 宋体小4，1.25倍行距（15bp），段前0
    {图~\thecontentslabel\hspace*{0.2em}}
    {}{\titlerule*[0.5pc]{\raisebox{0.2ex}{$\cdot$}}\contentspage}
\titlecontents{table}
    [\ccwd]
    {\addvspace{0bp}\songti\setfontsize{12bp}[18bp]}  % 宋体小4，1.25倍行距（15bp），段前0
    {表~\thecontentslabel\hspace*{0.2em}}
    {}{\titlerule*[0.5pc]{\raisebox{0.2ex}{$\cdot$}}\contentspage}
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
        format = \centering\heiti\bfseries\zihao{3}, % 黑体三号，英文数字Times New Roman加粗
        nameformat = {},
        titleformat = {},
        number = \chinese{chapter},
        aftername = \quad,
        beforeskip = 19.85bp,
        afterskip = 19.85bp,
    },
    section = {
        format = \heiti\bfseries\zihao{4}, % 黑体四号，英文数字Times New Roman加粗
        numberformat = \abstitlefont\mdseries\selectfont, % 序号Times New Roman不加粗
        nameformat = \heiti,
        beforeskip = 13bp,
        afterskip = 13bp,
        aftername = \hspace{5pt}
    },
    subsection = {
        format = \heiti\bfseries\zihao{-4}, % 黑体小四号，英文数字Times New Roman加粗
        numberformat = \abstitlefont\bfseries\selectfont, % 序号Times New Roman加粗
        nameformat = \heiti,
        beforeskip = 8.5bp,
        afterskip = 8.5bp,
        aftername = \hspace{5pt}
    },
    subsubsection = {
        format = \heiti\bfseries\zihao{-4}, % 黑体小四号
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
