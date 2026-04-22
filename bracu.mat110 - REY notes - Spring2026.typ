/**
 *   Code in MarkUp, #
 *             Math, $$
 *   markup/content, []
 *             Code, {}
 *        smallMath, $smallFractions$
 *        largeMath, $ largeFractions $             // Just because of the spaces before/after dollar signs
 * 
 *   horizon-center,     $ largeFractions $
 *     horizon-left, box($ largeFractions $)        // way1
 * 
 *        largeMath, $display(largeFractions)$      // but it's better to use way1
 * 
 * 
 * 
 * Foundations: https://typst.app/docs/reference/foundations/
 * PieceWise Function: https://forum.typst.app/t/how-to-write-piecewise-functions-in-math/4668
 * Math: https://typst.app/docs/reference/math/
 * 
 * Tutorials:
 *      1. https://www.youtube.com/@GuilhermeDGarcia/videos
 * 
 * Guides:
 *      1. https://sitandr.github.io/typst-examples-book/book/basics/tutorial/functions.html
 * 
 * MarkUp
 *    #let name = "Typst"                 // Binding
 *    This is #name's documentation.
 * 
 *    #let my-add(x, y) = x + y           // Binding
 *    Sum is #my-add(2, 3).               // Destruction
 * 
 *    #let (x, y) = (1, 2)                // Binding: Array
 *    The coordinates are #x, #y.
 * 
 *    #let (a, .., b) = (1, 2, 3, 4)      // Binding: Array
 *    The first element is #a.
 *    The last element is #b.
 * 
 *    #let books = (                      // Binding: Dictionary
        Shakespeare: "Hamlet",
        Homer: "The Odyssey",
        Austen: "Persuasion",
      )
 *
 *    #let dict = (greet: "Hello")        // Binding: Dictionary
      #dict.greet \
      #emoji.face
 *
 *    #let it = [= Heading]               // Binding: MarkUp/Content
      #it.body \
      #it.depth \
      #it.fields()                        // Very Interesting Function
 */ 


#show heading.where(level: 1): set align(center)

// Level 1: Standard
#show list: set text()

// Level 2: List inside a list
#show list: it => {
  show list: set text()
  show list: set list(tight: true, spacing: 0.65em)   // Loose-Lists will now be Tight-List
  it
}

// Level 3: List inside a list inside a list
#show list: it => {
  show list: it => {
    show list: set text()
    it
  }
  it
}

#let _m1 = "•";
#let _m2 = "◦";
#let _m3 = move(dy: 0.1em, text(0.7em)["▪"]);

#set list(tight: true, spacing: 0.65em)   // Loose-Lists will now be Tight-List
#set list(marker: (_m1, _m2, _m3))
#set page(
  margin: (
    x: 1cm,     // Left and Right
    y: 1cm      // Top and Bottom
  ),
)

#import "REY.typ"








= bracu.mat110 \ Contents Table
== Functions
- Vertical Line Test
- $abs(x)$
  #REY.fix_list_item[Basic Definition of Absolute Value: $|x| = display(cases(REY.case(x, x>=0), REY.case(-x, x<0)))$]
  - $sqrt(x^2) = |x|$           #v(0.5em)
  - $REY.e(-|x|, 2)$
- Anton -- Chapter 0 -- Page 8: "The Effect of Algebraic Operations on the Domain"
#v(1em)

== Limits
1. Easy ones
  - *Direct Substitution*
    #REY.img1("./1.png", [
        ©️ Week1 Slides, Page 154 \
        \@ CLP-1 by Joel, Andrew, Elyse
    ])
    $
      REY.ltr(
        limits(lim)_(x -> 5) (x^2 - 4x + 3),
        limits(lim)_(x -> 1) (x^7 - 2x^5 + 1)^35,
        limits(lim)_(x -> 2) x(x - 1)(x + 1),         REY.tPurple("(a)")
        limits(lim)_(x -> 3) ((x^2 - 9) / (x + 3)),
        limits(lim)_(x -> 0) ((6x - 9) / (x^3 - 12x + 3))
      )
    $
    /*

    */
  - *Factorising*
    $
      REY.ltr(
        limits(lim)_(x ->  2) ((x - 2) / (x^2 - 4)), 
        limits(lim)_(x ->  4) (x^2 - 4x) / (x^2 - 16),
        limits(lim)_(x ->  1) (x^3 - x^2) / (x - 1),
        limits(lim)_(x ->  2) (x^2 + x - 6) / (x - 2),  REY.tPurple("(b)")
        limits(lim)_(x -> -3) ((x^2 - 9) / (x + 3)),
      )
    $
    - Anton -- Chapter 1.2 -- Exercises 3-14
    - Anton -- Chapter 1.2 -- Exercise 40 [This is how exam questions should be]
    #v(1em)
  - Look out for questions that look like "Limits @ Infinity"
    $
      REY.ltr(
        limits(lim)_(x ->  2) (x^2 - 4x + 4) / (x^2 + x - 6),
        limits(lim)_(x -> 2) (2x^2 - 5x + 2) / (5x^2 - 7x - 6)
      )
    $
    #v(2em)

2. *Rationalizing the Denominator*
  $
    REY.ltr(
      limits(lim)_(x -> 9) (x - 9) / (sqrt(x) - 3),
      limits(lim)_(y -> 4) (4 - y) / (2 - sqrt(y)),
      limits(lim)_(x -> 0) x / (sqrt(x + 1) - 1)
    )
  $

3. *Conjugate*
  - Anton -- Chapter 1.2 -- Exercises 37,38
  $
    REY.ltr(
      limits(lim)_(x -> 0) (sqrt(x + 4) - 2) / x,
      limits(lim)_(x -> 0) (sqrt(x^2 + 4) - 2) / x
    )
  $

4. *1 Sided Limits*
  - PieceWise Functions
  - Anton -- Chapter 1.2 -- Exercises 15-28
  $
    REY.ltr(
      limits(lim)_(x -> 0) x / abs(x),
      limits(lim)_(x -> 0) 1 / abs(2-x),
      limits(lim)_(x -> 3) x / (x-3),
      limits(lim)_(x -> 2) x / (x^2-4),         REY.tPurple("(c)")
      limits(lim)_(x -> 6) ((x+6) / (x^2-36)),
      limits(lim)_(x -> 4) (3-x) / (x^2-2x-8),
    )
  $
  - Notice the difference between #REY.tPurple($"(a), (b), (c)"$)
  #v(2em)

#pagebreak()

5. *$limits(lim)_(x->infinity)$* #parbreak()
  - Type I #parbreak()
    $REY.col(
      REY.rinf((      (3x+5) / (6x-8)    ))   = REY.rinf(3x, 6x)     = 3/6,
      REY.rinf((2x^2 -5x +2) / (5x^2 -7x -6)) = REY.rinf(2x^2, 5x^2) = 2/5,

      REY.rinf((     (6-x^3) / (7t^3+3)    )) = REY.rinf(-x^3, 7x^3) = (-1)/7,
      REY.linf(     (x+4x^3) / (1-x^2+7x^3) ) = REY.linf(4x^3, 7x^3) = (-4)/(-7),

      REY.rinf(root(3, (3x+5) / (6x-8)))        = root(3, REY.rinf(3x, 6x))     = root(3, 3/6),
      REY.rinf(root(3, (3x^7-4x^5) / (2x^7+1))) = root(3, REY.rinf(3x^7, 2x^7)) = root(3, 3/2),
    )$
    #v(2.5em)

  - Type II #parbreak()
    $REY.utd(
      REY.rinf(4x^2-x, 2x^3-5) = REY.rinf(4x^2, 2x^3) = REY.rinf(4, 2x) = REY.rinf(1, 2x) = REY.rinf(1, x) = 1/infinity = 0^+,
      #v(0em),
      REY.linf(3, x+4)         = REY.linf(1, x)   = 1/(-infinity)       = 0^- wide ==> "approaching 0, yes, but from the bottom-half of y-axis",
      REY.rinf(1, x-12)        = REY.rinf(1, x)   = 1/(+infinity)       = 0^+,
      REY.linf(x-2, x^2+2x+1)  = REY.linf(x, x^2) = REY.linf(1,x)
    )$
    #v(2.5em)

  - SideNote: *$ thick limits(lim)_(-infinity)$* #parbreak()
    $REY.eq(REY.linf(x, x^2)        = REY.linf(1, x) dot cancel(x)/cancel(x)  wide     wide      
                                  ==> REY.linf(1, x) dot "-ve"/"-ve"          wide ==> wide  
                                      REY.linf(1, x) dot 1 
                                    = REY.linf(1, x) 
                                    = 1/(-infinity) 
                                    = 0^-
                                    )$
    #v(2.5em)

  - Type III #parbreak()
    $REY.utd(
      REY.rinf(7-6x^5, x+3) = REY.rinf(-6x^5, x) = REY.rinf((-6) dot x^4/1) = (-6) dot (+infinity)^4/1 = (-6) dot infinity/1 = -infinity,
      REY.linf(7-6x^5, x+3) = REY.linf(-6x^5, x) = REY.linf((-6) dot x^4/1) = (-6) dot (-infinity)^4/1 = (-6) dot infinity/1 = -infinity,
    )$  
    #v(2.5em)

  - Type IV #parbreak()
    
