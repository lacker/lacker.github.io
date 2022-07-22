---
layout: post
title: "Embracing My Inner Blub Programmer"
date: 2022-07-22 16:00:00
categories: tech
---

I always feel a little bit guilty about Lisp. I am supposed to
appreciate Lisp. It's a fine wine and as a member of respectable
society I should hold it in high esteem. But, I'm not quite
there. I'm not opposed to Lisp, per se, I just never end up
using it for very much.

This week is no exception. I am not writing any Lisp this week. Quite
the opposite - for the first time in a while, I am writing big
chunks of C++.

## The Bad

It's very obvious when you write C++ after using languages like Python
or JavaScript for a while that C++ has problems. Ancient problems that
I remember Java fixing back in the 90's. The problems with C++ are so
glaring, I run into programmers who are surprised that such things are
even possible.

* When you write a new class you have to split logic into `.h` and
  `.cpp` files, half repeating yourself.
  
* If you accidentally access of the end of an array, your program will
  simply crash with no error message reported.
  
* If you forget to initialize a member variable, your program will
  often set those variables to zero, but sometimes it will just fill
  them with quasi random data.
  
* You either have to manually free memory that you allocate, or use
  solutions like `unique_ptr` that are more complicated than any
  reasonable language offers.
  
## The Not So Bad
  
At least C++ is getting better. The last time I wrote a lot of C++ was
working for Google, 2005-2009, and I don't think we had even fully
adopted C++98. So I'm still a decade behind the times, learning the
various C++11 things. `unique_ptr` and `shared_ptr` are good; they let you
mostly avoid remembering to delete your own pointers. `mutex` and
`condition_variable` are good as well. And in general with GitHub, `cmake` and
`meson` there are a decent amount of libraries out there that do
common things. Not like Python or JavaScript where you have solutions
for everything, but it's a lot better than nothing.

## The Actually Good

So why C++ at all? Well, this is my favorite API of the week:

```
cublasCgemm3mStridedBatched(cublasHandle_t handle, 
                            cublasOperation_t transA, cublasOperation_t transB,
                            int M, int N, int K, 
                            const T* alpha,
                            const T* A, int ldA, int strideA, 
                            const T* B, int ldB, int strideB, 
                            const T* beta,
                            T* C, int ldC, int strideC,
                            int batchCount)
```

It's a shortcut to run code equivalent to these nested loops, on a
GPU...

```
for (int p = 0; p < batchCount; ++p) {
  for (int m = 0; m < M; ++m) {
    for (int n = 0; n < N; ++n) {
      T c_mnp = 0;
      for (int k = 0; k < K, ++k)
        c_mnp += A[m + k*ldA + p*strideA] * B[k + n*ldB + p*strideB];
      C[m + n*ldC + p*strideC] = 
        (*alpha)*c_mnp + (*beta)*C[m + n*ldC + p*strideC];
    }
  }
}
```

...but you can also conjugate-transpose `A` before running this matrix
operation. I was pretty excited, I literally wanted a matrix to be
conjugated and transposed, and I thought this was the sort of abstract
mathematical fun that I had given up long ago with the transition to
computer science.

See [this Nvidia blog
post](https://developer.nvidia.com/blog/cublas-strided-batched-matrix-multiply/)
if you're curious for more detail, but basically this code is
multiplying sequences of matrices that you've stored in some regular
way in memory.

## Blub

I feel like this is why I always end up developing in Blub
nowadays. I'm never choosing programming languages based on the most
powerful generalist language. I always have some narrow task - from GPU
matrix operations to making a responsive website where you can drag
stuff around - and having a library that's well suited to the task
ends up being more important to me than having macros.

It's not the same but at least I sort of get to use Lisp macros while
developing in Emacs. I'll take another look at VS Code once they
implement `C-x-(`, `C-x-)`, and `C-x-e`.
