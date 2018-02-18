= Learning Haskell

http:// docs.haskellstack.org/en/stable/README/
https://github.com/bitemyapp/learnhaskell
https://www.stackage.org/package/base

https://github.com/data61/fp-course

= First book
installing haskell on ubuntu
https://gist.github.com/Dexyne/5791465


= Stack
* `stack new learning-haskell new-template`
* `stack setup`
* `stack build`
* `stack test`
* `stack exec learning-haskell-exe`
* `stack list-dependencies`

* `stack build --pedantic --test --exec "echo Success" --file-watch`


stack ghci is the haskell shell to play around
:q quits the shell
:cd path changes directory
:load <file> loads a file into the current shell
:reload :r
:module un loads the current file
:info div
:type 'c'
