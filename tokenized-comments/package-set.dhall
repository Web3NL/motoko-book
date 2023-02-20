[ { dependencies = [] : List Text
  , name = "base"
  , repo = "https://github.com/dfinity/motoko-base.git"
  , version = "0c5029bfcc6f8d416aebad6fcd0c1c3bc492b802"
  }
, { dependencies = [ "base" ]
  , name = "matchers"
  , repo = "https://github.com/kritzcreek/motoko-matchers.git"
  , version = "7f95f69ae9a399cedf161d90738db822f315c07e"
  }
, { dependencies = [ "base", "matchers" ]  
  , name = "MotokoStableBTree"
  , repo = "https://github.com/sardariuss/MotokoStableBTree.git"
  , version = "8b2ce725be3df2481bde55c05561469cdd20b5c0"
  }
]
