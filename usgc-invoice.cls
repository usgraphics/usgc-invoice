\ProvidesClass{usgc-invoice}
\LoadClass{article}

\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage{longtable}
\RequirePackage{xcolor}

\renewcommand{\familydefault}{\ttdefault}

% Line item counter/generator
\newcounter{linenum}
\newcommand{\N}{%
  \stepcounter{linenum}%
  \thelinenum
}

\newcommand{\USGCAddress}{%
  \begin{tabular}[t]{@{}l@{}}
    \textbf{U.S. Graphics Company} \\
    PO Box 32871 \\
    Phoenix, AZ 85064\\
    billing@usgraphics.com\\
  \end{tabular}%
}

\newcommand{\invoiceData}[3]{%
  \raisebox{\dimexpr-\height+\ht\strutbox}[0pt][0pt]{%
    \begin{tabular}{|ll|}
      \hline
      \textbf{Invoice \#:}      & #1 \\
      \textbf{Invoice Created:} & #2 \\
      \textbf{Invoice Due:}     & #3 \\
      \hline
    \end{tabular}%
  }%
}

\newcommand{\header}[3]{%
  \noindent
  \USGCAddress
  \hfill
  \invoiceData{#1}{#2}{#3}%
  \vspace{20pt}%
}

\newenvironment{company}{%
  \begingroup
  \setlength{\parindent}{0pt}
  \obeylines
  \noindent
  \textbf{Billed To:}
}{
  \endgroup
  \vspace{22pt}
}

\newcommand{\order}[3]{%
  \def\orderNumber{#1} % Save it to be used in the table
  \noindent
  \begin{tabular}{@{}ll@{}}
  Order No.:     & #1 \\
  Checkout No.:  & #2 \\
  Purchase Date: & #3
  \end{tabular}
  \vspace{10pt}
}

\newenvironment{orderTable}[1][\orderNumber]{%
  % Reset counter before table
  \setcounter{linenum}{0}

  % Invoice table with SKU column
  % \begin{longtable}{r l p{3in} @{\hspace{2.3em}} r r r}
  \begin{longtable}{r l p{3in} @{\hspace{24pt}} r r r}
    \multicolumn{6}{c}{\textbf{Order #1}}\\
    \textbf{\#} & \textbf{SKU} & \textbf{Desc.} & \textbf{Unit Rate} & \textbf{Count} & \textbf{Amount (USD)}\\
    \hline
}{%
  \end{longtable}
}

\newcommand{\totals}[7]{%
  \hline
  \multicolumn{5}{r}{Subtotal} & #1\\
  \multicolumn{5}{r}{Discount} & #2\\
  \hline
  \multicolumn{5}{r}{Net Sales Total} & #3\\
  \multicolumn{5}{r}{Tax} & #4\\
  \hline\hline
  \multicolumn{5}{r}{\textbf{Total}} & \textbf{#5}\\
  \multicolumn{6}{r}{}\\
  \multicolumn{6}{c}{Invoice Status: P A I D}\\
  \multicolumn{6}{r}{}\\
  \hline
  \multicolumn{5}{r}{Paid} & #6\\
  \hline
  \multicolumn{5}{r}{\textbf{Balance}} & \textbf{#7}\\
}

\newcommand{\footer}[1]{%
  \noindent
  \begin{tabular}{@{}ll@{}}
    Payment Method: & #1\\
  \end{tabular}
  \center ***
  \center Thank you for your business.
  \center U.S. Graphics Company%
}

