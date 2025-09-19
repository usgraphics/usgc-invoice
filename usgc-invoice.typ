#set page("us-letter", margin: 0.75in)
#set text(font: "New Computer Modern Mono", size: 12pt)
#show math.text: set text(font: "New Computer Modern Mono", size: 12pt)


#set table(stroke: none)
// global option for all strokes, 0.4 seemed a bit light
#let strokeThickness = 0.50pt
#set table.hline(stroke: strokeThickness)

#set block(below: 2.3em)

#grid(
  columns: (1fr, 1fr), 
  align: (left, right),
  [
    *U.S. Graphics Company* \
    PO Box 32871 \
    Phoenix, AZ 85064 \
    billing\@usgraphics.com
  ],
  box(stroke: strokeThickness, inset: 5pt)[
    #grid(
      columns: 2,
      column-gutter: 0.65em,
      row-gutter: 0.65em,
      [Invoice \#:], [INV-2025-001],
      [Invoice Date:], [Sep 16, 2025],
      [Invoice Due:], [Oct 15, 2025]
     )
  ]
)

#block[
Billed To: \
European Graphics GmbH. \
404 Nonexistentstrasse, Unit 2B, \
70128, Stuttgart, Germany \
P.O. No. 100-20358238 \
VAT ID 82382101 \
]

#grid(
  columns: 2,
  column-gutter: 0.65em,
  row-gutter: 0.65em,
  [Order No.:], [TZR29K0],
  [Checkout No.:], [RXL02W4WKQZK6WN4NY5K],
  [Purchase Date:], [Sep 16, 2025],
)

// Manually typed this out here, but it just as easily could've come
// from a CSV or other source
#let orderList = (
  (1, "FX-400", "Berkeley Mono Startup", "495.00", "1", "495.00"),
  (2, "MX-004", "Berkeley Mono Standard Fonts", "0.00", "1", "0.00"),
  (3, "MX-017", "Berkeley Mono Ligatures", "0.00", "1", "0.00"),
  (4, "TS-024", "Berkeley Mono Standard Compiler", "0.00", "1", "0.00"),
  (5, "MX-014", "Berkeley Mono Web Fonts", "295.00", "1", "295.00"),
  (6, "MX-020", "Berkeley Mono App License", "395.00", "1", "395.00"),
)

#let subtotal = "1,185.00"

// interestingly, there's no way to make a double line 
// in Typst yet
#let doubleLine = stack(
  dir: ttb,
  spacing: 2.5pt,
  line(length: 100%, stroke: strokeThickness),
  line(length: 100%, stroke: strokeThickness)
)

#let offsetCell(content) = table.cell(colspan: 5, align: right, content)

#align(center)[
  Order TZR29K0 
]

#table(
  columns: (auto, auto, 1fr, auto, auto, auto),
  align: (center, left, left, right, right, right),
  table.header(
    [\#], [SKU], [Desc.], [Unit Rate], [Count], [Amount (USD)]
  ),
   table.hline(),
   
  ..orderList.map(((num, sku, desc, rate, count, amount)) => (
    [#num], [#sku], desc, rate, count, amount
  )).flatten(),

  table.hline(),
  offsetCell[Subtotal], subtotal,
  offsetCell[Discount], "-90.00",
  table.hline(),
  table.cell(colspan: 5, align: right)[Net Sales Total], "1095.00",
  offsetCell[Tax], "0.00",
  table.cell(colspan: 6, inset: 0pt, doubleLine),
  offsetCell[*Total*], [*1095.00*],

  table.cell(colspan: 6, inset: (y: 25pt))[
    #align(center+horizon)[Invoice Status: P A I D]
  ],
  
  table.hline(),
  table.cell(colspan: 5, align: right)[Paid], "-1095.00",
  table.hline(),
  table.cell(colspan: 5, align: right)[Balance], "0.00",
)

#block[
  Payment Method:  VISA x 4242
]

#align(center)[
  \*\*\*
  
  Thank you for your business.
]
