#!/bin/bash

# ---- download original C code
wget -q 'http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/VERSIONS/C-LANG/mt19937-64.c'
[ $? -ne 0 ] && { "could not download original C code"; exit 1; }

# ---- replace original main() function in C code
sed -i '/main(void)/,$d' mt19937-64.c
cat mt19937-64_test.c >> mt19937-64.c

# ---- compile C code 
gcc mt19937-64.c -o mt19937-64_c.out
[ $? -ne 0 ] && { "error compiling C code"; exit 2; }

# ---- compile Fortran code
gfortran ../mt19937-64.f95 mt19937-64_test.f95 -o mt19937-64_f.out
[ $? -ne 0 ] && { "error compiling Fortran code"; exit 3; }

# ---- run and compare results
./mt19937-64_c.out > c.txt
./mt19937-64_f.out > f.txt
diff c.txt f.txt && \
  echo "outputs from C and Fortran codes are identical" || \
  echo "outputs from C and Fortran codes differ"

