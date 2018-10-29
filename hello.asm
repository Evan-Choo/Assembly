; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;     nasm -fmacho64 hello.asm
;     (change the start indentifier to _main, otherwise it will prompt 'undifined symbol for 
;      architecture x86_64')
;     ld hello.o -o hello -macosx_version_min 10.13 -lSystem
;     (specify the version_min and link with libSystem.dylib)
;     ./hello(to run it)
; ----------------------------------------------------------------------------------------
          global    _main
          section   .text
_main:    mov       rax, 0x02000004         ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, message            ; address of string to output
          mov       rdx, 13                 ; number of bytes
          syscall                           ; invoke operating system to do the write
          mov       rax, 0x02000001         ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

          section   .data
message:  db        "Hello, World", 10      ; note the newline at the end
