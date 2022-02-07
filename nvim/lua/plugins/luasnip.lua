require("luasnip.loaders.from_vscode").lazy_load()
local u = require("utils")

-- Custom snippets
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

ls.config.set_config({
	enable_autosnippets = true,
})

ls.snippets = {
	rmd = {
		-- templage
		s(
			"ttt",
			fmta(
				[[
---
title: <1>
subtitle: <2>
author: <3>
date: "`r format(Sys.time(), '%d %B %Y')`"
output: pdf_document
---

<4>
]],
				{
					i(1, "@title"),
					i(2, "@subtitle"),
					i(3, "@author"),
					i(0),
				}
			)
		),
	},
	tex = {
		-- template
		s(
			"ttt",
			fmta(
				[[
\documentclass[11pt]{article}
\usepackage[a4paper, total={6in, 9in}]{geometry}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\usepackage[english]{babel}
\usepackage{mathtools,amsmath,amssymb}
\usepackage[shortlabels]{enumitem}
\usepackage{subcaption}
\usepackage{graphicx}

% decor
\usepackage{fancyhdr}
\usepackage{setspace}
\usepackage{hyperref}

% header
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.3mm} % Top line width
\renewcommand{\footrulewidth}{0mm} % Bottom line width
\setlength{\headheight}{45pt}

\lhead{}
\chead{\hspace*{55mm}\raisebox{7mm}{\hspace*{31mm}\small\begin{tabular}{r}
    \textbf{<1>} \\\\ <2> \\\\ \today \\\\
\end{tabular}}}

\title{<3>}
\author{<4> \vspace*{0.5cm} \\\\ Hau Phan - 886680}

\begin{document}
\maketitle
\thispagestyle{fancy}
<5>
\end{document}
]],
				{
					i(1, "@coursename"),
					i(2, "@courseid"),
					i(3, "@title"),
					i(4, "@subtitle"),
					i(0),
				}
			)
		),
	},
}

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
	s("=>", { t("\\implies"), i(0) }),
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
	s("OO", { t("\\O"), i(0) }),
	s("xx", { t("\\times"), i(0) }),
	s("**", { t("\\cdot"), i(0) }),
	s("...", { t("\\ldots"), i(0) }),
	s("pp", { t("\\pi "), i(0) }),
	s("ss", { t("\\sin "), i(0) }),
	s("cc", { t("\\cos "), i(0) }),
	s("nn", { t("\\in "), i(0) }),
	s("SS", { t("\\{"), i(1), t("\\}"), i(0) }),
	-- utils
	s("lmup", fmta("\\limsup_{<1> \to <2>}<3>", { i(1, "n"), i(2, "\\infty"), i(0) })),
	s("pd", fmta("\\frac{\\partial <1>}{partial <2>} <3>", { i(1), i(2, "x"), i(0) })),
	s("//", fmta("\\frac{<1>}{<2>}<3>", { i(1), i(2), i(0) })),
}

ls.autosnippets = {
	tex = u.iconcat({
		-- bold, italic
		s("bf", { t("\\textbf{"), i(1), t("}"), i(0) }),
		s("il", { t("\\textit{"), i(1), t("}"), i(0) }),
	}, mathh),
	markdown = u.iconcat({
		-- bold, italic
		s("bf", { t("**"), i(1), t("**"), i(0) }),
		s("il", { t("*"), i(1), t("*"), i(0) }),
	}, mathh),
	rmd = u.iconcat({
		-- bold, italic
		s("bf", { t("**"), i(1), t("**"), i(0) }),
		s("il", { t("*"), i(1), t("*"), i(0) }),
	}, mathh),
	python = {
		-- bold, italic
		s("bf", { t("**"), i(1), t("**"), i(0) }),
		s("il", { t("*"), i(1), t("*"), i(0) }),
		-- env
		s("mk", { t("$"), i(1), t("$"), i(0) }),
		s("dm", {
			t({ "$$", "\t" }),
			i(1),
			t({ "\t", ".$$", "\t" }),
			i(0),
		}),
		s(";;", { t({ "# %%", "" }), i(0) }),
		s(";md", { t({ "# %% [markdown]", '"""', "" }), i(0), t({ "", '"""' }) }),
	},
}
