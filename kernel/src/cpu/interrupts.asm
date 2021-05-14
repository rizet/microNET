; Defined in idt.cxx
extern isr_handler
extern irq_handler

global lidt

default rel

lidt:
	lidt [rdi]
	ret
    


; We don't get information about which interrupt was caller
; when the handler is run, so we will need to have a different handler
; for every interrupt.
; Furthermore, some interrupts push an error code onto the stack but others
; don't, so we will push a dummy error code for those which don't, so that
; we have a consistent stack for all of them.

; First make the ISRs global
global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31
; then IRQs

global irq0
global irq1
global irq2
global irq3
global irq4
global irq5
global irq6
global irq7
global irq8
global irq9
global irq10
global irq11
global irq12
global irq13
global irq14
global irq15
; then SGIs

global sgi128
global isr_common_stub
global irq_common_stub

; 0: Divide By Zero Exception
isr0:
    push 0
    push 0
    jmp isr_common_stub
    
; 1: Debug Exception
isr1:
    push 0
    push 3
    jmp isr_common_stub
    iretq   

; 2: Non Maskable Interrupt
isr2:
    push 0
    push 2
    jmp isr_common_stub
    

; 3: Breakpoint Exception
isr3:
    push 0
    push 3
    jmp isr_common_stub
    

; 4: INTO Exception
isr4:
    push 0
    push 4
    jmp isr_common_stub
    

; 5: Out of Bounds Exception
isr5:
    push 0
    push 5
    jmp isr_common_stub
    

; 6: Invalid Opcode Exception
isr6:
    push 0
    push 6
    jmp isr_common_stub
    

; 7: Coprocessor Not Available Exception
isr7:
    push 0
    push 7
    jmp isr_common_stub
    

; 8: Double Fault Exception (With Error Code!)
isr8:
    push 8
    jmp isr_common_stub
    

; 9: Coprocessor Segment Overrun Exception
isr9:
    push 0
    push 9
    jmp isr_common_stub
    

; 10: Bad TSS Exception (With Error Code!)
isr10:
    push 10
    jmp isr_common_stub
    

; 11: Segment Not Present Exception (With Error Code!)
isr11:
    push 11
    jmp isr_common_stub
    

; 12: Stack Fault Exception (With Error Code!)
isr12:
    push 12
    jmp isr_common_stub
    

; 13: General Protection Fault Exception (With Error Code!)
isr13:
    push 13
    jmp isr_common_stub
    

; 14: Page Fault Exception (With Error Code!)
isr14:
    push 14
    jmp isr_common_stub
    

; 15: Reserved Exception
isr15:
    push 0
    push 15
    jmp isr_common_stub
    

; 16: Floating Point Exception
isr16:
    push 0
    push 16
    jmp isr_common_stub
    

; 17: Alignment Check Exception
isr17:
    push 0
    push 17
    jmp isr_common_stub
    

; 18: Machine Check Exception
isr18:
    push 0
    push 18
    jmp isr_common_stub
    

; 19: Reserved
isr19:
    push 0
    push 19
    jmp isr_common_stub
    

; 20: Reserved
isr20:
    push 0
    push 20
    jmp isr_common_stub
    

; 21: Reserved
isr21:
    push 0
    push 21
    jmp isr_common_stub
    

; 22: Reserved
isr22:
    push 0
    push 22
    jmp isr_common_stub
    

; 23: Reserved
isr23:
    push 0
    push 23
    jmp isr_common_stub
    

; 24: Reserved
isr24:
    push 0
    push 24
    jmp isr_common_stub
    

; 25: Reserved
isr25:
    push 0
    push 25
    jmp isr_common_stub
    

; 26: Reserved
isr26:
    push 0
    push 26
    jmp isr_common_stub
    

; 27: Reserved
isr27:
    push 0
    push 27
    jmp isr_common_stub
    

; 28: Reserved
isr28:
    push 0
    push 28
    jmp isr_common_stub
    

; 29: Reserved
isr29:
    push 0
    push 29
    jmp isr_common_stub
    

; 30: Reserved
isr30:
    push 0
    push 30
    jmp isr_common_stub
    

; 31: Reserved
isr31:
    push 0
    push 31
    jmp isr_common_stub
    

; IRQ handlers

; This IRQ is the Programmable Interval Timer. Since it spams us with
; interrupts, we will ignore it until we have a use for chronology
irq0:	 
	push 0
	push 32
    jmp irq_common_stub
    

irq1:
    push 1
	push 33
	jmp irq_common_stub
    

irq2:
    push 2
	push 34
	jmp irq_common_stub
    

irq3:
    push 3
	push 35
	jmp irq_common_stub
    

irq4:
    push 4
	push 36
	jmp irq_common_stub
    

irq5:
    push 5
	push 37
	jmp irq_common_stub
    

irq6:
    push 6
	push 38
	jmp irq_common_stub
    

irq7:
    push 7
	push 39
	jmp irq_common_stub
    

irq8:
    push 8
	push 40
	jmp irq_common_stub
    

irq9:
    push 9
	push 41
	jmp irq_common_stub
    

irq10:
    push 10
	push 42
	jmp irq_common_stub
    

irq11:
    push 11
	push 43
	jmp irq_common_stub
    

irq12:
    push 12
	push 44
	jmp irq_common_stub
    

irq13:
	push 13
	push 45
	jmp irq_common_stub
    

irq14:
	push 14
	push 46
	jmp irq_common_stub
    

irq15:
	push 15
	push 47
	jmp irq_common_stub
    
extern ring0_return

;; Used by EVSYS to return to kernel mode
sgi128:
    mov rbx, 0xfffccfffdeadbeef
    cmp rax, rbx
    jne .iret

    mov rax, 0x10
    mov ds, ax
    mov es, ax

    push rax
    push 0x00
    push 0x202
    push 0x08
    push ring0_return

    .iret:
    iretq
    
%macro pusha 0
    push rax
    push rcx
    push rdx
    push rbx
    push rbp
    push rsi
    push rdi
%endmacro

%macro popa 0
    pop rdi
    pop rsi
    pop rbp
    pop rbx
    pop rdx
    pop rcx
    pop rax
%endmacro

; Common ISR code
isr_common_stub:
    ; Save CPU state into a structure,
    ; assembled onto the stack
    pusha 			; Pushes rdi, rsi, rbp and r[a-d]x
    mov ax, ds 		; Set the lower 16 bits of rax to ds
    push rax 		; save the value of rax, which is now ds
    mov ax, 0x10  	; kernel data segment descriptor
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov rax, cr0
    push rax ; gp control register
    mov rax, cr2
    push rax ; page fault faulty addy
    mov rax, cr3
    push rax ; paging table ptr
    mov rax, cr4
    push rax ; gp control register

    ; Since we assembled the struct
    ; on the stack, we can simply
    ; pass the stack pointer as a
    ; pointer to our structure
    mov rdi, rsp

  ; 2. Call C handler
    cld
    call isr_handler

  ; 3. Restore state
    pop rdx
    pop rdx
    pop rdx
    pop rdx
    pop rbx
    mov ds, bx
    mov es, bx
    mov fs, bx
    mov gs, bx
    popa
    add rsp, 16 ; Cleans up the pushed error code and pushed ISR number
    iretq ; pops 5 things at once: CS, RIP, RFLAGS, SS, and RSP
    

; Common IRQ code. Identical to ISR code except for the 'call'
; and the 'pop ebx'
irq_common_stub:
    ; Save CPU state into a structure,
    ; assembled onto the stack
    pusha 			; Pushes rdi, rsi, rbp and r[a-d]x
    mov ax, ds 		; Set the lower 16 bits of rax to ds
    push rax 		; save the value of rax, which is now ds
    mov ax, 0x10  	; kernel data segment descriptor
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    mov rax, cr0
    push rax ; gp control register
    mov rax, cr2
    push rax ; page fault faulty addy
    mov rax, cr3
    push rax ; page fault error info
    mov rax, cr4
    push rax ; gp control register

    ; Since we assembled the struct
    ; on the stack, we can simply
    ; pass the stack pointer as a
    ; pointer to our structure
    mov rdi, rsp

  ; 2. Call C handler
    cld
    call irq_handler

  ; 3. Restore state
    pop rdx
    pop rdx
    pop rdx
    pop rdx
    pop rax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    popa
    add rsp, 16 ; Cleans up the pushed error code and pushed ISR number
    iretq ; pops 5 things at once: CS, RIP, RFLAGS, SS, and RSP
    