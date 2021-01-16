#!/bin/bash
filename=$1
# without using precompiled headers
# g++ -std=c++17 $filename.cpp -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer -o  "${filename}"
# using precompiled headers
g++ -std=c++17 -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer -stdlib=libc++ -include stdc++.h  $filename.cpp -o  "${filename}"

