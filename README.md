# Linux-ELF-Inject

一个将代码静态注入到Linux的ELF可执行文件中的程序

program.c----宿主程序；
hello.s------寄生程序，使用AT&T 64位汇编编写，内容为打印"Helloworld\n"；
inject.c-----注入程序；

注入过程：
1.将program.c编译为ELF可执行文件；
2.将hello.s编译为hello.o;
3.反编译hello.o得到16进制代码；
4.修改16进制代码：

	0x50,
	0x53,
	0x51,
	0x52,
	0x48, 0xc7, 0xc3, 0x01, 0x00, 0x00, 0x00,
	0x48, 0xc7, 0xc0, 0x04, 0x00, 0x00, 0x00,
	0x48, 0xc7, 0xc1,data_addr[0], data_addr[1], data_addr[2], data_addr[3],
	0x48, 0xc7, 0xc2, 0x0b, 0x00, 0x00, 0x00,
	0xcd, 0x80,
	0x5a,
	0x59,
	0x5b,
	0x58,
	0xbd, old_entry_addr[0], old_entry_addr[1], old_entry_addr[2], old_entry_addr[3], 0xff, 0xe5,        
	0x48, 0x65, 0x6c, 0x6c, 0x6f,
	0x77, 0x6f,
	0x72, 0x6c,
	0x64, 0x0a,
	0x00
	
5.将代码复制到inject.c中；
6.编译并运行inject.c;
7.运行结果:在宿主程序运行前会先打印“Helloworld\n”;
