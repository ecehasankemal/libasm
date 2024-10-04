; öncelikle ana pointeri atamam gerekiyor.
;----------------------------------------------------------------------------------------------------

; rax = Ana accumulator. Çoğu zaman fonksiyonların geri dönüş değeri burada tutulur.
; Ayrıca matematiksel işlemlerde sonuç bu register'da saklanır.
;----------------------------------------------------------------------------------------------------

; rbx = Base register. Genellikle pointer'ları tutmak için kullanılır.
; Serbestçe kullanılabilen bir register'dır. Ancak bazı durumlarda özel işlemler için kullanılabilir.
;----------------------------------------------------------------------------------------------------

; rcx = Counter register. Genellikle döngülerde kullanılır. Döngüde kaç defa döneceğini belirler.
; (counter). Döngülerde ve özellikle rep gibi string komutlarında sayaç olarak kullanılır.
;----------------------------------------------------------------------------------------------------

; rdx = Data register. Genellikle veri transferlerinde kullanılır.
; Özellikle giriş/çıkış işlemlerinde kullanılır.Genellikle rax ile birlikte
; geniş matematiksel işlemlerde veya fonksiyon çağrılarında kullanılır.
;----------------------------------------------------------------------------------------------------

; rdi =  Çoğu zaman dizilerde ve string operasyonlarında hedef (destination)
; işaretleyici olarak kullanılır. Aynı zamanda fonksiyon çağrılarında ilk parametre burada geçilir
; (Linux sistem çağrılarında ilk argüman).
;----------------------------------------------------------------------------------------------------

; rsi = Source index. Dizilerde ve string operasyonlarında kaynak (source) işaretleyici olarak kullanılır.
; Fonksiyon çağrılarında ikinci parametre burada geçilir.
;----------------------------------------------------------------------------------------------------

; rsp = Stack pointer. Stack'in (yığın) en üstünde hangi adreste olduğunuzu gösterir.
; Fonksiyon çağrılarında stack kullanılır ve bu register,
; fonksiyon sırasında verileri saklamak için kullanılır.
;----------------------------------------------------------------------------------------------------

; rbp = Base pointer. Genellikle stack taban işaretçisi olarak kullanılır
; ve fonksiyon çağrıları sırasında stack'teki eski verileri korur.
;----------------------------------------------------------------------------------------------------

; r8-r15 = 	Ek register'lar. x86-64 mimarisinde ek veri işlemleri için fazladan 8 adet genel amaçlı
; register sağlanmıştır. Fonksiyon çağrılarında üçüncü ve sonraki parametreler bu
; register'larda geçilir (Linux'ta).
;----------------------------------------------------------------------------------------------------

; rip = Instruction pointer. İşlemcinin sıradaki hangi komutu çalıştıracağını gösterir.
; Program akışını kontrol etmek için kullanılır.
;----------------------------------------------------------------------------------------------------

; rflags = Flags register'ı. Durum bayraklarını tutar.
; Matematiksel işlemlerden sonra sıfır bayrağı (zero flag),
; taşıma bayrağı (carry flag) gibi bayrakların durumunu belirtir.
;----------------------------------------------------------------------------------------------------

; linux da registerlar belirli bir sıra ile parametreleri tutar. bu çağrı sıralaması calling convention olarak adlandırılır.
; işletim sistemine göre değişir. linux ta genelde rdi, rsi, rdx, rcx, r8, r9 şeklinde sıralanır. 
; eğer daha fazla parametre varsa stack üzerinden geçilir.
;----------------------------------------------------------------------------------------------------

; Stack(Yığın) = Stack, programın çalışma sırasında verileri geçici olarak sakladığı bir bellek bölgesidir.
; rsp (stack pointer) register'ı, stack'in en üstüne işaret eder. Fonksiyon çağrıları sırasında
; geri dönülecek adresler, yerel değişkenler ve diğer veriler stack'te saklanır.
;----------------------------------------------------------------------------------------------------

; Flags Register (Durum Bayrakları)
; İMatematiksel işlemlerden sonra işlemcinin durumunu belirten çeşitli bayraklar vardır. Bazı önemli bayraklar:
;    ZF (Zero Flag): Sonuç sıfır ise bu bayrak set edilir.
;    CF (Carry Flag): Bir taşma (carry) durumu olduğunda set edilir.
;    SF (Sign Flag): Sonuç negatifse bu bayrak set edilir.
;----------------------------------------------------------------------------------------------------

; section = bir bölümü segment tanımlar. Bu programın hangi bölümünde veri veya kod bulunacagını belirtir.
;----------------------------------------------------------------------------------------------------

; .data = sabit veri ve başlatılmış veriler bu bölümde saklanır. Programın çalışma zamanında değişmeyecek 
; sabit veriler burada tutulur.
;----------------------------------------------------------------------------------------------------

; .bss = başlatılmamış verilerin saklandığı bölümdür. bu bölümde taımlananan değişkenlere başlangıçta değer atanmaz.
; program calıstıgı zaman bunlara değer atanır.
;----------------------------------------------------------------------------------------------------

; .text = Programın kodlarının (komutlarının ) bulunduğu bölüm. Tüm çalıştırılabilir kod burada yer alır.
;----------------------------------------------------------------------------------------------------

; global = bir etiketin dışarıdan erişilebilir olmasını sağlar.
;----------------------------------------------------------------------------------------------------

; je: "Jump if Equal" anlamına gelir ve önceki bir karşılaştırma (comparison)
; işlemi sonucunda Zero Flag (ZF) set edilmişse yani sonuç eşitse (equal), belirtilen etikete atlama yapar.
; Bu komut genellikle bir karşılaştırma (cmp) komutundan sonra gelir. cmp komutu, iki değeri karşılaştırır
; ve ona göre işlemci bayraklarını (flags) ayarlar.
; Eğer karşılaştırılan iki değer eşitse, Zero Flag (ZF) set edilir ve je komutu o durumda devreye girer.
;----------------------------------------------------------------------------------------------------

; inc: "Increment (Arttır)" anlamına gelir ve bir register'ı bir artırır.
;----------------------------------------------------------------------------------------------------

; ret: "Return (Dön)" anlamına gelir ve bir fonksiyonu bitirir.
;----------------------------------------------------------------------------------------------------

; syscall: Sistem çağrısı yapar. Sistem çağrıları, işletim sistemi ile iletişim kurmak için kullanılır.
;----------------------------------------------------------------------------------------------------

; xor: "Exclusive OR" anlamına gelir ve iki değeri karşılaştırır.
; Eğer iki değer birbirine eşitse sonuç 0 olur, eğer farklıysa sonuç 1 olur.
; Bu komut genellikle bir register'ı sıfırlamak için kullanılır.
; Ayrıca xor komutu, iki değeri birbirinden çıkarmak için de kullanılabilir.
; A = 0, B = 1 ise A xor B = 1 olur.
; A = 1, B = 1 ise A xor B = 0 olur.
; A = 0, B = 0 ise A xor B = 0 olur.
; A = 1, B = 0 ise A xor B = 1 olur.
;----------------------------------------------------------------------------------------------------

;section .data
;    msg db "Hello, world!", 0 ; db = define byte. bir byelık hareket eden veri sıralaması oldugunu belirtir.

;section .text
;    global _start

;_start:
;    mov rdi, msg    ; rdi'yi stringin başlangıcına işaret edecek şekilde ayarla
;    call ft_strlen  ; ft_strlen'i çağır
;    ; sonucu rax register'ında tutarız
;    ; sonucu kontrol etmek için exit ile cıkalım
;    mov rax, 60     ; exit system call number
;    xor rdi, rdi    ; exit code 0
;    syscall

;global ft_strlen
;ft_strlen:
;    xor rcx, rcx    ; rcx'yi sıfırla rcx = counter register
;    mov rax, rdi    ; rax'i rdi'ye eşitle rax = data register
;.loop:
;    cmp byte [rdi], 0   ; rdi'nin gösterdiği byte 0 mı diye kontrol et
;    je .done            ; eğer 0 ise done'a git
;    inc rdi             ; rdi'yi bir artır yani bir sonraki karkatere geçtim.
;    inc rcx             ; rcx'i bir artır yani bir karakter daha buldum.
;    jmp .loop           ; loop'a geri dön

;.done:
;    mov rax, rcx        ; rax'e rcx'i ata
;    ret                 ; fonksiyonu bitir


; YUKARIDAKİ KODU GENEL MANADA DENEMEK İÇİN YAPTIK ALTTA GERÇEK KODU YAZALIM

section .text
    global ft_strlen    ; ft_strlen fonksiyonunu dışarıdan erişilebilir yap

ft_strlen:
    xor rcx, rcx        ; rcx'yi sıfırla
    mov rax, rdi        ; rax'i rdi'ye eşitle

.loop:
    cmp byte [rdi], 0   ; rdi'nin gösterdiği byte 0 mı diye kontrol et
    je .done            ; eğer 0 ise done'a git
    inc rdi             ; rdi'yi bir artır
    inc rcx             ; rcx'i bir artır count register yani bir karakter daha buldum.
    jmp .loop           ; loop'a geri dön

.done:
    mov rax, rcx        ; rax'e rcx'i ata
    ret                 ; fonksiyonu bitir

; Bu kodu derlemek istiyor iseniz aşağıdaki komutları kullanabilirsiniz.

; nasm -f elf64 -o ft_strlen.o ft_strlen.asm
; gcc main.c ft_strlen.o -Wall -Werror -Wextra -z execstack