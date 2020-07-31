.text
.global main
.type main, @function

main:
  push %rax
  push %rbx
  push %rcx
  push %rdx

  mov $4,%rax   
  mov $1,%rbx
  mov $content,%rcx
  mov $11,%rdx
  int $0x80

  pop %rdx
  pop %rcx
  pop %rbx
  pop %rax

  jmp -0x0000

content:
  .string "Helloworld\n"

