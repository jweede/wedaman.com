---
layout: post
title: Cum Mortis In Lingua Mortua
---

If you've ever taken a course with [Anca Ralescu](http://www.cs.uc.edu/~aralescu/), you may have had exposure to the language FRIL. If you're like most people you neither have heard nor would want to hear about it. Dr. Ralescu, however, is convinced that this is the best way to learn Logic Programming. 

What is **FRIL**? It stands for **[Fuzzy Relational Inference Language](http://en.wikipedia.org/wiki/Fril)**, and we're using it for [UC](http://cs.uc.edu/)'s *Organization of Programming Languages* course.

The reasons are not clear.

Let's do a simple comparison:

**FRIL**

Pros: 

 - <strike>Has support for Fuzzy Logic</strike> (not used in this course)
 - Supports some added brevity since it treats all expressions as lists, much like LISP.

Cons:

 - Not open source. Does not work reliably on Windows, OS X, or Linux systems. Although on the latter two it's not too beastly.
 - Has a syntax that encourages brevity and subtlety. Makes code you wrote ten minutes ago hard to read.
 - Lacks documentation
 - Not widely used or distributed

**PROLOG**

Pros:

 - SWI-Prolog is open source, widely used (as far as logic languages go), and highly reliable. 
 - Uses standard PROLOG syntax, and is well documented throughout.
 - Has a more explicit syntax. Much easier to read.

Cons:

 - &nbsp;

So why would a professor pick FRIL over PROLOG for a simple *Organization of Programming Languages* course? Maybe said professor isn't up to date on current practices. Maybe, like the famous [5th Generation Computing System](http://vanemden.wordpress.com/2010/08/21/who-killed-prolog/), she "fell in love" with the language. Who knows?

Curiously, all the features of PROLOG can be [implemented in Haskell](http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=prolog+in+haskell), very simply. Especially for such a simple course. They could be implemented in LISP as well. Since LISP is used later in the course, it might make it easier for students to parse what's going on. 

None of which is happening. So what do students take away from the course? Basically, **students learn that Logic and Functional languages should be ignored by and large and have no redeeming value**. I think the intent of the course should be the opposite, since each has a valuable domain which they fill.