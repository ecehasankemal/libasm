section .text
    global ft_strcmp

ft_strcmp:
    xor     rax, rax         ; rax register'ını sıfırla
    xor     rcx, rcx         ; rcx counter register'ını sıfırla

.matematikabla:
    mov     al, byte [rdi + rcx] ; rdi + rcx adresindeki byte'ı al ve al register'ına koy
    mov     bl, byte [rsi + rcx] ; rsi + rcx adresindeki byte'ı al ve bl register'ına koy
    cmp     al, bl               ; al ve bl'yi karşılaştır
    jne     .not_equal           ; eğer eşit değilse not_equal'a git
    test    al, al               ; al 0 mı diye kontrol et
    je      .done                ; eğer al 0 ise done'a git
    inc     rcx                  ; counter register'ı bir artır
    jmp     .matematikabla                ; loop'a geri dön

.not_equal:
    sub     al, bl               ; al - bl yap
    movsx   rax, al              ; sonucu rax'e koy | burada movsx kullanma sebebimiz al'ın 8 bitlik bir register olması ve rax'in 64 bitlik bir register olması
    ret                          ; fonksiyonu bitir

.done:
    xor     rax, rax             ; eğer eşitse rax'i sıfırla
    ret                          ; fonksiyonu bitir

; nasm -f elf64 -o ft_strcmp.o ft_strcmp.asm
; gcc main.c ft_strlen.o ft_strcpy.o ft_strcmp.o -Wall -Werror -Wextra -z execstack