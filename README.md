# Commands
To see all the available commands related to competitive programming, type
```
commands
```

You will see something like this
```
$ run problem <name of the problem(s)>  -> parses the problem from the OJ 
$ run contest <number of problems>      -> parses the defined number of problems from the OJ
$ run test    <no arguments>            -> test your code against the sample test cases parsed from the OJ
$ mk          <filename>                -> compiles the C++ code with the predefined flags
$ rn          <filename>                -> different input and out colors
$ generate    <no arguments>            -> generates a gen file to run stress test
$ stress      <filename>                -> runs stress test comparing 
$ header      <no arguments>            -> copy precompiled headers into current directory
```

## Precompiled Headers in c++
To precompile the bits/stdc++.h in  Mac/Linux, type
```
clang++ -std=c++17 -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer -stdlib=libc++ -x c++-header stdc++.h -o stdc++.h.pch
```
And to include it, type
```
clang++ -std=c++17 -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer -stdlib=libc++ -include stdc++.h main.cpp -o main
```
Note that you should pass the **same flags** while including and precompiling the header

To use ***run*** command, you need to download and install my [Competitive Programming Tool](https://github.com/Jintumoni/Parsing-Tool).
