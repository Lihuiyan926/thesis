# 中国原子能科学研究院学位论文 LaTeX 模板

本模板按照《中国原子能科学研究院研究生学位论文格式规范》制作，适用于硕士和博士学位论文排版，基于中国科学技术大学 ustcthesis 模板修改而来。

---

## 为什么用 LaTeX 而不是 Word？

| 对比项 | LaTeX | Word |
|--------|-------|------|
| 数学公式 | 原生支持，排版精美 | 公式编辑器操作繁琐 |
| 参考文献 | 自动编号、自动排序 | 手动维护，易出错 |
| 图表编号 | 插入/删除自动更新 | 需手动调整 |
| 格式统一 | 模板保证全文一致 | 容易因复制粘贴破坏格式 |
| 版本管理 | 纯文本，适合 Git | 二进制文件，难以对比 |

---

## 环境要求

> **注意：本模板含中文字体，必须使用 `xelatex` 编译，使用 `pdflatex` 或 `latex` 将导致中文乱码或编译失败。**

已测试通过的环境：

| 系统 | 编译工具 | 编辑器 |
|------|----------|--------|
| Windows + TeX Live 2023 | `xelatex → bibtex → xelatex → xelatex`，`latexmk` | VS Code + LaTeX Workshop |
| WSL Ubuntu + TeX Live | `xelatex → bibtex → xelatex → xelatex`，`latexmk`，`make` | — |

### 推荐编辑器

- **VS Code** + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件（推荐）

---

## 文件结构

```
├── main.tex                  # 主文件：填写封面信息，组织章节
├── .latexmkrc                # latexmk 配置文件（不能删除！见下方说明）
├── Makefile                  # Linux/WSL 下 make 编译入口
├── chapters/
│   ├── abstract.tex          # 中英文摘要
│   ├── chap01.tex            # 第一章（绪论或你的第一章）
│   ├── chap02.tex            # 第二章
│   ├── ...                   # 更多章节
│   ├── acknowledgements.tex  # 致谢
│   └── publications.tex      # 攻读学位期间发表的论文
├── bib/
│   └── refs.bib              # 参考文献数据库
├── figures/                  # 图片目录（支持 .pdf .eps .png .jpg）
├── ustcthesis.cls            # 文档类（定义所有格式，一般不需要改）
├── ustcextra.sty             # 扩展宏包（定理、代码、算法等环境）
└── gbt7714-numerical.bst     # 参考文献样式（国标 GB/T 7714）
```

---

## 快速开始（5步）

### 第一步：修改封面信息

打开 `main.tex`，找到以下部分并填写：

```latex
\classnum{O571.6}               % 中图分类号
\secretlevel{非密}              % 密级：非密|内部|秘密|机密
\title{你的论文中文题目}        % 不超过35个汉字
\author{张~三}                  % 姓名之间用 ~ 分隔
\major{粒子物理与原子核物理}    % 学科专业名称
\advisor{导师姓名}              % 导师姓名
\depart{研究员}                 % 导师职称
\submitdate{2025.5}             % 论文提交日期
\defensedate{2025.5}            % 论文答辩日期
\grantdate{2025.7}              % 学位授予日期
\chairman{答辩委员会主席}       % 答辩委员会主席
\reviewer{评阅人甲、评阅人乙}   % 评阅人
\coverdate{2025年5月}           % 封面底部日期
```

如有副导师，取消注释并填写：
```latex
% \coadvisor{副导师姓名}
% \codepart{副研究员}
```

如需英文封面，取消注释并填写：
```latex
% \entitle{Research on XXX Based on XXXX}
% \enauthor{Zhang San}
% \enmajor{Particle Physics and Nuclear Physics}
% \enadvisor{Prof. Li Si}
```

### 第二步：写摘要

打开 `chapters/abstract.tex`，填写中文摘要、英文摘要和关键词。
- 硕士论文中文摘要不少于 800 字
- 博士论文中文摘要不少于 1200 字

### 第三步：写正文各章

在 `chapters/chap01.tex`、`chap02.tex` 等文件中撰写各章内容。

每章文件结构如下：
```latex
\chapter{章节标题}\label{chap:标识符}

\section{第一节标题}
正文内容……

\section{本章小结}
本章介绍了……
```

如需新增章节：
1. 在 `chapters/` 目录下新建 `chap07.tex`
2. 在 `main.tex` 中添加一行：`\input{chapters/chap07}`

### 第四步：管理参考文献

在 `bib/refs.bib` 中添加文献条目，在正文中用 `\cite{key}` 或 `\upcite{key}` 引用。
详见第五章（参考文献使用说明）。

### 第五步：编译

**手动编译顺序：**
```bash
xelatex main
bibtex main
xelatex main
xelatex main
```
必须运行 4 次，才能正确生成目录、参考文献和交叉引用。

**使用 latexmk（Windows / Linux 通用）：**
```bash
latexmk main
```
> **注意：根目录下的 `.latexmkrc` 文件不能删除。** 该文件配置 `latexmk` 使用 `xelatex` 引擎；若缺失，`latexmk` 将默认使用 `latex`，导致中文乱码或编译失败。

**使用 VS Code + LaTeX Workshop（推荐）：**
1. 用 VS Code 打开模板根目录，打开 `main.tex`
2. 按 `Ctrl+Alt+B`，在弹出菜单中选择 Recipe：**xelatex → bibtex → xelatex → xelatex**
3. 编译完成后，按 `Ctrl+Alt+V` 预览 PDF

**Linux / WSL Ubuntu：**
```bash
make
```

---

## 常见问题

### 编译报错：字体找不到

**症状**：报错信息含 `Font ... not found` 或 `kpathsea: Running mktexpk`

**解决**：本模板会自动检测字体环境：
- Windows：使用系统自带的宋体（SimSun）和 Times New Roman，通常无需额外操作
- Linux：自动切换为 Fandol 和 TeX Gyre Termes，需确保 TeX Live 完整安装

若仍报字体错误，可在文档类选项中添加 `AutoFakeFont=true`：
```latex
\documentclass[doctor,chinese,pdf,AutoFakeFont=true]{ustcthesis}
```

### 编译报错：找不到 .sty 或 .bst 文件

**解决**：确认 TeX Live 安装完整。若使用最小安装，需手动安装缺失的宏包：
```bash
tlmgr install 宏包名
```

### 目录/参考文献/编号不更新

**原因**：编译次数不够。

**解决**：按顺序完整运行 `xelatex → bibtex → xelatex → xelatex`。

### 图片不显示

**解决**：确认图片文件放在 `figures/` 目录下，文件名不含中文和空格，扩展名与代码一致。

### 参考文献不显示

**解决**：确认已运行 `bibtex main`，且 `.bib` 文件中的 key 与 `\cite{key}` 一致。

---

## 学位类型与输出模式切换

在 `main.tex` 第一行修改文档类选项：

```latex
% 硕士论文，电子版（默认）
\documentclass[master,chinese,pdf]{ustcthesis}

% 博士论文，电子版
\documentclass[doctor,chinese,pdf]{ustcthesis}

% 打印版（双面装订，链接为黑色）
\documentclass[doctor,chinese,print]{ustcthesis}
```

### 双面打印说明

将选项由 `pdf` 改为 `print` 后：

- 启用双面（`twoside`）排版，奇偶页页眉和页码位置对称，适合装订
- 每章从奇数页（右页）开始
- 超链接颜色变为黑色，打印后无蓝色边框

---

## 参考资料

- [LaTeX 入门（lshort-zh-cn）](https://ctan.org/pkg/lshort-zh-cn)：最好的中文 LaTeX 入门教程
- [CTAN 宏包文档](https://www.ctan.org/)：查找任意 LaTeX 宏包的说明文档
- [Detexify](https://detexify.kirelabs.org/)：手写符号识别对应的 LaTeX 命令
