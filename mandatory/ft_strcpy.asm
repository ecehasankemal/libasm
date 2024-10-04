;section .text
;    global ft_strcpy

;ft_strcpy:
;    xor rcx, rcx            ; rcx counter register'ı sıfırla 
;.loop:
;   mov al, byte[rdi + rcx] ; al 8bitlik bir registerdır. 8bitlik bir veri alır.
;    mov [rsi + rcx], al     ; rsi + rcx adresine al'ı koy
;    inc rcx                 ; counter register o arttır
;    cmp al, 0               ; al 0 mı diye kontrol et
;    jne .loop               ; eğer al 0 değilse loop'a geri dön
;    ret                     ; fonksiyonu bitir

; nasm -f elf64 -o ft_strlen.o ft_strlen.asm
; gcc main.c ft_strlen.o -Wall -Werror -Wextra -z execstack


;section .text
;    global ft_strcpy
;ft_strcpy:
;    xor rcx, rcx            ; rcx counter register'ı sıfırla

;.loop:
;    mov al, [rdi + rcx]     ; al 8bitlik bir registerdır. 8bitlik bir veri alır.
;    mov [rsi + rcx], al     ; rsi + rcx adresine al'ı koy
;    inc rcx                 ; counter register o arttır
;    cmp al, 0               ; al 0 mı diye kontrol et
;    jnz .loop               ; eğer al 0 değilse loop'a geri dön
;.done:
;    ret                     ; fonksiyonu bitir

;section .text
;    global ft_strcpy

;ft_strcpy:
    ; rdi = src, rsi = dest yani rdi: src, rsi: dest

    ; İnitalize counter registers
;    xor rcx, rcx        ; rcx counter register'ı sıfırla
;    mov rax, rdi        ; rax'i registerine rax sonuçtur src adresini koy
;    mov rbx, rsi        ; rbx'i registerine rbx sonuçtur dest adresini koy

    ; src stringinin uzunlugunu hesaplayalım
;    .find_null:
;        cmp byte [rax + rcx], 0    ; rax + rcx adresindeki byte 0 mı diye kontrol et
;        je .found_null             ; eğer 0 ise found_null'a git
;        inc rcx                   ; counter register'ı bir artır
;        jmp .find_null            ; find_null'a geri dön

;    .found_null:
;        inc rcx                   ; counter register'ı bir artır null u da kopyalamak için
    
    ; stringi kopyalayalım.
;    mov rdi, rbx                     ; dest adresini rdi'ye koy
;    mov rsi, rax                     ; src adresini rsi'ye koy
;    mov rdx, rcx                     ; rcx'i rdx'e koy
;    rep movsb                      ; rsi'den rdi'ye rcx kadar byte kopyala

;    ret                          ; fonksiyonu bitir


section .text
    global ft_strcpy

ft_strcpy:
    mov     rax, 0         ; sonucu tutacak register i sıfırla
    mov     rcx, 0         ; counter register'ı sıfırla

.loop:
    mov     al, byte [rsi + rcx] ; src adresindeki byte'ı al ve al register'ına koy
    mov     [rdi + rcx], al      ; al register'ındaki byte'ı dest adresine koy
    inc     rcx                  ; counter register'ı bir artır
    cmp     al, 0                ; al 0 mı diye kontrol et
    jne     .loop                ; eğer al 0 değilse loop'a geri dön

.done:
    mov    rax, rdi             ; rax'e rcx'i ata
    ret                          ; fonksiyonu bitir

; Assembly dilinde, fonksiyonlara argümanlar belirli registerlar aracılığıyla geçirilir.
; x86-64 ABI (Application Binary Interface) standardına göre, ilk altı argüman
; sırasıyla rdi, rsi, rdx, rcx, r8, ve r9 registerları aracılığıyla geçirilir.
; Bu nedenle, ft_strcpy fonksiyonuna geçirilen ilk iki argüman rdi ve rsi registerlarında bulunur.