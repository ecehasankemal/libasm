section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    ; src string adresi rdi'de olacak, bunu sakla
    push    rdi             ; src string adresini stack'e kaydet

    ; String uzunluğunu hesapla
    call    ft_strlen       ; src string'in uzunluğunu hesapla
    inc     rax             ; null byte'ı da dahil etmek için
    mov     rdi, rax        ; malloc için boyutu rdi'ye koy
                            ; malloc ilk argumanı aldıgı için bizim de ilk argumanımız her zaman rdi olur.
                            ; bu yüzden sonucu rdi ye koyuyoruz stackte kayıtlı olan rdi değerini en son eşitleyecegiz.
    call    malloc          ; belleği ayır (malloc)
    test    rax, rax        ; malloc başarısız mı?
    jz      .error_handle   ; Eğer başarısızsa hata işleme

    ; Stack'teki src string adresini geri al
    pop     rsi             ; rsi'ye src string'in adresini geri al
    mov     rdi, rax        ; malloc'la tahsis edilen bellek adresini rdi'ye koy.
    call    ft_strcpy       ; src string'i yeni bellek alanına kopyala

    mov     rax, rdi        ; sonucu (kopyalanan string adresini) rax'e koy
    ret                     ; fonksiyonu bitir

.error_handle:
    xor     rax, rax        ; malloc başarısızsa rax'i sıfırla
    ret                     ; fonksiyonu bitir



; nasm -f elf64 -o ft_strdup.o ft_strdup.asm
; gcc main.c ft_strlen.o ft_strcpy.o ft_strcmp.o ft_strdup.o -Wall -Werror -Wextra -z execstack

; gcc -fPIE -c ft_strdup.asm ft_strlen.asm ft_strcpy.asm ft_strcmp.asm ft_write.asm ft_read.asm

; gcc -o test ft_strdup.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o main.c



