



#show math.frac: set text(size: 1em)          // Use this if you wanna increase fraction text size

#let REY_SHOW_fixPlus(body) = {
  // Target the specific math symbols
  show math.plus:  it => move(dy: -0.05em, dx: 0.05em, scale(75%, it))
  show math.minus: it => move(dy: -0.05em, dx: 0.00em, scale(75%, it))
  
  body
}

#let fixer = 1.44;
#let  lvl1(body)  = text(size: 1em*fixer*0.9, body)
#let   f1(..args) = {
  let pos = args.pos();
       if pos.len() == 1 {$ lvl1(    #pos.at(0)   ) $} 
  else if pos.len() == 2 {$ lvl1(   (#pos.at(0) / #pos.at(1))   ) $}
  else if pos.len() == 3 {$ lvl1(   (#pos.at(0) / #pos.at(1))   ) $}
}

#let t3           = $thick thick thick$
#let t2           = $thick thick$
#let big(body)    = text(size: 1.44em, body)
#let e(x,y)       = big[$e^frac(#x, #y)$]
#let case(a,x)    = $#a\, quad & #x$
#let eq(x)        = box[$ #x $]               // Better to use this, than using "display()" function
                                              // display() doesn't maintain vertical line-height based gaps properly
#let rinf(..args) = {
  let pos = args.pos()
       if pos.len() == 1 {$ limits(lim)_(x ->                        +infinity)   #pos.at(0) $} 
  else if pos.len() == 2 {$ limits(lim)_(x ->                        +infinity)  (#pos.at(0)) / (#pos.at(1)) $}
  else if pos.len() == 3 {$ limits(lim)_(x -> text(fill: #pos.at(2), +infinity)) (#pos.at(0)) / (#pos.at(1)) $}
}

#let linf(..args) = {
  let pos = args.pos()
       if pos.len() == 1 {$ limits(lim)_(x ->                        -infinity)   #pos.at(0) $} 
  else if pos.len() == 2 {$ limits(lim)_(x ->                        -infinity)  (#pos.at(0)) / (#pos.at(1)) $}
  else if pos.len() == 3 {$ limits(lim)_(x -> text(fill: #pos.at(2), -infinity)) (#pos.at(0)) / (#pos.at(1)) $}
}











/**
 * Math - Layout
 */ 

#let ltr(..eqs) = {         // Left to Right
  // .pos() gets the positional arguments as an array
  eqs.pos().join($ wide $)
}

#let utd(..eqs) = {
  eqs.pos().map(item => box[$ #item $]).join( linebreak() )
}

#let utdL(..eqs) = {
  eqs.pos().map(item => $ & #item $).join(linebreak())
}

#let col(..args) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    row-gutter: 0.6em,
    align: horizon,
    ..args.pos().map(item => {
      // If it's already a cell, don't wrap it!
      if type(item) == content and item.func() == grid.cell {
        item
      } else {
        box[$ #item $]
      }
    })
  )
}

#let fullRow(x) = grid.cell(colspan: 2, box($ #x $))


/**
 * Math - Prototypes
 */
#let col2_prototype1(..args) = {
  // We use layout to get access to measurement context
  layout(size => {
    let raw_items = args.pos()
    let formatted_items = ()
    
    for i in range(0, raw_items.len(), step: 2) {
      // Get the pair for the current row
      let left = raw_items.at(i)
      let right = if i + 1 < raw_items.len() { raw_items.at(i + 1) } else { [] }
      
      // Measure the "ink height" of both expressions
      let h_left = measure([$ display(#left) $]).height
      let h_right = measure([$ display(#right) $]).height
      let max_h = calc.max(h_left, h_right)
      
      // Force each cell in this row to take that exact max height
      formatted_items.push(box(height: max_h, [$ display(#left) $]))
      formatted_items.push(box(height: max_h, [$ display(#right) $]))
    }

    grid(
      columns: (1fr, 1fr),
      column-gutter: 2em,
      row-gutter: 0.6em, // Keeps rows from touching while heights are dynamic
      align: horizon,
      ..formatted_items
    )
  })
} 











/**
 * Logistics - Colors
 */

// --- 70S WAVES PALETTE --- [GEMINI from a pallette photo input]
#let retroCream = rgb("F5EBE1") // The background color
#let retroNavy  = rgb("112952") // The darkest blue
#let retroTeal  = rgb("297A8E") // The middle blue
#let retroAqua  = rgb("65A6A9") // The light dusty blue
#let retroGold  = rgb("F6D07A") // The warm yellow stripe
#let retroPeach = rgb("EE8E53") // The light orange stripe
#let retroRust  = rgb("E33C24") // The dark red/orange stripe

#let cream  = retroCream
#let navy   = retroNavy
#let teal   = retroTeal
#let aqua   = retroAqua
#let gold   = retroGold
#let peach  = retroPeach
#let rust   = retroRust
#let purple = rgb("#7c00d5")

#let tCream(x)    = text(fill: cream)[#x]
#let tNavy(x)     = text(fill: navy)[#x]
#let tTeal(x)     = text(fill: teal)[#x]
#let tAqua(x)     = text(fill: aqua)[#x]
#let tGold(x)     = text(fill: gold)[#x]
#let tPeach(x)    = text(fill: peach)[#x]
#let tRust(x)     = text(fill: rust)[#x]
#let tPurple(x)   = text(fill: purple)[#x]
#let tColor(c, x) = text(fill: c)[#x]


/**
 * 
 * Logistics - Image
 */
#let img1(p, x) = block(above: 0.5em, below: 0em,
  grid(
    columns: (1.5fr, 1fr), 
    gutter: 0.5em,
    align: horizon,
    image(p, width: 100%),
    x
  )
)




/**
 * Logistics - Fixes
 */

#let fix_list_item(markup, l2: none) = block(
  above: 0.65em, 
  below: 0.65em,
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    row-gutter: 0.5em,      // Adds nice spacing between line 1 and line 2
    align: horizon,         // Vertically centers the text beside the image
    
    // Row 1:- Basically this move Bulletin PIN is why we created this function
    [#move(dy: -0.11em)[◦]], [#markup],
    
    // Row 2 (Only generated if you actually provide l2)
    ..if l2 != none { 
      ([], [#l2]) // Empty cell for col 1, text for col 2
    }
  )
)