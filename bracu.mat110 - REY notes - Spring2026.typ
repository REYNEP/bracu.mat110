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


#set page(
  margin: (
    x: 1cm,     // Left and Right
    y: 1cm      // Top and Bottom
  ),
)

#show heading.where(level: 1): set align(center)

#import "REY.typ"








= bracu.mat110 \ Contents Table
== Functions
- Vertical Line Test
- $abs(x)$
  #REY.fix_list_item[Basic Definition of Absolute Value: $|x| = display(cases(REY.case(x, x>=0), REY.case(-x, x<0)))$]
  - $sqrt(x^2) = |x|$           #v(0.5em)
  - $REY.e(-|x|, 2)$            #h(2em) (graph this)
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

      REY.rinf(root(3,      (3x+5) / (6x-8)  )) = root(3, REY.rinf(3x, 6x))     = root(3, 3/6),
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
      REY.rinf(7-6x^5, x+3, REY.purple)   = REY.rinf(-6x^5, x) = REY.rinf((-6) dot x^4/1) = (-6) dot (+infinity)^4/1 = (-6) dot   infinity /1 = -infinity,
      REY.linf(7-6x^5, x+3, REY.purple)   = REY.linf(-6x^5, x) = REY.linf((-6) dot x^4/1) = (-6) dot (-infinity)^4/1 = (-6) dot   infinity /1 = -infinity,
      #v(0.5em),
      REY.linf(7-6x^#REY.tPurple(4), x+3) = REY.linf(-6x^4, x) = REY.linf((-6) dot x^3/1) = (-6) dot (-infinity)^3/1 = (-6) dot (-infinity)/1 = +infinity,
    )$  
    #v(2.5em)

  - Anton -- Chapter 1.3 -- Page 93: "A Quick method for finding limits of ..."
  - Anton -- Chapter 1.3 -- Exercises 09-24
  - Exercises #parbreak()
    $
      REY.ltr(
        REY.linf(3, x+4),
        REY.rinf(1, x-12),
        REY.linf(x-2, x^2+2x+1),
        REY.rinf(6-x^3, 7x^3+3),
        REY.linf(x+4x^3, 1-x^2+7x^3)
      )
    $
    #v(2.5em)

#pagebreak()














#show: REY.REY_SHOW_fixPlus

5. *$limits(lim)_(x->infinity)$* #parbreak()
  - Type IV -- #REY.tPurple[Divide by $|x|$] #parbreak()
    - Anton -- Chapter 1.3 -- Page 94: "Limits Involving Radicals" 
      $
        #let n1 = $sqrt(x^2+2)$
        #let d1 = $3x-6$
        #let f1 = REY.f1
        #let whyABS = $wide       because abs(x) = sqrt(x^2)      wide #[and] wide        because |x| = display(cases(REY.case(x, x>=0), REY.case(-x, x<0)))$

        REY.utd(
          REY.rinf(n1, d1)  = REY.rinf(f1(n1, |x|),       f1(d1, |x|)) 
                            = REY.rinf(f1(n1, sqrt(x^2)), f1(d1, +x)) whyABS,
          #v(0.5em),
          REY.linf(n1, d1)  = REY.linf(f1(n1, |x|),       f1(d1, |x|)) 
                            = REY.linf(f1(n1, sqrt(x^2)), f1(d1, -x)) whyABS
        )
      $
      #v(2.5em)

    - Anton -- Chapter 1.3 -- Exercises 25-30
    - Quick Method #parbreak() #v(0.5em) #h(1em)
      $REY.utd(
        REY.ltr(
          REY.linf(sqrt(5x^2)-2, x+3) = REY.linf(sqrt(5x^2), x)  = sqrt(5)/(-1),,,
          REY.rinf(sqrt(5x^2)-2, x+3) = REY.rinf(sqrt(5x^2), x)  = sqrt(5)/(+1),
        ),
        #v(0.0em),
        REY.linf(2-x, sqrt(7+6x^2))   = REY.linf(-x, sqrt(6x^2)) = (-(-1))/sqrt(6),
        #v(0.0em),
        REY.linf(sqrt(3x^4)+x, x^2-8) = REY.linf(sqrt(3x^4), x^2) = sqrt(3)/1,
      )$  
      #v(2.5em)


  - Type V: #REY.tPurple[Multiply by Conjugate] #v(-0.5em)
    $
      REY.ltr(
        REY.rinf(sqrt(x^6+5)    - x^3),
        REY.rinf(sqrt(x^6+5x^3) - x^3),
      )
    $
    #v(1.0em)
  - Anton -- Chapter 1.3 -- Exercises 31-32 [Conjugate]
    $
      REY.ltr(
        REY.rinf(sqrt(x^2+3)  - x),
        REY.rinf(sqrt(x^2-3x) - x),
      )
    $
    #v(2.5em)

  - Type VI 
    - Anton -- Chapter 1.3 -- Page 95: "End behavior of Trigonometric, Exponential, and Logarithmic Funcs"
    - Anton -- Chapter 1.3 -- Exercises 33-36 -- Divide by $e^x$ #parbreak() 
      $ REY.linf(1-e^x, 1+e^x) $
      #v(1.0em)
    - Anton -- Chapter 1.3 -- Exercises 37-38 -- $ln()$ #parbreak()
      $
        REY.ltr(
          REY.rinf(      thick ln(2/x^2)),,
          limits(lim)_(x -> 0^+) thick ln(2/x^2),
        )
      $










#pagebreak()

6. *Squeeze Theorem / SandWich Theorem*  #parbreak()
  $
    REY.utdL(
      limits(lim)_(h->0) REY.t3 sin(h)/h = 1,
      limits(lim)_(h->0) REY.t3 quad cos(1/h) = #[range[-1, 1] = D.N.E.],
      limits(lim)_(h->0) REY.t2 h dot cos(1/h) = 0,
      limits(lim)_(h->0) REY.t2 h dot sin(1/h) = 0,,
      & limits(lim)_(h->0) (cos(h)-1)/h &= limits(lim)_(h->0)                 (cos(h) -1)  /h dot (cos(h)+1)/(cos(h)+1),
      &                                 &= limits(lim)_(h->0) (REY.tPurple(  cos^2(h))-1^2)/h dot          1/(cos(h)+1),
      &                                 &= limits(lim)_(h->0) (REY.tPurple(1-sin^2(h))-1^2)/h dot          1/(cos(h)+1),
      &                                 &= limits(lim)_(h->0)              (-sin^2(h))     /h dot          1/(cos(h)+1),
      &                                 &= limits(lim)_(h->0)              ( sin  (h))     /h dot     -sin(h)/(cos(h)+1)
    )
  $