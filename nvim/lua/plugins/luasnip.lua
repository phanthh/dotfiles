require("luasnip.loaders.from_vscode").lazy_load()
local u = require("utils")

-- Custom snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
	enable_autosnippets = true,
})

-- Quick format snippets
local texformat = {
	s("bf", { t("\\textbf{"), i(1), t("}"), i(0) }),
	s("il", { t("\\textit{"), i(1), t("}"), i(0) }),
}

local mdformat = {
	s("bf", { t("**"), i(1), t("**"), i(0) }),
	s("il", { t("*"), i(1), t("*"), i(0) }),
}

-- Math snippets
local mathh = {
	-- env
	s("mk", { t("$"), i(1), t("$"), i(0) }),
	s("dm", {
		t({ "$$", "" }),
		i(1),
		t({ "", ".$$", "" }),
		i(0),
	}),
	-- formating
	s("mbf", { t("\\mathbf{"), i(1), t("}"), i(0) }),
	s("mil", { t("\\mathit{"), i(1), t("}"), i(0) }),
	s("mcl", { t("\\mathcal{"), i(1), t("}"), i(0) }),
	s("mbb", { t("\\mathbb{"), i(1), t("}"), i(0) }),
	s("mbf", { t("\\mathbf{"), i(1), t("}"), i(0) }),
	-- specials
	s("nrm", { t("||"), i(1), t("||"), i(0) }),
	s("notin", { t("\\not\\in"), i(0) }),
	s("^^", { t("\\hat{"), i(1), t("}"), i(0) }),
	s("--", { t("\\bar{"), i(1), t("}"), i(0) }),
	s("sre", { t("\\sqrt{"), i(1), t("}"), i(0) }),
	-- symbols
	s("prd", { t("\\langle "), i(1), t(" \\rangle"), i(0) }),
	s("ooo", { t("\\infty"), i(0) }),
	s("ipl", { t("\\implies"), i(0) }),
	s("=<", { t("\\impliedby"), i(0) }),
	s("<=", { t("\\leq"), i(0) }),
	s(">=", { t("\\geq"), i(0) }),
	s("!=", { t("\\neq"), i(0) }),
	s("tto", { t("\\to"), i(0) }),
	s("~~", { t("\\sim"), i(0) }),
	s("iff", { t("\\iff"), i(0) }),
	s("invs", { t("^{-1}"), i(0) }),
	s("lm", { t("\\lim"), i(0) }),
	s("AA", { t("\\forall"), i(0) }),
	s("OO", { t("\\emptyset"), i(0) }),
	s("xx", { t("\\times"), i(0) }),
	s("**", { t("\\cdot"), i(0) }),
	s("...", { t("\\ldots"), i(0) }),
	s("nn", { t("\\in "), i(0) }),
	s("EE", { t("\\exists "), i(0) }),
	s("sS", { t("\\subset "), i(0) }),
	s("Ss", { t("\\supset "), i(0) }),
	s("SS", { t("\\{"), i(1), t("\\}"), i(0) }),
	-- utils
	s("lmup", fmt("\\limsup_{{{1} \to {2}}}{3}", { i(1, "n"), i(2, "\\infty"), i(0) })),
	s("pd", fmt("\\frac{{\\partial {1}}}{{\\partial {2} }} {3}", { i(1), i(2, "x"), i(0) })),
	s("//", fmt("\\frac{{{1}}}{{{2}}}{3}", { i(1), i(2), i(0) })),
}

-- Quick R snippets
local rsnip = {
	s("iin", { t("%in%"), i(0) }),
	s("pp", { t("%>%"), i(0) }),
	s("**", { t("%*%"), i(0) }),
}

-- R
ls.add_snippets("r", rsnip, { type = "autosnippets" })

-- Rmd
ls.add_snippets("rmd", rsnip, { type = "autosnippets" })
ls.add_snippets("rmd", mathh, { type = "autosnippets" })
ls.add_snippets("rmd", mdformat, { type = "autosnippets" })
ls.add_snippets("rmd", {
	s(
		"ttt",
		fmt(
			[[
---
title: {1}
subtitle: {2}
author: {3}
date: "`r format(Sys.time(), '%d %B %Y')`"
output: pdf_document
---

{4}
]],
			{
				i(1, "@title"),
				i(2, "@subtitle"),
				i(3, "@author"),
				i(0),
			}
		)
	),
})

-- Latex
ls.add_snippets("tex", mathh, { type = "autosnippets" })
ls.add_snippets("tex", texformat, { type = "autosnippets" })
ls.add_snippets("tex", {
	-- template
	s(
		"ttt",
		fmt(
			[[
%format
\documentclass{{article}}
\usepackage[a4paper]{{geometry}}
\usepackage[english]{{babel}}
\usepackage[utf8]{{inputenc}}
\usepackage[shortlabels]{{enumitem}}
\usepackage{{setspace}}
\singlespacing

%math
\usepackage{{mathtools,amsmath,amssymb}}
\usepackage{{graphicx}}

%decor
\usepackage{{setspace}}
\usepackage{{hyperref}}
\hypersetup{{
  colorlinks=true,
  citecolor=blue,
  filecolor=black,
  linkcolor=blue,
  urlcolor=blue
}}

\usepackage{{fancyhdr}}
\pagestyle{{fancy}}
\fancyhf{{}}
\lhead{{{1}: {2}}}
\rfoot{{\thepage}}

%meta
\title{{{3}}}
\author{{{4}}}

\begin{{document}}
\maketitle
\thispagestyle{{fancy}}
{5}
\end{{document}}
]],
			{
				i(1, "@courseid"),
				i(2, "@coursename"),
				i(3, "@title"),
				i(4, "@author"),
				i(0),
			}
		)
	),
})

-- Markdown
ls.add_snippets("markdown", mdformat, { type = "autosnippets" })
ls.add_snippets("markdown", mathh, { type = "autosnippets" })

-- Python
ls.add_snippets("python", mdformat, { type = "autosnippets" })
ls.add_snippets("python", mathh, { type = "autosnippets" })
ls.add_snippets("python", {
	s(";;", { t({ "# %%", "" }), i(0) }),
	s(";md", { t({ "# %% [markdown]", '"""', "" }), i(0), t({ "", '"""' }) }),
}, { type = "autosnippets" })
