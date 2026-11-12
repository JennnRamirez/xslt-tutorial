# XSLT for Beginners – exercises

Exercise files from the "XSLT for Beginners" tutorial at Declarative Amsterdam 2026 (12 November 2026).

The whole tutorial is built around one project: this year's conference programme as XML. Each exercise adds one step, and you end up with a web page, a printout for each room door, and a plain-text version for an email.

Everything is XSLT 3.0.

## What's here

| File | What it is |
| --- | --- |
| `programme.xml` | The conference programme. Every exercise uses it as input. |
| `broken.xml` | An XML file with three mistakes. Open it and fix them one at a time. |
| `exercises/` | One stylesheet per section. Follow the numbered TODO comments at the top of each file. |

The exercises, in order:

| File | Topic |
| --- | --- |
| `1.3-first.xsl` | Your first stylesheet |
| `1.4-public.xsl` | The identity transform: a copy without emails and notes |
| `1.5-html.xsl` | Turning the programme into a web page |
| `1.6-push.xsl` | Push and pull: keeping bold and italics in the abstracts |
| `1.7-conditions.xsl` | Affiliations and speaker labels |
| `2.2-variable.xsl` | Variables: counting the sessions |
| `2.3-param.xsl` | Parameters: a printout for one room |
| `2.4-named.xsl` | Named templates: the time range, written once |
| `2.5-sort.xsl` | Sorting the programme |
| `2.6-text.xsl` | Plain-text output |

Each file starts from the finished version of the one before it. So you can jump in at any section, and the next file shows one way to solve the previous one.
