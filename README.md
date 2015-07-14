
## Description

The book, [_ScalaCheck: The Definitive Guide_](http://www.artima.com/shop/scalacheck), contains some nice examples
of property-based testing. The idea of this repo is to port some of these
examples from Scala / ScalaCheck to Haskell / QuickCheck.

## Progress

Below is a list of examples that I have ported to Haskell / QuickCheck:

* Chapter 4
    * [Constructing optimal output - run length encoding](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/tree/master/src/Chapter4/RunLengthEncoding) (pages 45-46)
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch04.html#sec6))
* Chapter 5
    * [Labelling properties - interleaving](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/tree/master/src/Chapter5/Interleaving) (pages 51-52)
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch05.html#sec1))
    * [Collecting test statistics - Classify](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/blob/master/src/Chapter5/ClassifyingTestStatistics.hs) (page 56)  
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch05.html#sec1))
    * [Collecting test statistics - Collect](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/blob/master/src/Chapter5/CollectingTestStatistics.hs) (page 57)  
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch05.html#sec1))
* Chapter 6
    * [Higher-order generators](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/tree/master/src/Chapter6/HigherOrderGenerators) (pages 68-70)  
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch06.html#sec1))
    * [Recursive generators](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/tree/master/src/Chapter6/RecursiveGenerators) (pages 78-82)  
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch06.html#sec1))
    * [Custom test case simplification](https://github.com/taylorjg/ScalaCheckBookExamplesInQuickCheck/tree/master/src/Chapter6/CustomTestCaseSimplification.hs) (pages 82-87)  
        * (_original example code_ can be found within [here](http://booksites.artima.com/scalacheck/examples/html/ch06.html#sec2))

## Links

* http://booksites.artima.com/scalacheck
* http://booksites.artima.com/scalacheck/ScalaCheckExamples.zip
* https://wiki.haskell.org/Introduction_to_QuickCheck2
* https://hackage.haskell.org/package/QuickCheck
* [Port of the examples in the ScalaCheck book to C# and FsCheck 2](https://github.com/taylorjg/ScalaCheckBookExamplesInFsCheck2)
* [Port of the examples in the ScalaCheck book to F# and FsCheck 2](https://github.com/taylorjg/ScalaCheckBookExamplesInFsCheckInFs)
