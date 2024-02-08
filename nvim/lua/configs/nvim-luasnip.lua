local fmt = require("luasnip.extras.fmt").fmt
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.config.set_config({
	enable_autosnippets = true,
	history = true,
	delete_check_events = "TextChanged",
})

ls.filetype_extend("markdown", { "tex" })
ls.filetype_extend("rmd", { "tex" })
ls.filetype_extend("typescriptreact", { "html", "typescript" })
ls.filetype_extend("javascriptreact", { "html", "javascript" })
ls.filetype_extend("typescript", { "html", "javascript" })

---- Common shared snippets

-- formatting
--
local texformat = {
	s("bf", { t("\\textbf{"), i(1), t("}"), i(0) }),
	s("il", { t("\\textit{"), i(1), t("}"), i(0) }),
}

local mdformat = {
	s("bf", { t("**"), i(1), t("**"), i(0) }),
	s("il", { t("*"), i(1), t("*"), i(0) }),
}

-- math
local mathh = {
	-- env
	s("mk", { t("$"), i(1), t("$"), i(0) }),
	s("dm", {
		t({ "$$", "" }),
		i(1),
		t({ "", ".$$" }),
		i(0),
	}),
	s("ml", {
		t({ "\\begin{aligned}", "" }),
		i(1),
		t({ "", "\\end{aligned}" }),
		i(0),
	}),
	-- formating
	s("mbf", { t("\\mathbf{"), i(1), t("}"), i(0) }),
	s("dft", { t("\\text{DFT}"), i(0) }),
	s("mil", { t("\\mathit{"), i(1), t("}"), i(0) }),
	s("mcl", { t("\\mathcal{"), i(1), t("}"), i(0) }),
	s("mcr", { t("\\mathscr{"), i(1), t("}"), i(0) }),
	s("msf", { t("\\mathsf{"), i(1), t("}"), i(0) }),
	s("mbb", { t("\\mathbb{"), i(1), t("}"), i(0) }),
	s("mbf", { t("\\mathbf{"), i(1), t("}"), i(0) }),
	s("lr(", { t("\\left("), i(1), t("\\right"), i(0) }),
	s("lr[", { t("\\left["), i(1), t("\\right"), i(0) }),
	s("lr{", { t("\\left\\{"), i(1), t("\\right\\"), i(0) }),
	-- specials
	s("nrm", { t("||"), i(1), t("||"), i(0) }),
	s("notnn", { t("\\not\\in"), i(0) }),
	s("ht", { t("\\hat{"), i(1), t("}"), i(0) }),
	s("tl", { t("\\tilde{"), i(1), t("}"), i(0) }),
	s("--", { t("\\bar{"), i(1), t("}"), i(0) }),
	s("sre", { t("\\sqrt{"), i(1), t("}"), i(0) }),
	-- symbols
	s("brc", { t("\\langle "), i(1), t(" \\rangle"), i(0) }),
	s("idp", { t("\\perp\\!\\!\\!\\!\\perp"), i(0) }),
	s("oo", { t("\\infty"), i(0) }),
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
	s("..", { t("\\cdot"), i(0) }),
	s(".*", { t("\\ldots"), i(0) }),
	s("lrr", { t("\\lor"), i(0) }),
	s("lnd", { t("\\land"), i(0) }),
	s("lnt", { t("\\lnot"), i(0) }),
	s("nn", { t("\\in "), i(0) }),
	s("EE", { t("\\exists "), i(0) }),
	s("sS", { t("\\subset "), i(0) }),
	s("Ss", { t("\\supset "), i(0) }),
	s("SS", { t("\\{"), i(1), t("\\}"), i(0) }),
	-- greek
	s(".a", { t("\\alpha"), i(0) }),
	s(".b", { t("\\beta"), i(0) }),
	s(".c", { t("\\chi"), i(0) }),
	s(".d", { t("\\delta"), i(0) }),
	s(".e", { t("\\epsilon"), i(0) }),
	s(".f", { t("\\phi"), i(0) }),
	s(".g", { t("\\gamma"), i(0) }),
	s(".h", { t("\\eta"), i(0) }),
	s(".i", { t("\\iota"), i(0) }),
	s(".j", { t("\\theta"), i(0) }),
	s(".k", { t("\\kappa"), i(0) }),
	s(".l", { t("\\lambda"), i(0) }),
	s(".m", { t("\\mu"), i(0) }),
	s(".n", { t("\\nu"), i(0) }),
	s(".o", { t("\\omega"), i(0) }),
	s(".p", { t("\\pi"), i(0) }),
	-- s(".q", { t("\\varepsilon"), i(0) }), ----------
	s(".r", { t("\\rho"), i(0) }),
	s(".s", { t("\\sigma"), i(0) }),
	s(".t", { t("\\tau"), i(0) }),
	s(".u", { t("\\upsilon"), i(0) }),
	-- s(".v", { t("\\varphi"), i(0) }), -----------
	s(".w", { t("\\omega"), i(0) }),
	s(".x", { t("\\xi"), i(0) }),
	s(".y", { t("\\psi"), i(0) }),
	s(".z", { t("\\zeta"), i(0) }),
	-- uppercase greek
	s(".A", { t("\\Alpha"), i(0) }),
	s(".B", { t("\\Beta"), i(0) }),
	s(".C", { t("\\Chi"), i(0) }),
	s(".D", { t("\\Delta"), i(0) }),
	s(".E", { t("\\Epsilon"), i(0) }),
	s(".F", { t("\\Phi"), i(0) }),
	s(".G", { t("\\Gamma"), i(0) }),
	s(".H", { t("\\Eta"), i(0) }),
	s(".I", { t("\\Iota"), i(0) }),
	s(".J", { t("\\Theta"), i(0) }),
	s(".K", { t("\\Kappa"), i(0) }),
	s(".L", { t("\\Lambda"), i(0) }),
	s(".M", { t("\\Mu"), i(0) }),
	s(".N", { t("\\Nu"), i(0) }),
	s(".O", { t("\\Omega"), i(0) }),
	s(".P", { t("\\Pi"), i(0) }),
	-- s(".Q", { t("\\Chi"), i(0) }),
	s(".R", { t("\\Rho"), i(0) }),
	s(".S", { t("\\Sigma"), i(0) }),
	s(".T", { t("\\Tau"), i(0) }),
	s(".U", { t("\\Upsilon"), i(0) }),
	-- s(".V", { t("\\Varphi"), i(0) }),
	s(".W", { t("\\Omega"), i(0) }),
	s(".X", { t("\\Xi"), i(0) }),
	s(".Y", { t("\\Psi"), i(0) }),
	s(".Z", { t("\\Zeta"), i(0) }),
	-- latin
	s(",l", { t("\\ell"), i(0) }),
	s(",f", { t("\\varphi"), i(0) }),
	s(",e", { t("\\varepsilon"), i(0) }),
	-- utils
	s("pdf", fmt("\\frac{{\\partial {1}}}{{\\partial {2} }} {3}", { i(1), i(2, "x"), i(0) })),
	s("ddd", fmt("\\frac{{d {1}}}{{d {2} }} {3}", { i(1), i(2, "x"), i(0) })),
	s("ffp", fmt("\\frac{{{1}}}{{{2}}}{3}", { i(1), i(2), i(0) })),
	s("smm", fmt("\\sum_{{{1}}}^{{{2}}}{3}", { i(1), i(2), i(0) })),
	s("blrr", fmt("\\bigvee_{{{1}}}^{{{2}}}{3}", { i(1), i(2), i(0) })),
	s("blnd", fmt("\\bigwedge_{{{1}}}^{{{2}}}{3}", { i(1), i(2), i(0) })),
	s("prd", fmt("\\prod_{{{1}}}^{{{2}}}{3}", { i(1), i(2), i(0) })),
}

-- R
local rsnip = {
	s("iin", { t("%in%"), i(0) }),
	s("pp", { t("%>%"), i(0) }),
	s("**", { t("%*%"), i(0) }),
}

---- Adding snippets

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
ls.add_snippets("markdown", {
	s("fm", {
		t({ "---", "" }),
		i(1),
		t({ "", "---", "" }),
		i(0),
	}),
}, { type = "autosnippets" })

-- Python
-- ls.add_snippets("python", mdformat)
-- ls.add_snippets("python", mathh)
ls.add_snippets("python", {
	s(";;", { t({ "# %%", "" }), i(0) }),
	s(";md", { t({ "# %% [markdown]", '"""', "" }), i(0), t({ "", '"""', "# %%" }) }),
}, { type = "autosnippets" })

-- Javascript
ls.add_snippets("javascript", {
	s("clg", { t("console.log("), i(1), t(")"), i(0) }),
}, { type = "autosnippets" })

ls.add_snippets("typescript", {
	s("clg", { t("console.log("), i(1), t(")"), i(0) }),
}, { type = "autosnippets" })

ls.add_snippets("javascriptreact", {
	s("clg", { t("console.log("), i(1), t(")"), i(0) }),
}, { type = "autosnippets" })

ls.add_snippets("typescriptreact", {
	s("clg", { t("console.log("), i(1), t(")"), i(0) }),
}, { type = "autosnippets" })
