
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	d7813103          	ld	sp,-648(sp) # 80008d78 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	39d040ef          	jal	ra,80004bb8 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:
    # push all registers to stack
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31

    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    80001084:	008020ef          	jal	ra,8000308c <_ZN5Riscv20handleSupervisorTrapEv>
        csrr t2, scause
    80001088:	142023f3          	csrr	t2,scause
        addi t3, x0, 8
    8000108c:	00800e13          	li	t3,8
        beq t2, t3, restore
    80001090:	01c38863          	beq	t2,t3,800010a0 <restore>
        addi t3, x0, 9
    80001094:	00900e13          	li	t3,9
        beq t2, t3, restore
    80001098:	01c38463          	beq	t2,t3,800010a0 <restore>
        j skip
    8000109c:	0080006f          	j	800010a4 <skip>

00000000800010a0 <restore>:
    restore:
        sd x10, 80(sp)
    800010a0:	04a13823          	sd	a0,80(sp)

00000000800010a4 <skip>:
    skip:

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a4:	00013003          	ld	zero,0(sp)
    800010a8:	00813083          	ld	ra,8(sp)
    800010ac:	01013103          	ld	sp,16(sp)
    800010b0:	01813183          	ld	gp,24(sp)
    800010b4:	02013203          	ld	tp,32(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    800010c0:	03813383          	ld	t2,56(sp)
    800010c4:	04013403          	ld	s0,64(sp)
    800010c8:	04813483          	ld	s1,72(sp)
    800010cc:	05013503          	ld	a0,80(sp)
    800010d0:	05813583          	ld	a1,88(sp)
    800010d4:	06013603          	ld	a2,96(sp)
    800010d8:	06813683          	ld	a3,104(sp)
    800010dc:	07013703          	ld	a4,112(sp)
    800010e0:	07813783          	ld	a5,120(sp)
    800010e4:	08013803          	ld	a6,128(sp)
    800010e8:	08813883          	ld	a7,136(sp)
    800010ec:	09013903          	ld	s2,144(sp)
    800010f0:	09813983          	ld	s3,152(sp)
    800010f4:	0a013a03          	ld	s4,160(sp)
    800010f8:	0a813a83          	ld	s5,168(sp)
    800010fc:	0b013b03          	ld	s6,176(sp)
    80001100:	0b813b83          	ld	s7,184(sp)
    80001104:	0c013c03          	ld	s8,192(sp)
    80001108:	0c813c83          	ld	s9,200(sp)
    8000110c:	0d013d03          	ld	s10,208(sp)
    80001110:	0d813d83          	ld	s11,216(sp)
    80001114:	0e013e03          	ld	t3,224(sp)
    80001118:	0e813e83          	ld	t4,232(sp)
    8000111c:	0f013f03          	ld	t5,240(sp)
    80001120:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001124:	10010113          	addi	sp,sp,256

    80001128:	10200073          	sret
    8000112c:	0000                	unimp
	...

0000000080001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001130:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001134:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001138:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000113c:	0085b103          	ld	sp,8(a1)

    80001140:	00008067          	ret

0000000080001144 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001144:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001148:	00b29a63          	bne	t0,a1,8000115c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000114c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001150:	fe029ae3          	bnez	t0,80001144 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001154:	00000513          	li	a0,0
    jr ra                  # Return.
    80001158:	00008067          	ret

000000008000115c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000115c:	00100513          	li	a0,1
    80001160:	00008067          	ret

0000000080001164 <_Z9move_regsv>:
#include "../h/syscall_c.h"
#include "../lib/hw.h"
#include "../h/tcb.hpp"

void move_regs(){
    80001164:	ff010113          	addi	sp,sp,-16
    80001168:	00813423          	sd	s0,8(sp)
    8000116c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a7, a6");
    80001170:	00080893          	mv	a7,a6
    __asm__ volatile ("mv a6, a5");
    80001174:	00078813          	mv	a6,a5
    __asm__ volatile ("mv a5, a4");
    80001178:	00070793          	mv	a5,a4
    __asm__ volatile ("mv a4, a3");
    8000117c:	00068713          	mv	a4,a3
    __asm__ volatile ("mv a3, a2");
    80001180:	00060693          	mv	a3,a2
    __asm__ volatile ("mv a2, a1");
    80001184:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, a0");
    80001188:	00050593          	mv	a1,a0
}
    8000118c:	00813403          	ld	s0,8(sp)
    80001190:	01010113          	addi	sp,sp,16
    80001194:	00008067          	ret

0000000080001198 <_Z9mem_allocm>:

//==========[MEMORY]=============================================================
void* mem_alloc (size_t size){
    80001198:	ff010113          	addi	sp,sp,-16
    8000119c:	00813423          	sd	s0,8(sp)
    800011a0:	01010413          	addi	s0,sp,16
    uint64 func_id=0x01;
    uint64 result;

    if(size<=0) return nullptr;
    800011a4:	02050a63          	beqz	a0,800011d8 <_Z9mem_allocm+0x40>

    size_t my_size=size/MEM_BLOCK_SIZE;
    800011a8:	00655793          	srli	a5,a0,0x6
    if(size % MEM_BLOCK_SIZE > 0){
    800011ac:	03f57513          	andi	a0,a0,63
    800011b0:	00050463          	beqz	a0,800011b8 <_Z9mem_allocm+0x20>
        my_size++;
    800011b4:	00178793          	addi	a5,a5,1
    }
    __asm__ volatile ("mv a1, %0" : : "r" (my_size));
    800011b8:	00078593          	mv	a1,a5

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800011bc:	00100793          	li	a5,1
    800011c0:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800011c4:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    800011c8:	00050513          	mv	a0,a0
    return (void*)result;
}
    800011cc:	00813403          	ld	s0,8(sp)
    800011d0:	01010113          	addi	sp,sp,16
    800011d4:	00008067          	ret
    if(size<=0) return nullptr;
    800011d8:	00000513          	li	a0,0
    800011dc:	ff1ff06f          	j	800011cc <_Z9mem_allocm+0x34>

00000000800011e0 <_Z8mem_freePv>:

int mem_free (void* p){
    uint64 func_id=0x02;
    uint64 result;

    if(p==nullptr) return -8;
    800011e0:	04050263          	beqz	a0,80001224 <_Z8mem_freePv+0x44>
int mem_free (void* p){
    800011e4:	ff010113          	addi	sp,sp,-16
    800011e8:	00113423          	sd	ra,8(sp)
    800011ec:	00813023          	sd	s0,0(sp)
    800011f0:	01010413          	addi	s0,sp,16

    move_regs();
    800011f4:	00000097          	auipc	ra,0x0
    800011f8:	f70080e7          	jalr	-144(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800011fc:	00200793          	li	a5,2
    80001200:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001204:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    80001208:	00050513          	mv	a0,a0
    if(result!=0) return -8;
    8000120c:	02051063          	bnez	a0,8000122c <_Z8mem_freePv+0x4c>
    else return result;
    80001210:	0005051b          	sext.w	a0,a0
}
    80001214:	00813083          	ld	ra,8(sp)
    80001218:	00013403          	ld	s0,0(sp)
    8000121c:	01010113          	addi	sp,sp,16
    80001220:	00008067          	ret
    if(p==nullptr) return -8;
    80001224:	ff800513          	li	a0,-8
}
    80001228:	00008067          	ret
    if(result!=0) return -8;
    8000122c:	ff800513          	li	a0,-8
    80001230:	fe5ff06f          	j	80001214 <_Z8mem_freePv+0x34>

0000000080001234 <_Z13thread_createPP3TCBPFvPvES2_>:
//==========[THREADS]=============================================================
int thread_create (thread_t* handle, void(*start_routine)(void*),void* arg){
    uint64 func_id=0x11;
    uint64 result;

    if(handle==nullptr) return -4;
    80001234:	06050c63          	beqz	a0,800012ac <_Z13thread_createPP3TCBPFvPvES2_+0x78>
int thread_create (thread_t* handle, void(*start_routine)(void*),void* arg){
    80001238:	fd010113          	addi	sp,sp,-48
    8000123c:	02113423          	sd	ra,40(sp)
    80001240:	02813023          	sd	s0,32(sp)
    80001244:	00913c23          	sd	s1,24(sp)
    80001248:	01213823          	sd	s2,16(sp)
    8000124c:	01313423          	sd	s3,8(sp)
    80001250:	03010413          	addi	s0,sp,48
    80001254:	00050493          	mv	s1,a0
    80001258:	00058993          	mv	s3,a1
    8000125c:	00060913          	mv	s2,a2
    uint64* stack=(uint64*)mem_alloc((size_t)DEFAULT_STACK_SIZE * sizeof(uint64));
    80001260:	00008537          	lui	a0,0x8
    80001264:	00000097          	auipc	ra,0x0
    80001268:	f34080e7          	jalr	-204(ra) # 80001198 <_Z9mem_allocm>

    __asm__ volatile ("mv a1, %0" : : "r" (handle));
    8000126c:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a2, %0" : : "r" (start_routine));
    80001270:	00098613          	mv	a2,s3
    __asm__ volatile ("mv a3, %0" : : "r" (arg));
    80001274:	00090693          	mv	a3,s2
    __asm__ volatile ("mv a4, %0" : : "r" (stack));
    80001278:	00050713          	mv	a4,a0

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    8000127c:	01100793          	li	a5,17
    80001280:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001284:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    80001288:	00050513          	mv	a0,a0
    return result;
    8000128c:	0005051b          	sext.w	a0,a0
}
    80001290:	02813083          	ld	ra,40(sp)
    80001294:	02013403          	ld	s0,32(sp)
    80001298:	01813483          	ld	s1,24(sp)
    8000129c:	01013903          	ld	s2,16(sp)
    800012a0:	00813983          	ld	s3,8(sp)
    800012a4:	03010113          	addi	sp,sp,48
    800012a8:	00008067          	ret
    if(handle==nullptr) return -4;
    800012ac:	ffc00513          	li	a0,-4
}
    800012b0:	00008067          	ret

00000000800012b4 <_Z11thread_exitv>:

int thread_exit (){
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00813423          	sd	s0,8(sp)
    800012bc:	01010413          	addi	s0,sp,16
    uint64 func_id=0x12;
    uint64 result;

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800012c0:	01200793          	li	a5,18
    800012c4:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800012c8:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    800012cc:	00050513          	mv	a0,a0
    return result;
}
    800012d0:	0005051b          	sext.w	a0,a0
    800012d4:	00813403          	ld	s0,8(sp)
    800012d8:	01010113          	addi	sp,sp,16
    800012dc:	00008067          	ret

00000000800012e0 <_Z15thread_dispatchv>:

void thread_dispatch (){
    800012e0:	ff010113          	addi	sp,sp,-16
    800012e4:	00813423          	sd	s0,8(sp)
    800012e8:	01010413          	addi	s0,sp,16
    uint64 func_id=0x13;

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800012ec:	01300793          	li	a5,19
    800012f0:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800012f4:	00000073          	ecall
}
    800012f8:	00813403          	ld	s0,8(sp)
    800012fc:	01010113          	addi	sp,sp,16
    80001300:	00008067          	ret

0000000080001304 <_Z11thread_makePP3TCBPFvPvES2_>:

int thread_make (thread_t* handle, void(*start_routine)(void*),void* arg){
    uint64 func_id=0x14;
    uint64 result;

    if(handle==nullptr) return -4;
    80001304:	06050c63          	beqz	a0,8000137c <_Z11thread_makePP3TCBPFvPvES2_+0x78>
int thread_make (thread_t* handle, void(*start_routine)(void*),void* arg){
    80001308:	fd010113          	addi	sp,sp,-48
    8000130c:	02113423          	sd	ra,40(sp)
    80001310:	02813023          	sd	s0,32(sp)
    80001314:	00913c23          	sd	s1,24(sp)
    80001318:	01213823          	sd	s2,16(sp)
    8000131c:	01313423          	sd	s3,8(sp)
    80001320:	03010413          	addi	s0,sp,48
    80001324:	00050493          	mv	s1,a0
    80001328:	00058993          	mv	s3,a1
    8000132c:	00060913          	mv	s2,a2
    void* stack=mem_alloc(DEFAULT_STACK_SIZE * sizeof(uint64));
    80001330:	00008537          	lui	a0,0x8
    80001334:	00000097          	auipc	ra,0x0
    80001338:	e64080e7          	jalr	-412(ra) # 80001198 <_Z9mem_allocm>

    __asm__ volatile ("mv a1, %0" : : "r" (handle));
    8000133c:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a2, %0" : : "r" (start_routine));
    80001340:	00098613          	mv	a2,s3
    __asm__ volatile ("mv a3, %0" : : "r" (arg));
    80001344:	00090693          	mv	a3,s2
    __asm__ volatile ("mv a4, %0" : : "r" (stack));
    80001348:	00050713          	mv	a4,a0

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    8000134c:	01400793          	li	a5,20
    80001350:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001354:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    80001358:	00050513          	mv	a0,a0
    return result;
    8000135c:	0005051b          	sext.w	a0,a0
}
    80001360:	02813083          	ld	ra,40(sp)
    80001364:	02013403          	ld	s0,32(sp)
    80001368:	01813483          	ld	s1,24(sp)
    8000136c:	01013903          	ld	s2,16(sp)
    80001370:	00813983          	ld	s3,8(sp)
    80001374:	03010113          	addi	sp,sp,48
    80001378:	00008067          	ret
    if(handle==nullptr) return -4;
    8000137c:	ffc00513          	li	a0,-4
}
    80001380:	00008067          	ret

0000000080001384 <_Z12thread_startP3TCB>:

int thread_start (thread_t handle){
    uint64 func_id=0x15;
    uint64 result;

    if(handle==nullptr) return -8;
    80001384:	04050063          	beqz	a0,800013c4 <_Z12thread_startP3TCB+0x40>
int thread_start (thread_t handle){
    80001388:	ff010113          	addi	sp,sp,-16
    8000138c:	00113423          	sd	ra,8(sp)
    80001390:	00813023          	sd	s0,0(sp)
    80001394:	01010413          	addi	s0,sp,16

    move_regs();
    80001398:	00000097          	auipc	ra,0x0
    8000139c:	dcc080e7          	jalr	-564(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800013a0:	01500793          	li	a5,21
    800013a4:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800013a8:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    800013ac:	00050513          	mv	a0,a0
    return result;
    800013b0:	0005051b          	sext.w	a0,a0
}
    800013b4:	00813083          	ld	ra,8(sp)
    800013b8:	00013403          	ld	s0,0(sp)
    800013bc:	01010113          	addi	sp,sp,16
    800013c0:	00008067          	ret
    if(handle==nullptr) return -8;
    800013c4:	ff800513          	li	a0,-8
}
    800013c8:	00008067          	ret

00000000800013cc <_Z8sem_openPP4_semj>:
//==========[SEMS]=============================================================
int sem_open (sem_t* handle, unsigned init){
    uint64 func_id=0x21;
    uint64 result;

    if(!handle) return -2;
    800013cc:	04050063          	beqz	a0,8000140c <_Z8sem_openPP4_semj+0x40>
int sem_open (sem_t* handle, unsigned init){
    800013d0:	ff010113          	addi	sp,sp,-16
    800013d4:	00113423          	sd	ra,8(sp)
    800013d8:	00813023          	sd	s0,0(sp)
    800013dc:	01010413          	addi	s0,sp,16
    move_regs();
    800013e0:	00000097          	auipc	ra,0x0
    800013e4:	d84080e7          	jalr	-636(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800013e8:	02100793          	li	a5,33
    800013ec:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800013f0:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    800013f4:	00050513          	mv	a0,a0
    return result;
    800013f8:	0005051b          	sext.w	a0,a0
}
    800013fc:	00813083          	ld	ra,8(sp)
    80001400:	00013403          	ld	s0,0(sp)
    80001404:	01010113          	addi	sp,sp,16
    80001408:	00008067          	ret
    if(!handle) return -2;
    8000140c:	ffe00513          	li	a0,-2
}
    80001410:	00008067          	ret

0000000080001414 <_Z9sem_closeP4_sem>:

int sem_close (sem_t handle){
    uint64 func_id=0x22;
    uint64 result;

    if(handle==nullptr) return -16;
    80001414:	04050063          	beqz	a0,80001454 <_Z9sem_closeP4_sem+0x40>
int sem_close (sem_t handle){
    80001418:	ff010113          	addi	sp,sp,-16
    8000141c:	00113423          	sd	ra,8(sp)
    80001420:	00813023          	sd	s0,0(sp)
    80001424:	01010413          	addi	s0,sp,16
    move_regs();
    80001428:	00000097          	auipc	ra,0x0
    8000142c:	d3c080e7          	jalr	-708(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    80001430:	02200793          	li	a5,34
    80001434:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001438:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    8000143c:	00050513          	mv	a0,a0
    return result;
    80001440:	0005051b          	sext.w	a0,a0
}
    80001444:	00813083          	ld	ra,8(sp)
    80001448:	00013403          	ld	s0,0(sp)
    8000144c:	01010113          	addi	sp,sp,16
    80001450:	00008067          	ret
    if(handle==nullptr) return -16;
    80001454:	ff000513          	li	a0,-16
}
    80001458:	00008067          	ret

000000008000145c <_Z8sem_waitP4_sem>:

int sem_wait (sem_t id){
    uint64 func_id=0x23;
    uint64 result;

    if(id==nullptr) return -16;
    8000145c:	04050063          	beqz	a0,8000149c <_Z8sem_waitP4_sem+0x40>
int sem_wait (sem_t id){
    80001460:	ff010113          	addi	sp,sp,-16
    80001464:	00113423          	sd	ra,8(sp)
    80001468:	00813023          	sd	s0,0(sp)
    8000146c:	01010413          	addi	s0,sp,16
    move_regs();
    80001470:	00000097          	auipc	ra,0x0
    80001474:	cf4080e7          	jalr	-780(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    80001478:	02300793          	li	a5,35
    8000147c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001480:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    80001484:	00050513          	mv	a0,a0
    return result;
    80001488:	0005051b          	sext.w	a0,a0
}
    8000148c:	00813083          	ld	ra,8(sp)
    80001490:	00013403          	ld	s0,0(sp)
    80001494:	01010113          	addi	sp,sp,16
    80001498:	00008067          	ret
    if(id==nullptr) return -16;
    8000149c:	ff000513          	li	a0,-16
}
    800014a0:	00008067          	ret

00000000800014a4 <_Z10sem_signalP4_sem>:

int sem_signal (sem_t id) {
    uint64 func_id=0x24;
    uint64 result;

    if(id==nullptr) return -16;
    800014a4:	04050063          	beqz	a0,800014e4 <_Z10sem_signalP4_sem+0x40>
int sem_signal (sem_t id) {
    800014a8:	ff010113          	addi	sp,sp,-16
    800014ac:	00113423          	sd	ra,8(sp)
    800014b0:	00813023          	sd	s0,0(sp)
    800014b4:	01010413          	addi	s0,sp,16
    move_regs();
    800014b8:	00000097          	auipc	ra,0x0
    800014bc:	cac080e7          	jalr	-852(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800014c0:	02400793          	li	a5,36
    800014c4:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800014c8:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    800014cc:	00050513          	mv	a0,a0
    return result;
    800014d0:	0005051b          	sext.w	a0,a0
}
    800014d4:	00813083          	ld	ra,8(sp)
    800014d8:	00013403          	ld	s0,0(sp)
    800014dc:	01010113          	addi	sp,sp,16
    800014e0:	00008067          	ret
    if(id==nullptr) return -16;
    800014e4:	ff000513          	li	a0,-16
}
    800014e8:	00008067          	ret

00000000800014ec <_Z10time_sleepm>:

//==========[MISC]=============================================================

int time_sleep (time_t t){
    800014ec:	ff010113          	addi	sp,sp,-16
    800014f0:	00113423          	sd	ra,8(sp)
    800014f4:	00813023          	sd	s0,0(sp)
    800014f8:	01010413          	addi	s0,sp,16
    uint64 func_id=0x31;
    uint64 result;

    move_regs();
    800014fc:	00000097          	auipc	ra,0x0
    80001500:	c68080e7          	jalr	-920(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    80001504:	03100793          	li	a5,49
    80001508:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    8000150c:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    80001510:	00050513          	mv	a0,a0
    return result;
}
    80001514:	0005051b          	sext.w	a0,a0
    80001518:	00813083          	ld	ra,8(sp)
    8000151c:	00013403          	ld	s0,0(sp)
    80001520:	01010113          	addi	sp,sp,16
    80001524:	00008067          	ret

0000000080001528 <_Z4getcv>:

char getc(){
    80001528:	ff010113          	addi	sp,sp,-16
    8000152c:	00813423          	sd	s0,8(sp)
    80001530:	01010413          	addi	s0,sp,16
    uint64 func_id=0x41;
    uint64 result;

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    80001534:	04100793          	li	a5,65
    80001538:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    8000153c:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    80001540:	00050513          	mv	a0,a0
    return (char)result;
}
    80001544:	0ff57513          	andi	a0,a0,255
    80001548:	00813403          	ld	s0,8(sp)
    8000154c:	01010113          	addi	sp,sp,16
    80001550:	00008067          	ret

0000000080001554 <_Z4putcc>:

void putc(char c){
    80001554:	ff010113          	addi	sp,sp,-16
    80001558:	00113423          	sd	ra,8(sp)
    8000155c:	00813023          	sd	s0,0(sp)
    80001560:	01010413          	addi	s0,sp,16
    uint64 func_id=0x42;

    move_regs();
    80001564:	00000097          	auipc	ra,0x0
    80001568:	c00080e7          	jalr	-1024(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    8000156c:	04200793          	li	a5,66
    80001570:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001574:	00000073          	ecall
}
    80001578:	00813083          	ld	ra,8(sp)
    8000157c:	00013403          	ld	s0,0(sp)
    80001580:	01010113          	addi	sp,sp,16
    80001584:	00008067          	ret

0000000080001588 <_Z17test_function_abiii>:


int test_function_abi(int param1, int param2){
    80001588:	ff010113          	addi	sp,sp,-16
    8000158c:	00113423          	sd	ra,8(sp)
    80001590:	00813023          	sd	s0,0(sp)
    80001594:	01010413          	addi	s0,sp,16
    uint64 func_id=0x69;
    uint64 result;

    move_regs();
    80001598:	00000097          	auipc	ra,0x0
    8000159c:	bcc080e7          	jalr	-1076(ra) # 80001164 <_Z9move_regsv>
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    800015a0:	06900793          	li	a5,105
    800015a4:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800015a8:	00000073          	ecall
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    800015ac:	00050513          	mv	a0,a0
    return result;
    800015b0:	0005051b          	sext.w	a0,a0
    800015b4:	00813083          	ld	ra,8(sp)
    800015b8:	00013403          	ld	s0,0(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret

00000000800015c4 <__mem_alloc>:
// Created by DjordjeS on 8.8.2022.
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"

void* __mem_alloc(size_t size){
    800015c4:	ff010113          	addi	sp,sp,-16
    800015c8:	00113423          	sd	ra,8(sp)
    800015cc:	00813023          	sd	s0,0(sp)
    800015d0:	01010413          	addi	s0,sp,16
    return MemoryAllocator::allocate(size);
    800015d4:	00002097          	auipc	ra,0x2
    800015d8:	2c4080e7          	jalr	708(ra) # 80003898 <_ZN15MemoryAllocator8allocateEm>
}
    800015dc:	00813083          	ld	ra,8(sp)
    800015e0:	00013403          	ld	s0,0(sp)
    800015e4:	01010113          	addi	sp,sp,16
    800015e8:	00008067          	ret

00000000800015ec <__mem_free>:

int __mem_free(void *ptr){
    800015ec:	ff010113          	addi	sp,sp,-16
    800015f0:	00113423          	sd	ra,8(sp)
    800015f4:	00813023          	sd	s0,0(sp)
    800015f8:	01010413          	addi	s0,sp,16
    return MemoryAllocator::free_memory(ptr);
    800015fc:	00002097          	auipc	ra,0x2
    80001600:	3e0080e7          	jalr	992(ra) # 800039dc <_ZN15MemoryAllocator11free_memoryEPv>
}
    80001604:	00813083          	ld	ra,8(sp)
    80001608:	00013403          	ld	s0,0(sp)
    8000160c:	01010113          	addi	sp,sp,16
    80001610:	00008067          	ret

0000000080001614 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80001614:	ff010113          	addi	sp,sp,-16
    80001618:	00113423          	sd	ra,8(sp)
    8000161c:	00813023          	sd	s0,0(sp)
    80001620:	01010413          	addi	s0,sp,16
    80001624:	00007797          	auipc	a5,0x7
    80001628:	5fc78793          	addi	a5,a5,1532 # 80008c20 <_ZTV9Semaphore+0x10>
    8000162c:	00f53023          	sd	a5,0(a0) # 8000 <_entry-0x7fff8000>
    sem_close(myHandle);
    80001630:	00853503          	ld	a0,8(a0)
    80001634:	00000097          	auipc	ra,0x0
    80001638:	de0080e7          	jalr	-544(ra) # 80001414 <_Z9sem_closeP4_sem>
}
    8000163c:	00813083          	ld	ra,8(sp)
    80001640:	00013403          	ld	s0,0(sp)
    80001644:	01010113          	addi	sp,sp,16
    80001648:	00008067          	ret

000000008000164c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000164c:	fe010113          	addi	sp,sp,-32
    80001650:	00113c23          	sd	ra,24(sp)
    80001654:	00813823          	sd	s0,16(sp)
    80001658:	00913423          	sd	s1,8(sp)
    8000165c:	02010413          	addi	s0,sp,32
    80001660:	00050493          	mv	s1,a0
}
    80001664:	00000097          	auipc	ra,0x0
    80001668:	fb0080e7          	jalr	-80(ra) # 80001614 <_ZN9SemaphoreD1Ev>
    8000166c:	00048513          	mv	a0,s1
    80001670:	00001097          	auipc	ra,0x1
    80001674:	f7c080e7          	jalr	-132(ra) # 800025ec <_ZdlPv>
    80001678:	01813083          	ld	ra,24(sp)
    8000167c:	01013403          	ld	s0,16(sp)
    80001680:	00813483          	ld	s1,8(sp)
    80001684:	02010113          	addi	sp,sp,32
    80001688:	00008067          	ret

000000008000168c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init) {
    8000168c:	ff010113          	addi	sp,sp,-16
    80001690:	00113423          	sd	ra,8(sp)
    80001694:	00813023          	sd	s0,0(sp)
    80001698:	01010413          	addi	s0,sp,16
    8000169c:	00007797          	auipc	a5,0x7
    800016a0:	58478793          	addi	a5,a5,1412 # 80008c20 <_ZTV9Semaphore+0x10>
    800016a4:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800016a8:	00850513          	addi	a0,a0,8
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	d20080e7          	jalr	-736(ra) # 800013cc <_Z8sem_openPP4_semj>
}
    800016b4:	00813083          	ld	ra,8(sp)
    800016b8:	00013403          	ld	s0,0(sp)
    800016bc:	01010113          	addi	sp,sp,16
    800016c0:	00008067          	ret

00000000800016c4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800016c4:	ff010113          	addi	sp,sp,-16
    800016c8:	00113423          	sd	ra,8(sp)
    800016cc:	00813023          	sd	s0,0(sp)
    800016d0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800016d4:	00853503          	ld	a0,8(a0)
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	d84080e7          	jalr	-636(ra) # 8000145c <_Z8sem_waitP4_sem>
}
    800016e0:	00813083          	ld	ra,8(sp)
    800016e4:	00013403          	ld	s0,0(sp)
    800016e8:	01010113          	addi	sp,sp,16
    800016ec:	00008067          	ret

00000000800016f0 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800016f0:	ff010113          	addi	sp,sp,-16
    800016f4:	00113423          	sd	ra,8(sp)
    800016f8:	00813023          	sd	s0,0(sp)
    800016fc:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001700:	00853503          	ld	a0,8(a0)
    80001704:	00000097          	auipc	ra,0x0
    80001708:	da0080e7          	jalr	-608(ra) # 800014a4 <_Z10sem_signalP4_sem>
}
    8000170c:	00813083          	ld	ra,8(sp)
    80001710:	00013403          	ld	s0,0(sp)
    80001714:	01010113          	addi	sp,sp,16
    80001718:	00008067          	ret

000000008000171c <_ZN6Thread13threadWrapperEPv>:
int Thread::sleep(time_t t) {
    return time_sleep(t);
}

void Thread::threadWrapper(void* t) {
    if(t){
    8000171c:	02050863          	beqz	a0,8000174c <_ZN6Thread13threadWrapperEPv+0x30>
void Thread::threadWrapper(void* t) {
    80001720:	ff010113          	addi	sp,sp,-16
    80001724:	00113423          	sd	ra,8(sp)
    80001728:	00813023          	sd	s0,0(sp)
    8000172c:	01010413          	addi	s0,sp,16
        ((Thread*)t)->run();
    80001730:	00053783          	ld	a5,0(a0)
    80001734:	0107b783          	ld	a5,16(a5)
    80001738:	000780e7          	jalr	a5
    }
}
    8000173c:	00813083          	ld	ra,8(sp)
    80001740:	00013403          	ld	s0,0(sp)
    80001744:	01010113          	addi	sp,sp,16
    80001748:	00008067          	ret
    8000174c:	00008067          	ret

0000000080001750 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001750:	fe010113          	addi	sp,sp,-32
    80001754:	00113c23          	sd	ra,24(sp)
    80001758:	00813823          	sd	s0,16(sp)
    8000175c:	00913423          	sd	s1,8(sp)
    80001760:	02010413          	addi	s0,sp,32
    80001764:	00007797          	auipc	a5,0x7
    80001768:	4e478793          	addi	a5,a5,1252 # 80008c48 <_ZTV6Thread+0x10>
    8000176c:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80001770:	00853483          	ld	s1,8(a0)
    80001774:	00048e63          	beqz	s1,80001790 <_ZN6ThreadD1Ev+0x40>
    80001778:	00048513          	mv	a0,s1
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	464080e7          	jalr	1124(ra) # 80001be0 <_ZN3TCBD1Ev>
class TCB{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    80001784:	00048513          	mv	a0,s1
    80001788:	00000097          	auipc	ra,0x0
    8000178c:	e64080e7          	jalr	-412(ra) # 800015ec <__mem_free>
}
    80001790:	01813083          	ld	ra,24(sp)
    80001794:	01013403          	ld	s0,16(sp)
    80001798:	00813483          	ld	s1,8(sp)
    8000179c:	02010113          	addi	sp,sp,32
    800017a0:	00008067          	ret

00000000800017a4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800017a4:	fe010113          	addi	sp,sp,-32
    800017a8:	00113c23          	sd	ra,24(sp)
    800017ac:	00813823          	sd	s0,16(sp)
    800017b0:	00913423          	sd	s1,8(sp)
    800017b4:	02010413          	addi	s0,sp,32
    800017b8:	00050493          	mv	s1,a0
}
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	f94080e7          	jalr	-108(ra) # 80001750 <_ZN6ThreadD1Ev>
    800017c4:	00048513          	mv	a0,s1
    800017c8:	00001097          	auipc	ra,0x1
    800017cc:	e24080e7          	jalr	-476(ra) # 800025ec <_ZdlPv>
    800017d0:	01813083          	ld	ra,24(sp)
    800017d4:	01013403          	ld	s0,16(sp)
    800017d8:	00813483          	ld	s1,8(sp)
    800017dc:	02010113          	addi	sp,sp,32
    800017e0:	00008067          	ret

00000000800017e4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800017e4:	ff010113          	addi	sp,sp,-16
    800017e8:	00113423          	sd	ra,8(sp)
    800017ec:	00813023          	sd	s0,0(sp)
    800017f0:	01010413          	addi	s0,sp,16
    800017f4:	00007797          	auipc	a5,0x7
    800017f8:	45478793          	addi	a5,a5,1108 # 80008c48 <_ZTV6Thread+0x10>
    800017fc:	00f53023          	sd	a5,0(a0)
    thread_make(&myHandle, body, arg);
    80001800:	00850513          	addi	a0,a0,8
    80001804:	00000097          	auipc	ra,0x0
    80001808:	b00080e7          	jalr	-1280(ra) # 80001304 <_Z11thread_makePP3TCBPFvPvES2_>
}
    8000180c:	00813083          	ld	ra,8(sp)
    80001810:	00013403          	ld	s0,0(sp)
    80001814:	01010113          	addi	sp,sp,16
    80001818:	00008067          	ret

000000008000181c <_ZN6Thread5startEv>:
int Thread::start() {
    8000181c:	ff010113          	addi	sp,sp,-16
    80001820:	00113423          	sd	ra,8(sp)
    80001824:	00813023          	sd	s0,0(sp)
    80001828:	01010413          	addi	s0,sp,16
    return thread_start(myHandle);
    8000182c:	00853503          	ld	a0,8(a0)
    80001830:	00000097          	auipc	ra,0x0
    80001834:	b54080e7          	jalr	-1196(ra) # 80001384 <_Z12thread_startP3TCB>
}
    80001838:	00813083          	ld	ra,8(sp)
    8000183c:	00013403          	ld	s0,0(sp)
    80001840:	01010113          	addi	sp,sp,16
    80001844:	00008067          	ret

0000000080001848 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001848:	ff010113          	addi	sp,sp,-16
    8000184c:	00113423          	sd	ra,8(sp)
    80001850:	00813023          	sd	s0,0(sp)
    80001854:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	a88080e7          	jalr	-1400(ra) # 800012e0 <_Z15thread_dispatchv>
}
    80001860:	00813083          	ld	ra,8(sp)
    80001864:	00013403          	ld	s0,0(sp)
    80001868:	01010113          	addi	sp,sp,16
    8000186c:	00008067          	ret

0000000080001870 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80001870:	ff010113          	addi	sp,sp,-16
    80001874:	00113423          	sd	ra,8(sp)
    80001878:	00813023          	sd	s0,0(sp)
    8000187c:	01010413          	addi	s0,sp,16
    return time_sleep(t);
    80001880:	00000097          	auipc	ra,0x0
    80001884:	c6c080e7          	jalr	-916(ra) # 800014ec <_Z10time_sleepm>
}
    80001888:	00813083          	ld	ra,8(sp)
    8000188c:	00013403          	ld	s0,0(sp)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <_ZN6ThreadC1Ev>:

Thread::Thread() {
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00113423          	sd	ra,8(sp)
    800018a0:	00813023          	sd	s0,0(sp)
    800018a4:	01010413          	addi	s0,sp,16
    800018a8:	00007797          	auipc	a5,0x7
    800018ac:	3a078793          	addi	a5,a5,928 # 80008c48 <_ZTV6Thread+0x10>
    800018b0:	00f53023          	sd	a5,0(a0)
    thread_make(&myHandle, threadWrapper, this);
    800018b4:	00050613          	mv	a2,a0
    800018b8:	00000597          	auipc	a1,0x0
    800018bc:	e6458593          	addi	a1,a1,-412 # 8000171c <_ZN6Thread13threadWrapperEPv>
    800018c0:	00850513          	addi	a0,a0,8
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	a40080e7          	jalr	-1472(ra) # 80001304 <_Z11thread_makePP3TCBPFvPvES2_>
    800018cc:	00813083          	ld	ra,8(sp)
    800018d0:	00013403          	ld	s0,0(sp)
    800018d4:	01010113          	addi	sp,sp,16
    800018d8:	00008067          	ret

00000000800018dc <_ZN6Thread3runEv>:
    static int sleep (time_t);
    static void threadWrapper(void*);

protected:
    Thread ();
    virtual void run () {}
    800018dc:	ff010113          	addi	sp,sp,-16
    800018e0:	00813423          	sd	s0,8(sp)
    800018e4:	01010413          	addi	s0,sp,16
    800018e8:	00813403          	ld	s0,8(sp)
    800018ec:	01010113          	addi	sp,sp,16
    800018f0:	00008067          	ret

00000000800018f4 <_ZN7Console4getcEv>:
// Created by DjordjeS on 1.8.2022.
//

#include "../h/syscall_cpp.hpp"

char Console::getc() {
    800018f4:	ff010113          	addi	sp,sp,-16
    800018f8:	00113423          	sd	ra,8(sp)
    800018fc:	00813023          	sd	s0,0(sp)
    80001900:	01010413          	addi	s0,sp,16
    return ::getc();
    80001904:	00000097          	auipc	ra,0x0
    80001908:	c24080e7          	jalr	-988(ra) # 80001528 <_Z4getcv>
}
    8000190c:	00813083          	ld	ra,8(sp)
    80001910:	00013403          	ld	s0,0(sp)
    80001914:	01010113          	addi	sp,sp,16
    80001918:	00008067          	ret

000000008000191c <_ZN7Console4putcEc>:

void Console::putc(char c){
    8000191c:	ff010113          	addi	sp,sp,-16
    80001920:	00113423          	sd	ra,8(sp)
    80001924:	00813023          	sd	s0,0(sp)
    80001928:	01010413          	addi	s0,sp,16
    ::putc(c);
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	c28080e7          	jalr	-984(ra) # 80001554 <_Z4putcc>
    80001934:	00813083          	ld	ra,8(sp)
    80001938:	00013403          	ld	s0,0(sp)
    8000193c:	01010113          	addi	sp,sp,16
    80001940:	00008067          	ret

0000000080001944 <_Z11testWrapperPv>:
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../h/userMain.hpp"
#include "../h/MemoryAllocator.hpp"

void testWrapper(void *arg){
    80001944:	ff010113          	addi	sp,sp,-16
    80001948:	00113423          	sd	ra,8(sp)
    8000194c:	00813023          	sd	s0,0(sp)
    80001950:	01010413          	addi	s0,sp,16
    userMain();
    80001954:	00003097          	auipc	ra,0x3
    80001958:	bb4080e7          	jalr	-1100(ra) # 80004508 <_Z8userMainv>
    printString("User finished\n");
    8000195c:	00005517          	auipc	a0,0x5
    80001960:	6c450513          	addi	a0,a0,1732 # 80007020 <CONSOLE_STATUS+0x10>
    80001964:	00002097          	auipc	ra,0x2
    80001968:	0dc080e7          	jalr	220(ra) # 80003a40 <_Z11printStringPKc>
}
    8000196c:	00813083          	ld	ra,8(sp)
    80001970:	00013403          	ld	s0,0(sp)
    80001974:	01010113          	addi	sp,sp,16
    80001978:	00008067          	ret

000000008000197c <main>:

void main(){
    8000197c:	fc010113          	addi	sp,sp,-64
    80001980:	02113c23          	sd	ra,56(sp)
    80001984:	02813823          	sd	s0,48(sp)
    80001988:	02913423          	sd	s1,40(sp)
    8000198c:	03213023          	sd	s2,32(sp)
    80001990:	01313c23          	sd	s3,24(sp)
    80001994:	01413823          	sd	s4,16(sp)
    80001998:	04010413          	addi	s0,sp,64
    MemoryAllocator::initMemory();
    8000199c:	00002097          	auipc	ra,0x2
    800019a0:	c88080e7          	jalr	-888(ra) # 80003624 <_ZN15MemoryAllocator10initMemoryEv>
    TCB* kernelThread = TCB::initKernel();
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	32c080e7          	jalr	812(ra) # 80001cd0 <_ZN3TCB10initKernelEv>
    800019ac:	00050993          	mv	s3,a0
    TCB* inactiveThread = TCB::initInactiveThread();
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	690080e7          	jalr	1680(ra) # 80002040 <_ZN3TCB18initInactiveThreadEv>
    800019b8:	00050913          	mv	s2,a0
    TCB* consolePrintThread = TCB::initConsoleThread();
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	748080e7          	jalr	1864(ra) # 80002104 <_ZN3TCB17initConsoleThreadEv>
    800019c4:	00050493          	mv	s1,a0

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800019c8:	00007797          	auipc	a5,0x7
    800019cc:	3807b783          	ld	a5,896(a5) # 80008d48 <_GLOBAL_OFFSET_TABLE_+0x28>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}
inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800019d0:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800019d4:	00200793          	li	a5,2
    800019d8:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_t user1;
    thread_create(&user1, testWrapper, (void*)nullptr);
    800019dc:	00000613          	li	a2,0
    800019e0:	00000597          	auipc	a1,0x0
    800019e4:	f6458593          	addi	a1,a1,-156 # 80001944 <_Z11testWrapperPv>
    800019e8:	fc840513          	addi	a0,s0,-56
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	848080e7          	jalr	-1976(ra) # 80001234 <_Z13thread_createPP3TCBPFvPvES2_>
    800019f4:	00c0006f          	j	80001a00 <main+0x84>

    while (!user1->isFinished() || Riscv::buffer_output->getSize() > 0) {
        thread_dispatch();
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	8e8080e7          	jalr	-1816(ra) # 800012e0 <_Z15thread_dispatchv>
    while (!user1->isFinished() || Riscv::buffer_output->getSize() > 0) {
    80001a00:	fc843783          	ld	a5,-56(s0)
    enum state {CREATED, READY, RUNNING, FINISHED, BLOCKED, SLEEPING, INACTIVE};

    ~TCB();

    bool isFinished() const {
        if(current_state==FINISHED){
    80001a04:	0307a703          	lw	a4,48(a5)
    80001a08:	00300793          	li	a5,3
    80001a0c:	fef716e3          	bne	a4,a5,800019f8 <main+0x7c>
    80001a10:	00007797          	auipc	a5,0x7
    80001a14:	3587b783          	ld	a5,856(a5) # 80008d68 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001a18:	0007b503          	ld	a0,0(a5)
    80001a1c:	00001097          	auipc	ra,0x1
    80001a20:	25c080e7          	jalr	604(ra) # 80002c78 <_ZNK13ConsoleBuffer7getSizeEv>
    80001a24:	fca04ae3          	bgtz	a0,800019f8 <main+0x7c>
    }
    printString("Main finished\n");
    80001a28:	00005517          	auipc	a0,0x5
    80001a2c:	60850513          	addi	a0,a0,1544 # 80007030 <CONSOLE_STATUS+0x20>
    80001a30:	00002097          	auipc	ra,0x2
    80001a34:	010080e7          	jalr	16(ra) # 80003a40 <_Z11printStringPKc>

    delete user1;
    80001a38:	fc843a03          	ld	s4,-56(s0)
    80001a3c:	000a0e63          	beqz	s4,80001a58 <main+0xdc>
    80001a40:	000a0513          	mv	a0,s4
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	19c080e7          	jalr	412(ra) # 80001be0 <_ZN3TCBD1Ev>
    void operator delete(void *p) {__mem_free(p);}
    80001a4c:	000a0513          	mv	a0,s4
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	b9c080e7          	jalr	-1124(ra) # 800015ec <__mem_free>
    delete kernelThread;
    80001a58:	00098e63          	beqz	s3,80001a74 <main+0xf8>
    80001a5c:	00098513          	mv	a0,s3
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	180080e7          	jalr	384(ra) # 80001be0 <_ZN3TCBD1Ev>
    80001a68:	00098513          	mv	a0,s3
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	b80080e7          	jalr	-1152(ra) # 800015ec <__mem_free>
    delete inactiveThread;
    80001a74:	00090e63          	beqz	s2,80001a90 <main+0x114>
    80001a78:	00090513          	mv	a0,s2
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	164080e7          	jalr	356(ra) # 80001be0 <_ZN3TCBD1Ev>
    80001a84:	00090513          	mv	a0,s2
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	b64080e7          	jalr	-1180(ra) # 800015ec <__mem_free>
    delete consolePrintThread;
    80001a90:	00048e63          	beqz	s1,80001aac <main+0x130>
    80001a94:	00048513          	mv	a0,s1
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	148080e7          	jalr	328(ra) # 80001be0 <_ZN3TCBD1Ev>
    80001aa0:	00048513          	mv	a0,s1
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	b48080e7          	jalr	-1208(ra) # 800015ec <__mem_free>
    80001aac:	03813083          	ld	ra,56(sp)
    80001ab0:	03013403          	ld	s0,48(sp)
    80001ab4:	02813483          	ld	s1,40(sp)
    80001ab8:	02013903          	ld	s2,32(sp)
    80001abc:	01813983          	ld	s3,24(sp)
    80001ac0:	01013a03          	ld	s4,16(sp)
    80001ac4:	04010113          	addi	sp,sp,64
    80001ac8:	00008067          	ret

0000000080001acc <_Z41__static_initialization_and_destruction_0ii>:
        this->setState(READY);
        Scheduler::put(this);
        return 0;
    }
    else return -2;
}
    80001acc:	ff010113          	addi	sp,sp,-16
    80001ad0:	00813423          	sd	s0,8(sp)
    80001ad4:	01010413          	addi	s0,sp,16
    80001ad8:	00100793          	li	a5,1
    80001adc:	00f50863          	beq	a0,a5,80001aec <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001ae0:	00813403          	ld	s0,8(sp)
    80001ae4:	01010113          	addi	sp,sp,16
    80001ae8:	00008067          	ret
    80001aec:	000107b7          	lui	a5,0x10
    80001af0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001af4:	fef596e3          	bne	a1,a5,80001ae0 <_Z41__static_initialization_and_destruction_0ii+0x14>
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------
    List() : head(0), tail(0), length(0) {}
    80001af8:	00007797          	auipc	a5,0x7
    80001afc:	2f878793          	addi	a5,a5,760 # 80008df0 <_ZN3TCB11all_threadsE>
    80001b00:	0007b023          	sd	zero,0(a5)
    80001b04:	0007b423          	sd	zero,8(a5)
    80001b08:	0007a823          	sw	zero,16(a5)
    80001b0c:	fd5ff06f          	j	80001ae0 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001b10 <_ZN3TCB15inactiveWrapperEPv>:
void TCB::inactiveWrapper(void* arg) {
    80001b10:	ff010113          	addi	sp,sp,-16
    80001b14:	00113423          	sd	ra,8(sp)
    80001b18:	00813023          	sd	s0,0(sp)
    80001b1c:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80001b20:	fffff097          	auipc	ra,0xfffff
    80001b24:	7c0080e7          	jalr	1984(ra) # 800012e0 <_Z15thread_dispatchv>
    while(1){
    80001b28:	ff9ff06f          	j	80001b20 <_ZN3TCB15inactiveWrapperEPv+0x10>

0000000080001b2c <_ZN3TCB13threadWrapperEv>:
void TCB::threadWrapper(){
    80001b2c:	fe010113          	addi	sp,sp,-32
    80001b30:	00113c23          	sd	ra,24(sp)
    80001b34:	00813823          	sd	s0,16(sp)
    80001b38:	00913423          	sd	s1,8(sp)
    80001b3c:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001b40:	00001097          	auipc	ra,0x1
    80001b44:	154080e7          	jalr	340(ra) # 80002c94 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80001b48:	00007497          	auipc	s1,0x7
    80001b4c:	2a848493          	addi	s1,s1,680 # 80008df0 <_ZN3TCB11all_threadsE>
    80001b50:	0184b783          	ld	a5,24(s1)
    80001b54:	0087b703          	ld	a4,8(a5)
    80001b58:	0287b503          	ld	a0,40(a5)
    80001b5c:	000700e7          	jalr	a4
    running->setState(FINISHED);
    80001b60:	0184b783          	ld	a5,24(s1)
            return true;
        }
        else return false;
    }

    void setState(state my_state) {current_state=my_state; return;}
    80001b64:	00300713          	li	a4,3
    80001b68:	02e7a823          	sw	a4,48(a5)
    thread_dispatch();
    80001b6c:	fffff097          	auipc	ra,0xfffff
    80001b70:	774080e7          	jalr	1908(ra) # 800012e0 <_Z15thread_dispatchv>
}
    80001b74:	01813083          	ld	ra,24(sp)
    80001b78:	01013403          	ld	s0,16(sp)
    80001b7c:	00813483          	ld	s1,8(sp)
    80001b80:	02010113          	addi	sp,sp,32
    80001b84:	00008067          	ret

0000000080001b88 <_ZN3TCB20consoleThreadWrapperEPv>:
void TCB::consoleThreadWrapper(void* arg) {
    80001b88:	fe010113          	addi	sp,sp,-32
    80001b8c:	00113c23          	sd	ra,24(sp)
    80001b90:	00813823          	sd	s0,16(sp)
    80001b94:	00913423          	sd	s1,8(sp)
    80001b98:	02010413          	addi	s0,sp,32
        current_status=*((char *) CONSOLE_STATUS);
    80001b9c:	00007797          	auipc	a5,0x7
    80001ba0:	19c7b783          	ld	a5,412(a5) # 80008d38 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001ba4:	0007b483          	ld	s1,0(a5)
    80001ba8:	0004c783          	lbu	a5,0(s1)
        while((CONSOLE_TX_STATUS_BIT & current_status)){
    80001bac:	0207f793          	andi	a5,a5,32
    80001bb0:	fe0786e3          	beqz	a5,80001b9c <_ZN3TCB20consoleThreadWrapperEPv+0x14>
            char reciv_char = Riscv::buffer_output->take();
    80001bb4:	00007797          	auipc	a5,0x7
    80001bb8:	1b47b783          	ld	a5,436(a5) # 80008d68 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001bbc:	0007b503          	ld	a0,0(a5)
    80001bc0:	00001097          	auipc	ra,0x1
    80001bc4:	f08080e7          	jalr	-248(ra) # 80002ac8 <_ZN13ConsoleBuffer4takeEv>
            (*((char*)CONSOLE_TX_DATA)) = reciv_char;
    80001bc8:	00007797          	auipc	a5,0x7
    80001bcc:	1a87b783          	ld	a5,424(a5) # 80008d70 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001bd0:	0007b783          	ld	a5,0(a5)
    80001bd4:	00a78023          	sb	a0,0(a5)
            current_status = *((char*) CONSOLE_STATUS);
    80001bd8:	0004c783          	lbu	a5,0(s1)
        while((CONSOLE_TX_STATUS_BIT & current_status)){
    80001bdc:	fd1ff06f          	j	80001bac <_ZN3TCB20consoleThreadWrapperEPv+0x24>

0000000080001be0 <_ZN3TCBD1Ev>:
TCB::~TCB() {
    80001be0:	fe010113          	addi	sp,sp,-32
    80001be4:	00113c23          	sd	ra,24(sp)
    80001be8:	00813823          	sd	s0,16(sp)
    80001bec:	00913423          	sd	s1,8(sp)
    80001bf0:	02010413          	addi	s0,sp,32
    if(this->current_state==INACTIVE){
    80001bf4:	03052703          	lw	a4,48(a0)
    80001bf8:	00600793          	li	a5,6
    80001bfc:	02f70a63          	beq	a4,a5,80001c30 <_ZN3TCBD1Ev+0x50>
    80001c00:	00050493          	mv	s1,a0
    List<TCB>::Elem* tren=all_threads.head;
    80001c04:	00007517          	auipc	a0,0x7
    80001c08:	1ec53503          	ld	a0,492(a0) # 80008df0 <_ZN3TCB11all_threadsE>
    List<TCB>::Elem* prev=nullptr;
    80001c0c:	00000693          	li	a3,0
    while(tren!=nullptr){
    80001c10:	04050c63          	beqz	a0,80001c68 <_ZN3TCBD1Ev+0x88>
        if(tren->data->my_id==this->my_id){
    80001c14:	00053783          	ld	a5,0(a0)
    80001c18:	0487b703          	ld	a4,72(a5)
    80001c1c:	0484b783          	ld	a5,72(s1)
    80001c20:	02f70a63          	beq	a4,a5,80001c54 <_ZN3TCBD1Ev+0x74>
        prev=tren;
    80001c24:	00050693          	mv	a3,a0
        tren=tren->next;
    80001c28:	00853503          	ld	a0,8(a0)
    while(tren!=nullptr){
    80001c2c:	fe5ff06f          	j	80001c10 <_ZN3TCBD1Ev+0x30>
        delete inactiveThread->stack;
    80001c30:	00007797          	auipc	a5,0x7
    80001c34:	1e07b783          	ld	a5,480(a5) # 80008e10 <_ZN3TCB14inactiveThreadE>
    80001c38:	0107b503          	ld	a0,16(a5)
    80001c3c:	00050663          	beqz	a0,80001c48 <_ZN3TCBD1Ev+0x68>
    80001c40:	00001097          	auipc	ra,0x1
    80001c44:	9ac080e7          	jalr	-1620(ra) # 800025ec <_ZdlPv>
        inactiveThread= nullptr;
    80001c48:	00007797          	auipc	a5,0x7
    80001c4c:	1c07b423          	sd	zero,456(a5) # 80008e10 <_ZN3TCB14inactiveThreadE>
        return;
    80001c50:	0280006f          	j	80001c78 <_ZN3TCBD1Ev+0x98>
            if(prev==nullptr){
    80001c54:	02068c63          	beqz	a3,80001c8c <_ZN3TCBD1Ev+0xac>
                prev->next=tren->next;
    80001c58:	00853783          	ld	a5,8(a0)
    80001c5c:	00f6b423          	sd	a5,8(a3)
        void operator delete(void *p) {__mem_free(p);}
    80001c60:	00000097          	auipc	ra,0x0
    80001c64:	98c080e7          	jalr	-1652(ra) # 800015ec <__mem_free>
    delete[] stack;
    80001c68:	0104b503          	ld	a0,16(s1)
    80001c6c:	00050663          	beqz	a0,80001c78 <_ZN3TCBD1Ev+0x98>
    80001c70:	00001097          	auipc	ra,0x1
    80001c74:	9a4080e7          	jalr	-1628(ra) # 80002614 <_ZdaPv>
}
    80001c78:	01813083          	ld	ra,24(sp)
    80001c7c:	01013403          	ld	s0,16(sp)
    80001c80:	00813483          	ld	s1,8(sp)
    80001c84:	02010113          	addi	sp,sp,32
    80001c88:	00008067          	ret
    }

    T *removeFirst()
    {

        if (!head) { return 0; }
    80001c8c:	00007517          	auipc	a0,0x7
    80001c90:	16453503          	ld	a0,356(a0) # 80008df0 <_ZN3TCB11all_threadsE>
    80001c94:	fc050ae3          	beqz	a0,80001c68 <_ZN3TCBD1Ev+0x88>
        length--;
    80001c98:	00007797          	auipc	a5,0x7
    80001c9c:	15878793          	addi	a5,a5,344 # 80008df0 <_ZN3TCB11all_threadsE>
    80001ca0:	0107a703          	lw	a4,16(a5)
    80001ca4:	fff7071b          	addiw	a4,a4,-1
    80001ca8:	00e7a823          	sw	a4,16(a5)
        Elem *elem = head;
        head = head->next;
    80001cac:	00853703          	ld	a4,8(a0)
    80001cb0:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    80001cb4:	00070863          	beqz	a4,80001cc4 <_ZN3TCBD1Ev+0xe4>
        void operator delete(void *p) {__mem_free(p);}
    80001cb8:	00000097          	auipc	ra,0x0
    80001cbc:	934080e7          	jalr	-1740(ra) # 800015ec <__mem_free>

        T *ret = elem->data;
        delete elem;
        return ret;
    80001cc0:	fa9ff06f          	j	80001c68 <_ZN3TCBD1Ev+0x88>
        if (!head) { tail = 0; }
    80001cc4:	00007797          	auipc	a5,0x7
    80001cc8:	1207ba23          	sd	zero,308(a5) # 80008df8 <_ZN3TCB11all_threadsE+0x8>
    80001ccc:	fedff06f          	j	80001cb8 <_ZN3TCBD1Ev+0xd8>

0000000080001cd0 <_ZN3TCB10initKernelEv>:
TCB *TCB::initKernel(){
    80001cd0:	fe010113          	addi	sp,sp,-32
    80001cd4:	00113c23          	sd	ra,24(sp)
    80001cd8:	00813823          	sd	s0,16(sp)
    80001cdc:	00913423          	sd	s1,8(sp)
    80001ce0:	01213023          	sd	s2,0(sp)
    80001ce4:	02010413          	addi	s0,sp,32
    void *operator new(size_t n){return __mem_alloc(n);}
    80001ce8:	05000513          	li	a0,80
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	8d8080e7          	jalr	-1832(ra) # 800015c4 <__mem_alloc>
    80001cf4:	00050493          	mv	s1,a0
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
                    }),
            arg(arg),
            timeSlice(DEFAULT_TIME_SLICE),
            privileged(privileged)
    80001cf8:	00053423          	sd	zero,8(a0)
    80001cfc:	00053823          	sd	zero,16(a0)
    80001d00:	00000797          	auipc	a5,0x0
    80001d04:	e2c78793          	addi	a5,a5,-468 # 80001b2c <_ZN3TCB13threadWrapperEv>
    80001d08:	00f53c23          	sd	a5,24(a0)
    80001d0c:	02053023          	sd	zero,32(a0)
    80001d10:	02053423          	sd	zero,40(a0)
    80001d14:	00200793          	li	a5,2
    80001d18:	02f53c23          	sd	a5,56(a0)
    80001d1c:	00100713          	li	a4,1
    80001d20:	04e50023          	sb	a4,64(a0)
    {
        if(body==nullptr){
            current_state=RUNNING;
    80001d24:	02f52823          	sw	a5,48(a0)
        }
        else{
            current_state=CREATED;
        }

        time_to_sleep=-1;
    80001d28:	fff00793          	li	a5,-1
    80001d2c:	00f53023          	sd	a5,0(a0)
    kernel=kernelThr;
    80001d30:	00007797          	auipc	a5,0x7
    80001d34:	0c078793          	addi	a5,a5,192 # 80008df0 <_ZN3TCB11all_threadsE>
    80001d38:	02a7b423          	sd	a0,40(a5)
    running = kernel;
    80001d3c:	00a7bc23          	sd	a0,24(a5)
#define N 1000

class ConsoleBuffer{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    80001d40:	42000513          	li	a0,1056
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	880080e7          	jalr	-1920(ra) # 800015c4 <__mem_alloc>
    80001d4c:	00050913          	mv	s2,a0
    80001d50:	00001097          	auipc	ra,0x1
    80001d54:	a2c080e7          	jalr	-1492(ra) # 8000277c <_ZN13ConsoleBufferC1Ev>
    Riscv::buffer_input = new ConsoleBuffer();
    80001d58:	00007797          	auipc	a5,0x7
    80001d5c:	0087b783          	ld	a5,8(a5) # 80008d60 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001d60:	0127b023          	sd	s2,0(a5)
    80001d64:	42000513          	li	a0,1056
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	85c080e7          	jalr	-1956(ra) # 800015c4 <__mem_alloc>
    80001d70:	00050913          	mv	s2,a0
    80001d74:	00001097          	auipc	ra,0x1
    80001d78:	a08080e7          	jalr	-1528(ra) # 8000277c <_ZN13ConsoleBufferC1Ev>
    80001d7c:	03c0006f          	j	80001db8 <_ZN3TCB10initKernelEv+0xe8>
    80001d80:	00050493          	mv	s1,a0
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    80001d84:	00090513          	mv	a0,s2
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	864080e7          	jalr	-1948(ra) # 800015ec <__mem_free>
    80001d90:	00048513          	mv	a0,s1
    80001d94:	00008097          	auipc	ra,0x8
    80001d98:	1e4080e7          	jalr	484(ra) # 80009f78 <_Unwind_Resume>
    80001d9c:	00050493          	mv	s1,a0
    80001da0:	00090513          	mv	a0,s2
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	848080e7          	jalr	-1976(ra) # 800015ec <__mem_free>
    80001dac:	00048513          	mv	a0,s1
    80001db0:	00008097          	auipc	ra,0x8
    80001db4:	1c8080e7          	jalr	456(ra) # 80009f78 <_Unwind_Resume>
    Riscv::buffer_output = new ConsoleBuffer();
    80001db8:	00007797          	auipc	a5,0x7
    80001dbc:	fb07b783          	ld	a5,-80(a5) # 80008d68 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001dc0:	0127b023          	sd	s2,0(a5)
}
    80001dc4:	00048513          	mv	a0,s1
    80001dc8:	01813083          	ld	ra,24(sp)
    80001dcc:	01013403          	ld	s0,16(sp)
    80001dd0:	00813483          	ld	s1,8(sp)
    80001dd4:	00013903          	ld	s2,0(sp)
    80001dd8:	02010113          	addi	sp,sp,32
    80001ddc:	00008067          	ret

0000000080001de0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch(){
    80001de0:	fe010113          	addi	sp,sp,-32
    80001de4:	00113c23          	sd	ra,24(sp)
    80001de8:	00813823          	sd	s0,16(sp)
    80001dec:	00913423          	sd	s1,8(sp)
    80001df0:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80001df4:	00007497          	auipc	s1,0x7
    80001df8:	0144b483          	ld	s1,20(s1) # 80008e08 <_ZN3TCB7runningE>
    if (old->current_state == RUNNING){
    80001dfc:	0304a703          	lw	a4,48(s1)
    80001e00:	00200793          	li	a5,2
    80001e04:	04f70e63          	beq	a4,a5,80001e60 <_ZN3TCB8dispatchEv+0x80>
    running = Scheduler::get();
    80001e08:	00001097          	auipc	ra,0x1
    80001e0c:	6d0080e7          	jalr	1744(ra) # 800034d8 <_ZN9Scheduler3getEv>
    80001e10:	00007797          	auipc	a5,0x7
    80001e14:	fea7bc23          	sd	a0,-8(a5) # 80008e08 <_ZN3TCB7runningE>
    if(running){
    80001e18:	06050063          	beqz	a0,80001e78 <_ZN3TCB8dispatchEv+0x98>
    void setState(state my_state) {current_state=my_state; return;}
    80001e1c:	00200793          	li	a5,2
    80001e20:	02f52823          	sw	a5,48(a0)
    if(running->privileged==false){
    80001e24:	00007597          	auipc	a1,0x7
    80001e28:	fe45b583          	ld	a1,-28(a1) # 80008e08 <_ZN3TCB7runningE>
    80001e2c:	0405c783          	lbu	a5,64(a1)
    80001e30:	04079e63          	bnez	a5,80001e8c <_ZN3TCB8dispatchEv+0xac>
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001e34:	10000793          	li	a5,256
    80001e38:	1007b073          	csrc	sstatus,a5
    TCB::contextSwitch(&old->context, &running->context);
    80001e3c:	01858593          	addi	a1,a1,24
    80001e40:	01848513          	addi	a0,s1,24
    80001e44:	fffff097          	auipc	ra,0xfffff
    80001e48:	2ec080e7          	jalr	748(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001e4c:	01813083          	ld	ra,24(sp)
    80001e50:	01013403          	ld	s0,16(sp)
    80001e54:	00813483          	ld	s1,8(sp)
    80001e58:	02010113          	addi	sp,sp,32
    80001e5c:	00008067          	ret
    80001e60:	00100793          	li	a5,1
    80001e64:	02f4a823          	sw	a5,48(s1)
        Scheduler::put(old);
    80001e68:	00048513          	mv	a0,s1
    80001e6c:	00001097          	auipc	ra,0x1
    80001e70:	6e4080e7          	jalr	1764(ra) # 80003550 <_ZN9Scheduler3putEP3TCB>
    80001e74:	f95ff06f          	j	80001e08 <_ZN3TCB8dispatchEv+0x28>
        running=inactiveThread;
    80001e78:	00007797          	auipc	a5,0x7
    80001e7c:	f7878793          	addi	a5,a5,-136 # 80008df0 <_ZN3TCB11all_threadsE>
    80001e80:	0207b703          	ld	a4,32(a5)
    80001e84:	00e7bc23          	sd	a4,24(a5)
    80001e88:	f9dff06f          	j	80001e24 <_ZN3TCB8dispatchEv+0x44>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001e8c:	10000793          	li	a5,256
    80001e90:	1007a073          	csrs	sstatus,a5
}
    80001e94:	fa9ff06f          	j	80001e3c <_ZN3TCB8dispatchEv+0x5c>

0000000080001e98 <_ZN3TCB7prepareEv>:
void TCB::prepare(){
    80001e98:	ff010113          	addi	sp,sp,-16
    80001e9c:	00113423          	sd	ra,8(sp)
    80001ea0:	00813023          	sd	s0,0(sp)
    80001ea4:	01010413          	addi	s0,sp,16
    80001ea8:	00100793          	li	a5,1
    80001eac:	02f52823          	sw	a5,48(a0)
    Scheduler::put(this);
    80001eb0:	00001097          	auipc	ra,0x1
    80001eb4:	6a0080e7          	jalr	1696(ra) # 80003550 <_ZN9Scheduler3putEP3TCB>
};
    80001eb8:	00813083          	ld	ra,8(sp)
    80001ebc:	00013403          	ld	s0,0(sp)
    80001ec0:	01010113          	addi	sp,sp,16
    80001ec4:	00008067          	ret

0000000080001ec8 <_ZN3TCB4exitEv>:
    if(running->current_state == RUNNING){
    80001ec8:	00007797          	auipc	a5,0x7
    80001ecc:	f407b783          	ld	a5,-192(a5) # 80008e08 <_ZN3TCB7runningE>
    80001ed0:	0307a683          	lw	a3,48(a5)
    80001ed4:	00200713          	li	a4,2
    80001ed8:	02e69c63          	bne	a3,a4,80001f10 <_ZN3TCB4exitEv+0x48>
int TCB::exit(){
    80001edc:	ff010113          	addi	sp,sp,-16
    80001ee0:	00113423          	sd	ra,8(sp)
    80001ee4:	00813023          	sd	s0,0(sp)
    80001ee8:	01010413          	addi	s0,sp,16
    80001eec:	00300713          	li	a4,3
    80001ef0:	02e7a823          	sw	a4,48(a5)
        dispatch();
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	eec080e7          	jalr	-276(ra) # 80001de0 <_ZN3TCB8dispatchEv>
        return 0;
    80001efc:	00000513          	li	a0,0
};
    80001f00:	00813083          	ld	ra,8(sp)
    80001f04:	00013403          	ld	s0,0(sp)
    80001f08:	01010113          	addi	sp,sp,16
    80001f0c:	00008067          	ret
        return -8;
    80001f10:	ff800513          	li	a0,-8
};
    80001f14:	00008067          	ret

0000000080001f18 <_ZN3TCB5blockEv>:
    if(running->getState() == RUNNING){
    80001f18:	00007797          	auipc	a5,0x7
    80001f1c:	ef07b783          	ld	a5,-272(a5) # 80008e08 <_ZN3TCB7runningE>
    state getState() {return current_state;}
    80001f20:	0307a683          	lw	a3,48(a5)
    80001f24:	00200713          	li	a4,2
    80001f28:	02e69c63          	bne	a3,a4,80001f60 <_ZN3TCB5blockEv+0x48>
int TCB::block(){
    80001f2c:	ff010113          	addi	sp,sp,-16
    80001f30:	00113423          	sd	ra,8(sp)
    80001f34:	00813023          	sd	s0,0(sp)
    80001f38:	01010413          	addi	s0,sp,16
    void setState(state my_state) {current_state=my_state; return;}
    80001f3c:	00400713          	li	a4,4
    80001f40:	02e7a823          	sw	a4,48(a5)
        dispatch();
    80001f44:	00000097          	auipc	ra,0x0
    80001f48:	e9c080e7          	jalr	-356(ra) # 80001de0 <_ZN3TCB8dispatchEv>
        return 0;
    80001f4c:	00000513          	li	a0,0
}
    80001f50:	00813083          	ld	ra,8(sp)
    80001f54:	00013403          	ld	s0,0(sp)
    80001f58:	01010113          	addi	sp,sp,16
    80001f5c:	00008067          	ret
        return -2;
    80001f60:	ffe00513          	li	a0,-2
}
    80001f64:	00008067          	ret

0000000080001f68 <_ZN3TCB7unblockEv>:
    if(this->current_state == BLOCKED){
    80001f68:	03052703          	lw	a4,48(a0)
    80001f6c:	00400793          	li	a5,4
    80001f70:	02f71863          	bne	a4,a5,80001fa0 <_ZN3TCB7unblockEv+0x38>
int TCB::unblock(){
    80001f74:	ff010113          	addi	sp,sp,-16
    80001f78:	00113423          	sd	ra,8(sp)
    80001f7c:	00813023          	sd	s0,0(sp)
    80001f80:	01010413          	addi	s0,sp,16
        this->prepare();
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	f14080e7          	jalr	-236(ra) # 80001e98 <_ZN3TCB7prepareEv>
        return 0;
    80001f8c:	00000513          	li	a0,0
}
    80001f90:	00813083          	ld	ra,8(sp)
    80001f94:	00013403          	ld	s0,0(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret
        return -16;
    80001fa0:	ff000513          	li	a0,-16
}
    80001fa4:	00008067          	ret

0000000080001fa8 <_ZN3TCB5sleepEm>:
int TCB::sleep(time_t time) {
    80001fa8:	00050593          	mv	a1,a0
    if(running->getState() == RUNNING){
    80001fac:	00007517          	auipc	a0,0x7
    80001fb0:	e5c53503          	ld	a0,-420(a0) # 80008e08 <_ZN3TCB7runningE>
    state getState() {return current_state;}
    80001fb4:	03052703          	lw	a4,48(a0)
    80001fb8:	00200793          	li	a5,2
    80001fbc:	04f71063          	bne	a4,a5,80001ffc <_ZN3TCB5sleepEm+0x54>
int TCB::sleep(time_t time) {
    80001fc0:	ff010113          	addi	sp,sp,-16
    80001fc4:	00113423          	sd	ra,8(sp)
    80001fc8:	00813023          	sd	s0,0(sp)
    80001fcc:	01010413          	addi	s0,sp,16
    void setState(state my_state) {current_state=my_state; return;}
    80001fd0:	00500793          	li	a5,5
    80001fd4:	02f52823          	sw	a5,48(a0)
        SleepingThread::go_sleep(running,time);
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	2b0080e7          	jalr	688(ra) # 80002288 <_ZN14SleepingThread8go_sleepEP3TCBm>
        dispatch();
    80001fe0:	00000097          	auipc	ra,0x0
    80001fe4:	e00080e7          	jalr	-512(ra) # 80001de0 <_ZN3TCB8dispatchEv>
        return 0;
    80001fe8:	00000513          	li	a0,0
}
    80001fec:	00813083          	ld	ra,8(sp)
    80001ff0:	00013403          	ld	s0,0(sp)
    80001ff4:	01010113          	addi	sp,sp,16
    80001ff8:	00008067          	ret
        return -2;
    80001ffc:	ffe00513          	li	a0,-2
}
    80002000:	00008067          	ret

0000000080002004 <_ZN3TCB23find_elem_in_allthreadsEm>:
List<TCB>::Elem *TCB::find_elem_in_allthreads(uint64 id_to_find) {
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
    80002010:	00050713          	mv	a4,a0
    List<TCB>::Elem* tren=all_threads.head;
    80002014:	00007517          	auipc	a0,0x7
    80002018:	ddc53503          	ld	a0,-548(a0) # 80008df0 <_ZN3TCB11all_threadsE>
    while(tren!=nullptr){
    8000201c:	00050c63          	beqz	a0,80002034 <_ZN3TCB23find_elem_in_allthreadsEm+0x30>
        if(tren->data->my_id==id_to_find){
    80002020:	00053783          	ld	a5,0(a0)
    80002024:	0487b783          	ld	a5,72(a5)
    80002028:	00e78663          	beq	a5,a4,80002034 <_ZN3TCB23find_elem_in_allthreadsEm+0x30>
        tren=tren->next;
    8000202c:	00853503          	ld	a0,8(a0)
    while(tren!=nullptr){
    80002030:	fedff06f          	j	8000201c <_ZN3TCB23find_elem_in_allthreadsEm+0x18>
}
    80002034:	00813403          	ld	s0,8(sp)
    80002038:	01010113          	addi	sp,sp,16
    8000203c:	00008067          	ret

0000000080002040 <_ZN3TCB18initInactiveThreadEv>:
    if(inactiveThread==nullptr){
    80002040:	00007797          	auipc	a5,0x7
    80002044:	dd07b783          	ld	a5,-560(a5) # 80008e10 <_ZN3TCB14inactiveThreadE>
    80002048:	00078863          	beqz	a5,80002058 <_ZN3TCB18initInactiveThreadEv+0x18>
}
    8000204c:	00007517          	auipc	a0,0x7
    80002050:	dc453503          	ld	a0,-572(a0) # 80008e10 <_ZN3TCB14inactiveThreadE>
    80002054:	00008067          	ret
TCB* TCB::initInactiveThread() {
    80002058:	fe010113          	addi	sp,sp,-32
    8000205c:	00113c23          	sd	ra,24(sp)
    80002060:	00813823          	sd	s0,16(sp)
    80002064:	00913423          	sd	s1,8(sp)
    80002068:	02010413          	addi	s0,sp,32
            uint64 *stack = (uint64*)__mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    8000206c:	00008537          	lui	a0,0x8
    80002070:	fffff097          	auipc	ra,0xfffff
    80002074:	554080e7          	jalr	1364(ra) # 800015c4 <__mem_alloc>
    80002078:	00050493          	mv	s1,a0
    void *operator new(size_t n){return __mem_alloc(n);}
    8000207c:	05000513          	li	a0,80
    80002080:	fffff097          	auipc	ra,0xfffff
    80002084:	544080e7          	jalr	1348(ra) # 800015c4 <__mem_alloc>
            privileged(privileged)
    80002088:	00000797          	auipc	a5,0x0
    8000208c:	a8878793          	addi	a5,a5,-1400 # 80001b10 <_ZN3TCB15inactiveWrapperEPv>
    80002090:	00f53423          	sd	a5,8(a0) # 8008 <_entry-0x7fff7ff8>
    80002094:	00953823          	sd	s1,16(a0)
    80002098:	00000797          	auipc	a5,0x0
    8000209c:	a9478793          	addi	a5,a5,-1388 # 80001b2c <_ZN3TCB13threadWrapperEv>
    800020a0:	00f53c23          	sd	a5,24(a0)
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    800020a4:	04048c63          	beqz	s1,800020fc <_ZN3TCB18initInactiveThreadEv+0xbc>
    800020a8:	000087b7          	lui	a5,0x8
    800020ac:	00f484b3          	add	s1,s1,a5
            privileged(privileged)
    800020b0:	02953023          	sd	s1,32(a0)
    800020b4:	02053423          	sd	zero,40(a0)
    800020b8:	00200793          	li	a5,2
    800020bc:	02f53c23          	sd	a5,56(a0)
    800020c0:	00100793          	li	a5,1
    800020c4:	04f50023          	sb	a5,64(a0)
        time_to_sleep=-1;
    800020c8:	fff00793          	li	a5,-1
    800020cc:	00f53023          	sd	a5,0(a0)
            inactiveThread=new TCB(&inactiveWrapper, (void*)nullptr, (uint64*)stack, true);
    800020d0:	00007797          	auipc	a5,0x7
    800020d4:	d4a7b023          	sd	a0,-704(a5) # 80008e10 <_ZN3TCB14inactiveThreadE>
    void setState(state my_state) {current_state=my_state; return;}
    800020d8:	00600793          	li	a5,6
    800020dc:	02f52823          	sw	a5,48(a0)
}
    800020e0:	00007517          	auipc	a0,0x7
    800020e4:	d3053503          	ld	a0,-720(a0) # 80008e10 <_ZN3TCB14inactiveThreadE>
    800020e8:	01813083          	ld	ra,24(sp)
    800020ec:	01013403          	ld	s0,16(sp)
    800020f0:	00813483          	ld	s1,8(sp)
    800020f4:	02010113          	addi	sp,sp,32
    800020f8:	00008067          	ret
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    800020fc:	00000493          	li	s1,0
    80002100:	fb1ff06f          	j	800020b0 <_ZN3TCB18initInactiveThreadEv+0x70>

0000000080002104 <_ZN3TCB17initConsoleThreadEv>:
    if(consolePrintThread==nullptr){
    80002104:	00007797          	auipc	a5,0x7
    80002108:	d1c7b783          	ld	a5,-740(a5) # 80008e20 <_ZN3TCB18consolePrintThreadE>
    8000210c:	00078863          	beqz	a5,8000211c <_ZN3TCB17initConsoleThreadEv+0x18>
}
    80002110:	00007517          	auipc	a0,0x7
    80002114:	d1053503          	ld	a0,-752(a0) # 80008e20 <_ZN3TCB18consolePrintThreadE>
    80002118:	00008067          	ret
TCB *TCB::initConsoleThread() {
    8000211c:	fe010113          	addi	sp,sp,-32
    80002120:	00113c23          	sd	ra,24(sp)
    80002124:	00813823          	sd	s0,16(sp)
    80002128:	00913423          	sd	s1,8(sp)
    8000212c:	02010413          	addi	s0,sp,32
        uint64 *stack = (uint64*)__mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    80002130:	00008537          	lui	a0,0x8
    80002134:	fffff097          	auipc	ra,0xfffff
    80002138:	490080e7          	jalr	1168(ra) # 800015c4 <__mem_alloc>
    8000213c:	00050493          	mv	s1,a0
    void *operator new(size_t n){return __mem_alloc(n);}
    80002140:	05000513          	li	a0,80
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	480080e7          	jalr	1152(ra) # 800015c4 <__mem_alloc>
            privileged(privileged)
    8000214c:	00000797          	auipc	a5,0x0
    80002150:	a3c78793          	addi	a5,a5,-1476 # 80001b88 <_ZN3TCB20consoleThreadWrapperEPv>
    80002154:	00f53423          	sd	a5,8(a0) # 8008 <_entry-0x7fff7ff8>
    80002158:	00953823          	sd	s1,16(a0)
    8000215c:	00000797          	auipc	a5,0x0
    80002160:	9d078793          	addi	a5,a5,-1584 # 80001b2c <_ZN3TCB13threadWrapperEv>
    80002164:	00f53c23          	sd	a5,24(a0)
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    80002168:	04048e63          	beqz	s1,800021c4 <_ZN3TCB17initConsoleThreadEv+0xc0>
    8000216c:	000087b7          	lui	a5,0x8
    80002170:	00f484b3          	add	s1,s1,a5
            privileged(privileged)
    80002174:	02953023          	sd	s1,32(a0)
    80002178:	02053423          	sd	zero,40(a0)
    8000217c:	00200793          	li	a5,2
    80002180:	02f53c23          	sd	a5,56(a0)
    80002184:	00100793          	li	a5,1
    80002188:	04f50023          	sb	a5,64(a0)
            current_state=CREATED;
    8000218c:	02052823          	sw	zero,48(a0)
        time_to_sleep=-1;
    80002190:	fff00793          	li	a5,-1
    80002194:	00f53023          	sd	a5,0(a0)
        consolePrintThread=new TCB(&consoleThreadWrapper, (void*)nullptr, (uint64*)stack, true);
    80002198:	00007797          	auipc	a5,0x7
    8000219c:	c8a7b423          	sd	a0,-888(a5) # 80008e20 <_ZN3TCB18consolePrintThreadE>
        consolePrintThread->prepare();
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	cf8080e7          	jalr	-776(ra) # 80001e98 <_ZN3TCB7prepareEv>
}
    800021a8:	00007517          	auipc	a0,0x7
    800021ac:	c7853503          	ld	a0,-904(a0) # 80008e20 <_ZN3TCB18consolePrintThreadE>
    800021b0:	01813083          	ld	ra,24(sp)
    800021b4:	01013403          	ld	s0,16(sp)
    800021b8:	00813483          	ld	s1,8(sp)
    800021bc:	02010113          	addi	sp,sp,32
    800021c0:	00008067          	ret
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    800021c4:	00000493          	li	s1,0
    800021c8:	fadff06f          	j	80002174 <_ZN3TCB17initConsoleThreadEv+0x70>

00000000800021cc <_ZN3TCB5startEv>:
    if(this->current_state == CREATED){
    800021cc:	03052783          	lw	a5,48(a0)
    800021d0:	02079c63          	bnez	a5,80002208 <_ZN3TCB5startEv+0x3c>
int TCB::start() {
    800021d4:	ff010113          	addi	sp,sp,-16
    800021d8:	00113423          	sd	ra,8(sp)
    800021dc:	00813023          	sd	s0,0(sp)
    800021e0:	01010413          	addi	s0,sp,16
    void setState(state my_state) {current_state=my_state; return;}
    800021e4:	00100793          	li	a5,1
    800021e8:	02f52823          	sw	a5,48(a0)
        Scheduler::put(this);
    800021ec:	00001097          	auipc	ra,0x1
    800021f0:	364080e7          	jalr	868(ra) # 80003550 <_ZN9Scheduler3putEP3TCB>
        return 0;
    800021f4:	00000513          	li	a0,0
}
    800021f8:	00813083          	ld	ra,8(sp)
    800021fc:	00013403          	ld	s0,0(sp)
    80002200:	01010113          	addi	sp,sp,16
    80002204:	00008067          	ret
    else return -2;
    80002208:	ffe00513          	li	a0,-2
}
    8000220c:	00008067          	ret

0000000080002210 <_GLOBAL__sub_I__ZN3TCB6kernelE>:
    80002210:	ff010113          	addi	sp,sp,-16
    80002214:	00113423          	sd	ra,8(sp)
    80002218:	00813023          	sd	s0,0(sp)
    8000221c:	01010413          	addi	s0,sp,16
    80002220:	000105b7          	lui	a1,0x10
    80002224:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002228:	00100513          	li	a0,1
    8000222c:	00000097          	auipc	ra,0x0
    80002230:	8a0080e7          	jalr	-1888(ra) # 80001acc <_Z41__static_initialization_and_destruction_0ii>
    80002234:	00813083          	ld	ra,8(sp)
    80002238:	00013403          	ld	s0,0(sp)
    8000223c:	01010113          	addi	sp,sp,16
    80002240:	00008067          	ret

0000000080002244 <_Z41__static_initialization_and_destruction_0ii>:
        }
        else{
            break;
        }
    }
}
    80002244:	ff010113          	addi	sp,sp,-16
    80002248:	00813423          	sd	s0,8(sp)
    8000224c:	01010413          	addi	s0,sp,16
    80002250:	00100793          	li	a5,1
    80002254:	00f50863          	beq	a0,a5,80002264 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002258:	00813403          	ld	s0,8(sp)
    8000225c:	01010113          	addi	sp,sp,16
    80002260:	00008067          	ret
    80002264:	000107b7          	lui	a5,0x10
    80002268:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000226c:	fef596e3          	bne	a1,a5,80002258 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0), length(0) {}
    80002270:	00007797          	auipc	a5,0x7
    80002274:	bc878793          	addi	a5,a5,-1080 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002278:	0007b023          	sd	zero,0(a5)
    8000227c:	0007b423          	sd	zero,8(a5)
    80002280:	0007a823          	sw	zero,16(a5)
    80002284:	fd5ff06f          	j	80002258 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002288 <_ZN14SleepingThread8go_sleepEP3TCBm>:
    if(time<0 || thread==nullptr) return;
    80002288:	1c050063          	beqz	a0,80002448 <_ZN14SleepingThread8go_sleepEP3TCBm+0x1c0>
void SleepingThread::go_sleep(TCB *thread, time_t time) {
    8000228c:	fd010113          	addi	sp,sp,-48
    80002290:	02113423          	sd	ra,40(sp)
    80002294:	02813023          	sd	s0,32(sp)
    80002298:	00913c23          	sd	s1,24(sp)
    8000229c:	01213823          	sd	s2,16(sp)
    800022a0:	01313423          	sd	s3,8(sp)
    800022a4:	03010413          	addi	s0,sp,48
    800022a8:	00050913          	mv	s2,a0
    thread->time_to_sleep = time + time_elapsed; //relativno vreme budjenja
    800022ac:	00007797          	auipc	a5,0x7
    800022b0:	b8c78793          	addi	a5,a5,-1140 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    800022b4:	0187b703          	ld	a4,24(a5)
    800022b8:	00e585b3          	add	a1,a1,a4
    800022bc:	00b53023          	sd	a1,0(a0)
    unsigned get_length() const { return length;}
    800022c0:	0107a783          	lw	a5,16(a5)
    if(sleeping_threads.get_length() == 0){
    800022c4:	00078c63          	beqz	a5,800022dc <_ZN14SleepingThread8go_sleepEP3TCBm+0x54>
        List<TCB>::Elem* tren=sleeping_threads.head;
    800022c8:	00007497          	auipc	s1,0x7
    800022cc:	b704b483          	ld	s1,-1168(s1) # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
        bool added=false;
    800022d0:	00000693          	li	a3,0
        List<TCB>::Elem* prev=nullptr;
    800022d4:	00000993          	li	s3,0
    800022d8:	0a00006f          	j	80002378 <_ZN14SleepingThread8go_sleepEP3TCBm+0xf0>
        void *operator new(size_t n){return __mem_alloc(n);}
    800022dc:	01000513          	li	a0,16
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	2e4080e7          	jalr	740(ra) # 800015c4 <__mem_alloc>
        Elem *elem = new Elem(data, head);
    800022e8:	00007797          	auipc	a5,0x7
    800022ec:	b5078793          	addi	a5,a5,-1200 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    800022f0:	0007b703          	ld	a4,0(a5)
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800022f4:	01253023          	sd	s2,0(a0)
    800022f8:	00e53423          	sd	a4,8(a0)
        head = elem;
    800022fc:	00a7b023          	sd	a0,0(a5)
        if (!tail) { tail = head; }
    80002300:	0087b783          	ld	a5,8(a5)
    80002304:	00078e63          	beqz	a5,80002320 <_ZN14SleepingThread8go_sleepEP3TCBm+0x98>
        length++;
    80002308:	00007717          	auipc	a4,0x7
    8000230c:	b3070713          	addi	a4,a4,-1232 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002310:	01072783          	lw	a5,16(a4)
    80002314:	0017879b          	addiw	a5,a5,1
    80002318:	00f72823          	sw	a5,16(a4)
    }
    8000231c:	0b80006f          	j	800023d4 <_ZN14SleepingThread8go_sleepEP3TCBm+0x14c>
        if (!tail) { tail = head; }
    80002320:	00007797          	auipc	a5,0x7
    80002324:	b2a7b023          	sd	a0,-1248(a5) # 80008e40 <_ZN14SleepingThread16sleeping_threadsE+0x8>
    80002328:	fe1ff06f          	j	80002308 <_ZN14SleepingThread8go_sleepEP3TCBm+0x80>
        void *operator new(size_t n){return __mem_alloc(n);}
    8000232c:	01000513          	li	a0,16
    80002330:	fffff097          	auipc	ra,0xfffff
    80002334:	294080e7          	jalr	660(ra) # 800015c4 <__mem_alloc>
        Elem *elem = new Elem(data, head);
    80002338:	00007797          	auipc	a5,0x7
    8000233c:	b0078793          	addi	a5,a5,-1280 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002340:	0007b703          	ld	a4,0(a5)
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002344:	01253023          	sd	s2,0(a0)
    80002348:	00e53423          	sd	a4,8(a0)
        head = elem;
    8000234c:	00a7b023          	sd	a0,0(a5)
        if (!tail) { tail = head; }
    80002350:	0087b783          	ld	a5,8(a5)
    80002354:	06078863          	beqz	a5,800023c4 <_ZN14SleepingThread8go_sleepEP3TCBm+0x13c>
        length++;
    80002358:	00007717          	auipc	a4,0x7
    8000235c:	ae070713          	addi	a4,a4,-1312 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002360:	01072783          	lw	a5,16(a4)
    80002364:	0017879b          	addiw	a5,a5,1
    80002368:	00f72823          	sw	a5,16(a4)
                    added=true;
    8000236c:	00100693          	li	a3,1
            prev=tren;
    80002370:	00048993          	mv	s3,s1
            tren=tren->next;
    80002374:	0084b483          	ld	s1,8(s1)
        while(tren!=nullptr){
    80002378:	04048c63          	beqz	s1,800023d0 <_ZN14SleepingThread8go_sleepEP3TCBm+0x148>
            if(tren->data->time_to_sleep > thread->time_to_sleep){
    8000237c:	0004b783          	ld	a5,0(s1)
    80002380:	0007b703          	ld	a4,0(a5)
    80002384:	00093783          	ld	a5,0(s2)
    80002388:	fee7f4e3          	bgeu	a5,a4,80002370 <_ZN14SleepingThread8go_sleepEP3TCBm+0xe8>
                if(prev==nullptr){
    8000238c:	fa0980e3          	beqz	s3,8000232c <_ZN14SleepingThread8go_sleepEP3TCBm+0xa4>
        void *operator new(size_t n){return __mem_alloc(n);}
    80002390:	01000513          	li	a0,16
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	230080e7          	jalr	560(ra) # 800015c4 <__mem_alloc>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    8000239c:	01253023          	sd	s2,0(a0)
    800023a0:	00953423          	sd	s1,8(a0)
                    prev->next=new_elem;
    800023a4:	00a9b423          	sd	a0,8(s3)
                    sleeping_threads.length++;
    800023a8:	00007717          	auipc	a4,0x7
    800023ac:	a9070713          	addi	a4,a4,-1392 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    800023b0:	01072783          	lw	a5,16(a4)
    800023b4:	0017879b          	addiw	a5,a5,1
    800023b8:	00f72823          	sw	a5,16(a4)
                    added=true;
    800023bc:	00100693          	li	a3,1
    800023c0:	fb1ff06f          	j	80002370 <_ZN14SleepingThread8go_sleepEP3TCBm+0xe8>
        if (!tail) { tail = head; }
    800023c4:	00007797          	auipc	a5,0x7
    800023c8:	a6a7be23          	sd	a0,-1412(a5) # 80008e40 <_ZN14SleepingThread16sleeping_threadsE+0x8>
    800023cc:	f8dff06f          	j	80002358 <_ZN14SleepingThread8go_sleepEP3TCBm+0xd0>
        if(added==false){
    800023d0:	02068063          	beqz	a3,800023f0 <_ZN14SleepingThread8go_sleepEP3TCBm+0x168>
}
    800023d4:	02813083          	ld	ra,40(sp)
    800023d8:	02013403          	ld	s0,32(sp)
    800023dc:	01813483          	ld	s1,24(sp)
    800023e0:	01013903          	ld	s2,16(sp)
    800023e4:	00813983          	ld	s3,8(sp)
    800023e8:	03010113          	addi	sp,sp,48
    800023ec:	00008067          	ret
        void *operator new(size_t n){return __mem_alloc(n);}
    800023f0:	01000513          	li	a0,16
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	1d0080e7          	jalr	464(ra) # 800015c4 <__mem_alloc>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800023fc:	01253023          	sd	s2,0(a0)
    80002400:	00053423          	sd	zero,8(a0)
        if (tail)
    80002404:	00007797          	auipc	a5,0x7
    80002408:	a3c7b783          	ld	a5,-1476(a5) # 80008e40 <_ZN14SleepingThread16sleeping_threadsE+0x8>
    8000240c:	02078463          	beqz	a5,80002434 <_ZN14SleepingThread8go_sleepEP3TCBm+0x1ac>
            tail->next = elem;
    80002410:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002414:	00007797          	auipc	a5,0x7
    80002418:	a2a7b623          	sd	a0,-1492(a5) # 80008e40 <_ZN14SleepingThread16sleeping_threadsE+0x8>
        length++;
    8000241c:	00007717          	auipc	a4,0x7
    80002420:	a1c70713          	addi	a4,a4,-1508 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002424:	01072783          	lw	a5,16(a4)
    80002428:	0017879b          	addiw	a5,a5,1
    8000242c:	00f72823          	sw	a5,16(a4)
    }
    80002430:	fa5ff06f          	j	800023d4 <_ZN14SleepingThread8go_sleepEP3TCBm+0x14c>
            head = tail = elem;
    80002434:	00007797          	auipc	a5,0x7
    80002438:	a0478793          	addi	a5,a5,-1532 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    8000243c:	00a7b423          	sd	a0,8(a5)
    80002440:	00a7b023          	sd	a0,0(a5)
    80002444:	fd9ff06f          	j	8000241c <_ZN14SleepingThread8go_sleepEP3TCBm+0x194>
    80002448:	00008067          	ret

000000008000244c <_ZN14SleepingThread4tickEv>:
    if(sleeping_threads.length==0){
    8000244c:	00007797          	auipc	a5,0x7
    80002450:	9fc7a783          	lw	a5,-1540(a5) # 80008e48 <_ZN14SleepingThread16sleeping_threadsE+0x10>
    80002454:	04079863          	bnez	a5,800024a4 <_ZN14SleepingThread4tickEv+0x58>
        time_elapsed=0;
    80002458:	00007797          	auipc	a5,0x7
    8000245c:	9e07bc23          	sd	zero,-1544(a5) # 80008e50 <_ZN14SleepingThread12time_elapsedE>
    while(sleeping_threads.length>0){
    80002460:	00007797          	auipc	a5,0x7
    80002464:	9e87a783          	lw	a5,-1560(a5) # 80008e48 <_ZN14SleepingThread16sleeping_threadsE+0x10>
    80002468:	0e078e63          	beqz	a5,80002564 <_ZN14SleepingThread4tickEv+0x118>
    }

    T *peekFirst()
    {
        if (!head) { return 0; }
    8000246c:	00007797          	auipc	a5,0x7
    80002470:	9cc7b783          	ld	a5,-1588(a5) # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002474:	00078463          	beqz	a5,8000247c <_ZN14SleepingThread4tickEv+0x30>
        return head->data;
    80002478:	0007b783          	ld	a5,0(a5)
        if(time_elapsed >= sleeping_threads.peekFirst()->time_to_sleep){
    8000247c:	0007b703          	ld	a4,0(a5)
    80002480:	00007797          	auipc	a5,0x7
    80002484:	9d07b783          	ld	a5,-1584(a5) # 80008e50 <_ZN14SleepingThread12time_elapsedE>
    80002488:	0ce7ee63          	bltu	a5,a4,80002564 <_ZN14SleepingThread4tickEv+0x118>
void SleepingThread::tick() {
    8000248c:	fe010113          	addi	sp,sp,-32
    80002490:	00113c23          	sd	ra,24(sp)
    80002494:	00813823          	sd	s0,16(sp)
    80002498:	00913423          	sd	s1,8(sp)
    8000249c:	02010413          	addi	s0,sp,32
    800024a0:	0680006f          	j	80002508 <_ZN14SleepingThread4tickEv+0xbc>
        time_elapsed=time_elapsed+1;
    800024a4:	00007717          	auipc	a4,0x7
    800024a8:	99470713          	addi	a4,a4,-1644 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    800024ac:	01873783          	ld	a5,24(a4)
    800024b0:	00178793          	addi	a5,a5,1
    800024b4:	00f73c23          	sd	a5,24(a4)
    800024b8:	fa9ff06f          	j	80002460 <_ZN14SleepingThread4tickEv+0x14>
        if (!head) { tail = 0; }
    800024bc:	00007797          	auipc	a5,0x7
    800024c0:	9807b223          	sd	zero,-1660(a5) # 80008e40 <_ZN14SleepingThread16sleeping_threadsE+0x8>
        T *ret = elem->data;
    800024c4:	00053483          	ld	s1,0(a0)
        void operator delete(void *p) {__mem_free(p);}
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	124080e7          	jalr	292(ra) # 800015ec <__mem_free>
    state getState() {return current_state;}
    800024d0:	0304a703          	lw	a4,48(s1)
            if(thr->getState() == TCB::SLEEPING){
    800024d4:	00500793          	li	a5,5
    800024d8:	06f70463          	beq	a4,a5,80002540 <_ZN14SleepingThread4tickEv+0xf4>
    while(sleeping_threads.length>0){
    800024dc:	00007797          	auipc	a5,0x7
    800024e0:	96c7a783          	lw	a5,-1684(a5) # 80008e48 <_ZN14SleepingThread16sleeping_threadsE+0x10>
    800024e4:	06078663          	beqz	a5,80002550 <_ZN14SleepingThread4tickEv+0x104>
        if (!head) { return 0; }
    800024e8:	00007797          	auipc	a5,0x7
    800024ec:	9507b783          	ld	a5,-1712(a5) # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    800024f0:	00078463          	beqz	a5,800024f8 <_ZN14SleepingThread4tickEv+0xac>
        return head->data;
    800024f4:	0007b783          	ld	a5,0(a5)
        if(time_elapsed >= sleeping_threads.peekFirst()->time_to_sleep){
    800024f8:	0007b703          	ld	a4,0(a5)
    800024fc:	00007797          	auipc	a5,0x7
    80002500:	9547b783          	ld	a5,-1708(a5) # 80008e50 <_ZN14SleepingThread12time_elapsedE>
    80002504:	04e7e663          	bltu	a5,a4,80002550 <_ZN14SleepingThread4tickEv+0x104>
        if (!head) { return 0; }
    80002508:	00007517          	auipc	a0,0x7
    8000250c:	93053503          	ld	a0,-1744(a0) # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    80002510:	02050463          	beqz	a0,80002538 <_ZN14SleepingThread4tickEv+0xec>
        length--;
    80002514:	00007797          	auipc	a5,0x7
    80002518:	92478793          	addi	a5,a5,-1756 # 80008e38 <_ZN14SleepingThread16sleeping_threadsE>
    8000251c:	0107a703          	lw	a4,16(a5)
    80002520:	fff7071b          	addiw	a4,a4,-1
    80002524:	00e7a823          	sw	a4,16(a5)
        head = head->next;
    80002528:	00853703          	ld	a4,8(a0)
    8000252c:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    80002530:	f8071ae3          	bnez	a4,800024c4 <_ZN14SleepingThread4tickEv+0x78>
    80002534:	f89ff06f          	j	800024bc <_ZN14SleepingThread4tickEv+0x70>
        if (!head) { return 0; }
    80002538:	00050493          	mv	s1,a0
    8000253c:	f95ff06f          	j	800024d0 <_ZN14SleepingThread4tickEv+0x84>
                thr->prepare();
    80002540:	00048513          	mv	a0,s1
    80002544:	00000097          	auipc	ra,0x0
    80002548:	954080e7          	jalr	-1708(ra) # 80001e98 <_ZN3TCB7prepareEv>
    8000254c:	f91ff06f          	j	800024dc <_ZN14SleepingThread4tickEv+0x90>
}
    80002550:	01813083          	ld	ra,24(sp)
    80002554:	01013403          	ld	s0,16(sp)
    80002558:	00813483          	ld	s1,8(sp)
    8000255c:	02010113          	addi	sp,sp,32
    80002560:	00008067          	ret
    80002564:	00008067          	ret

0000000080002568 <_GLOBAL__sub_I__ZN14SleepingThread16sleeping_threadsE>:
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00113423          	sd	ra,8(sp)
    80002570:	00813023          	sd	s0,0(sp)
    80002574:	01010413          	addi	s0,sp,16
    80002578:	000105b7          	lui	a1,0x10
    8000257c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002580:	00100513          	li	a0,1
    80002584:	00000097          	auipc	ra,0x0
    80002588:	cc0080e7          	jalr	-832(ra) # 80002244 <_Z41__static_initialization_and_destruction_0ii>
    8000258c:	00813083          	ld	ra,8(sp)
    80002590:	00013403          	ld	s0,0(sp)
    80002594:	01010113          	addi	sp,sp,16
    80002598:	00008067          	ret

000000008000259c <_Znwm>:
#include "../h/syscall_c.h"


using size_t = decltype(sizeof(0));

void *operator new(size_t n){
    8000259c:	ff010113          	addi	sp,sp,-16
    800025a0:	00113423          	sd	ra,8(sp)
    800025a4:	00813023          	sd	s0,0(sp)
    800025a8:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    800025ac:	fffff097          	auipc	ra,0xfffff
    800025b0:	bec080e7          	jalr	-1044(ra) # 80001198 <_Z9mem_allocm>
    //return __mem_alloc(n);
}
    800025b4:	00813083          	ld	ra,8(sp)
    800025b8:	00013403          	ld	s0,0(sp)
    800025bc:	01010113          	addi	sp,sp,16
    800025c0:	00008067          	ret

00000000800025c4 <_Znam>:

void *operator new[](size_t n){
    800025c4:	ff010113          	addi	sp,sp,-16
    800025c8:	00113423          	sd	ra,8(sp)
    800025cc:	00813023          	sd	s0,0(sp)
    800025d0:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    800025d4:	fffff097          	auipc	ra,0xfffff
    800025d8:	bc4080e7          	jalr	-1084(ra) # 80001198 <_Z9mem_allocm>
    //return __mem_alloc(n);
}
    800025dc:	00813083          	ld	ra,8(sp)
    800025e0:	00013403          	ld	s0,0(sp)
    800025e4:	01010113          	addi	sp,sp,16
    800025e8:	00008067          	ret

00000000800025ec <_ZdlPv>:

void operator delete(void *p) noexcept{
    800025ec:	ff010113          	addi	sp,sp,-16
    800025f0:	00113423          	sd	ra,8(sp)
    800025f4:	00813023          	sd	s0,0(sp)
    800025f8:	01010413          	addi	s0,sp,16
    mem_free(p);
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	be4080e7          	jalr	-1052(ra) # 800011e0 <_Z8mem_freePv>
    //__mem_free(p);
}
    80002604:	00813083          	ld	ra,8(sp)
    80002608:	00013403          	ld	s0,0(sp)
    8000260c:	01010113          	addi	sp,sp,16
    80002610:	00008067          	ret

0000000080002614 <_ZdaPv>:

void operator delete[](void *p) noexcept{
    80002614:	ff010113          	addi	sp,sp,-16
    80002618:	00113423          	sd	ra,8(sp)
    8000261c:	00813023          	sd	s0,0(sp)
    80002620:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002624:	fffff097          	auipc	ra,0xfffff
    80002628:	bbc080e7          	jalr	-1092(ra) # 800011e0 <_Z8mem_freePv>
    //__mem_free(p);
}
    8000262c:	00813083          	ld	ra,8(sp)
    80002630:	00013403          	ld	s0,0(sp)
    80002634:	01010113          	addi	sp,sp,16
    80002638:	00008067          	ret

000000008000263c <_ZN14PeriodicThread15periodicWrapperEPv>:
struct p_struct{
    time_t time;
    PeriodicThread *p_thr;
};

void PeriodicThread::periodicWrapper(void* par){
    8000263c:	fe010113          	addi	sp,sp,-32
    80002640:	00113c23          	sd	ra,24(sp)
    80002644:	00813823          	sd	s0,16(sp)
    80002648:	00913423          	sd	s1,8(sp)
    8000264c:	02010413          	addi	s0,sp,32
    80002650:	00050493          	mv	s1,a0
    p_struct *my_ps = (p_struct*)par;
    while (1){
        time_sleep(my_ps->time);
    80002654:	0004b503          	ld	a0,0(s1)
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	e94080e7          	jalr	-364(ra) # 800014ec <_Z10time_sleepm>
        my_ps->p_thr->periodicActivation();
    80002660:	0084b503          	ld	a0,8(s1)
    80002664:	00053783          	ld	a5,0(a0)
    80002668:	0187b783          	ld	a5,24(a5)
    8000266c:	000780e7          	jalr	a5
    while (1){
    80002670:	fe5ff06f          	j	80002654 <_ZN14PeriodicThread15periodicWrapperEPv+0x18>

0000000080002674 <_ZN14PeriodicThreadC1Em>:
    }
}

PeriodicThread::PeriodicThread(time_t period) :
    80002674:	fe010113          	addi	sp,sp,-32
    80002678:	00113c23          	sd	ra,24(sp)
    8000267c:	00813823          	sd	s0,16(sp)
    80002680:	00913423          	sd	s1,8(sp)
    80002684:	01213023          	sd	s2,0(sp)
    80002688:	02010413          	addi	s0,sp,32
    8000268c:	00050493          	mv	s1,a0
    80002690:	00058913          	mv	s2,a1
    Thread(PeriodicThread::periodicWrapper, (void*)(new (p_struct){period, this}))
    80002694:	01000513          	li	a0,16
    80002698:	00000097          	auipc	ra,0x0
    8000269c:	f04080e7          	jalr	-252(ra) # 8000259c <_Znwm>
    800026a0:	00050613          	mv	a2,a0
    800026a4:	01253023          	sd	s2,0(a0)
    800026a8:	00953423          	sd	s1,8(a0)
    800026ac:	00000597          	auipc	a1,0x0
    800026b0:	f9058593          	addi	a1,a1,-112 # 8000263c <_ZN14PeriodicThread15periodicWrapperEPv>
    800026b4:	00048513          	mv	a0,s1
    800026b8:	fffff097          	auipc	ra,0xfffff
    800026bc:	12c080e7          	jalr	300(ra) # 800017e4 <_ZN6ThreadC1EPFvPvES0_>
    800026c0:	00006797          	auipc	a5,0x6
    800026c4:	5b078793          	addi	a5,a5,1456 # 80008c70 <_ZTV14PeriodicThread+0x10>
    800026c8:	00f4b023          	sd	a5,0(s1)
    800026cc:	01813083          	ld	ra,24(sp)
    800026d0:	01013403          	ld	s0,16(sp)
    800026d4:	00813483          	ld	s1,8(sp)
    800026d8:	00013903          	ld	s2,0(sp)
    800026dc:	02010113          	addi	sp,sp,32
    800026e0:	00008067          	ret

00000000800026e4 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00813423          	sd	s0,8(sp)
    800026ec:	01010413          	addi	s0,sp,16
    800026f0:	00813403          	ld	s0,8(sp)
    800026f4:	01010113          	addi	sp,sp,16
    800026f8:	00008067          	ret

00000000800026fc <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800026fc:	ff010113          	addi	sp,sp,-16
    80002700:	00113423          	sd	ra,8(sp)
    80002704:	00813023          	sd	s0,0(sp)
    80002708:	01010413          	addi	s0,sp,16
    8000270c:	00006797          	auipc	a5,0x6
    80002710:	56478793          	addi	a5,a5,1380 # 80008c70 <_ZTV14PeriodicThread+0x10>
    80002714:	00f53023          	sd	a5,0(a0)
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	038080e7          	jalr	56(ra) # 80001750 <_ZN6ThreadD1Ev>
    80002720:	00813083          	ld	ra,8(sp)
    80002724:	00013403          	ld	s0,0(sp)
    80002728:	01010113          	addi	sp,sp,16
    8000272c:	00008067          	ret

0000000080002730 <_ZN14PeriodicThreadD0Ev>:
    80002730:	fe010113          	addi	sp,sp,-32
    80002734:	00113c23          	sd	ra,24(sp)
    80002738:	00813823          	sd	s0,16(sp)
    8000273c:	00913423          	sd	s1,8(sp)
    80002740:	02010413          	addi	s0,sp,32
    80002744:	00050493          	mv	s1,a0
    80002748:	00006797          	auipc	a5,0x6
    8000274c:	52878793          	addi	a5,a5,1320 # 80008c70 <_ZTV14PeriodicThread+0x10>
    80002750:	00f53023          	sd	a5,0(a0)
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	ffc080e7          	jalr	-4(ra) # 80001750 <_ZN6ThreadD1Ev>
    8000275c:	00048513          	mv	a0,s1
    80002760:	00000097          	auipc	ra,0x0
    80002764:	e8c080e7          	jalr	-372(ra) # 800025ec <_ZdlPv>
    80002768:	01813083          	ld	ra,24(sp)
    8000276c:	01013403          	ld	s0,16(sp)
    80002770:	00813483          	ld	s1,8(sp)
    80002774:	02010113          	addi	sp,sp,32
    80002778:	00008067          	ret

000000008000277c <_ZN13ConsoleBufferC1Ev>:
//
// Created by DjordjeS on 30.7.2022.
//
#include "../h/consolebuffer.hpp"

ConsoleBuffer::ConsoleBuffer(){
    8000277c:	fe010113          	addi	sp,sp,-32
    80002780:	00113c23          	sd	ra,24(sp)
    80002784:	00813823          	sd	s0,16(sp)
    80002788:	00913423          	sd	s1,8(sp)
    8000278c:	01213023          	sd	s2,0(sp)
    80002790:	02010413          	addi	s0,sp,32
    80002794:	00050493          	mv	s1,a0
    80002798:	3e052623          	sw	zero,1004(a0)
    8000279c:	3e052823          	sw	zero,1008(a0)
    800027a0:	3e052a23          	sw	zero,1012(a0)
    capacity = N+1;
    800027a4:	3e900793          	li	a5,1001
    800027a8:	3ef52c23          	sw	a5,1016(a0)
#include "list.hpp"

class _sem{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    800027ac:	02000513          	li	a0,32
    800027b0:	fffff097          	auipc	ra,0xfffff
    800027b4:	e14080e7          	jalr	-492(ra) # 800015c4 <__mem_alloc>
    //-------------------------------------------------------------

    int value () const { return val; }

private:
    _sem(sem_t *handle, unsigned init=1) : val(init){
    800027b8:	00100913          	li	s2,1
    800027bc:	01252023          	sw	s2,0(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------
    List() : head(0), tail(0), length(0) {}
    800027c0:	00053423          	sd	zero,8(a0)
    800027c4:	00053823          	sd	zero,16(a0)
    800027c8:	00052c23          	sw	zero,24(a0)
        *handle = this;
    800027cc:	40a4b023          	sd	a0,1024(s1)
        active=true;
    800027d0:	01250223          	sb	s2,4(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    800027d4:	02000513          	li	a0,32
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	dec080e7          	jalr	-532(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    800027e0:	01252023          	sw	s2,0(a0)
    800027e4:	00053423          	sd	zero,8(a0)
    800027e8:	00053823          	sd	zero,16(a0)
    800027ec:	00052c23          	sw	zero,24(a0)
        *handle = this;
    800027f0:	40a4b423          	sd	a0,1032(s1)
        active=true;
    800027f4:	01250223          	sb	s2,4(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    800027f8:	02000513          	li	a0,32
    800027fc:	fffff097          	auipc	ra,0xfffff
    80002800:	dc8080e7          	jalr	-568(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    80002804:	00052023          	sw	zero,0(a0)
    80002808:	00053423          	sd	zero,8(a0)
    8000280c:	00053823          	sd	zero,16(a0)
    80002810:	00052c23          	sw	zero,24(a0)
        *handle = this;
    80002814:	40a4b823          	sd	a0,1040(s1)
        active=true;
    80002818:	01250223          	sb	s2,4(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    8000281c:	02000513          	li	a0,32
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	da4080e7          	jalr	-604(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    80002828:	3e800793          	li	a5,1000
    8000282c:	00f52023          	sw	a5,0(a0)
    80002830:	00053423          	sd	zero,8(a0)
    80002834:	00053823          	sd	zero,16(a0)
    80002838:	00052c23          	sw	zero,24(a0)
        *handle = this;
    8000283c:	40a4bc23          	sd	a0,1048(s1)
        active=true;
    80002840:	01250223          	sb	s2,4(a0)
    new _sem(&mutexP, 1);
    new _sem(&mutexC, 1);
    new _sem(&empty, 0);
    new _sem(&full, N);
}
    80002844:	01813083          	ld	ra,24(sp)
    80002848:	01013403          	ld	s0,16(sp)
    8000284c:	00813483          	ld	s1,8(sp)
    80002850:	00013903          	ld	s2,0(sp)
    80002854:	02010113          	addi	sp,sp,32
    80002858:	00008067          	ret

000000008000285c <_ZN13ConsoleBufferC1Ei>:

ConsoleBuffer::ConsoleBuffer(int cap){
    8000285c:	fe010113          	addi	sp,sp,-32
    80002860:	00113c23          	sd	ra,24(sp)
    80002864:	00813823          	sd	s0,16(sp)
    80002868:	00913423          	sd	s1,8(sp)
    8000286c:	01213023          	sd	s2,0(sp)
    80002870:	02010413          	addi	s0,sp,32
    80002874:	00050493          	mv	s1,a0
    80002878:	3e052623          	sw	zero,1004(a0)
    8000287c:	3e052823          	sw	zero,1008(a0)
    80002880:	3e052a23          	sw	zero,1012(a0)
    if(cap > N || cap<=0){
    80002884:	fff5871b          	addiw	a4,a1,-1
    80002888:	3e700793          	li	a5,999
    8000288c:	0ce7f063          	bgeu	a5,a4,8000294c <_ZN13ConsoleBufferC1Ei+0xf0>
        capacity=N+1;
    80002890:	3e900793          	li	a5,1001
    80002894:	3ef52c23          	sw	a5,1016(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    80002898:	02000513          	li	a0,32
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	d28080e7          	jalr	-728(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    800028a4:	3e800793          	li	a5,1000
    800028a8:	00f52023          	sw	a5,0(a0)
    800028ac:	00053423          	sd	zero,8(a0)
    800028b0:	00053823          	sd	zero,16(a0)
    800028b4:	00052c23          	sw	zero,24(a0)
        *handle = this;
    800028b8:	40a4bc23          	sd	a0,1048(s1)
        active=true;
    800028bc:	00100793          	li	a5,1
    800028c0:	00f50223          	sb	a5,4(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    800028c4:	02000513          	li	a0,32
    800028c8:	fffff097          	auipc	ra,0xfffff
    800028cc:	cfc080e7          	jalr	-772(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    800028d0:	00100913          	li	s2,1
    800028d4:	01252023          	sw	s2,0(a0)
    800028d8:	00053423          	sd	zero,8(a0)
    800028dc:	00053823          	sd	zero,16(a0)
    800028e0:	00052c23          	sw	zero,24(a0)
        *handle = this;
    800028e4:	40a4b023          	sd	a0,1024(s1)
        active=true;
    800028e8:	01250223          	sb	s2,4(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    800028ec:	02000513          	li	a0,32
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	cd4080e7          	jalr	-812(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    800028f8:	01252023          	sw	s2,0(a0)
    800028fc:	00053423          	sd	zero,8(a0)
    80002900:	00053823          	sd	zero,16(a0)
    80002904:	00052c23          	sw	zero,24(a0)
        *handle = this;
    80002908:	40a4b423          	sd	a0,1032(s1)
        active=true;
    8000290c:	01250223          	sb	s2,4(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    80002910:	02000513          	li	a0,32
    80002914:	fffff097          	auipc	ra,0xfffff
    80002918:	cb0080e7          	jalr	-848(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    8000291c:	00052023          	sw	zero,0(a0)
    80002920:	00053423          	sd	zero,8(a0)
    80002924:	00053823          	sd	zero,16(a0)
    80002928:	00052c23          	sw	zero,24(a0)
        *handle = this;
    8000292c:	40a4b823          	sd	a0,1040(s1)
        active=true;
    80002930:	01250223          	sb	s2,4(a0)
        new _sem(&full, cap);
    }
    new _sem(&mutexP, 1);
    new _sem(&mutexC, 1);
    new _sem(&empty, 0);
}
    80002934:	01813083          	ld	ra,24(sp)
    80002938:	01013403          	ld	s0,16(sp)
    8000293c:	00813483          	ld	s1,8(sp)
    80002940:	00013903          	ld	s2,0(sp)
    80002944:	02010113          	addi	sp,sp,32
    80002948:	00008067          	ret
    8000294c:	00058913          	mv	s2,a1
        capacity=cap+1;
    80002950:	0015879b          	addiw	a5,a1,1
    80002954:	3ef52c23          	sw	a5,1016(a0)
    void *operator new(size_t n){return __mem_alloc(n);}
    80002958:	02000513          	li	a0,32
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	c68080e7          	jalr	-920(ra) # 800015c4 <__mem_alloc>
    _sem(sem_t *handle, unsigned init=1) : val(init){
    80002964:	01252023          	sw	s2,0(a0)
    80002968:	00053423          	sd	zero,8(a0)
    8000296c:	00053823          	sd	zero,16(a0)
    80002970:	00052c23          	sw	zero,24(a0)
        *handle = this;
    80002974:	40a4bc23          	sd	a0,1048(s1)
        active=true;
    80002978:	00100793          	li	a5,1
    8000297c:	00f50223          	sb	a5,4(a0)
    }
    80002980:	f45ff06f          	j	800028c4 <_ZN13ConsoleBufferC1Ei+0x68>

0000000080002984 <_ZN13ConsoleBufferD1Ev>:

ConsoleBuffer::~ConsoleBuffer() {
    80002984:	fe010113          	addi	sp,sp,-32
    80002988:	00113c23          	sd	ra,24(sp)
    8000298c:	00813823          	sd	s0,16(sp)
    80002990:	00913423          	sd	s1,8(sp)
    80002994:	01213023          	sd	s2,0(sp)
    80002998:	02010413          	addi	s0,sp,32
    8000299c:	00050493          	mv	s1,a0
    delete mutexP;
    800029a0:	40053903          	ld	s2,1024(a0)
    800029a4:	00090e63          	beqz	s2,800029c0 <_ZN13ConsoleBufferD1Ev+0x3c>
    800029a8:	00090513          	mv	a0,s2
    800029ac:	00001097          	auipc	ra,0x1
    800029b0:	ac0080e7          	jalr	-1344(ra) # 8000346c <_ZN4_semD1Ev>
    void operator delete(void *p) {__mem_free(p);}
    800029b4:	00090513          	mv	a0,s2
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	c34080e7          	jalr	-972(ra) # 800015ec <__mem_free>
    delete mutexC;
    800029c0:	4084b903          	ld	s2,1032(s1)
    800029c4:	00090e63          	beqz	s2,800029e0 <_ZN13ConsoleBufferD1Ev+0x5c>
    800029c8:	00090513          	mv	a0,s2
    800029cc:	00001097          	auipc	ra,0x1
    800029d0:	aa0080e7          	jalr	-1376(ra) # 8000346c <_ZN4_semD1Ev>
    800029d4:	00090513          	mv	a0,s2
    800029d8:	fffff097          	auipc	ra,0xfffff
    800029dc:	c14080e7          	jalr	-1004(ra) # 800015ec <__mem_free>
    delete empty;
    800029e0:	4104b903          	ld	s2,1040(s1)
    800029e4:	00090e63          	beqz	s2,80002a00 <_ZN13ConsoleBufferD1Ev+0x7c>
    800029e8:	00090513          	mv	a0,s2
    800029ec:	00001097          	auipc	ra,0x1
    800029f0:	a80080e7          	jalr	-1408(ra) # 8000346c <_ZN4_semD1Ev>
    800029f4:	00090513          	mv	a0,s2
    800029f8:	fffff097          	auipc	ra,0xfffff
    800029fc:	bf4080e7          	jalr	-1036(ra) # 800015ec <__mem_free>
    delete full;
    80002a00:	4184b483          	ld	s1,1048(s1)
    80002a04:	00048e63          	beqz	s1,80002a20 <_ZN13ConsoleBufferD1Ev+0x9c>
    80002a08:	00048513          	mv	a0,s1
    80002a0c:	00001097          	auipc	ra,0x1
    80002a10:	a60080e7          	jalr	-1440(ra) # 8000346c <_ZN4_semD1Ev>
    80002a14:	00048513          	mv	a0,s1
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	bd4080e7          	jalr	-1068(ra) # 800015ec <__mem_free>
}
    80002a20:	01813083          	ld	ra,24(sp)
    80002a24:	01013403          	ld	s0,16(sp)
    80002a28:	00813483          	ld	s1,8(sp)
    80002a2c:	00013903          	ld	s2,0(sp)
    80002a30:	02010113          	addi	sp,sp,32
    80002a34:	00008067          	ret

0000000080002a38 <_ZN13ConsoleBuffer3putEc>:

void ConsoleBuffer::put(char new_char) {
    80002a38:	fe010113          	addi	sp,sp,-32
    80002a3c:	00113c23          	sd	ra,24(sp)
    80002a40:	00813823          	sd	s0,16(sp)
    80002a44:	00913423          	sd	s1,8(sp)
    80002a48:	01213023          	sd	s2,0(sp)
    80002a4c:	02010413          	addi	s0,sp,32
    80002a50:	00050493          	mv	s1,a0
    80002a54:	00058913          	mv	s2,a1
    sem_wait(full);
    80002a58:	41853503          	ld	a0,1048(a0)
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	a00080e7          	jalr	-1536(ra) # 8000145c <_Z8sem_waitP4_sem>
    sem_wait(mutexP);
    80002a64:	4004b503          	ld	a0,1024(s1)
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	9f4080e7          	jalr	-1548(ra) # 8000145c <_Z8sem_waitP4_sem>
    buffer[rear] = new_char;
    80002a70:	3f04a783          	lw	a5,1008(s1)
    80002a74:	00f48733          	add	a4,s1,a5
    80002a78:	01270023          	sb	s2,0(a4)
    rear = (rear + 1) % capacity;
    80002a7c:	0017879b          	addiw	a5,a5,1
    80002a80:	3f84a703          	lw	a4,1016(s1)
    80002a84:	02e7e7bb          	remw	a5,a5,a4
    80002a88:	3ef4a823          	sw	a5,1008(s1)
    size=size+1;
    80002a8c:	3f44a783          	lw	a5,1012(s1)
    80002a90:	0017879b          	addiw	a5,a5,1
    80002a94:	3ef4aa23          	sw	a5,1012(s1)
    sem_signal(mutexP);
    80002a98:	4004b503          	ld	a0,1024(s1)
    80002a9c:	fffff097          	auipc	ra,0xfffff
    80002aa0:	a08080e7          	jalr	-1528(ra) # 800014a4 <_Z10sem_signalP4_sem>
    sem_signal(empty);
    80002aa4:	4104b503          	ld	a0,1040(s1)
    80002aa8:	fffff097          	auipc	ra,0xfffff
    80002aac:	9fc080e7          	jalr	-1540(ra) # 800014a4 <_Z10sem_signalP4_sem>
}
    80002ab0:	01813083          	ld	ra,24(sp)
    80002ab4:	01013403          	ld	s0,16(sp)
    80002ab8:	00813483          	ld	s1,8(sp)
    80002abc:	00013903          	ld	s2,0(sp)
    80002ac0:	02010113          	addi	sp,sp,32
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN13ConsoleBuffer4takeEv>:

char ConsoleBuffer::take() {
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	01213023          	sd	s2,0(sp)
    80002adc:	02010413          	addi	s0,sp,32
    80002ae0:	00050493          	mv	s1,a0
    sem_wait(empty);
    80002ae4:	41053503          	ld	a0,1040(a0)
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	974080e7          	jalr	-1676(ra) # 8000145c <_Z8sem_waitP4_sem>
    sem_wait(mutexC);
    80002af0:	4084b503          	ld	a0,1032(s1)
    80002af4:	fffff097          	auipc	ra,0xfffff
    80002af8:	968080e7          	jalr	-1688(ra) # 8000145c <_Z8sem_waitP4_sem>
    char c=buffer[front];
    80002afc:	3ec4a783          	lw	a5,1004(s1)
    80002b00:	00f48733          	add	a4,s1,a5
    80002b04:	00074903          	lbu	s2,0(a4)
    front = (front + 1) % capacity;
    80002b08:	0017879b          	addiw	a5,a5,1
    80002b0c:	3f84a703          	lw	a4,1016(s1)
    80002b10:	02e7e7bb          	remw	a5,a5,a4
    80002b14:	3ef4a623          	sw	a5,1004(s1)
    size=size-1;
    80002b18:	3f44a783          	lw	a5,1012(s1)
    80002b1c:	fff7879b          	addiw	a5,a5,-1
    80002b20:	3ef4aa23          	sw	a5,1012(s1)
    sem_signal(mutexC);
    80002b24:	4084b503          	ld	a0,1032(s1)
    80002b28:	fffff097          	auipc	ra,0xfffff
    80002b2c:	97c080e7          	jalr	-1668(ra) # 800014a4 <_Z10sem_signalP4_sem>
    sem_signal(full);
    80002b30:	4184b503          	ld	a0,1048(s1)
    80002b34:	fffff097          	auipc	ra,0xfffff
    80002b38:	970080e7          	jalr	-1680(ra) # 800014a4 <_Z10sem_signalP4_sem>
    return c;
}
    80002b3c:	00090513          	mv	a0,s2
    80002b40:	01813083          	ld	ra,24(sp)
    80002b44:	01013403          	ld	s0,16(sp)
    80002b48:	00813483          	ld	s1,8(sp)
    80002b4c:	00013903          	ld	s2,0(sp)
    80002b50:	02010113          	addi	sp,sp,32
    80002b54:	00008067          	ret

0000000080002b58 <_ZN13ConsoleBuffer10put_kernelEc>:

void ConsoleBuffer::put_kernel(char new_char) {
    80002b58:	fe010113          	addi	sp,sp,-32
    80002b5c:	00113c23          	sd	ra,24(sp)
    80002b60:	00813823          	sd	s0,16(sp)
    80002b64:	00913423          	sd	s1,8(sp)
    80002b68:	01213023          	sd	s2,0(sp)
    80002b6c:	02010413          	addi	s0,sp,32
    80002b70:	00050493          	mv	s1,a0
    80002b74:	00058913          	mv	s2,a1
    full->wait();
    80002b78:	41853503          	ld	a0,1048(a0)
    80002b7c:	00000097          	auipc	ra,0x0
    80002b80:	6dc080e7          	jalr	1756(ra) # 80003258 <_ZN4_sem4waitEv>
    mutexP->wait();
    80002b84:	4004b503          	ld	a0,1024(s1)
    80002b88:	00000097          	auipc	ra,0x0
    80002b8c:	6d0080e7          	jalr	1744(ra) # 80003258 <_ZN4_sem4waitEv>
    buffer[rear] = new_char;
    80002b90:	3f04a783          	lw	a5,1008(s1)
    80002b94:	00f48733          	add	a4,s1,a5
    80002b98:	01270023          	sb	s2,0(a4)
    rear = (rear + 1) % capacity;
    80002b9c:	0017879b          	addiw	a5,a5,1
    80002ba0:	3f84a703          	lw	a4,1016(s1)
    80002ba4:	02e7e7bb          	remw	a5,a5,a4
    80002ba8:	3ef4a823          	sw	a5,1008(s1)
    size=size+1;
    80002bac:	3f44a783          	lw	a5,1012(s1)
    80002bb0:	0017879b          	addiw	a5,a5,1
    80002bb4:	3ef4aa23          	sw	a5,1012(s1)
    mutexP->signal();
    80002bb8:	4004b503          	ld	a0,1024(s1)
    80002bbc:	00000097          	auipc	ra,0x0
    80002bc0:	768080e7          	jalr	1896(ra) # 80003324 <_ZN4_sem6signalEv>
    empty->signal();
    80002bc4:	4104b503          	ld	a0,1040(s1)
    80002bc8:	00000097          	auipc	ra,0x0
    80002bcc:	75c080e7          	jalr	1884(ra) # 80003324 <_ZN4_sem6signalEv>
}
    80002bd0:	01813083          	ld	ra,24(sp)
    80002bd4:	01013403          	ld	s0,16(sp)
    80002bd8:	00813483          	ld	s1,8(sp)
    80002bdc:	00013903          	ld	s2,0(sp)
    80002be0:	02010113          	addi	sp,sp,32
    80002be4:	00008067          	ret

0000000080002be8 <_ZN13ConsoleBuffer11take_kernelEv>:

char ConsoleBuffer::take_kernel() {
    80002be8:	fe010113          	addi	sp,sp,-32
    80002bec:	00113c23          	sd	ra,24(sp)
    80002bf0:	00813823          	sd	s0,16(sp)
    80002bf4:	00913423          	sd	s1,8(sp)
    80002bf8:	01213023          	sd	s2,0(sp)
    80002bfc:	02010413          	addi	s0,sp,32
    80002c00:	00050493          	mv	s1,a0
    empty->wait();
    80002c04:	41053503          	ld	a0,1040(a0)
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	650080e7          	jalr	1616(ra) # 80003258 <_ZN4_sem4waitEv>
    mutexC->wait();
    80002c10:	4084b503          	ld	a0,1032(s1)
    80002c14:	00000097          	auipc	ra,0x0
    80002c18:	644080e7          	jalr	1604(ra) # 80003258 <_ZN4_sem4waitEv>
    char c=buffer[front];
    80002c1c:	3ec4a783          	lw	a5,1004(s1)
    80002c20:	00f48733          	add	a4,s1,a5
    80002c24:	00074903          	lbu	s2,0(a4)
    front = (front + 1) % capacity;
    80002c28:	0017879b          	addiw	a5,a5,1
    80002c2c:	3f84a703          	lw	a4,1016(s1)
    80002c30:	02e7e7bb          	remw	a5,a5,a4
    80002c34:	3ef4a623          	sw	a5,1004(s1)
    size=size-1;
    80002c38:	3f44a783          	lw	a5,1012(s1)
    80002c3c:	fff7879b          	addiw	a5,a5,-1
    80002c40:	3ef4aa23          	sw	a5,1012(s1)
    mutexC->signal();
    80002c44:	4084b503          	ld	a0,1032(s1)
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	6dc080e7          	jalr	1756(ra) # 80003324 <_ZN4_sem6signalEv>
    full->signal();
    80002c50:	4184b503          	ld	a0,1048(s1)
    80002c54:	00000097          	auipc	ra,0x0
    80002c58:	6d0080e7          	jalr	1744(ra) # 80003324 <_ZN4_sem6signalEv>
    return c;
}
    80002c5c:	00090513          	mv	a0,s2
    80002c60:	01813083          	ld	ra,24(sp)
    80002c64:	01013403          	ld	s0,16(sp)
    80002c68:	00813483          	ld	s1,8(sp)
    80002c6c:	00013903          	ld	s2,0(sp)
    80002c70:	02010113          	addi	sp,sp,32
    80002c74:	00008067          	ret

0000000080002c78 <_ZNK13ConsoleBuffer7getSizeEv>:

int ConsoleBuffer::getSize() const {
    80002c78:	ff010113          	addi	sp,sp,-16
    80002c7c:	00813423          	sd	s0,8(sp)
    80002c80:	01010413          	addi	s0,sp,16
    return size;
}
    80002c84:	3f452503          	lw	a0,1012(a0)
    80002c88:	00813403          	ld	s0,8(sp)
    80002c8c:	01010113          	addi	sp,sp,16
    80002c90:	00008067          	ret

0000000080002c94 <_ZN5Riscv10popSppSpieEv>:
using Body = void(*)(void*);

ConsoleBuffer* Riscv::buffer_input = nullptr;
ConsoleBuffer* Riscv::buffer_output = nullptr;

void Riscv::popSppSpie(){
    80002c94:	ff010113          	addi	sp,sp,-16
    80002c98:	00813423          	sd	s0,8(sp)
    80002c9c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002ca0:	10000793          	li	a5,256
    80002ca4:	1007b073          	csrc	sstatus,a5
    mc_sstatus(SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80002ca8:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret"); //return after handling a trap - S(supervisor)
    80002cac:	10200073          	sret
}
    80002cb0:	00813403          	ld	s0,8(sp)
    80002cb4:	01010113          	addi	sp,sp,16
    80002cb8:	00008067          	ret

0000000080002cbc <_ZN5Riscv12sysfunctionsEPm>:

uint64 Riscv::sysfunctions(uint64 *params){

    switch(params[0]){
    80002cbc:	00053783          	ld	a5,0(a0)
    80002cc0:	06900713          	li	a4,105
    80002cc4:	3cf76063          	bltu	a4,a5,80003084 <_ZN5Riscv12sysfunctionsEPm+0x3c8>
uint64 Riscv::sysfunctions(uint64 *params){
    80002cc8:	fe010113          	addi	sp,sp,-32
    80002ccc:	00113c23          	sd	ra,24(sp)
    80002cd0:	00813823          	sd	s0,16(sp)
    80002cd4:	00913423          	sd	s1,8(sp)
    80002cd8:	01213023          	sd	s2,0(sp)
    80002cdc:	02010413          	addi	s0,sp,32
    80002ce0:	00050493          	mv	s1,a0
    80002ce4:	00279793          	slli	a5,a5,0x2
    80002ce8:	00004717          	auipc	a4,0x4
    80002cec:	35870713          	addi	a4,a4,856 # 80007040 <CONSOLE_STATUS+0x30>
    80002cf0:	00e787b3          	add	a5,a5,a4
    80002cf4:	0007a783          	lw	a5,0(a5)
    80002cf8:	00e787b3          	add	a5,a5,a4
    80002cfc:	00078067          	jr	a5
        //----------[MEMORY]-------------------------------------------------------------
        case 0x01: //mem_alloc
            return (uint64)__mem_alloc(MEM_BLOCK_SIZE * params[1]);
    80002d00:	00853503          	ld	a0,8(a0)
    80002d04:	00651513          	slli	a0,a0,0x6
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	8bc080e7          	jalr	-1860(ra) # 800015c4 <__mem_alloc>
    80002d10:	3240006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            break;

        case 0x02: //mem_free
            return (uint64)__mem_free((void*)params[1]);
    80002d14:	00853503          	ld	a0,8(a0)
    80002d18:	fffff097          	auipc	ra,0xfffff
    80002d1c:	8d4080e7          	jalr	-1836(ra) # 800015ec <__mem_free>
    80002d20:	3140006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>

// Thread Control Block
class TCB{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    80002d24:	05000513          	li	a0,80
    80002d28:	fffff097          	auipc	ra,0xfffff
    80002d2c:	89c080e7          	jalr	-1892(ra) # 800015c4 <__mem_alloc>
    80002d30:	00050913          	mv	s2,a0
//          size_t my_size=size/MEM_BLOCK_SIZE;
//          if(size % MEM_BLOCK_SIZE > 0){
//              my_size++;
//          }
//          uint64* stack=(uint64*)__mem_alloc((uint64)MEM_BLOCK_SIZE * my_size);
            TCB* t = new TCB((thread_t *) params[1], (Body) params[2], (void *) params[3], (uint64*)params[4]);
    80002d34:	0084b603          	ld	a2,8(s1)
    80002d38:	0104b703          	ld	a4,16(s1)
    80002d3c:	0184b583          	ld	a1,24(s1)
    80002d40:	0204b783          	ld	a5,32(s1)
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
                    }),
            arg(arg),
            timeSlice(DEFAULT_TIME_SLICE),
            privileged(privileged)
    80002d44:	00e53423          	sd	a4,8(a0)
            stack(body != nullptr ? stack_f : nullptr),
    80002d48:	06070663          	beqz	a4,80002db4 <_ZN5Riscv12sysfunctionsEPm+0xf8>
    80002d4c:	00078693          	mv	a3,a5
            privileged(privileged)
    80002d50:	00d93823          	sd	a3,16(s2)
    80002d54:	00006517          	auipc	a0,0x6
    80002d58:	fdc53503          	ld	a0,-36(a0) # 80008d30 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002d5c:	00a93c23          	sd	a0,24(s2)
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    80002d60:	04068e63          	beqz	a3,80002dbc <_ZN5Riscv12sysfunctionsEPm+0x100>
    80002d64:	000086b7          	lui	a3,0x8
    80002d68:	00d787b3          	add	a5,a5,a3
            privileged(privileged)
    80002d6c:	02f93023          	sd	a5,32(s2)
    80002d70:	02b93423          	sd	a1,40(s2)
    80002d74:	00200793          	li	a5,2
    80002d78:	02f93c23          	sd	a5,56(s2)
    80002d7c:	04090023          	sb	zero,64(s2)
    {
        *handle=this;
    80002d80:	01263023          	sd	s2,0(a2)
        if(body==nullptr){
    80002d84:	04070063          	beqz	a4,80002dc4 <_ZN5Riscv12sysfunctionsEPm+0x108>
            current_state=RUNNING;
        }
        else{
            current_state=CREATED;
    80002d88:	02092823          	sw	zero,48(s2)
        }
        my_id=++all_threads_id;
    80002d8c:	00006717          	auipc	a4,0x6
    80002d90:	fcc73703          	ld	a4,-52(a4) # 80008d58 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002d94:	00073783          	ld	a5,0(a4)
    80002d98:	00178793          	addi	a5,a5,1
    80002d9c:	00f73023          	sd	a5,0(a4)
    80002da0:	04f93423          	sd	a5,72(s2)
class List
{
protected:
    struct Elem{
        //---[NEW i DELETE]--------------------------------------------
        void *operator new(size_t n){return __mem_alloc(n);}
    80002da4:	01000513          	li	a0,16
    80002da8:	fffff097          	auipc	ra,0xfffff
    80002dac:	81c080e7          	jalr	-2020(ra) # 800015c4 <__mem_alloc>
    80002db0:	01c0006f          	j	80002dcc <_ZN5Riscv12sysfunctionsEPm+0x110>
            stack(body != nullptr ? stack_f : nullptr),
    80002db4:	00000693          	li	a3,0
    80002db8:	f99ff06f          	j	80002d50 <_ZN5Riscv12sysfunctionsEPm+0x94>
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    80002dbc:	00000793          	li	a5,0
    80002dc0:	fadff06f          	j	80002d6c <_ZN5Riscv12sysfunctionsEPm+0xb0>
            current_state=RUNNING;
    80002dc4:	02f92823          	sw	a5,48(s2)
    80002dc8:	fc5ff06f          	j	80002d8c <_ZN5Riscv12sysfunctionsEPm+0xd0>
        //-------------------------------------------------------------

        T *data;
        Elem *next;

        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002dcc:	01253023          	sd	s2,0(a0)
    80002dd0:	00053423          	sd	zero,8(a0)
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
        if (tail)
    80002dd4:	00006797          	auipc	a5,0x6
    80002dd8:	fac7b783          	ld	a5,-84(a5) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002ddc:	0087b783          	ld	a5,8(a5)
    80002de0:	04078263          	beqz	a5,80002e24 <_ZN5Riscv12sysfunctionsEPm+0x168>
        {
            tail->next = elem;
    80002de4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002de8:	00006797          	auipc	a5,0x6
    80002dec:	f987b783          	ld	a5,-104(a5) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002df0:	00a7b423          	sd	a0,8(a5)
        } else
        {
            head = tail = elem;
        }
        length++;
    80002df4:	00006717          	auipc	a4,0x6
    80002df8:	f8c73703          	ld	a4,-116(a4) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002dfc:	01072783          	lw	a5,16(a4)
    80002e00:	0017879b          	addiw	a5,a5,1
    80002e04:	00f72823          	sw	a5,16(a4)
        all_threads.addLast(this);

        time_to_sleep=-1;
    80002e08:	fff00793          	li	a5,-1
    80002e0c:	00f93023          	sd	a5,0(s2)
            t->prepare();
    80002e10:	00090513          	mv	a0,s2
    80002e14:	fffff097          	auipc	ra,0xfffff
    80002e18:	084080e7          	jalr	132(ra) # 80001e98 <_ZN3TCB7prepareEv>
            return 0;
    80002e1c:	00000513          	li	a0,0
    80002e20:	2140006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            head = tail = elem;
    80002e24:	00006797          	auipc	a5,0x6
    80002e28:	f5c7b783          	ld	a5,-164(a5) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002e2c:	00a7b423          	sd	a0,8(a5)
    80002e30:	00a7b023          	sd	a0,0(a5)
    80002e34:	fc1ff06f          	j	80002df4 <_ZN5Riscv12sysfunctionsEPm+0x138>
        }
        break;

        case 0x12: //thread_exit
            return TCB::exit();
    80002e38:	fffff097          	auipc	ra,0xfffff
    80002e3c:	090080e7          	jalr	144(ra) # 80001ec8 <_ZN3TCB4exitEv>
    80002e40:	1f40006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            break;

        case 0x13: //thread_dispatch
        {
            TCB::timeSliceCounter = 0;
    80002e44:	00006797          	auipc	a5,0x6
    80002e48:	f0c7b783          	ld	a5,-244(a5) # 80008d50 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002e4c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002e50:	fffff097          	auipc	ra,0xfffff
    80002e54:	f90080e7          	jalr	-112(ra) # 80001de0 <_ZN3TCB8dispatchEv>
            return 0;
    80002e58:	00000513          	li	a0,0
    80002e5c:	1d80006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
    void *operator new(size_t n){return __mem_alloc(n);}
    80002e60:	05000513          	li	a0,80
    80002e64:	ffffe097          	auipc	ra,0xffffe
    80002e68:	760080e7          	jalr	1888(ra) # 800015c4 <__mem_alloc>
    80002e6c:	00050913          	mv	s2,a0
        }
        break;

        case 0x14: //thread_make za Thread C++ API
        {
            new TCB((thread_t *) params[1], (Body) params[2], (void *) params[3], (uint64*)params[4]);
    80002e70:	0084b603          	ld	a2,8(s1)
    80002e74:	0104b703          	ld	a4,16(s1)
    80002e78:	0184b583          	ld	a1,24(s1)
    80002e7c:	0204b783          	ld	a5,32(s1)
            privileged(privileged)
    80002e80:	00e53423          	sd	a4,8(a0)
            stack(body != nullptr ? stack_f : nullptr),
    80002e84:	06070663          	beqz	a4,80002ef0 <_ZN5Riscv12sysfunctionsEPm+0x234>
    80002e88:	00078693          	mv	a3,a5
            privileged(privileged)
    80002e8c:	00d93823          	sd	a3,16(s2)
    80002e90:	00006517          	auipc	a0,0x6
    80002e94:	ea053503          	ld	a0,-352(a0) # 80008d30 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002e98:	00a93c23          	sd	a0,24(s2)
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    80002e9c:	04068e63          	beqz	a3,80002ef8 <_ZN5Riscv12sysfunctionsEPm+0x23c>
    80002ea0:	000086b7          	lui	a3,0x8
    80002ea4:	00d787b3          	add	a5,a5,a3
            privileged(privileged)
    80002ea8:	02f93023          	sd	a5,32(s2)
    80002eac:	02b93423          	sd	a1,40(s2)
    80002eb0:	00200793          	li	a5,2
    80002eb4:	02f93c23          	sd	a5,56(s2)
    80002eb8:	04090023          	sb	zero,64(s2)
        *handle=this;
    80002ebc:	01263023          	sd	s2,0(a2)
        if(body==nullptr){
    80002ec0:	04070063          	beqz	a4,80002f00 <_ZN5Riscv12sysfunctionsEPm+0x244>
            current_state=CREATED;
    80002ec4:	02092823          	sw	zero,48(s2)
        my_id=++all_threads_id;
    80002ec8:	00006717          	auipc	a4,0x6
    80002ecc:	e9073703          	ld	a4,-368(a4) # 80008d58 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002ed0:	00073783          	ld	a5,0(a4)
    80002ed4:	00178793          	addi	a5,a5,1
    80002ed8:	00f73023          	sd	a5,0(a4)
    80002edc:	04f93423          	sd	a5,72(s2)
        void *operator new(size_t n){return __mem_alloc(n);}
    80002ee0:	01000513          	li	a0,16
    80002ee4:	ffffe097          	auipc	ra,0xffffe
    80002ee8:	6e0080e7          	jalr	1760(ra) # 800015c4 <__mem_alloc>
    80002eec:	01c0006f          	j	80002f08 <_ZN5Riscv12sysfunctionsEPm+0x24c>
            stack(body != nullptr ? stack_f : nullptr),
    80002ef0:	00000693          	li	a3,0
    80002ef4:	f99ff06f          	j	80002e8c <_ZN5Riscv12sysfunctionsEPm+0x1d0>
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
    80002ef8:	00000793          	li	a5,0
    80002efc:	fadff06f          	j	80002ea8 <_ZN5Riscv12sysfunctionsEPm+0x1ec>
            current_state=RUNNING;
    80002f00:	02f92823          	sw	a5,48(s2)
    80002f04:	fc5ff06f          	j	80002ec8 <_ZN5Riscv12sysfunctionsEPm+0x20c>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002f08:	01253023          	sd	s2,0(a0)
    80002f0c:	00053423          	sd	zero,8(a0)
        if (tail)
    80002f10:	00006797          	auipc	a5,0x6
    80002f14:	e707b783          	ld	a5,-400(a5) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f18:	0087b783          	ld	a5,8(a5)
    80002f1c:	02078c63          	beqz	a5,80002f54 <_ZN5Riscv12sysfunctionsEPm+0x298>
            tail->next = elem;
    80002f20:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002f24:	00006797          	auipc	a5,0x6
    80002f28:	e5c7b783          	ld	a5,-420(a5) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f2c:	00a7b423          	sd	a0,8(a5)
        length++;
    80002f30:	00006717          	auipc	a4,0x6
    80002f34:	e5073703          	ld	a4,-432(a4) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f38:	01072783          	lw	a5,16(a4)
    80002f3c:	0017879b          	addiw	a5,a5,1
    80002f40:	00f72823          	sw	a5,16(a4)
        time_to_sleep=-1;
    80002f44:	fff00793          	li	a5,-1
    80002f48:	00f93023          	sd	a5,0(s2)
            return 0;
    80002f4c:	00000513          	li	a0,0
    }
    80002f50:	0e40006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            head = tail = elem;
    80002f54:	00006797          	auipc	a5,0x6
    80002f58:	e2c7b783          	ld	a5,-468(a5) # 80008d80 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f5c:	00a7b423          	sd	a0,8(a5)
    80002f60:	00a7b023          	sd	a0,0(a5)
    80002f64:	fcdff06f          	j	80002f30 <_ZN5Riscv12sysfunctionsEPm+0x274>
        break;

        case 0x15: //thread_start za Thread C++ API
        {
            thread_t t=(thread_t)params[1];
            return t->start();
    80002f68:	00853503          	ld	a0,8(a0)
    80002f6c:	fffff097          	auipc	ra,0xfffff
    80002f70:	260080e7          	jalr	608(ra) # 800021cc <_ZN3TCB5startEv>
    80002f74:	0c00006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
#include "list.hpp"

class _sem{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    80002f78:	02000513          	li	a0,32
    80002f7c:	ffffe097          	auipc	ra,0xffffe
    80002f80:	648080e7          	jalr	1608(ra) # 800015c4 <__mem_alloc>
            break;

        //----------[SEMS]-------------------------------------------------------------
        case 0x21: //sem_open
        {
            new _sem((sem_t *) params[1], (unsigned) params[2]);
    80002f84:	0084b783          	ld	a5,8(s1)
    //-------------------------------------------------------------

    int value () const { return val; }

private:
    _sem(sem_t *handle, unsigned init=1) : val(init){
    80002f88:	0104a703          	lw	a4,16(s1)
    80002f8c:	00e52023          	sw	a4,0(a0)
    List() : head(0), tail(0), length(0) {}
    80002f90:	00053423          	sd	zero,8(a0)
    80002f94:	00053823          	sd	zero,16(a0)
    80002f98:	00052c23          	sw	zero,24(a0)
        *handle = this;
    80002f9c:	00a7b023          	sd	a0,0(a5)
        active=true;
    80002fa0:	00100793          	li	a5,1
    80002fa4:	00f50223          	sb	a5,4(a0)
            return 0;
    80002fa8:	00000513          	li	a0,0
    80002fac:	0880006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
        break;

        case 0x22: //sem_close
        {
            sem_t sem=(sem_t)params[1];
            return sem->close();
    80002fb0:	00853503          	ld	a0,8(a0)
    80002fb4:	00000097          	auipc	ra,0x0
    80002fb8:	414080e7          	jalr	1044(ra) # 800033c8 <_ZN4_sem5closeEv>
    80002fbc:	0780006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
        break;

        case 0x23: //sem_wait
        {
            sem_t sem=(sem_t)params[1];
            return sem->wait();
    80002fc0:	00853503          	ld	a0,8(a0)
    80002fc4:	00000097          	auipc	ra,0x0
    80002fc8:	294080e7          	jalr	660(ra) # 80003258 <_ZN4_sem4waitEv>
    80002fcc:	0680006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
        break;

        case 0x24: //sem_signal
        {
            sem_t sem=(sem_t)params[1];
            return sem->signal();
    80002fd0:	00853503          	ld	a0,8(a0)
    80002fd4:	00000097          	auipc	ra,0x0
    80002fd8:	350080e7          	jalr	848(ra) # 80003324 <_ZN4_sem6signalEv>
    80002fdc:	0580006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
        }
        break;

        //----------[MISC]-------------------------------------------------------------
        case 0x31: //time_sleep
            return TCB::sleep((time_t)params[1]);
    80002fe0:	00853503          	ld	a0,8(a0)
    80002fe4:	fffff097          	auipc	ra,0xfffff
    80002fe8:	fc4080e7          	jalr	-60(ra) # 80001fa8 <_ZN3TCB5sleepEm>
    80002fec:	0480006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            break;

        case 0x41: //getc
            return (uint64)buffer_input->take_kernel();
    80002ff0:	00006517          	auipc	a0,0x6
    80002ff4:	e6853503          	ld	a0,-408(a0) # 80008e58 <_ZN5Riscv12buffer_inputE>
    80002ff8:	00000097          	auipc	ra,0x0
    80002ffc:	bf0080e7          	jalr	-1040(ra) # 80002be8 <_ZN13ConsoleBuffer11take_kernelEv>
    80003000:	0340006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            break;

        case 0x42: //putc
            buffer_output->put_kernel((uint8)params[1]);
    80003004:	00854583          	lbu	a1,8(a0)
    80003008:	00006517          	auipc	a0,0x6
    8000300c:	e5853503          	ld	a0,-424(a0) # 80008e60 <_ZN5Riscv13buffer_outputE>
    80003010:	00000097          	auipc	ra,0x0
    80003014:	b48080e7          	jalr	-1208(ra) # 80002b58 <_ZN13ConsoleBuffer10put_kernelEc>
            return 0;
    80003018:	00000513          	li	a0,0
    8000301c:	0180006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
            break;

        case 0x69: //test f
            return params[1]-params[2];
    80003020:	00853503          	ld	a0,8(a0)
    80003024:	0104b783          	ld	a5,16(s1)
    80003028:	40f50533          	sub	a0,a0,a5
    8000302c:	0080006f          	j	80003034 <_ZN5Riscv12sysfunctionsEPm+0x378>
    switch(params[0]){
    80003030:	ff000513          	li	a0,-16
            break;

        default: return -16;
    }

}
    80003034:	01813083          	ld	ra,24(sp)
    80003038:	01013403          	ld	s0,16(sp)
    8000303c:	00813483          	ld	s1,8(sp)
    80003040:	00013903          	ld	s2,0(sp)
    80003044:	02010113          	addi	sp,sp,32
    80003048:	00008067          	ret
    8000304c:	00050493          	mv	s1,a0
    void operator delete(void *p) {__mem_free(p);}
    80003050:	00090513          	mv	a0,s2
    80003054:	ffffe097          	auipc	ra,0xffffe
    80003058:	598080e7          	jalr	1432(ra) # 800015ec <__mem_free>
    8000305c:	00048513          	mv	a0,s1
    80003060:	00007097          	auipc	ra,0x7
    80003064:	f18080e7          	jalr	-232(ra) # 80009f78 <_Unwind_Resume>
    80003068:	00050493          	mv	s1,a0
    8000306c:	00090513          	mv	a0,s2
    80003070:	ffffe097          	auipc	ra,0xffffe
    80003074:	57c080e7          	jalr	1404(ra) # 800015ec <__mem_free>
    80003078:	00048513          	mv	a0,s1
    8000307c:	00007097          	auipc	ra,0x7
    80003080:	efc080e7          	jalr	-260(ra) # 80009f78 <_Unwind_Resume>
    switch(params[0]){
    80003084:	ff000513          	li	a0,-16
}
    80003088:	00008067          	ret

000000008000308c <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap(){
    8000308c:	f5010113          	addi	sp,sp,-176
    80003090:	0a113423          	sd	ra,168(sp)
    80003094:	0a813023          	sd	s0,160(sp)
    80003098:	08913c23          	sd	s1,152(sp)
    8000309c:	0b010413          	addi	s0,sp,176
    uint64 params[8];
    __asm__ volatile ("mv %0, a7" : "=r" (params[7]));
    800030a0:	00088793          	mv	a5,a7
    800030a4:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("mv %0, a6" : "=r" (params[6]));
    800030a8:	00080793          	mv	a5,a6
    800030ac:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("mv %0, a5" : "=r" (params[5]));
    800030b0:	00078793          	mv	a5,a5
    800030b4:	fcf43423          	sd	a5,-56(s0)
    __asm__ volatile ("mv %0, a4" : "=r" (params[4]));
    800030b8:	00070793          	mv	a5,a4
    800030bc:	fcf43023          	sd	a5,-64(s0)
    __asm__ volatile ("mv %0, a3" : "=r" (params[3]));
    800030c0:	00068793          	mv	a5,a3
    800030c4:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("mv %0, a2" : "=r" (params[2]));
    800030c8:	00060793          	mv	a5,a2
    800030cc:	faf43823          	sd	a5,-80(s0)
    __asm__ volatile ("mv %0, a1" : "=r" (params[1]));
    800030d0:	00058793          	mv	a5,a1
    800030d4:	faf43423          	sd	a5,-88(s0)
    __asm__ volatile ("mv %0, a0" : "=r" (params[0]));
    800030d8:	00050793          	mv	a5,a0
    800030dc:	faf43023          	sd	a5,-96(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800030e0:	142027f3          	csrr	a5,scause
    800030e4:	f6f43c23          	sd	a5,-136(s0)
    return scause;
    800030e8:	f7843703          	ld	a4,-136(s0)

    uint64 scause = r_scause();
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
    800030ec:	ff870693          	addi	a3,a4,-8
    800030f0:	00100793          	li	a5,1
    800030f4:	02d7fc63          	bgeu	a5,a3,8000312c <_ZN5Riscv20handleSupervisorTrapEv+0xa0>
        w_sstatus(sstatus);
        w_sepc(sepc);

        __asm__ volatile ("mv a0, %0" : : "r" (result));
    }
    else if (scause == 0x8000000000000001UL){
    800030f8:	fff00793          	li	a5,-1
    800030fc:	03f79793          	slli	a5,a5,0x3f
    80003100:	00178793          	addi	a5,a5,1
    80003104:	06f70863          	beq	a4,a5,80003174 <_ZN5Riscv20handleSupervisorTrapEv+0xe8>
        }

        SleepingThread::tick();
        mc_sip(SIP_SSIP);
    }
    else if (scause == 0x8000000000000009UL){
    80003108:	fff00793          	li	a5,-1
    8000310c:	03f79793          	slli	a5,a5,0x3f
    80003110:	00978793          	addi	a5,a5,9
    80003114:	0ef70263          	beq	a4,a5,800031f8 <_ZN5Riscv20handleSupervisorTrapEv+0x16c>
//        printString("SEPC:   "); //sačuvana vrednost registra pc u korisničkom režimu
//        printInteger(sepc);
//        printString("\n----------------------------\n");
//        while(true);
    }
    80003118:	0a813083          	ld	ra,168(sp)
    8000311c:	0a013403          	ld	s0,160(sp)
    80003120:	09813483          	ld	s1,152(sp)
    80003124:	0b010113          	addi	sp,sp,176
    80003128:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000312c:	141027f3          	csrr	a5,sepc
    80003130:	f8f43423          	sd	a5,-120(s0)
    return sepc;
    80003134:	f8843783          	ld	a5,-120(s0)
        uint64 volatile sepc = r_sepc() + 4;
    80003138:	00478793          	addi	a5,a5,4
    8000313c:	f4f43c23          	sd	a5,-168(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003140:	100027f3          	csrr	a5,sstatus
    80003144:	f8f43023          	sd	a5,-128(s0)
    return sstatus;
    80003148:	f8043783          	ld	a5,-128(s0)
        uint64 volatile sstatus = r_sstatus();
    8000314c:	f6f43023          	sd	a5,-160(s0)
        uint64 result=sysfunctions(params);
    80003150:	fa040513          	addi	a0,s0,-96
    80003154:	00000097          	auipc	ra,0x0
    80003158:	b68080e7          	jalr	-1176(ra) # 80002cbc <_ZN5Riscv12sysfunctionsEPm>
        w_sstatus(sstatus);
    8000315c:	f6043783          	ld	a5,-160(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003160:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80003164:	f5843783          	ld	a5,-168(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003168:	14179073          	csrw	sepc,a5
        __asm__ volatile ("mv a0, %0" : : "r" (result));
    8000316c:	00050513          	mv	a0,a0
    80003170:	fa9ff06f          	j	80003118 <_ZN5Riscv20handleSupervisorTrapEv+0x8c>
        TCB::timeSliceCounter++;
    80003174:	00006717          	auipc	a4,0x6
    80003178:	bdc73703          	ld	a4,-1060(a4) # 80008d50 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000317c:	00073783          	ld	a5,0(a4)
    80003180:	00178793          	addi	a5,a5,1
    80003184:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
    80003188:	00006717          	auipc	a4,0x6
    8000318c:	c0073703          	ld	a4,-1024(a4) # 80008d88 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003190:	00073703          	ld	a4,0(a4)
    uint64 getTimeSlice() const { return timeSlice; }
    80003194:	03873703          	ld	a4,56(a4)
    80003198:	00e7fc63          	bgeu	a5,a4,800031b0 <_ZN5Riscv20handleSupervisorTrapEv+0x124>
        SleepingThread::tick();
    8000319c:	fffff097          	auipc	ra,0xfffff
    800031a0:	2b0080e7          	jalr	688(ra) # 8000244c <_ZN14SleepingThread4tickEv>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800031a4:	00200793          	li	a5,2
    800031a8:	1447b073          	csrc	sip,a5
}
    800031ac:	f6dff06f          	j	80003118 <_ZN5Riscv20handleSupervisorTrapEv+0x8c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800031b0:	141027f3          	csrr	a5,sepc
    800031b4:	f8f43c23          	sd	a5,-104(s0)
    return sepc;
    800031b8:	f9843783          	ld	a5,-104(s0)
            uint64 volatile sepc = r_sepc();
    800031bc:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800031c0:	100027f3          	csrr	a5,sstatus
    800031c4:	f8f43823          	sd	a5,-112(s0)
    return sstatus;
    800031c8:	f9043783          	ld	a5,-112(s0)
            uint64 volatile sstatus = r_sstatus();
    800031cc:	f6f43823          	sd	a5,-144(s0)
            TCB::timeSliceCounter = 0;
    800031d0:	00006797          	auipc	a5,0x6
    800031d4:	b807b783          	ld	a5,-1152(a5) # 80008d50 <_GLOBAL_OFFSET_TABLE_+0x30>
    800031d8:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    800031dc:	fffff097          	auipc	ra,0xfffff
    800031e0:	c04080e7          	jalr	-1020(ra) # 80001de0 <_ZN3TCB8dispatchEv>
            w_sstatus(sstatus);
    800031e4:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800031e8:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800031ec:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800031f0:	14179073          	csrw	sepc,a5
}
    800031f4:	fa9ff06f          	j	8000319c <_ZN5Riscv20handleSupervisorTrapEv+0x110>
        uint64 device = plic_claim();
    800031f8:	00002097          	auipc	ra,0x2
    800031fc:	21c080e7          	jalr	540(ra) # 80005414 <plic_claim>
    80003200:	00050493          	mv	s1,a0
        if (device == CONSOLE_IRQ){
    80003204:	00a00793          	li	a5,10
    80003208:	00f50a63          	beq	a0,a5,8000321c <_ZN5Riscv20handleSupervisorTrapEv+0x190>
        plic_complete(device);
    8000320c:	00048513          	mv	a0,s1
    80003210:	00002097          	auipc	ra,0x2
    80003214:	23c080e7          	jalr	572(ra) # 8000544c <plic_complete>
    80003218:	f01ff06f          	j	80003118 <_ZN5Riscv20handleSupervisorTrapEv+0x8c>
                current_status = *((uint8*)CONSOLE_STATUS);
    8000321c:	00006797          	auipc	a5,0x6
    80003220:	b1c7b783          	ld	a5,-1252(a5) # 80008d38 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003224:	0007b783          	ld	a5,0(a5)
    80003228:	0007c783          	lbu	a5,0(a5)
                if((CONSOLE_RX_STATUS_BIT & current_status) == 0) break;
    8000322c:	0017f793          	andi	a5,a5,1
    80003230:	fc078ee3          	beqz	a5,8000320c <_ZN5Riscv20handleSupervisorTrapEv+0x180>
                sent_char = *((char*)CONSOLE_RX_DATA);
    80003234:	00006797          	auipc	a5,0x6
    80003238:	af47b783          	ld	a5,-1292(a5) # 80008d28 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000323c:	0007b783          	ld	a5,0(a5)
                buffer_input->put_kernel(sent_char);
    80003240:	0007c583          	lbu	a1,0(a5)
    80003244:	00006517          	auipc	a0,0x6
    80003248:	c1453503          	ld	a0,-1004(a0) # 80008e58 <_ZN5Riscv12buffer_inputE>
    8000324c:	00000097          	auipc	ra,0x0
    80003250:	90c080e7          	jalr	-1780(ra) # 80002b58 <_ZN13ConsoleBuffer10put_kernelEc>
    80003254:	fc9ff06f          	j	8000321c <_ZN5Riscv20handleSupervisorTrapEv+0x190>

0000000080003258 <_ZN4_sem4waitEv>:
_sem::~_sem() {
    this->close();
}

int _sem::wait (){
    if(active==false){
    80003258:	00454783          	lbu	a5,4(a0)
    8000325c:	0a078c63          	beqz	a5,80003314 <_ZN4_sem4waitEv+0xbc>
int _sem::wait (){
    80003260:	fd010113          	addi	sp,sp,-48
    80003264:	02113423          	sd	ra,40(sp)
    80003268:	02813023          	sd	s0,32(sp)
    8000326c:	00913c23          	sd	s1,24(sp)
    80003270:	01213823          	sd	s2,16(sp)
    80003274:	01313423          	sd	s3,8(sp)
    80003278:	03010413          	addi	s0,sp,48
    8000327c:	00050493          	mv	s1,a0
        return -4;
    }
    if(--val<0){
    80003280:	00052783          	lw	a5,0(a0)
    80003284:	fff7879b          	addiw	a5,a5,-1
    80003288:	00f52023          	sw	a5,0(a0)
    8000328c:	02079713          	slli	a4,a5,0x20
    80003290:	02074663          	bltz	a4,800032bc <_ZN4_sem4waitEv+0x64>
        blocked.addLast(TCB::running);
        TCB::block();
    }

    if(active==true){
    80003294:	0044c783          	lbu	a5,4(s1)
    80003298:	08078263          	beqz	a5,8000331c <_ZN4_sem4waitEv+0xc4>
        return 0;
    8000329c:	00000513          	li	a0,0
    }
    else{
        //slucaj kada je semafor dealociran dok je pozivajuca nit na njemu cekala
        return -8;
    }
}
    800032a0:	02813083          	ld	ra,40(sp)
    800032a4:	02013403          	ld	s0,32(sp)
    800032a8:	01813483          	ld	s1,24(sp)
    800032ac:	01013903          	ld	s2,16(sp)
    800032b0:	00813983          	ld	s3,8(sp)
    800032b4:	03010113          	addi	sp,sp,48
    800032b8:	00008067          	ret
        blocked.addLast(TCB::running);
    800032bc:	00850913          	addi	s2,a0,8
    800032c0:	00006797          	auipc	a5,0x6
    800032c4:	ac87b783          	ld	a5,-1336(a5) # 80008d88 <_GLOBAL_OFFSET_TABLE_+0x68>
    800032c8:	0007b983          	ld	s3,0(a5)
        void *operator new(size_t n){return __mem_alloc(n);}
    800032cc:	01000513          	li	a0,16
    800032d0:	ffffe097          	auipc	ra,0xffffe
    800032d4:	2f4080e7          	jalr	756(ra) # 800015c4 <__mem_alloc>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800032d8:	01353023          	sd	s3,0(a0)
    800032dc:	00053423          	sd	zero,8(a0)
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
        if (tail)
    800032e0:	00893783          	ld	a5,8(s2)
    800032e4:	02078263          	beqz	a5,80003308 <_ZN4_sem4waitEv+0xb0>
        {
            tail->next = elem;
    800032e8:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800032ec:	00a93423          	sd	a0,8(s2)
        } else
        {
            head = tail = elem;
        }
        length++;
    800032f0:	01092783          	lw	a5,16(s2)
    800032f4:	0017879b          	addiw	a5,a5,1
    800032f8:	00f92823          	sw	a5,16(s2)
        TCB::block();
    800032fc:	fffff097          	auipc	ra,0xfffff
    80003300:	c1c080e7          	jalr	-996(ra) # 80001f18 <_ZN3TCB5blockEv>
    80003304:	f91ff06f          	j	80003294 <_ZN4_sem4waitEv+0x3c>
            head = tail = elem;
    80003308:	00a93423          	sd	a0,8(s2)
    8000330c:	00a4b423          	sd	a0,8(s1)
    80003310:	fe1ff06f          	j	800032f0 <_ZN4_sem4waitEv+0x98>
        return -4;
    80003314:	ffc00513          	li	a0,-4
}
    80003318:	00008067          	ret
        return -8;
    8000331c:	ff800513          	li	a0,-8
    80003320:	f81ff06f          	j	800032a0 <_ZN4_sem4waitEv+0x48>

0000000080003324 <_ZN4_sem6signalEv>:

int _sem::signal (){
    if(active==false){
    80003324:	00454783          	lbu	a5,4(a0)
    80003328:	08078c63          	beqz	a5,800033c0 <_ZN4_sem6signalEv+0x9c>
        return -4;
    }
    if(++val<=0){
    8000332c:	00052783          	lw	a5,0(a0)
    80003330:	0017879b          	addiw	a5,a5,1
    80003334:	0007871b          	sext.w	a4,a5
    80003338:	00f52023          	sw	a5,0(a0)
    8000333c:	00e05663          	blez	a4,80003348 <_ZN4_sem6signalEv+0x24>
        TCB* t=blocked.removeFirst();
        t->unblock();
    }

    return 0;
    80003340:	00000513          	li	a0,0
}
    80003344:	00008067          	ret
int _sem::signal (){
    80003348:	fe010113          	addi	sp,sp,-32
    8000334c:	00113c23          	sd	ra,24(sp)
    80003350:	00813823          	sd	s0,16(sp)
    80003354:	00913423          	sd	s1,8(sp)
    80003358:	02010413          	addi	s0,sp,32
    }

    T *removeFirst()
    {

        if (!head) { return 0; }
    8000335c:	00853783          	ld	a5,8(a0)
    80003360:	04078c63          	beqz	a5,800033b8 <_ZN4_sem6signalEv+0x94>
        length--;
    80003364:	01852703          	lw	a4,24(a0)
    80003368:	fff7071b          	addiw	a4,a4,-1
    8000336c:	00e52c23          	sw	a4,24(a0)
        Elem *elem = head;
        head = head->next;
    80003370:	0087b703          	ld	a4,8(a5)
    80003374:	00e53423          	sd	a4,8(a0)
        if (!head) { tail = 0; }
    80003378:	02070c63          	beqz	a4,800033b0 <_ZN4_sem6signalEv+0x8c>

        T *ret = elem->data;
    8000337c:	0007b483          	ld	s1,0(a5)
        void operator delete(void *p) {__mem_free(p);}
    80003380:	00078513          	mv	a0,a5
    80003384:	ffffe097          	auipc	ra,0xffffe
    80003388:	268080e7          	jalr	616(ra) # 800015ec <__mem_free>
        t->unblock();
    8000338c:	00048513          	mv	a0,s1
    80003390:	fffff097          	auipc	ra,0xfffff
    80003394:	bd8080e7          	jalr	-1064(ra) # 80001f68 <_ZN3TCB7unblockEv>
    return 0;
    80003398:	00000513          	li	a0,0
}
    8000339c:	01813083          	ld	ra,24(sp)
    800033a0:	01013403          	ld	s0,16(sp)
    800033a4:	00813483          	ld	s1,8(sp)
    800033a8:	02010113          	addi	sp,sp,32
    800033ac:	00008067          	ret
        if (!head) { tail = 0; }
    800033b0:	00053823          	sd	zero,16(a0)
    800033b4:	fc9ff06f          	j	8000337c <_ZN4_sem6signalEv+0x58>
        if (!head) { return 0; }
    800033b8:	00078493          	mv	s1,a5
    800033bc:	fd1ff06f          	j	8000338c <_ZN4_sem6signalEv+0x68>
        return -4;
    800033c0:	ffc00513          	li	a0,-4
    800033c4:	00008067          	ret

00000000800033c8 <_ZN4_sem5closeEv>:

int _sem::close() {
    if(active==false){
    800033c8:	00454783          	lbu	a5,4(a0)
    800033cc:	06078e63          	beqz	a5,80003448 <_ZN4_sem5closeEv+0x80>
int _sem::close() {
    800033d0:	fe010113          	addi	sp,sp,-32
    800033d4:	00113c23          	sd	ra,24(sp)
    800033d8:	00813823          	sd	s0,16(sp)
    800033dc:	00913423          	sd	s1,8(sp)
    800033e0:	01213023          	sd	s2,0(sp)
    800033e4:	02010413          	addi	s0,sp,32
    800033e8:	00050493          	mv	s1,a0
        return -4;
    }

    val=0, active=false;
    800033ec:	00052023          	sw	zero,0(a0)
    800033f0:	00050223          	sb	zero,4(a0)
    800033f4:	0200006f          	j	80003414 <_ZN4_sem5closeEv+0x4c>
        if (!head) { tail = 0; }
    800033f8:	0004b823          	sd	zero,16(s1)
        T *ret = elem->data;
    800033fc:	00053903          	ld	s2,0(a0)
        void operator delete(void *p) {__mem_free(p);}
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	1ec080e7          	jalr	492(ra) # 800015ec <__mem_free>

    while(blocked.get_length()>0){
        //Sve niti koje su se zatekle da cekaju na semaforu
        //se deblokiraju, pri cemu njihov wait vraca gresku
        TCB* t=blocked.removeFirst();
        t->unblock();
    80003408:	00090513          	mv	a0,s2
    8000340c:	fffff097          	auipc	ra,0xfffff
    80003410:	b5c080e7          	jalr	-1188(ra) # 80001f68 <_ZN3TCB7unblockEv>
    unsigned get_length() const { return length;}
    80003414:	0184a783          	lw	a5,24(s1)
    while(blocked.get_length()>0){
    80003418:	02078c63          	beqz	a5,80003450 <_ZN4_sem5closeEv+0x88>
        if (!head) { return 0; }
    8000341c:	0084b503          	ld	a0,8(s1)
    80003420:	02050063          	beqz	a0,80003440 <_ZN4_sem5closeEv+0x78>
        length--;
    80003424:	0184a783          	lw	a5,24(s1)
    80003428:	fff7879b          	addiw	a5,a5,-1
    8000342c:	00f4ac23          	sw	a5,24(s1)
        head = head->next;
    80003430:	00853783          	ld	a5,8(a0)
    80003434:	00f4b423          	sd	a5,8(s1)
        if (!head) { tail = 0; }
    80003438:	fc0792e3          	bnez	a5,800033fc <_ZN4_sem5closeEv+0x34>
    8000343c:	fbdff06f          	j	800033f8 <_ZN4_sem5closeEv+0x30>
        if (!head) { return 0; }
    80003440:	00050913          	mv	s2,a0
    80003444:	fc5ff06f          	j	80003408 <_ZN4_sem5closeEv+0x40>
        return -4;
    80003448:	ffc00513          	li	a0,-4
    }
    return 0;
    8000344c:	00008067          	ret
    return 0;
    80003450:	00000513          	li	a0,0
    80003454:	01813083          	ld	ra,24(sp)
    80003458:	01013403          	ld	s0,16(sp)
    8000345c:	00813483          	ld	s1,8(sp)
    80003460:	00013903          	ld	s2,0(sp)
    80003464:	02010113          	addi	sp,sp,32
    80003468:	00008067          	ret

000000008000346c <_ZN4_semD1Ev>:
_sem::~_sem() {
    8000346c:	ff010113          	addi	sp,sp,-16
    80003470:	00113423          	sd	ra,8(sp)
    80003474:	00813023          	sd	s0,0(sp)
    80003478:	01010413          	addi	s0,sp,16
    this->close();
    8000347c:	00000097          	auipc	ra,0x0
    80003480:	f4c080e7          	jalr	-180(ra) # 800033c8 <_ZN4_sem5closeEv>
}
    80003484:	00813083          	ld	ra,8(sp)
    80003488:	00013403          	ld	s0,0(sp)
    8000348c:	01010113          	addi	sp,sp,16
    80003490:	00008067          	ret

0000000080003494 <_Z41__static_initialization_and_destruction_0ii>:
    readyThreadQueue.addLast(ccb);
}

int Scheduler::getLength(){
    return readyThreadQueue.get_length();
    80003494:	ff010113          	addi	sp,sp,-16
    80003498:	00813423          	sd	s0,8(sp)
    8000349c:	01010413          	addi	s0,sp,16
    800034a0:	00100793          	li	a5,1
    800034a4:	00f50863          	beq	a0,a5,800034b4 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800034a8:	00813403          	ld	s0,8(sp)
    800034ac:	01010113          	addi	sp,sp,16
    800034b0:	00008067          	ret
    800034b4:	000107b7          	lui	a5,0x10
    800034b8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800034bc:	fef596e3          	bne	a1,a5,800034a8 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0), length(0) {}
    800034c0:	00006797          	auipc	a5,0x6
    800034c4:	9a878793          	addi	a5,a5,-1624 # 80008e68 <_ZN9Scheduler16readyThreadQueueE>
    800034c8:	0007b023          	sd	zero,0(a5)
    800034cc:	0007b423          	sd	zero,8(a5)
    800034d0:	0007a823          	sw	zero,16(a5)
    800034d4:	fd5ff06f          	j	800034a8 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800034d8 <_ZN9Scheduler3getEv>:
{
    800034d8:	fe010113          	addi	sp,sp,-32
    800034dc:	00113c23          	sd	ra,24(sp)
    800034e0:	00813823          	sd	s0,16(sp)
    800034e4:	00913423          	sd	s1,8(sp)
    800034e8:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    800034ec:	00006517          	auipc	a0,0x6
    800034f0:	97c53503          	ld	a0,-1668(a0) # 80008e68 <_ZN9Scheduler16readyThreadQueueE>
    800034f4:	04050a63          	beqz	a0,80003548 <_ZN9Scheduler3getEv+0x70>
        length--;
    800034f8:	00006797          	auipc	a5,0x6
    800034fc:	97078793          	addi	a5,a5,-1680 # 80008e68 <_ZN9Scheduler16readyThreadQueueE>
    80003500:	0107a703          	lw	a4,16(a5)
    80003504:	fff7071b          	addiw	a4,a4,-1
    80003508:	00e7a823          	sw	a4,16(a5)
        head = head->next;
    8000350c:	00853703          	ld	a4,8(a0)
    80003510:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    80003514:	02070463          	beqz	a4,8000353c <_ZN9Scheduler3getEv+0x64>
        T *ret = elem->data;
    80003518:	00053483          	ld	s1,0(a0)
        void operator delete(void *p) {__mem_free(p);}
    8000351c:	ffffe097          	auipc	ra,0xffffe
    80003520:	0d0080e7          	jalr	208(ra) # 800015ec <__mem_free>
}
    80003524:	00048513          	mv	a0,s1
    80003528:	01813083          	ld	ra,24(sp)
    8000352c:	01013403          	ld	s0,16(sp)
    80003530:	00813483          	ld	s1,8(sp)
    80003534:	02010113          	addi	sp,sp,32
    80003538:	00008067          	ret
        if (!head) { tail = 0; }
    8000353c:	00006797          	auipc	a5,0x6
    80003540:	9207ba23          	sd	zero,-1740(a5) # 80008e70 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80003544:	fd5ff06f          	j	80003518 <_ZN9Scheduler3getEv+0x40>
        if (!head) { return 0; }
    80003548:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    8000354c:	fd9ff06f          	j	80003524 <_ZN9Scheduler3getEv+0x4c>

0000000080003550 <_ZN9Scheduler3putEP3TCB>:
{
    80003550:	fe010113          	addi	sp,sp,-32
    80003554:	00113c23          	sd	ra,24(sp)
    80003558:	00813823          	sd	s0,16(sp)
    8000355c:	00913423          	sd	s1,8(sp)
    80003560:	02010413          	addi	s0,sp,32
    80003564:	00050493          	mv	s1,a0
        void *operator new(size_t n){return __mem_alloc(n);}
    80003568:	01000513          	li	a0,16
    8000356c:	ffffe097          	auipc	ra,0xffffe
    80003570:	058080e7          	jalr	88(ra) # 800015c4 <__mem_alloc>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80003574:	00953023          	sd	s1,0(a0)
    80003578:	00053423          	sd	zero,8(a0)
        if (tail)
    8000357c:	00006797          	auipc	a5,0x6
    80003580:	8f47b783          	ld	a5,-1804(a5) # 80008e70 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80003584:	02078c63          	beqz	a5,800035bc <_ZN9Scheduler3putEP3TCB+0x6c>
            tail->next = elem;
    80003588:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000358c:	00006797          	auipc	a5,0x6
    80003590:	8ea7b223          	sd	a0,-1820(a5) # 80008e70 <_ZN9Scheduler16readyThreadQueueE+0x8>
        length++;
    80003594:	00006717          	auipc	a4,0x6
    80003598:	8d470713          	addi	a4,a4,-1836 # 80008e68 <_ZN9Scheduler16readyThreadQueueE>
    8000359c:	01072783          	lw	a5,16(a4)
    800035a0:	0017879b          	addiw	a5,a5,1
    800035a4:	00f72823          	sw	a5,16(a4)
}
    800035a8:	01813083          	ld	ra,24(sp)
    800035ac:	01013403          	ld	s0,16(sp)
    800035b0:	00813483          	ld	s1,8(sp)
    800035b4:	02010113          	addi	sp,sp,32
    800035b8:	00008067          	ret
            head = tail = elem;
    800035bc:	00006797          	auipc	a5,0x6
    800035c0:	8ac78793          	addi	a5,a5,-1876 # 80008e68 <_ZN9Scheduler16readyThreadQueueE>
    800035c4:	00a7b423          	sd	a0,8(a5)
    800035c8:	00a7b023          	sd	a0,0(a5)
    800035cc:	fc9ff06f          	j	80003594 <_ZN9Scheduler3putEP3TCB+0x44>

00000000800035d0 <_ZN9Scheduler9getLengthEv>:
int Scheduler::getLength(){
    800035d0:	ff010113          	addi	sp,sp,-16
    800035d4:	00813423          	sd	s0,8(sp)
    800035d8:	01010413          	addi	s0,sp,16
    800035dc:	00006517          	auipc	a0,0x6
    800035e0:	89c52503          	lw	a0,-1892(a0) # 80008e78 <_ZN9Scheduler16readyThreadQueueE+0x10>
    800035e4:	00813403          	ld	s0,8(sp)
    800035e8:	01010113          	addi	sp,sp,16
    800035ec:	00008067          	ret

00000000800035f0 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    800035f0:	ff010113          	addi	sp,sp,-16
    800035f4:	00113423          	sd	ra,8(sp)
    800035f8:	00813023          	sd	s0,0(sp)
    800035fc:	01010413          	addi	s0,sp,16
    80003600:	000105b7          	lui	a1,0x10
    80003604:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80003608:	00100513          	li	a0,1
    8000360c:	00000097          	auipc	ra,0x0
    80003610:	e88080e7          	jalr	-376(ra) # 80003494 <_Z41__static_initialization_and_destruction_0ii>
    80003614:	00813083          	ld	ra,8(sp)
    80003618:	00013403          	ld	s0,0(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret

0000000080003624 <_ZN15MemoryAllocator10initMemoryEv>:

MemFragment* MemoryAllocator::free_mem_head = nullptr;

MemFragment* MemoryAllocator::allocated_head = nullptr;

void MemoryAllocator::initMemory(){
    80003624:	ff010113          	addi	sp,sp,-16
    80003628:	00813423          	sd	s0,8(sp)
    8000362c:	01010413          	addi	s0,sp,16
    free_mem_head = (MemFragment*)HEAP_START_ADDR;
    80003630:	00005697          	auipc	a3,0x5
    80003634:	7106b683          	ld	a3,1808(a3) # 80008d40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003638:	0006b703          	ld	a4,0(a3)
    8000363c:	00006797          	auipc	a5,0x6
    80003640:	84478793          	addi	a5,a5,-1980 # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    80003644:	00e7b023          	sd	a4,0(a5)

    free_mem_head->next = nullptr;
    80003648:	00073023          	sd	zero,0(a4)
    free_mem_head->prev = nullptr;
    8000364c:	0007b703          	ld	a4,0(a5)
    80003650:	00073423          	sd	zero,8(a4)
    free_mem_head->free = true;
    80003654:	00100793          	li	a5,1
    80003658:	00f70c23          	sb	a5,24(a4)
    free_mem_head->size = (size_t)( (char*)HEAP_END_ADDR - sizeof(size_t) - (char*)HEAP_START_ADDR - MEM_BLOCK_SIZE);
    8000365c:	00005797          	auipc	a5,0x5
    80003660:	7347b783          	ld	a5,1844(a5) # 80008d90 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003664:	0007b783          	ld	a5,0(a5)
    80003668:	ff878793          	addi	a5,a5,-8
    8000366c:	0006b683          	ld	a3,0(a3)
    80003670:	40d787b3          	sub	a5,a5,a3
    80003674:	fc078793          	addi	a5,a5,-64
    80003678:	00f73823          	sd	a5,16(a4)
}
    8000367c:	00813403          	ld	s0,8(sp)
    80003680:	01010113          	addi	sp,sp,16
    80003684:	00008067          	ret

0000000080003688 <_ZN15MemoryAllocator9add_to_flEP11MemFragment>:
        return 0;
    }
    return -4;
}

void MemoryAllocator::add_to_fl(MemFragment* fragment) {
    80003688:	ff010113          	addi	sp,sp,-16
    8000368c:	00813423          	sd	s0,8(sp)
    80003690:	01010413          	addi	s0,sp,16
    if(fragment==nullptr) return;
    80003694:	0e050e63          	beqz	a0,80003790 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x108>

    fragment->free=true;
    80003698:	00100793          	li	a5,1
    8000369c:	00f50c23          	sb	a5,24(a0)

    if(free_mem_head==nullptr){
    800036a0:	00005717          	auipc	a4,0x5
    800036a4:	7e073703          	ld	a4,2016(a4) # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    800036a8:	02070063          	beqz	a4,800036c8 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x40>
        free_mem_head=fragment;
        return;
    }

    //fragment postaje nova glava
    if(fragment < free_mem_head){
    800036ac:	02e56463          	bltu	a0,a4,800036d4 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x4c>
            tren->prev=nullptr;
        }
        return;
    }

    MemFragment* tren = free_mem_head->next;
    800036b0:	00073783          	ld	a5,0(a4)
    MemFragment* prev = free_mem_head;
    while(tren!=nullptr){
    800036b4:	0c078863          	beqz	a5,80003784 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0xfc>
        //stavljamo u sred liste
        if(fragment<tren){
    800036b8:	08f56063          	bltu	a0,a5,80003738 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0xb0>
                tren->prev=nullptr;
            }
            return;
        }

        prev=tren;
    800036bc:	00078713          	mv	a4,a5
        tren=tren->next;
    800036c0:	0007b783          	ld	a5,0(a5)
    while(tren!=nullptr){
    800036c4:	ff1ff06f          	j	800036b4 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x2c>
        free_mem_head=fragment;
    800036c8:	00005797          	auipc	a5,0x5
    800036cc:	7aa7bc23          	sd	a0,1976(a5) # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
        return;
    800036d0:	0c00006f          	j	80003790 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x108>
        fragment->next = free_mem_head;
    800036d4:	00e53023          	sd	a4,0(a0)
        fragment->prev = nullptr;
    800036d8:	00053423          	sd	zero,8(a0)
        free_mem_head->prev = fragment;
    800036dc:	00005797          	auipc	a5,0x5
    800036e0:	7a478793          	addi	a5,a5,1956 # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    800036e4:	0007b703          	ld	a4,0(a5)
    800036e8:	00a73423          	sd	a0,8(a4)
        free_mem_head = fragment;
    800036ec:	00a7b023          	sd	a0,0(a5)
        MemFragment* tren = free_mem_head->next;
    800036f0:	00053683          	ld	a3,0(a0)
        if( ( (char*)free_mem_head + free_mem_head->size + MEM_BLOCK_SIZE) >= ((char*)tren) ){
    800036f4:	01053783          	ld	a5,16(a0)
    800036f8:	04078713          	addi	a4,a5,64
    800036fc:	00e50733          	add	a4,a0,a4
    80003700:	08d76863          	bltu	a4,a3,80003790 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x108>
            free_mem_head->size = free_mem_head->size + tren->size + MEM_BLOCK_SIZE;
    80003704:	0106b703          	ld	a4,16(a3)
    80003708:	00e787b3          	add	a5,a5,a4
    8000370c:	04078793          	addi	a5,a5,64
    80003710:	00f53823          	sd	a5,16(a0)
            free_mem_head->next=tren->next;
    80003714:	0006b783          	ld	a5,0(a3)
    80003718:	00f53023          	sd	a5,0(a0)
            if(tren->next!=nullptr) tren->next->prev=free_mem_head;
    8000371c:	00078863          	beqz	a5,8000372c <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0xa4>
    80003720:	00005717          	auipc	a4,0x5
    80003724:	76073703          	ld	a4,1888(a4) # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    80003728:	00e7b423          	sd	a4,8(a5)
            tren->next=nullptr;
    8000372c:	0006b023          	sd	zero,0(a3)
            tren->prev=nullptr;
    80003730:	0006b423          	sd	zero,8(a3)
        return;
    80003734:	05c0006f          	j	80003790 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x108>
            prev->next=fragment;
    80003738:	00a73023          	sd	a0,0(a4)
            tren->prev=fragment;
    8000373c:	00a7b423          	sd	a0,8(a5)
            fragment->prev=prev;
    80003740:	00e53423          	sd	a4,8(a0)
            fragment->next=tren;
    80003744:	00f53023          	sd	a5,0(a0)
            if( ( (char*)fragment + fragment->size + MEM_BLOCK_SIZE) >= ((char*)tren) ){
    80003748:	01053703          	ld	a4,16(a0)
    8000374c:	04070693          	addi	a3,a4,64
    80003750:	00d506b3          	add	a3,a0,a3
    80003754:	02f6ee63          	bltu	a3,a5,80003790 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x108>
                fragment->size = fragment->size + tren->size + MEM_BLOCK_SIZE;
    80003758:	0107b683          	ld	a3,16(a5)
    8000375c:	00d70733          	add	a4,a4,a3
    80003760:	04070713          	addi	a4,a4,64
    80003764:	00e53823          	sd	a4,16(a0)
                fragment->next=tren->next;
    80003768:	0007b703          	ld	a4,0(a5)
    8000376c:	00e53023          	sd	a4,0(a0)
                if(tren->next!=nullptr) tren->next->prev=fragment;
    80003770:	00070463          	beqz	a4,80003778 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0xf0>
    80003774:	00a73423          	sd	a0,8(a4)
                tren->next=nullptr;
    80003778:	0007b023          	sd	zero,0(a5)
                tren->prev=nullptr;
    8000377c:	0007b423          	sd	zero,8(a5)
            return;
    80003780:	0100006f          	j	80003790 <_ZN15MemoryAllocator9add_to_flEP11MemFragment+0x108>
    }
    //na kraju liste stavljamo fragment
    prev->next=fragment;
    80003784:	00a73023          	sd	a0,0(a4)
    fragment->prev=prev;
    80003788:	00e53423          	sd	a4,8(a0)
    fragment->next=nullptr;
    8000378c:	00053023          	sd	zero,0(a0)
    return;
}
    80003790:	00813403          	ld	s0,8(sp)
    80003794:	01010113          	addi	sp,sp,16
    80003798:	00008067          	ret

000000008000379c <_ZN15MemoryAllocator15discard_from_flEP11MemFragment>:

void MemoryAllocator::discard_from_fl(MemFragment* fragment) {
    8000379c:	ff010113          	addi	sp,sp,-16
    800037a0:	00813423          	sd	s0,8(sp)
    800037a4:	01010413          	addi	s0,sp,16
    if(fragment==nullptr || free_mem_head==nullptr) return;
    800037a8:	02050863          	beqz	a0,800037d8 <_ZN15MemoryAllocator15discard_from_flEP11MemFragment+0x3c>
    800037ac:	00005797          	auipc	a5,0x5
    800037b0:	6d47b783          	ld	a5,1748(a5) # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    800037b4:	02078263          	beqz	a5,800037d8 <_ZN15MemoryAllocator15discard_from_flEP11MemFragment+0x3c>

    //ako je glava
    if(fragment==free_mem_head){
    800037b8:	02a78663          	beq	a5,a0,800037e4 <_ZN15MemoryAllocator15discard_from_flEP11MemFragment+0x48>
        fragment->next=nullptr;
        fragment->prev=nullptr;
        return;
    }

    MemFragment* levi = fragment->prev;
    800037bc:	00853703          	ld	a4,8(a0)
    MemFragment* desni = fragment->next;
    800037c0:	00053783          	ld	a5,0(a0)

    levi->next=desni;
    800037c4:	00f73023          	sd	a5,0(a4)
    if(desni != nullptr) desni->prev=levi;
    800037c8:	00078463          	beqz	a5,800037d0 <_ZN15MemoryAllocator15discard_from_flEP11MemFragment+0x34>
    800037cc:	00e7b423          	sd	a4,8(a5)
    fragment->next=nullptr;
    800037d0:	00053023          	sd	zero,0(a0)
    fragment->prev=nullptr;
    800037d4:	00053423          	sd	zero,8(a0)
    return;
}
    800037d8:	00813403          	ld	s0,8(sp)
    800037dc:	01010113          	addi	sp,sp,16
    800037e0:	00008067          	ret
        free_mem_head=free_mem_head->next;
    800037e4:	0007b783          	ld	a5,0(a5)
    800037e8:	00005717          	auipc	a4,0x5
    800037ec:	68f73c23          	sd	a5,1688(a4) # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
        if(free_mem_head) {
    800037f0:	00078463          	beqz	a5,800037f8 <_ZN15MemoryAllocator15discard_from_flEP11MemFragment+0x5c>
            free_mem_head->prev = nullptr;
    800037f4:	0007b423          	sd	zero,8(a5)
        fragment->next=nullptr;
    800037f8:	00053023          	sd	zero,0(a0)
        fragment->prev=nullptr;
    800037fc:	00053423          	sd	zero,8(a0)
        return;
    80003800:	fd9ff06f          	j	800037d8 <_ZN15MemoryAllocator15discard_from_flEP11MemFragment+0x3c>

0000000080003804 <_ZN15MemoryAllocator9add_to_alEP11MemFragment>:

void MemoryAllocator::add_to_al(MemFragment* fragment) {
    80003804:	ff010113          	addi	sp,sp,-16
    80003808:	00813423          	sd	s0,8(sp)
    8000380c:	01010413          	addi	s0,sp,16
    if(fragment==nullptr) return;
    80003810:	04050c63          	beqz	a0,80003868 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x64>
    fragment->free=false;
    80003814:	00050c23          	sb	zero,24(a0)

    if(allocated_head==nullptr){
    80003818:	00005717          	auipc	a4,0x5
    8000381c:	67073703          	ld	a4,1648(a4) # 80008e88 <_ZN15MemoryAllocator14allocated_headE>
    80003820:	02070063          	beqz	a4,80003840 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x3c>
        allocated_head=fragment;
        return;
    }
    if(fragment < allocated_head){
    80003824:	02e56463          	bltu	a0,a4,8000384c <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x48>
        allocated_head->prev = fragment;
        allocated_head = fragment;
        return;
    }

    MemFragment* tren = allocated_head->next;
    80003828:	00073783          	ld	a5,0(a4)
    MemFragment* prev = allocated_head;
    while(tren!=nullptr){
    8000382c:	04078e63          	beqz	a5,80003888 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x84>
        if(fragment<tren){
    80003830:	04f56263          	bltu	a0,a5,80003874 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x70>
            fragment->prev=prev;
            fragment->next=tren;
            return;
        }

        prev=tren;
    80003834:	00078713          	mv	a4,a5
        tren=tren->next;
    80003838:	0007b783          	ld	a5,0(a5)
    while(tren!=nullptr){
    8000383c:	ff1ff06f          	j	8000382c <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x28>
        allocated_head=fragment;
    80003840:	00005797          	auipc	a5,0x5
    80003844:	64a7b423          	sd	a0,1608(a5) # 80008e88 <_ZN15MemoryAllocator14allocated_headE>
        return;
    80003848:	0200006f          	j	80003868 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x64>
        fragment->next = allocated_head;
    8000384c:	00e53023          	sd	a4,0(a0)
        fragment->prev = nullptr;
    80003850:	00053423          	sd	zero,8(a0)
        allocated_head->prev = fragment;
    80003854:	00005797          	auipc	a5,0x5
    80003858:	62c78793          	addi	a5,a5,1580 # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    8000385c:	0087b703          	ld	a4,8(a5)
    80003860:	00a73423          	sd	a0,8(a4)
        allocated_head = fragment;
    80003864:	00a7b423          	sd	a0,8(a5)
    }
    prev->next=fragment;
    fragment->prev=prev;
    fragment->next=nullptr;
    return;
}
    80003868:	00813403          	ld	s0,8(sp)
    8000386c:	01010113          	addi	sp,sp,16
    80003870:	00008067          	ret
            prev->next=fragment;
    80003874:	00a73023          	sd	a0,0(a4)
            tren->prev=fragment;
    80003878:	00a7b423          	sd	a0,8(a5)
            fragment->prev=prev;
    8000387c:	00e53423          	sd	a4,8(a0)
            fragment->next=tren;
    80003880:	00f53023          	sd	a5,0(a0)
            return;
    80003884:	fe5ff06f          	j	80003868 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x64>
    prev->next=fragment;
    80003888:	00a73023          	sd	a0,0(a4)
    fragment->prev=prev;
    8000388c:	00e53423          	sd	a4,8(a0)
    fragment->next=nullptr;
    80003890:	00053023          	sd	zero,0(a0)
    return;
    80003894:	fd5ff06f          	j	80003868 <_ZN15MemoryAllocator9add_to_alEP11MemFragment+0x64>

0000000080003898 <_ZN15MemoryAllocator8allocateEm>:
void* MemoryAllocator::allocate(size_t size){
    80003898:	fe010113          	addi	sp,sp,-32
    8000389c:	00113c23          	sd	ra,24(sp)
    800038a0:	00813823          	sd	s0,16(sp)
    800038a4:	00913423          	sd	s1,8(sp)
    800038a8:	01213023          	sd	s2,0(sp)
    800038ac:	02010413          	addi	s0,sp,32
    if(size<=0) return nullptr;
    800038b0:	0a050e63          	beqz	a0,8000396c <_ZN15MemoryAllocator8allocateEm+0xd4>
    size_t my_size=size/MEM_BLOCK_SIZE;
    800038b4:	00655913          	srli	s2,a0,0x6
    if(size % MEM_BLOCK_SIZE > 0){
    800038b8:	03f57513          	andi	a0,a0,63
    800038bc:	00050463          	beqz	a0,800038c4 <_ZN15MemoryAllocator8allocateEm+0x2c>
        my_size++;
    800038c0:	00190913          	addi	s2,s2,1
    my_size = my_size * MEM_BLOCK_SIZE;
    800038c4:	00691913          	slli	s2,s2,0x6
    MemFragment* tren = free_mem_head;
    800038c8:	00005497          	auipc	s1,0x5
    800038cc:	5b84b483          	ld	s1,1464(s1) # 80008e80 <_ZN15MemoryAllocator13free_mem_headE>
    800038d0:	0400006f          	j	80003910 <_ZN15MemoryAllocator8allocateEm+0x78>
            discard_from_fl(tren);
    800038d4:	00048513          	mv	a0,s1
    800038d8:	00000097          	auipc	ra,0x0
    800038dc:	ec4080e7          	jalr	-316(ra) # 8000379c <_ZN15MemoryAllocator15discard_from_flEP11MemFragment>
            add_to_al(tren);
    800038e0:	00048513          	mv	a0,s1
    800038e4:	00000097          	auipc	ra,0x0
    800038e8:	f20080e7          	jalr	-224(ra) # 80003804 <_ZN15MemoryAllocator9add_to_alEP11MemFragment>
            return (void*)( (char*)tren + MEM_BLOCK_SIZE);
    800038ec:	04048493          	addi	s1,s1,64
}
    800038f0:	00048513          	mv	a0,s1
    800038f4:	01813083          	ld	ra,24(sp)
    800038f8:	01013403          	ld	s0,16(sp)
    800038fc:	00813483          	ld	s1,8(sp)
    80003900:	00013903          	ld	s2,0(sp)
    80003904:	02010113          	addi	sp,sp,32
    80003908:	00008067          	ret
        tren=tren->next;
    8000390c:	0004b483          	ld	s1,0(s1)
    while(tren!=nullptr){
    80003910:	fe0480e3          	beqz	s1,800038f0 <_ZN15MemoryAllocator8allocateEm+0x58>
        if(tren->size == my_size){
    80003914:	0104b783          	ld	a5,16(s1)
    80003918:	fb278ee3          	beq	a5,s2,800038d4 <_ZN15MemoryAllocator8allocateEm+0x3c>
        else if(tren->size > my_size){
    8000391c:	fef978e3          	bgeu	s2,a5,8000390c <_ZN15MemoryAllocator8allocateEm+0x74>
            discard_from_fl(tren);
    80003920:	00048513          	mv	a0,s1
    80003924:	00000097          	auipc	ra,0x0
    80003928:	e78080e7          	jalr	-392(ra) # 8000379c <_ZN15MemoryAllocator15discard_from_flEP11MemFragment>
            MemFragment* new_free_frag=(MemFragment*)( (char*)tren + MEM_BLOCK_SIZE + my_size);
    8000392c:	04090513          	addi	a0,s2,64
    80003930:	00a48533          	add	a0,s1,a0
            new_free_frag->size=(tren->size - MEM_BLOCK_SIZE - my_size);
    80003934:	0104b783          	ld	a5,16(s1)
    80003938:	412787b3          	sub	a5,a5,s2
    8000393c:	fc078793          	addi	a5,a5,-64
    80003940:	00f53823          	sd	a5,16(a0)
            new_free_frag->next= nullptr;
    80003944:	00053023          	sd	zero,0(a0)
            new_free_frag->prev= nullptr;
    80003948:	00053423          	sd	zero,8(a0)
            add_to_fl(new_free_frag);
    8000394c:	00000097          	auipc	ra,0x0
    80003950:	d3c080e7          	jalr	-708(ra) # 80003688 <_ZN15MemoryAllocator9add_to_flEP11MemFragment>
            tren->size=my_size;
    80003954:	0124b823          	sd	s2,16(s1)
            add_to_al(tren);
    80003958:	00048513          	mv	a0,s1
    8000395c:	00000097          	auipc	ra,0x0
    80003960:	ea8080e7          	jalr	-344(ra) # 80003804 <_ZN15MemoryAllocator9add_to_alEP11MemFragment>
            return (void*)((char*)tren + MEM_BLOCK_SIZE);
    80003964:	04048493          	addi	s1,s1,64
    80003968:	f89ff06f          	j	800038f0 <_ZN15MemoryAllocator8allocateEm+0x58>
    if(size<=0) return nullptr;
    8000396c:	00000493          	li	s1,0
    80003970:	f81ff06f          	j	800038f0 <_ZN15MemoryAllocator8allocateEm+0x58>

0000000080003974 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment>:

void MemoryAllocator::discard_from_al(MemFragment* fragment) {
    80003974:	ff010113          	addi	sp,sp,-16
    80003978:	00813423          	sd	s0,8(sp)
    8000397c:	01010413          	addi	s0,sp,16
    if(fragment==nullptr || allocated_head==nullptr) return;
    80003980:	02050863          	beqz	a0,800039b0 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment+0x3c>
    80003984:	00005797          	auipc	a5,0x5
    80003988:	5047b783          	ld	a5,1284(a5) # 80008e88 <_ZN15MemoryAllocator14allocated_headE>
    8000398c:	02078263          	beqz	a5,800039b0 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment+0x3c>

    if(fragment==allocated_head){
    80003990:	02a78663          	beq	a5,a0,800039bc <_ZN15MemoryAllocator15discard_from_alEP11MemFragment+0x48>
        fragment->next=nullptr;
        fragment->prev=nullptr;
        return;
    }

    MemFragment* levi = fragment->prev;
    80003994:	00853703          	ld	a4,8(a0)
    MemFragment* desni = fragment->next;
    80003998:	00053783          	ld	a5,0(a0)

    levi->next=desni;
    8000399c:	00f73023          	sd	a5,0(a4)
    if(desni != nullptr) desni->prev=levi;
    800039a0:	00078463          	beqz	a5,800039a8 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment+0x34>
    800039a4:	00e7b423          	sd	a4,8(a5)
    fragment->next=nullptr;
    800039a8:	00053023          	sd	zero,0(a0)
    fragment->prev=nullptr;
    800039ac:	00053423          	sd	zero,8(a0)
    return;
}
    800039b0:	00813403          	ld	s0,8(sp)
    800039b4:	01010113          	addi	sp,sp,16
    800039b8:	00008067          	ret
        allocated_head=allocated_head->next;
    800039bc:	0007b783          	ld	a5,0(a5)
    800039c0:	00005717          	auipc	a4,0x5
    800039c4:	4cf73423          	sd	a5,1224(a4) # 80008e88 <_ZN15MemoryAllocator14allocated_headE>
        if(allocated_head!=nullptr)allocated_head->prev=nullptr;
    800039c8:	00078463          	beqz	a5,800039d0 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment+0x5c>
    800039cc:	0007b423          	sd	zero,8(a5)
        fragment->next=nullptr;
    800039d0:	00053023          	sd	zero,0(a0)
        fragment->prev=nullptr;
    800039d4:	00053423          	sd	zero,8(a0)
        return;
    800039d8:	fd9ff06f          	j	800039b0 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment+0x3c>

00000000800039dc <_ZN15MemoryAllocator11free_memoryEPv>:
    if(ptr==nullptr) return -2;
    800039dc:	04050a63          	beqz	a0,80003a30 <_ZN15MemoryAllocator11free_memoryEPv+0x54>
int MemoryAllocator::free_memory(void* ptr) {
    800039e0:	fe010113          	addi	sp,sp,-32
    800039e4:	00113c23          	sd	ra,24(sp)
    800039e8:	00813823          	sd	s0,16(sp)
    800039ec:	00913423          	sd	s1,8(sp)
    800039f0:	02010413          	addi	s0,sp,32
    MemFragment* fragment=(MemFragment*)( (char*)(ptr) - MEM_BLOCK_SIZE);
    800039f4:	fc050493          	addi	s1,a0,-64
    if(!fragment->free){
    800039f8:	fd854783          	lbu	a5,-40(a0)
    800039fc:	02079e63          	bnez	a5,80003a38 <_ZN15MemoryAllocator11free_memoryEPv+0x5c>
        discard_from_al(fragment);
    80003a00:	00048513          	mv	a0,s1
    80003a04:	00000097          	auipc	ra,0x0
    80003a08:	f70080e7          	jalr	-144(ra) # 80003974 <_ZN15MemoryAllocator15discard_from_alEP11MemFragment>
        add_to_fl(fragment);
    80003a0c:	00048513          	mv	a0,s1
    80003a10:	00000097          	auipc	ra,0x0
    80003a14:	c78080e7          	jalr	-904(ra) # 80003688 <_ZN15MemoryAllocator9add_to_flEP11MemFragment>
        return 0;
    80003a18:	00000513          	li	a0,0
}
    80003a1c:	01813083          	ld	ra,24(sp)
    80003a20:	01013403          	ld	s0,16(sp)
    80003a24:	00813483          	ld	s1,8(sp)
    80003a28:	02010113          	addi	sp,sp,32
    80003a2c:	00008067          	ret
    if(ptr==nullptr) return -2;
    80003a30:	ffe00513          	li	a0,-2
}
    80003a34:	00008067          	ret
    return -4;
    80003a38:	ffc00513          	li	a0,-4
    80003a3c:	fe1ff06f          	j	80003a1c <_ZN15MemoryAllocator11free_memoryEPv+0x40>

0000000080003a40 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80003a40:	fe010113          	addi	sp,sp,-32
    80003a44:	00113c23          	sd	ra,24(sp)
    80003a48:	00813823          	sd	s0,16(sp)
    80003a4c:	00913423          	sd	s1,8(sp)
    80003a50:	02010413          	addi	s0,sp,32
    80003a54:	00050493          	mv	s1,a0
    LOCK();
    80003a58:	00100613          	li	a2,1
    80003a5c:	00000593          	li	a1,0
    80003a60:	00005517          	auipc	a0,0x5
    80003a64:	43050513          	addi	a0,a0,1072 # 80008e90 <lockPrint>
    80003a68:	ffffd097          	auipc	ra,0xffffd
    80003a6c:	6dc080e7          	jalr	1756(ra) # 80001144 <copy_and_swap>
    80003a70:	fe0514e3          	bnez	a0,80003a58 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003a74:	0004c503          	lbu	a0,0(s1)
    80003a78:	00050a63          	beqz	a0,80003a8c <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80003a7c:	ffffe097          	auipc	ra,0xffffe
    80003a80:	ad8080e7          	jalr	-1320(ra) # 80001554 <_Z4putcc>
        string++;
    80003a84:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003a88:	fedff06f          	j	80003a74 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80003a8c:	00000613          	li	a2,0
    80003a90:	00100593          	li	a1,1
    80003a94:	00005517          	auipc	a0,0x5
    80003a98:	3fc50513          	addi	a0,a0,1020 # 80008e90 <lockPrint>
    80003a9c:	ffffd097          	auipc	ra,0xffffd
    80003aa0:	6a8080e7          	jalr	1704(ra) # 80001144 <copy_and_swap>
    80003aa4:	fe0514e3          	bnez	a0,80003a8c <_Z11printStringPKc+0x4c>
}
    80003aa8:	01813083          	ld	ra,24(sp)
    80003aac:	01013403          	ld	s0,16(sp)
    80003ab0:	00813483          	ld	s1,8(sp)
    80003ab4:	02010113          	addi	sp,sp,32
    80003ab8:	00008067          	ret

0000000080003abc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003abc:	fd010113          	addi	sp,sp,-48
    80003ac0:	02113423          	sd	ra,40(sp)
    80003ac4:	02813023          	sd	s0,32(sp)
    80003ac8:	00913c23          	sd	s1,24(sp)
    80003acc:	01213823          	sd	s2,16(sp)
    80003ad0:	01313423          	sd	s3,8(sp)
    80003ad4:	01413023          	sd	s4,0(sp)
    80003ad8:	03010413          	addi	s0,sp,48
    80003adc:	00050993          	mv	s3,a0
    80003ae0:	00058a13          	mv	s4,a1
    LOCK();
    80003ae4:	00100613          	li	a2,1
    80003ae8:	00000593          	li	a1,0
    80003aec:	00005517          	auipc	a0,0x5
    80003af0:	3a450513          	addi	a0,a0,932 # 80008e90 <lockPrint>
    80003af4:	ffffd097          	auipc	ra,0xffffd
    80003af8:	650080e7          	jalr	1616(ra) # 80001144 <copy_and_swap>
    80003afc:	fe0514e3          	bnez	a0,80003ae4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003b00:	00000913          	li	s2,0
    80003b04:	00090493          	mv	s1,s2
    80003b08:	0019091b          	addiw	s2,s2,1
    80003b0c:	03495a63          	bge	s2,s4,80003b40 <_Z9getStringPci+0x84>
        cc = getc();
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	a18080e7          	jalr	-1512(ra) # 80001528 <_Z4getcv>
        if(cc < 1)
    80003b18:	02050463          	beqz	a0,80003b40 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80003b1c:	009984b3          	add	s1,s3,s1
    80003b20:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80003b24:	00a00793          	li	a5,10
    80003b28:	00f50a63          	beq	a0,a5,80003b3c <_Z9getStringPci+0x80>
    80003b2c:	00d00793          	li	a5,13
    80003b30:	fcf51ae3          	bne	a0,a5,80003b04 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80003b34:	00090493          	mv	s1,s2
    80003b38:	0080006f          	j	80003b40 <_Z9getStringPci+0x84>
    80003b3c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80003b40:	009984b3          	add	s1,s3,s1
    80003b44:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80003b48:	00000613          	li	a2,0
    80003b4c:	00100593          	li	a1,1
    80003b50:	00005517          	auipc	a0,0x5
    80003b54:	34050513          	addi	a0,a0,832 # 80008e90 <lockPrint>
    80003b58:	ffffd097          	auipc	ra,0xffffd
    80003b5c:	5ec080e7          	jalr	1516(ra) # 80001144 <copy_and_swap>
    80003b60:	fe0514e3          	bnez	a0,80003b48 <_Z9getStringPci+0x8c>
    return buf;
}
    80003b64:	00098513          	mv	a0,s3
    80003b68:	02813083          	ld	ra,40(sp)
    80003b6c:	02013403          	ld	s0,32(sp)
    80003b70:	01813483          	ld	s1,24(sp)
    80003b74:	01013903          	ld	s2,16(sp)
    80003b78:	00813983          	ld	s3,8(sp)
    80003b7c:	00013a03          	ld	s4,0(sp)
    80003b80:	03010113          	addi	sp,sp,48
    80003b84:	00008067          	ret

0000000080003b88 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003b88:	ff010113          	addi	sp,sp,-16
    80003b8c:	00813423          	sd	s0,8(sp)
    80003b90:	01010413          	addi	s0,sp,16
    80003b94:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003b98:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003b9c:	0006c603          	lbu	a2,0(a3)
    80003ba0:	fd06071b          	addiw	a4,a2,-48
    80003ba4:	0ff77713          	andi	a4,a4,255
    80003ba8:	00900793          	li	a5,9
    80003bac:	02e7e063          	bltu	a5,a4,80003bcc <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003bb0:	0025179b          	slliw	a5,a0,0x2
    80003bb4:	00a787bb          	addw	a5,a5,a0
    80003bb8:	0017979b          	slliw	a5,a5,0x1
    80003bbc:	00168693          	addi	a3,a3,1
    80003bc0:	00c787bb          	addw	a5,a5,a2
    80003bc4:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003bc8:	fd5ff06f          	j	80003b9c <_Z11stringToIntPKc+0x14>
    return n;
}
    80003bcc:	00813403          	ld	s0,8(sp)
    80003bd0:	01010113          	addi	sp,sp,16
    80003bd4:	00008067          	ret

0000000080003bd8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003bd8:	fc010113          	addi	sp,sp,-64
    80003bdc:	02113c23          	sd	ra,56(sp)
    80003be0:	02813823          	sd	s0,48(sp)
    80003be4:	02913423          	sd	s1,40(sp)
    80003be8:	03213023          	sd	s2,32(sp)
    80003bec:	01313c23          	sd	s3,24(sp)
    80003bf0:	04010413          	addi	s0,sp,64
    80003bf4:	00050493          	mv	s1,a0
    80003bf8:	00058913          	mv	s2,a1
    80003bfc:	00060993          	mv	s3,a2
    LOCK();
    80003c00:	00100613          	li	a2,1
    80003c04:	00000593          	li	a1,0
    80003c08:	00005517          	auipc	a0,0x5
    80003c0c:	28850513          	addi	a0,a0,648 # 80008e90 <lockPrint>
    80003c10:	ffffd097          	auipc	ra,0xffffd
    80003c14:	534080e7          	jalr	1332(ra) # 80001144 <copy_and_swap>
    80003c18:	fe0514e3          	bnez	a0,80003c00 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003c1c:	00098463          	beqz	s3,80003c24 <_Z8printIntiii+0x4c>
    80003c20:	0804c463          	bltz	s1,80003ca8 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003c24:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003c28:	00000593          	li	a1,0
    }

    i = 0;
    80003c2c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003c30:	0009079b          	sext.w	a5,s2
    80003c34:	0325773b          	remuw	a4,a0,s2
    80003c38:	00048613          	mv	a2,s1
    80003c3c:	0014849b          	addiw	s1,s1,1
    80003c40:	02071693          	slli	a3,a4,0x20
    80003c44:	0206d693          	srli	a3,a3,0x20
    80003c48:	00005717          	auipc	a4,0x5
    80003c4c:	04870713          	addi	a4,a4,72 # 80008c90 <digits>
    80003c50:	00d70733          	add	a4,a4,a3
    80003c54:	00074683          	lbu	a3,0(a4)
    80003c58:	fd040713          	addi	a4,s0,-48
    80003c5c:	00c70733          	add	a4,a4,a2
    80003c60:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003c64:	0005071b          	sext.w	a4,a0
    80003c68:	0325553b          	divuw	a0,a0,s2
    80003c6c:	fcf772e3          	bgeu	a4,a5,80003c30 <_Z8printIntiii+0x58>
    if(neg)
    80003c70:	00058c63          	beqz	a1,80003c88 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80003c74:	fd040793          	addi	a5,s0,-48
    80003c78:	009784b3          	add	s1,a5,s1
    80003c7c:	02d00793          	li	a5,45
    80003c80:	fef48823          	sb	a5,-16(s1)
    80003c84:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003c88:	fff4849b          	addiw	s1,s1,-1
    80003c8c:	0204c463          	bltz	s1,80003cb4 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80003c90:	fd040793          	addi	a5,s0,-48
    80003c94:	009787b3          	add	a5,a5,s1
    80003c98:	ff07c503          	lbu	a0,-16(a5)
    80003c9c:	ffffe097          	auipc	ra,0xffffe
    80003ca0:	8b8080e7          	jalr	-1864(ra) # 80001554 <_Z4putcc>
    80003ca4:	fe5ff06f          	j	80003c88 <_Z8printIntiii+0xb0>
        x = -xx;
    80003ca8:	4090053b          	negw	a0,s1
        neg = 1;
    80003cac:	00100593          	li	a1,1
        x = -xx;
    80003cb0:	f7dff06f          	j	80003c2c <_Z8printIntiii+0x54>

    UNLOCK();
    80003cb4:	00000613          	li	a2,0
    80003cb8:	00100593          	li	a1,1
    80003cbc:	00005517          	auipc	a0,0x5
    80003cc0:	1d450513          	addi	a0,a0,468 # 80008e90 <lockPrint>
    80003cc4:	ffffd097          	auipc	ra,0xffffd
    80003cc8:	480080e7          	jalr	1152(ra) # 80001144 <copy_and_swap>
    80003ccc:	fe0514e3          	bnez	a0,80003cb4 <_Z8printIntiii+0xdc>
}
    80003cd0:	03813083          	ld	ra,56(sp)
    80003cd4:	03013403          	ld	s0,48(sp)
    80003cd8:	02813483          	ld	s1,40(sp)
    80003cdc:	02013903          	ld	s2,32(sp)
    80003ce0:	01813983          	ld	s3,24(sp)
    80003ce4:	04010113          	addi	sp,sp,64
    80003ce8:	00008067          	ret

0000000080003cec <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003cec:	fd010113          	addi	sp,sp,-48
    80003cf0:	02113423          	sd	ra,40(sp)
    80003cf4:	02813023          	sd	s0,32(sp)
    80003cf8:	00913c23          	sd	s1,24(sp)
    80003cfc:	01213823          	sd	s2,16(sp)
    80003d00:	01313423          	sd	s3,8(sp)
    80003d04:	03010413          	addi	s0,sp,48
    80003d08:	00050493          	mv	s1,a0
    80003d0c:	00058913          	mv	s2,a1
    80003d10:	0015879b          	addiw	a5,a1,1
    80003d14:	0007851b          	sext.w	a0,a5
    80003d18:	00f4a023          	sw	a5,0(s1)
    80003d1c:	0004a823          	sw	zero,16(s1)
    80003d20:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003d24:	00251513          	slli	a0,a0,0x2
    80003d28:	ffffd097          	auipc	ra,0xffffd
    80003d2c:	470080e7          	jalr	1136(ra) # 80001198 <_Z9mem_allocm>
    80003d30:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80003d34:	01000513          	li	a0,16
    80003d38:	fffff097          	auipc	ra,0xfffff
    80003d3c:	864080e7          	jalr	-1948(ra) # 8000259c <_Znwm>
    80003d40:	00050993          	mv	s3,a0
    80003d44:	00000593          	li	a1,0
    80003d48:	ffffe097          	auipc	ra,0xffffe
    80003d4c:	944080e7          	jalr	-1724(ra) # 8000168c <_ZN9SemaphoreC1Ej>
    80003d50:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80003d54:	01000513          	li	a0,16
    80003d58:	fffff097          	auipc	ra,0xfffff
    80003d5c:	844080e7          	jalr	-1980(ra) # 8000259c <_Znwm>
    80003d60:	00050993          	mv	s3,a0
    80003d64:	00090593          	mv	a1,s2
    80003d68:	ffffe097          	auipc	ra,0xffffe
    80003d6c:	924080e7          	jalr	-1756(ra) # 8000168c <_ZN9SemaphoreC1Ej>
    80003d70:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80003d74:	01000513          	li	a0,16
    80003d78:	fffff097          	auipc	ra,0xfffff
    80003d7c:	824080e7          	jalr	-2012(ra) # 8000259c <_Znwm>
    80003d80:	00050913          	mv	s2,a0
    80003d84:	00100593          	li	a1,1
    80003d88:	ffffe097          	auipc	ra,0xffffe
    80003d8c:	904080e7          	jalr	-1788(ra) # 8000168c <_ZN9SemaphoreC1Ej>
    80003d90:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80003d94:	01000513          	li	a0,16
    80003d98:	fffff097          	auipc	ra,0xfffff
    80003d9c:	804080e7          	jalr	-2044(ra) # 8000259c <_Znwm>
    80003da0:	00050913          	mv	s2,a0
    80003da4:	00100593          	li	a1,1
    80003da8:	ffffe097          	auipc	ra,0xffffe
    80003dac:	8e4080e7          	jalr	-1820(ra) # 8000168c <_ZN9SemaphoreC1Ej>
    80003db0:	0324b823          	sd	s2,48(s1)
}
    80003db4:	02813083          	ld	ra,40(sp)
    80003db8:	02013403          	ld	s0,32(sp)
    80003dbc:	01813483          	ld	s1,24(sp)
    80003dc0:	01013903          	ld	s2,16(sp)
    80003dc4:	00813983          	ld	s3,8(sp)
    80003dc8:	03010113          	addi	sp,sp,48
    80003dcc:	00008067          	ret
    80003dd0:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80003dd4:	00098513          	mv	a0,s3
    80003dd8:	fffff097          	auipc	ra,0xfffff
    80003ddc:	814080e7          	jalr	-2028(ra) # 800025ec <_ZdlPv>
    80003de0:	00048513          	mv	a0,s1
    80003de4:	00006097          	auipc	ra,0x6
    80003de8:	194080e7          	jalr	404(ra) # 80009f78 <_Unwind_Resume>
    80003dec:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80003df0:	00098513          	mv	a0,s3
    80003df4:	ffffe097          	auipc	ra,0xffffe
    80003df8:	7f8080e7          	jalr	2040(ra) # 800025ec <_ZdlPv>
    80003dfc:	00048513          	mv	a0,s1
    80003e00:	00006097          	auipc	ra,0x6
    80003e04:	178080e7          	jalr	376(ra) # 80009f78 <_Unwind_Resume>
    80003e08:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003e0c:	00090513          	mv	a0,s2
    80003e10:	ffffe097          	auipc	ra,0xffffe
    80003e14:	7dc080e7          	jalr	2012(ra) # 800025ec <_ZdlPv>
    80003e18:	00048513          	mv	a0,s1
    80003e1c:	00006097          	auipc	ra,0x6
    80003e20:	15c080e7          	jalr	348(ra) # 80009f78 <_Unwind_Resume>
    80003e24:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80003e28:	00090513          	mv	a0,s2
    80003e2c:	ffffe097          	auipc	ra,0xffffe
    80003e30:	7c0080e7          	jalr	1984(ra) # 800025ec <_ZdlPv>
    80003e34:	00048513          	mv	a0,s1
    80003e38:	00006097          	auipc	ra,0x6
    80003e3c:	140080e7          	jalr	320(ra) # 80009f78 <_Unwind_Resume>

0000000080003e40 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80003e40:	fe010113          	addi	sp,sp,-32
    80003e44:	00113c23          	sd	ra,24(sp)
    80003e48:	00813823          	sd	s0,16(sp)
    80003e4c:	00913423          	sd	s1,8(sp)
    80003e50:	01213023          	sd	s2,0(sp)
    80003e54:	02010413          	addi	s0,sp,32
    80003e58:	00050493          	mv	s1,a0
    80003e5c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80003e60:	01853503          	ld	a0,24(a0)
    80003e64:	ffffe097          	auipc	ra,0xffffe
    80003e68:	860080e7          	jalr	-1952(ra) # 800016c4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80003e6c:	0304b503          	ld	a0,48(s1)
    80003e70:	ffffe097          	auipc	ra,0xffffe
    80003e74:	854080e7          	jalr	-1964(ra) # 800016c4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80003e78:	0084b783          	ld	a5,8(s1)
    80003e7c:	0144a703          	lw	a4,20(s1)
    80003e80:	00271713          	slli	a4,a4,0x2
    80003e84:	00e787b3          	add	a5,a5,a4
    80003e88:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003e8c:	0144a783          	lw	a5,20(s1)
    80003e90:	0017879b          	addiw	a5,a5,1
    80003e94:	0004a703          	lw	a4,0(s1)
    80003e98:	02e7e7bb          	remw	a5,a5,a4
    80003e9c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80003ea0:	0304b503          	ld	a0,48(s1)
    80003ea4:	ffffe097          	auipc	ra,0xffffe
    80003ea8:	84c080e7          	jalr	-1972(ra) # 800016f0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80003eac:	0204b503          	ld	a0,32(s1)
    80003eb0:	ffffe097          	auipc	ra,0xffffe
    80003eb4:	840080e7          	jalr	-1984(ra) # 800016f0 <_ZN9Semaphore6signalEv>

}
    80003eb8:	01813083          	ld	ra,24(sp)
    80003ebc:	01013403          	ld	s0,16(sp)
    80003ec0:	00813483          	ld	s1,8(sp)
    80003ec4:	00013903          	ld	s2,0(sp)
    80003ec8:	02010113          	addi	sp,sp,32
    80003ecc:	00008067          	ret

0000000080003ed0 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80003ed0:	fe010113          	addi	sp,sp,-32
    80003ed4:	00113c23          	sd	ra,24(sp)
    80003ed8:	00813823          	sd	s0,16(sp)
    80003edc:	00913423          	sd	s1,8(sp)
    80003ee0:	01213023          	sd	s2,0(sp)
    80003ee4:	02010413          	addi	s0,sp,32
    80003ee8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80003eec:	02053503          	ld	a0,32(a0)
    80003ef0:	ffffd097          	auipc	ra,0xffffd
    80003ef4:	7d4080e7          	jalr	2004(ra) # 800016c4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80003ef8:	0284b503          	ld	a0,40(s1)
    80003efc:	ffffd097          	auipc	ra,0xffffd
    80003f00:	7c8080e7          	jalr	1992(ra) # 800016c4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80003f04:	0084b703          	ld	a4,8(s1)
    80003f08:	0104a783          	lw	a5,16(s1)
    80003f0c:	00279693          	slli	a3,a5,0x2
    80003f10:	00d70733          	add	a4,a4,a3
    80003f14:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003f18:	0017879b          	addiw	a5,a5,1
    80003f1c:	0004a703          	lw	a4,0(s1)
    80003f20:	02e7e7bb          	remw	a5,a5,a4
    80003f24:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80003f28:	0284b503          	ld	a0,40(s1)
    80003f2c:	ffffd097          	auipc	ra,0xffffd
    80003f30:	7c4080e7          	jalr	1988(ra) # 800016f0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80003f34:	0184b503          	ld	a0,24(s1)
    80003f38:	ffffd097          	auipc	ra,0xffffd
    80003f3c:	7b8080e7          	jalr	1976(ra) # 800016f0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80003f40:	00090513          	mv	a0,s2
    80003f44:	01813083          	ld	ra,24(sp)
    80003f48:	01013403          	ld	s0,16(sp)
    80003f4c:	00813483          	ld	s1,8(sp)
    80003f50:	00013903          	ld	s2,0(sp)
    80003f54:	02010113          	addi	sp,sp,32
    80003f58:	00008067          	ret

0000000080003f5c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80003f5c:	fe010113          	addi	sp,sp,-32
    80003f60:	00113c23          	sd	ra,24(sp)
    80003f64:	00813823          	sd	s0,16(sp)
    80003f68:	00913423          	sd	s1,8(sp)
    80003f6c:	01213023          	sd	s2,0(sp)
    80003f70:	02010413          	addi	s0,sp,32
    80003f74:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80003f78:	02853503          	ld	a0,40(a0)
    80003f7c:	ffffd097          	auipc	ra,0xffffd
    80003f80:	748080e7          	jalr	1864(ra) # 800016c4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80003f84:	0304b503          	ld	a0,48(s1)
    80003f88:	ffffd097          	auipc	ra,0xffffd
    80003f8c:	73c080e7          	jalr	1852(ra) # 800016c4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80003f90:	0144a783          	lw	a5,20(s1)
    80003f94:	0104a903          	lw	s2,16(s1)
    80003f98:	0327ce63          	blt	a5,s2,80003fd4 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80003f9c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80003fa0:	0304b503          	ld	a0,48(s1)
    80003fa4:	ffffd097          	auipc	ra,0xffffd
    80003fa8:	74c080e7          	jalr	1868(ra) # 800016f0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80003fac:	0284b503          	ld	a0,40(s1)
    80003fb0:	ffffd097          	auipc	ra,0xffffd
    80003fb4:	740080e7          	jalr	1856(ra) # 800016f0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80003fb8:	00090513          	mv	a0,s2
    80003fbc:	01813083          	ld	ra,24(sp)
    80003fc0:	01013403          	ld	s0,16(sp)
    80003fc4:	00813483          	ld	s1,8(sp)
    80003fc8:	00013903          	ld	s2,0(sp)
    80003fcc:	02010113          	addi	sp,sp,32
    80003fd0:	00008067          	ret
        ret = cap - head + tail;
    80003fd4:	0004a703          	lw	a4,0(s1)
    80003fd8:	4127093b          	subw	s2,a4,s2
    80003fdc:	00f9093b          	addw	s2,s2,a5
    80003fe0:	fc1ff06f          	j	80003fa0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080003fe4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80003fe4:	fe010113          	addi	sp,sp,-32
    80003fe8:	00113c23          	sd	ra,24(sp)
    80003fec:	00813823          	sd	s0,16(sp)
    80003ff0:	00913423          	sd	s1,8(sp)
    80003ff4:	02010413          	addi	s0,sp,32
    80003ff8:	00050493          	mv	s1,a0
    Console::putc('\n');
    80003ffc:	00a00513          	li	a0,10
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	91c080e7          	jalr	-1764(ra) # 8000191c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004008:	00003517          	auipc	a0,0x3
    8000400c:	1e050513          	addi	a0,a0,480 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80004010:	00000097          	auipc	ra,0x0
    80004014:	a30080e7          	jalr	-1488(ra) # 80003a40 <_Z11printStringPKc>
    while (getCnt()) {
    80004018:	00048513          	mv	a0,s1
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	f40080e7          	jalr	-192(ra) # 80003f5c <_ZN9BufferCPP6getCntEv>
    80004024:	02050c63          	beqz	a0,8000405c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004028:	0084b783          	ld	a5,8(s1)
    8000402c:	0104a703          	lw	a4,16(s1)
    80004030:	00271713          	slli	a4,a4,0x2
    80004034:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004038:	0007c503          	lbu	a0,0(a5)
    8000403c:	ffffe097          	auipc	ra,0xffffe
    80004040:	8e0080e7          	jalr	-1824(ra) # 8000191c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80004044:	0104a783          	lw	a5,16(s1)
    80004048:	0017879b          	addiw	a5,a5,1
    8000404c:	0004a703          	lw	a4,0(s1)
    80004050:	02e7e7bb          	remw	a5,a5,a4
    80004054:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004058:	fc1ff06f          	j	80004018 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    8000405c:	02100513          	li	a0,33
    80004060:	ffffe097          	auipc	ra,0xffffe
    80004064:	8bc080e7          	jalr	-1860(ra) # 8000191c <_ZN7Console4putcEc>
    Console::putc('\n');
    80004068:	00a00513          	li	a0,10
    8000406c:	ffffe097          	auipc	ra,0xffffe
    80004070:	8b0080e7          	jalr	-1872(ra) # 8000191c <_ZN7Console4putcEc>
    mem_free(buffer);
    80004074:	0084b503          	ld	a0,8(s1)
    80004078:	ffffd097          	auipc	ra,0xffffd
    8000407c:	168080e7          	jalr	360(ra) # 800011e0 <_Z8mem_freePv>
    delete itemAvailable;
    80004080:	0204b503          	ld	a0,32(s1)
    80004084:	00050863          	beqz	a0,80004094 <_ZN9BufferCPPD1Ev+0xb0>
    80004088:	00053783          	ld	a5,0(a0)
    8000408c:	0087b783          	ld	a5,8(a5)
    80004090:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004094:	0184b503          	ld	a0,24(s1)
    80004098:	00050863          	beqz	a0,800040a8 <_ZN9BufferCPPD1Ev+0xc4>
    8000409c:	00053783          	ld	a5,0(a0)
    800040a0:	0087b783          	ld	a5,8(a5)
    800040a4:	000780e7          	jalr	a5
    delete mutexTail;
    800040a8:	0304b503          	ld	a0,48(s1)
    800040ac:	00050863          	beqz	a0,800040bc <_ZN9BufferCPPD1Ev+0xd8>
    800040b0:	00053783          	ld	a5,0(a0)
    800040b4:	0087b783          	ld	a5,8(a5)
    800040b8:	000780e7          	jalr	a5
    delete mutexHead;
    800040bc:	0284b503          	ld	a0,40(s1)
    800040c0:	00050863          	beqz	a0,800040d0 <_ZN9BufferCPPD1Ev+0xec>
    800040c4:	00053783          	ld	a5,0(a0)
    800040c8:	0087b783          	ld	a5,8(a5)
    800040cc:	000780e7          	jalr	a5
}
    800040d0:	01813083          	ld	ra,24(sp)
    800040d4:	01013403          	ld	s0,16(sp)
    800040d8:	00813483          	ld	s1,8(sp)
    800040dc:	02010113          	addi	sp,sp,32
    800040e0:	00008067          	ret

00000000800040e4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    800040e4:	f8010113          	addi	sp,sp,-128
    800040e8:	06113c23          	sd	ra,120(sp)
    800040ec:	06813823          	sd	s0,112(sp)
    800040f0:	06913423          	sd	s1,104(sp)
    800040f4:	07213023          	sd	s2,96(sp)
    800040f8:	05313c23          	sd	s3,88(sp)
    800040fc:	05413823          	sd	s4,80(sp)
    80004100:	05513423          	sd	s5,72(sp)
    80004104:	05613023          	sd	s6,64(sp)
    80004108:	03713c23          	sd	s7,56(sp)
    8000410c:	03813823          	sd	s8,48(sp)
    80004110:	03913423          	sd	s9,40(sp)
    80004114:	08010413          	addi	s0,sp,128
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    80004118:	00010c13          	mv	s8,sp
        printString("Unesite broj proizvodjaca?\n");
    8000411c:	00003517          	auipc	a0,0x3
    80004120:	0e450513          	addi	a0,a0,228 # 80007200 <CONSOLE_STATUS+0x1f0>
    80004124:	00000097          	auipc	ra,0x0
    80004128:	91c080e7          	jalr	-1764(ra) # 80003a40 <_Z11printStringPKc>
        getString(input, 30);
    8000412c:	01e00593          	li	a1,30
    80004130:	f8040493          	addi	s1,s0,-128
    80004134:	00048513          	mv	a0,s1
    80004138:	00000097          	auipc	ra,0x0
    8000413c:	984080e7          	jalr	-1660(ra) # 80003abc <_Z9getStringPci>
        threadNum = stringToInt(input);
    80004140:	00048513          	mv	a0,s1
    80004144:	00000097          	auipc	ra,0x0
    80004148:	a44080e7          	jalr	-1468(ra) # 80003b88 <_Z11stringToIntPKc>
    8000414c:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    80004150:	00003517          	auipc	a0,0x3
    80004154:	0d050513          	addi	a0,a0,208 # 80007220 <CONSOLE_STATUS+0x210>
    80004158:	00000097          	auipc	ra,0x0
    8000415c:	8e8080e7          	jalr	-1816(ra) # 80003a40 <_Z11printStringPKc>
        getString(input, 30);
    80004160:	01e00593          	li	a1,30
    80004164:	00048513          	mv	a0,s1
    80004168:	00000097          	auipc	ra,0x0
    8000416c:	954080e7          	jalr	-1708(ra) # 80003abc <_Z9getStringPci>
        n = stringToInt(input);
    80004170:	00048513          	mv	a0,s1
    80004174:	00000097          	auipc	ra,0x0
    80004178:	a14080e7          	jalr	-1516(ra) # 80003b88 <_Z11stringToIntPKc>
    8000417c:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    80004180:	00003517          	auipc	a0,0x3
    80004184:	0c050513          	addi	a0,a0,192 # 80007240 <CONSOLE_STATUS+0x230>
    80004188:	00000097          	auipc	ra,0x0
    8000418c:	8b8080e7          	jalr	-1864(ra) # 80003a40 <_Z11printStringPKc>
    80004190:	00000613          	li	a2,0
    80004194:	00a00593          	li	a1,10
    80004198:	00098513          	mv	a0,s3
    8000419c:	00000097          	auipc	ra,0x0
    800041a0:	a3c080e7          	jalr	-1476(ra) # 80003bd8 <_Z8printIntiii>
        printString(" i velicina bafera "); printInt(n);
    800041a4:	00003517          	auipc	a0,0x3
    800041a8:	0b450513          	addi	a0,a0,180 # 80007258 <CONSOLE_STATUS+0x248>
    800041ac:	00000097          	auipc	ra,0x0
    800041b0:	894080e7          	jalr	-1900(ra) # 80003a40 <_Z11printStringPKc>
    800041b4:	00000613          	li	a2,0
    800041b8:	00a00593          	li	a1,10
    800041bc:	00048513          	mv	a0,s1
    800041c0:	00000097          	auipc	ra,0x0
    800041c4:	a18080e7          	jalr	-1512(ra) # 80003bd8 <_Z8printIntiii>
        printString(".\n");
    800041c8:	00003517          	auipc	a0,0x3
    800041cc:	0a850513          	addi	a0,a0,168 # 80007270 <CONSOLE_STATUS+0x260>
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	870080e7          	jalr	-1936(ra) # 80003a40 <_Z11printStringPKc>
        if(threadNum > n) {
    800041d8:	0334c463          	blt	s1,s3,80004200 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x11c>
        } else if (threadNum < 1) {
    800041dc:	03305c63          	blez	s3,80004214 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x130>
        BufferCPP *buffer = new BufferCPP(n);
    800041e0:	03800513          	li	a0,56
    800041e4:	ffffe097          	auipc	ra,0xffffe
    800041e8:	3b8080e7          	jalr	952(ra) # 8000259c <_Znwm>
    800041ec:	00050a93          	mv	s5,a0
    800041f0:	00048593          	mv	a1,s1
    800041f4:	00000097          	auipc	ra,0x0
    800041f8:	af8080e7          	jalr	-1288(ra) # 80003cec <_ZN9BufferCPPC1Ei>
    800041fc:	0300006f          	j	8000422c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x148>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004200:	00003517          	auipc	a0,0x3
    80004204:	07850513          	addi	a0,a0,120 # 80007278 <CONSOLE_STATUS+0x268>
    80004208:	00000097          	auipc	ra,0x0
    8000420c:	838080e7          	jalr	-1992(ra) # 80003a40 <_Z11printStringPKc>
            return;
    80004210:	0140006f          	j	80004224 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x140>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004214:	00003517          	auipc	a0,0x3
    80004218:	0a450513          	addi	a0,a0,164 # 800072b8 <CONSOLE_STATUS+0x2a8>
    8000421c:	00000097          	auipc	ra,0x0
    80004220:	824080e7          	jalr	-2012(ra) # 80003a40 <_Z11printStringPKc>
            return;
    80004224:	000c0113          	mv	sp,s8
    80004228:	21c0006f          	j	80004444 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x360>
        waitForAll = new Semaphore(0);
    8000422c:	01000513          	li	a0,16
    80004230:	ffffe097          	auipc	ra,0xffffe
    80004234:	36c080e7          	jalr	876(ra) # 8000259c <_Znwm>
    80004238:	00050493          	mv	s1,a0
    8000423c:	00000593          	li	a1,0
    80004240:	ffffd097          	auipc	ra,0xffffd
    80004244:	44c080e7          	jalr	1100(ra) # 8000168c <_ZN9SemaphoreC1Ej>
    80004248:	00005717          	auipc	a4,0x5
    8000424c:	c5070713          	addi	a4,a4,-944 # 80008e98 <_ZN19ConsumerProducerCPP9threadEndE>
    80004250:	00973423          	sd	s1,8(a4)
        Thread *producers[threadNum];
    80004254:	00399793          	slli	a5,s3,0x3
    80004258:	00f78793          	addi	a5,a5,15
    8000425c:	ff07f793          	andi	a5,a5,-16
    80004260:	40f10133          	sub	sp,sp,a5
    80004264:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    80004268:	0019869b          	addiw	a3,s3,1
    8000426c:	00169793          	slli	a5,a3,0x1
    80004270:	00d787b3          	add	a5,a5,a3
    80004274:	00379793          	slli	a5,a5,0x3
    80004278:	00f78793          	addi	a5,a5,15
    8000427c:	ff07f793          	andi	a5,a5,-16
    80004280:	40f10133          	sub	sp,sp,a5
    80004284:	00010b13          	mv	s6,sp
        threadData[threadNum].id = threadNum;
    80004288:	00199493          	slli	s1,s3,0x1
    8000428c:	013484b3          	add	s1,s1,s3
    80004290:	00349493          	slli	s1,s1,0x3
    80004294:	009b04b3          	add	s1,s6,s1
    80004298:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    8000429c:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    800042a0:	00873783          	ld	a5,8(a4)
    800042a4:	00f4b823          	sd	a5,16(s1)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    800042a8:	01800513          	li	a0,24
    800042ac:	ffffe097          	auipc	ra,0xffffe
    800042b0:	2f0080e7          	jalr	752(ra) # 8000259c <_Znwm>
    800042b4:	00050b93          	mv	s7,a0
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    800042b8:	ffffd097          	auipc	ra,0xffffd
    800042bc:	5e0080e7          	jalr	1504(ra) # 80001898 <_ZN6ThreadC1Ev>
    800042c0:	00005797          	auipc	a5,0x5
    800042c4:	a4878793          	addi	a5,a5,-1464 # 80008d08 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    800042c8:	00fbb023          	sd	a5,0(s7)
    800042cc:	009bb823          	sd	s1,16(s7)
        consumer->start();
    800042d0:	000b8513          	mv	a0,s7
    800042d4:	ffffd097          	auipc	ra,0xffffd
    800042d8:	548080e7          	jalr	1352(ra) # 8000181c <_ZN6Thread5startEv>
        threadData[0].id = 0;
    800042dc:	000b2023          	sw	zero,0(s6)
        threadData[0].buffer = buffer;
    800042e0:	015b3423          	sd	s5,8(s6)
        threadData[0].sem = waitForAll;
    800042e4:	00005797          	auipc	a5,0x5
    800042e8:	bbc7b783          	ld	a5,-1092(a5) # 80008ea0 <_ZN19ConsumerProducerCPP10waitForAllE>
    800042ec:	00fb3823          	sd	a5,16(s6)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    800042f0:	01800513          	li	a0,24
    800042f4:	ffffe097          	auipc	ra,0xffffe
    800042f8:	2a8080e7          	jalr	680(ra) # 8000259c <_Znwm>
    800042fc:	00050493          	mv	s1,a0
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004300:	ffffd097          	auipc	ra,0xffffd
    80004304:	598080e7          	jalr	1432(ra) # 80001898 <_ZN6ThreadC1Ev>
    80004308:	00005797          	auipc	a5,0x5
    8000430c:	9b078793          	addi	a5,a5,-1616 # 80008cb8 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80004310:	00f4b023          	sd	a5,0(s1)
    80004314:	0164b823          	sd	s6,16(s1)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80004318:	009a3023          	sd	s1,0(s4)
        producers[0]->start();
    8000431c:	00048513          	mv	a0,s1
    80004320:	ffffd097          	auipc	ra,0xffffd
    80004324:	4fc080e7          	jalr	1276(ra) # 8000181c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80004328:	00100913          	li	s2,1
    8000432c:	0300006f          	j	8000435c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x278>
        Producer(thread_data *_td) : Thread(), td(_td) {}
    80004330:	00005797          	auipc	a5,0x5
    80004334:	9b078793          	addi	a5,a5,-1616 # 80008ce0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80004338:	00fcb023          	sd	a5,0(s9)
    8000433c:	009cb823          	sd	s1,16(s9)
            producers[i] = new Producer(&threadData[i]);
    80004340:	00391793          	slli	a5,s2,0x3
    80004344:	00fa07b3          	add	a5,s4,a5
    80004348:	0197b023          	sd	s9,0(a5)
            producers[i]->start();
    8000434c:	000c8513          	mv	a0,s9
    80004350:	ffffd097          	auipc	ra,0xffffd
    80004354:	4cc080e7          	jalr	1228(ra) # 8000181c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80004358:	0019091b          	addiw	s2,s2,1
    8000435c:	05395263          	bge	s2,s3,800043a0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2bc>
            threadData[i].id = i;
    80004360:	00191493          	slli	s1,s2,0x1
    80004364:	012484b3          	add	s1,s1,s2
    80004368:	00349493          	slli	s1,s1,0x3
    8000436c:	009b04b3          	add	s1,s6,s1
    80004370:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    80004374:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    80004378:	00005797          	auipc	a5,0x5
    8000437c:	b287b783          	ld	a5,-1240(a5) # 80008ea0 <_ZN19ConsumerProducerCPP10waitForAllE>
    80004380:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    80004384:	01800513          	li	a0,24
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	214080e7          	jalr	532(ra) # 8000259c <_Znwm>
    80004390:	00050c93          	mv	s9,a0
        Producer(thread_data *_td) : Thread(), td(_td) {}
    80004394:	ffffd097          	auipc	ra,0xffffd
    80004398:	504080e7          	jalr	1284(ra) # 80001898 <_ZN6ThreadC1Ev>
    8000439c:	f95ff06f          	j	80004330 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x24c>
        Thread::dispatch();
    800043a0:	ffffd097          	auipc	ra,0xffffd
    800043a4:	4a8080e7          	jalr	1192(ra) # 80001848 <_ZN6Thread8dispatchEv>
        for (int i = 0; i <= threadNum; i++) {
    800043a8:	00000493          	li	s1,0
    800043ac:	0099ce63          	blt	s3,s1,800043c8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2e4>
            waitForAll->wait();
    800043b0:	00005517          	auipc	a0,0x5
    800043b4:	af053503          	ld	a0,-1296(a0) # 80008ea0 <_ZN19ConsumerProducerCPP10waitForAllE>
    800043b8:	ffffd097          	auipc	ra,0xffffd
    800043bc:	30c080e7          	jalr	780(ra) # 800016c4 <_ZN9Semaphore4waitEv>
        for (int i = 0; i <= threadNum; i++) {
    800043c0:	0014849b          	addiw	s1,s1,1
    800043c4:	fe9ff06f          	j	800043ac <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2c8>
        delete waitForAll;
    800043c8:	00005517          	auipc	a0,0x5
    800043cc:	ad853503          	ld	a0,-1320(a0) # 80008ea0 <_ZN19ConsumerProducerCPP10waitForAllE>
    800043d0:	00050863          	beqz	a0,800043e0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2fc>
    800043d4:	00053783          	ld	a5,0(a0)
    800043d8:	0087b783          	ld	a5,8(a5)
    800043dc:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    800043e0:	00000493          	li	s1,0
    800043e4:	0080006f          	j	800043ec <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x308>
        for (int i = 0; i < threadNum; i++) {
    800043e8:	0014849b          	addiw	s1,s1,1
    800043ec:	0334d263          	bge	s1,s3,80004410 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x32c>
            delete producers[i];
    800043f0:	00349793          	slli	a5,s1,0x3
    800043f4:	00fa07b3          	add	a5,s4,a5
    800043f8:	0007b503          	ld	a0,0(a5)
    800043fc:	fe0506e3          	beqz	a0,800043e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x304>
    80004400:	00053783          	ld	a5,0(a0)
    80004404:	0087b783          	ld	a5,8(a5)
    80004408:	000780e7          	jalr	a5
    8000440c:	fddff06f          	j	800043e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x304>
        delete consumer;
    80004410:	000b8a63          	beqz	s7,80004424 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x340>
    80004414:	000bb783          	ld	a5,0(s7)
    80004418:	0087b783          	ld	a5,8(a5)
    8000441c:	000b8513          	mv	a0,s7
    80004420:	000780e7          	jalr	a5
        delete buffer;
    80004424:	000a8e63          	beqz	s5,80004440 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x35c>
    80004428:	000a8513          	mv	a0,s5
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	bb8080e7          	jalr	-1096(ra) # 80003fe4 <_ZN9BufferCPPD1Ev>
    80004434:	000a8513          	mv	a0,s5
    80004438:	ffffe097          	auipc	ra,0xffffe
    8000443c:	1b4080e7          	jalr	436(ra) # 800025ec <_ZdlPv>
    80004440:	000c0113          	mv	sp,s8
    }
    80004444:	f8040113          	addi	sp,s0,-128
    80004448:	07813083          	ld	ra,120(sp)
    8000444c:	07013403          	ld	s0,112(sp)
    80004450:	06813483          	ld	s1,104(sp)
    80004454:	06013903          	ld	s2,96(sp)
    80004458:	05813983          	ld	s3,88(sp)
    8000445c:	05013a03          	ld	s4,80(sp)
    80004460:	04813a83          	ld	s5,72(sp)
    80004464:	04013b03          	ld	s6,64(sp)
    80004468:	03813b83          	ld	s7,56(sp)
    8000446c:	03013c03          	ld	s8,48(sp)
    80004470:	02813c83          	ld	s9,40(sp)
    80004474:	08010113          	addi	sp,sp,128
    80004478:	00008067          	ret
    8000447c:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    80004480:	000a8513          	mv	a0,s5
    80004484:	ffffe097          	auipc	ra,0xffffe
    80004488:	168080e7          	jalr	360(ra) # 800025ec <_ZdlPv>
    8000448c:	00048513          	mv	a0,s1
    80004490:	00006097          	auipc	ra,0x6
    80004494:	ae8080e7          	jalr	-1304(ra) # 80009f78 <_Unwind_Resume>
    80004498:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    8000449c:	00048513          	mv	a0,s1
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	14c080e7          	jalr	332(ra) # 800025ec <_ZdlPv>
    800044a8:	00090513          	mv	a0,s2
    800044ac:	00006097          	auipc	ra,0x6
    800044b0:	acc080e7          	jalr	-1332(ra) # 80009f78 <_Unwind_Resume>
    800044b4:	00050493          	mv	s1,a0
        Thread *consumer = new Consumer(&threadData[threadNum]);
    800044b8:	000b8513          	mv	a0,s7
    800044bc:	ffffe097          	auipc	ra,0xffffe
    800044c0:	130080e7          	jalr	304(ra) # 800025ec <_ZdlPv>
    800044c4:	00048513          	mv	a0,s1
    800044c8:	00006097          	auipc	ra,0x6
    800044cc:	ab0080e7          	jalr	-1360(ra) # 80009f78 <_Unwind_Resume>
    800044d0:	00050913          	mv	s2,a0
        producers[0] = new ProducerKeyborad(&threadData[0]);
    800044d4:	00048513          	mv	a0,s1
    800044d8:	ffffe097          	auipc	ra,0xffffe
    800044dc:	114080e7          	jalr	276(ra) # 800025ec <_ZdlPv>
    800044e0:	00090513          	mv	a0,s2
    800044e4:	00006097          	auipc	ra,0x6
    800044e8:	a94080e7          	jalr	-1388(ra) # 80009f78 <_Unwind_Resume>
    800044ec:	00050493          	mv	s1,a0
            producers[i] = new Producer(&threadData[i]);
    800044f0:	000c8513          	mv	a0,s9
    800044f4:	ffffe097          	auipc	ra,0xffffe
    800044f8:	0f8080e7          	jalr	248(ra) # 800025ec <_ZdlPv>
    800044fc:	00048513          	mv	a0,s1
    80004500:	00006097          	auipc	ra,0x6
    80004504:	a78080e7          	jalr	-1416(ra) # 80009f78 <_Unwind_Resume>

0000000080004508 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80004508:	ff010113          	addi	sp,sp,-16
    8000450c:	00113423          	sd	ra,8(sp)
    80004510:	00813023          	sd	s0,0(sp)
    80004514:	01010413          	addi	s0,sp,16

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    80004518:	00000097          	auipc	ra,0x0
    8000451c:	bcc080e7          	jalr	-1076(ra) # 800040e4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>
    80004520:	00813083          	ld	ra,8(sp)
    80004524:	00013403          	ld	s0,0(sp)
    80004528:	01010113          	addi	sp,sp,16
    8000452c:	00008067          	ret

0000000080004530 <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    80004530:	fd010113          	addi	sp,sp,-48
    80004534:	02113423          	sd	ra,40(sp)
    80004538:	02813023          	sd	s0,32(sp)
    8000453c:	00913c23          	sd	s1,24(sp)
    80004540:	01213823          	sd	s2,16(sp)
    80004544:	01313423          	sd	s3,8(sp)
    80004548:	03010413          	addi	s0,sp,48
    8000454c:	00050913          	mv	s2,a0
            int i = 0;
    80004550:	00000993          	li	s3,0
    80004554:	0100006f          	j	80004564 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
                    Console::putc('\n');
    80004558:	00a00513          	li	a0,10
    8000455c:	ffffd097          	auipc	ra,0xffffd
    80004560:	3c0080e7          	jalr	960(ra) # 8000191c <_ZN7Console4putcEc>
            while (!threadEnd) {
    80004564:	00005797          	auipc	a5,0x5
    80004568:	9347a783          	lw	a5,-1740(a5) # 80008e98 <_ZN19ConsumerProducerCPP9threadEndE>
    8000456c:	04079a63          	bnez	a5,800045c0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x90>
                int key = td->buffer->get();
    80004570:	01093783          	ld	a5,16(s2)
    80004574:	0087b503          	ld	a0,8(a5)
    80004578:	00000097          	auipc	ra,0x0
    8000457c:	958080e7          	jalr	-1704(ra) # 80003ed0 <_ZN9BufferCPP3getEv>
                i++;
    80004580:	0019849b          	addiw	s1,s3,1
    80004584:	0004899b          	sext.w	s3,s1
                Console::putc(key);
    80004588:	0ff57513          	andi	a0,a0,255
    8000458c:	ffffd097          	auipc	ra,0xffffd
    80004590:	390080e7          	jalr	912(ra) # 8000191c <_ZN7Console4putcEc>
                if (i % 80 == 0) {
    80004594:	05000793          	li	a5,80
    80004598:	02f4e4bb          	remw	s1,s1,a5
    8000459c:	fc0494e3          	bnez	s1,80004564 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    800045a0:	fb9ff06f          	j	80004558 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
                int key = td->buffer->get();
    800045a4:	01093783          	ld	a5,16(s2)
    800045a8:	0087b503          	ld	a0,8(a5)
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	924080e7          	jalr	-1756(ra) # 80003ed0 <_ZN9BufferCPP3getEv>
                Console::putc(key);
    800045b4:	0ff57513          	andi	a0,a0,255
    800045b8:	ffffd097          	auipc	ra,0xffffd
    800045bc:	364080e7          	jalr	868(ra) # 8000191c <_ZN7Console4putcEc>
            while (td->buffer->getCnt() > 0) {
    800045c0:	01093783          	ld	a5,16(s2)
    800045c4:	0087b503          	ld	a0,8(a5)
    800045c8:	00000097          	auipc	ra,0x0
    800045cc:	994080e7          	jalr	-1644(ra) # 80003f5c <_ZN9BufferCPP6getCntEv>
    800045d0:	fca04ae3          	bgtz	a0,800045a4 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x74>
            td->sem->signal();
    800045d4:	01093783          	ld	a5,16(s2)
    800045d8:	0107b503          	ld	a0,16(a5)
    800045dc:	ffffd097          	auipc	ra,0xffffd
    800045e0:	114080e7          	jalr	276(ra) # 800016f0 <_ZN9Semaphore6signalEv>
        }
    800045e4:	02813083          	ld	ra,40(sp)
    800045e8:	02013403          	ld	s0,32(sp)
    800045ec:	01813483          	ld	s1,24(sp)
    800045f0:	01013903          	ld	s2,16(sp)
    800045f4:	00813983          	ld	s3,8(sp)
    800045f8:	03010113          	addi	sp,sp,48
    800045fc:	00008067          	ret

0000000080004600 <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    80004600:	ff010113          	addi	sp,sp,-16
    80004604:	00113423          	sd	ra,8(sp)
    80004608:	00813023          	sd	s0,0(sp)
    8000460c:	01010413          	addi	s0,sp,16
    80004610:	00004797          	auipc	a5,0x4
    80004614:	6f878793          	addi	a5,a5,1784 # 80008d08 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80004618:	00f53023          	sd	a5,0(a0)
    8000461c:	ffffd097          	auipc	ra,0xffffd
    80004620:	134080e7          	jalr	308(ra) # 80001750 <_ZN6ThreadD1Ev>
    80004624:	00813083          	ld	ra,8(sp)
    80004628:	00013403          	ld	s0,0(sp)
    8000462c:	01010113          	addi	sp,sp,16
    80004630:	00008067          	ret

0000000080004634 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    80004634:	fe010113          	addi	sp,sp,-32
    80004638:	00113c23          	sd	ra,24(sp)
    8000463c:	00813823          	sd	s0,16(sp)
    80004640:	00913423          	sd	s1,8(sp)
    80004644:	02010413          	addi	s0,sp,32
    80004648:	00050493          	mv	s1,a0
    8000464c:	00004797          	auipc	a5,0x4
    80004650:	6bc78793          	addi	a5,a5,1724 # 80008d08 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80004654:	00f53023          	sd	a5,0(a0)
    80004658:	ffffd097          	auipc	ra,0xffffd
    8000465c:	0f8080e7          	jalr	248(ra) # 80001750 <_ZN6ThreadD1Ev>
    80004660:	00048513          	mv	a0,s1
    80004664:	ffffe097          	auipc	ra,0xffffe
    80004668:	f88080e7          	jalr	-120(ra) # 800025ec <_ZdlPv>
    8000466c:	01813083          	ld	ra,24(sp)
    80004670:	01013403          	ld	s0,16(sp)
    80004674:	00813483          	ld	s1,8(sp)
    80004678:	02010113          	addi	sp,sp,32
    8000467c:	00008067          	ret

0000000080004680 <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    80004680:	ff010113          	addi	sp,sp,-16
    80004684:	00113423          	sd	ra,8(sp)
    80004688:	00813023          	sd	s0,0(sp)
    8000468c:	01010413          	addi	s0,sp,16
    80004690:	00004797          	auipc	a5,0x4
    80004694:	62878793          	addi	a5,a5,1576 # 80008cb8 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80004698:	00f53023          	sd	a5,0(a0)
    8000469c:	ffffd097          	auipc	ra,0xffffd
    800046a0:	0b4080e7          	jalr	180(ra) # 80001750 <_ZN6ThreadD1Ev>
    800046a4:	00813083          	ld	ra,8(sp)
    800046a8:	00013403          	ld	s0,0(sp)
    800046ac:	01010113          	addi	sp,sp,16
    800046b0:	00008067          	ret

00000000800046b4 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    800046b4:	fe010113          	addi	sp,sp,-32
    800046b8:	00113c23          	sd	ra,24(sp)
    800046bc:	00813823          	sd	s0,16(sp)
    800046c0:	00913423          	sd	s1,8(sp)
    800046c4:	02010413          	addi	s0,sp,32
    800046c8:	00050493          	mv	s1,a0
    800046cc:	00004797          	auipc	a5,0x4
    800046d0:	5ec78793          	addi	a5,a5,1516 # 80008cb8 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    800046d4:	00f53023          	sd	a5,0(a0)
    800046d8:	ffffd097          	auipc	ra,0xffffd
    800046dc:	078080e7          	jalr	120(ra) # 80001750 <_ZN6ThreadD1Ev>
    800046e0:	00048513          	mv	a0,s1
    800046e4:	ffffe097          	auipc	ra,0xffffe
    800046e8:	f08080e7          	jalr	-248(ra) # 800025ec <_ZdlPv>
    800046ec:	01813083          	ld	ra,24(sp)
    800046f0:	01013403          	ld	s0,16(sp)
    800046f4:	00813483          	ld	s1,8(sp)
    800046f8:	02010113          	addi	sp,sp,32
    800046fc:	00008067          	ret

0000000080004700 <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    80004700:	ff010113          	addi	sp,sp,-16
    80004704:	00113423          	sd	ra,8(sp)
    80004708:	00813023          	sd	s0,0(sp)
    8000470c:	01010413          	addi	s0,sp,16
    80004710:	00004797          	auipc	a5,0x4
    80004714:	5d078793          	addi	a5,a5,1488 # 80008ce0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80004718:	00f53023          	sd	a5,0(a0)
    8000471c:	ffffd097          	auipc	ra,0xffffd
    80004720:	034080e7          	jalr	52(ra) # 80001750 <_ZN6ThreadD1Ev>
    80004724:	00813083          	ld	ra,8(sp)
    80004728:	00013403          	ld	s0,0(sp)
    8000472c:	01010113          	addi	sp,sp,16
    80004730:	00008067          	ret

0000000080004734 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    80004734:	fe010113          	addi	sp,sp,-32
    80004738:	00113c23          	sd	ra,24(sp)
    8000473c:	00813823          	sd	s0,16(sp)
    80004740:	00913423          	sd	s1,8(sp)
    80004744:	02010413          	addi	s0,sp,32
    80004748:	00050493          	mv	s1,a0
    8000474c:	00004797          	auipc	a5,0x4
    80004750:	59478793          	addi	a5,a5,1428 # 80008ce0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80004754:	00f53023          	sd	a5,0(a0)
    80004758:	ffffd097          	auipc	ra,0xffffd
    8000475c:	ff8080e7          	jalr	-8(ra) # 80001750 <_ZN6ThreadD1Ev>
    80004760:	00048513          	mv	a0,s1
    80004764:	ffffe097          	auipc	ra,0xffffe
    80004768:	e88080e7          	jalr	-376(ra) # 800025ec <_ZdlPv>
    8000476c:	01813083          	ld	ra,24(sp)
    80004770:	01013403          	ld	s0,16(sp)
    80004774:	00813483          	ld	s1,8(sp)
    80004778:	02010113          	addi	sp,sp,32
    8000477c:	00008067          	ret

0000000080004780 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    80004780:	fe010113          	addi	sp,sp,-32
    80004784:	00113c23          	sd	ra,24(sp)
    80004788:	00813823          	sd	s0,16(sp)
    8000478c:	00913423          	sd	s1,8(sp)
    80004790:	02010413          	addi	s0,sp,32
    80004794:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    80004798:	ffffd097          	auipc	ra,0xffffd
    8000479c:	d90080e7          	jalr	-624(ra) # 80001528 <_Z4getcv>
    800047a0:	0005059b          	sext.w	a1,a0
    800047a4:	01b00793          	li	a5,27
    800047a8:	00f58c63          	beq	a1,a5,800047c0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    800047ac:	0104b783          	ld	a5,16(s1)
    800047b0:	0087b503          	ld	a0,8(a5)
    800047b4:	fffff097          	auipc	ra,0xfffff
    800047b8:	68c080e7          	jalr	1676(ra) # 80003e40 <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    800047bc:	fddff06f          	j	80004798 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    800047c0:	00100793          	li	a5,1
    800047c4:	00004717          	auipc	a4,0x4
    800047c8:	6cf72a23          	sw	a5,1748(a4) # 80008e98 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    800047cc:	0104b783          	ld	a5,16(s1)
    800047d0:	02100593          	li	a1,33
    800047d4:	0087b503          	ld	a0,8(a5)
    800047d8:	fffff097          	auipc	ra,0xfffff
    800047dc:	668080e7          	jalr	1640(ra) # 80003e40 <_ZN9BufferCPP3putEi>
            td->sem->signal();
    800047e0:	0104b783          	ld	a5,16(s1)
    800047e4:	0107b503          	ld	a0,16(a5)
    800047e8:	ffffd097          	auipc	ra,0xffffd
    800047ec:	f08080e7          	jalr	-248(ra) # 800016f0 <_ZN9Semaphore6signalEv>
        }
    800047f0:	01813083          	ld	ra,24(sp)
    800047f4:	01013403          	ld	s0,16(sp)
    800047f8:	00813483          	ld	s1,8(sp)
    800047fc:	02010113          	addi	sp,sp,32
    80004800:	00008067          	ret

0000000080004804 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80004804:	fe010113          	addi	sp,sp,-32
    80004808:	00113c23          	sd	ra,24(sp)
    8000480c:	00813823          	sd	s0,16(sp)
    80004810:	00913423          	sd	s1,8(sp)
    80004814:	01213023          	sd	s2,0(sp)
    80004818:	02010413          	addi	s0,sp,32
    8000481c:	00050493          	mv	s1,a0
            int i = 0;
    80004820:	00000913          	li	s2,0
            while (!threadEnd) {
    80004824:	00004797          	auipc	a5,0x4
    80004828:	6747a783          	lw	a5,1652(a5) # 80008e98 <_ZN19ConsumerProducerCPP9threadEndE>
    8000482c:	04079263          	bnez	a5,80004870 <_ZN19ConsumerProducerCPP8Producer3runEv+0x6c>
                td->buffer->put(td->id + '0');
    80004830:	0104b783          	ld	a5,16(s1)
    80004834:	0007a583          	lw	a1,0(a5)
    80004838:	0305859b          	addiw	a1,a1,48
    8000483c:	0087b503          	ld	a0,8(a5)
    80004840:	fffff097          	auipc	ra,0xfffff
    80004844:	600080e7          	jalr	1536(ra) # 80003e40 <_ZN9BufferCPP3putEi>
                i++;
    80004848:	0019071b          	addiw	a4,s2,1
    8000484c:	0007091b          	sext.w	s2,a4
                Thread::sleep((i+td->id)%5);
    80004850:	0104b783          	ld	a5,16(s1)
    80004854:	0007a783          	lw	a5,0(a5)
    80004858:	00e787bb          	addw	a5,a5,a4
    8000485c:	00500513          	li	a0,5
    80004860:	02a7e53b          	remw	a0,a5,a0
    80004864:	ffffd097          	auipc	ra,0xffffd
    80004868:	00c080e7          	jalr	12(ra) # 80001870 <_ZN6Thread5sleepEm>
            while (!threadEnd) {
    8000486c:	fb9ff06f          	j	80004824 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    80004870:	0104b783          	ld	a5,16(s1)
    80004874:	0107b503          	ld	a0,16(a5)
    80004878:	ffffd097          	auipc	ra,0xffffd
    8000487c:	e78080e7          	jalr	-392(ra) # 800016f0 <_ZN9Semaphore6signalEv>
        }
    80004880:	01813083          	ld	ra,24(sp)
    80004884:	01013403          	ld	s0,16(sp)
    80004888:	00813483          	ld	s1,8(sp)
    8000488c:	00013903          	ld	s2,0(sp)
    80004890:	02010113          	addi	sp,sp,32
    80004894:	00008067          	ret

0000000080004898 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004898:	fe010113          	addi	sp,sp,-32
    8000489c:	00113c23          	sd	ra,24(sp)
    800048a0:	00813823          	sd	s0,16(sp)
    800048a4:	00913423          	sd	s1,8(sp)
    800048a8:	01213023          	sd	s2,0(sp)
    800048ac:	02010413          	addi	s0,sp,32
    800048b0:	00050493          	mv	s1,a0
    800048b4:	00058913          	mv	s2,a1
    800048b8:	0015879b          	addiw	a5,a1,1
    800048bc:	0007851b          	sext.w	a0,a5
    800048c0:	00f4a023          	sw	a5,0(s1)
    800048c4:	0004a823          	sw	zero,16(s1)
    800048c8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800048cc:	00251513          	slli	a0,a0,0x2
    800048d0:	ffffd097          	auipc	ra,0xffffd
    800048d4:	8c8080e7          	jalr	-1848(ra) # 80001198 <_Z9mem_allocm>
    800048d8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800048dc:	00000593          	li	a1,0
    800048e0:	02048513          	addi	a0,s1,32
    800048e4:	ffffd097          	auipc	ra,0xffffd
    800048e8:	ae8080e7          	jalr	-1304(ra) # 800013cc <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    800048ec:	00090593          	mv	a1,s2
    800048f0:	01848513          	addi	a0,s1,24
    800048f4:	ffffd097          	auipc	ra,0xffffd
    800048f8:	ad8080e7          	jalr	-1320(ra) # 800013cc <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    800048fc:	00100593          	li	a1,1
    80004900:	02848513          	addi	a0,s1,40
    80004904:	ffffd097          	auipc	ra,0xffffd
    80004908:	ac8080e7          	jalr	-1336(ra) # 800013cc <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    8000490c:	00100593          	li	a1,1
    80004910:	03048513          	addi	a0,s1,48
    80004914:	ffffd097          	auipc	ra,0xffffd
    80004918:	ab8080e7          	jalr	-1352(ra) # 800013cc <_Z8sem_openPP4_semj>
}
    8000491c:	01813083          	ld	ra,24(sp)
    80004920:	01013403          	ld	s0,16(sp)
    80004924:	00813483          	ld	s1,8(sp)
    80004928:	00013903          	ld	s2,0(sp)
    8000492c:	02010113          	addi	sp,sp,32
    80004930:	00008067          	ret

0000000080004934 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80004934:	fe010113          	addi	sp,sp,-32
    80004938:	00113c23          	sd	ra,24(sp)
    8000493c:	00813823          	sd	s0,16(sp)
    80004940:	00913423          	sd	s1,8(sp)
    80004944:	01213023          	sd	s2,0(sp)
    80004948:	02010413          	addi	s0,sp,32
    8000494c:	00050493          	mv	s1,a0
    80004950:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80004954:	01853503          	ld	a0,24(a0)
    80004958:	ffffd097          	auipc	ra,0xffffd
    8000495c:	b04080e7          	jalr	-1276(ra) # 8000145c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80004960:	0304b503          	ld	a0,48(s1)
    80004964:	ffffd097          	auipc	ra,0xffffd
    80004968:	af8080e7          	jalr	-1288(ra) # 8000145c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    8000496c:	0084b783          	ld	a5,8(s1)
    80004970:	0144a703          	lw	a4,20(s1)
    80004974:	00271713          	slli	a4,a4,0x2
    80004978:	00e787b3          	add	a5,a5,a4
    8000497c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004980:	0144a783          	lw	a5,20(s1)
    80004984:	0017879b          	addiw	a5,a5,1
    80004988:	0004a703          	lw	a4,0(s1)
    8000498c:	02e7e7bb          	remw	a5,a5,a4
    80004990:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004994:	0304b503          	ld	a0,48(s1)
    80004998:	ffffd097          	auipc	ra,0xffffd
    8000499c:	b0c080e7          	jalr	-1268(ra) # 800014a4 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    800049a0:	0204b503          	ld	a0,32(s1)
    800049a4:	ffffd097          	auipc	ra,0xffffd
    800049a8:	b00080e7          	jalr	-1280(ra) # 800014a4 <_Z10sem_signalP4_sem>

}
    800049ac:	01813083          	ld	ra,24(sp)
    800049b0:	01013403          	ld	s0,16(sp)
    800049b4:	00813483          	ld	s1,8(sp)
    800049b8:	00013903          	ld	s2,0(sp)
    800049bc:	02010113          	addi	sp,sp,32
    800049c0:	00008067          	ret

00000000800049c4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800049c4:	fe010113          	addi	sp,sp,-32
    800049c8:	00113c23          	sd	ra,24(sp)
    800049cc:	00813823          	sd	s0,16(sp)
    800049d0:	00913423          	sd	s1,8(sp)
    800049d4:	01213023          	sd	s2,0(sp)
    800049d8:	02010413          	addi	s0,sp,32
    800049dc:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800049e0:	02053503          	ld	a0,32(a0)
    800049e4:	ffffd097          	auipc	ra,0xffffd
    800049e8:	a78080e7          	jalr	-1416(ra) # 8000145c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    800049ec:	0284b503          	ld	a0,40(s1)
    800049f0:	ffffd097          	auipc	ra,0xffffd
    800049f4:	a6c080e7          	jalr	-1428(ra) # 8000145c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    800049f8:	0084b703          	ld	a4,8(s1)
    800049fc:	0104a783          	lw	a5,16(s1)
    80004a00:	00279693          	slli	a3,a5,0x2
    80004a04:	00d70733          	add	a4,a4,a3
    80004a08:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004a0c:	0017879b          	addiw	a5,a5,1
    80004a10:	0004a703          	lw	a4,0(s1)
    80004a14:	02e7e7bb          	remw	a5,a5,a4
    80004a18:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004a1c:	0284b503          	ld	a0,40(s1)
    80004a20:	ffffd097          	auipc	ra,0xffffd
    80004a24:	a84080e7          	jalr	-1404(ra) # 800014a4 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004a28:	0184b503          	ld	a0,24(s1)
    80004a2c:	ffffd097          	auipc	ra,0xffffd
    80004a30:	a78080e7          	jalr	-1416(ra) # 800014a4 <_Z10sem_signalP4_sem>

    return ret;
}
    80004a34:	00090513          	mv	a0,s2
    80004a38:	01813083          	ld	ra,24(sp)
    80004a3c:	01013403          	ld	s0,16(sp)
    80004a40:	00813483          	ld	s1,8(sp)
    80004a44:	00013903          	ld	s2,0(sp)
    80004a48:	02010113          	addi	sp,sp,32
    80004a4c:	00008067          	ret

0000000080004a50 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004a50:	fe010113          	addi	sp,sp,-32
    80004a54:	00113c23          	sd	ra,24(sp)
    80004a58:	00813823          	sd	s0,16(sp)
    80004a5c:	00913423          	sd	s1,8(sp)
    80004a60:	01213023          	sd	s2,0(sp)
    80004a64:	02010413          	addi	s0,sp,32
    80004a68:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004a6c:	02853503          	ld	a0,40(a0)
    80004a70:	ffffd097          	auipc	ra,0xffffd
    80004a74:	9ec080e7          	jalr	-1556(ra) # 8000145c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80004a78:	0304b503          	ld	a0,48(s1)
    80004a7c:	ffffd097          	auipc	ra,0xffffd
    80004a80:	9e0080e7          	jalr	-1568(ra) # 8000145c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80004a84:	0144a783          	lw	a5,20(s1)
    80004a88:	0104a903          	lw	s2,16(s1)
    80004a8c:	0327ce63          	blt	a5,s2,80004ac8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004a90:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004a94:	0304b503          	ld	a0,48(s1)
    80004a98:	ffffd097          	auipc	ra,0xffffd
    80004a9c:	a0c080e7          	jalr	-1524(ra) # 800014a4 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80004aa0:	0284b503          	ld	a0,40(s1)
    80004aa4:	ffffd097          	auipc	ra,0xffffd
    80004aa8:	a00080e7          	jalr	-1536(ra) # 800014a4 <_Z10sem_signalP4_sem>

    return ret;
}
    80004aac:	00090513          	mv	a0,s2
    80004ab0:	01813083          	ld	ra,24(sp)
    80004ab4:	01013403          	ld	s0,16(sp)
    80004ab8:	00813483          	ld	s1,8(sp)
    80004abc:	00013903          	ld	s2,0(sp)
    80004ac0:	02010113          	addi	sp,sp,32
    80004ac4:	00008067          	ret
        ret = cap - head + tail;
    80004ac8:	0004a703          	lw	a4,0(s1)
    80004acc:	4127093b          	subw	s2,a4,s2
    80004ad0:	00f9093b          	addw	s2,s2,a5
    80004ad4:	fc1ff06f          	j	80004a94 <_ZN6Buffer6getCntEv+0x44>

0000000080004ad8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004ad8:	fe010113          	addi	sp,sp,-32
    80004adc:	00113c23          	sd	ra,24(sp)
    80004ae0:	00813823          	sd	s0,16(sp)
    80004ae4:	00913423          	sd	s1,8(sp)
    80004ae8:	02010413          	addi	s0,sp,32
    80004aec:	00050493          	mv	s1,a0
    putc('\n');
    80004af0:	00a00513          	li	a0,10
    80004af4:	ffffd097          	auipc	ra,0xffffd
    80004af8:	a60080e7          	jalr	-1440(ra) # 80001554 <_Z4putcc>
    printString("Buffer deleted!\n");
    80004afc:	00002517          	auipc	a0,0x2
    80004b00:	6ec50513          	addi	a0,a0,1772 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80004b04:	fffff097          	auipc	ra,0xfffff
    80004b08:	f3c080e7          	jalr	-196(ra) # 80003a40 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004b0c:	00048513          	mv	a0,s1
    80004b10:	00000097          	auipc	ra,0x0
    80004b14:	f40080e7          	jalr	-192(ra) # 80004a50 <_ZN6Buffer6getCntEv>
    80004b18:	02a05c63          	blez	a0,80004b50 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004b1c:	0084b783          	ld	a5,8(s1)
    80004b20:	0104a703          	lw	a4,16(s1)
    80004b24:	00271713          	slli	a4,a4,0x2
    80004b28:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80004b2c:	0007c503          	lbu	a0,0(a5)
    80004b30:	ffffd097          	auipc	ra,0xffffd
    80004b34:	a24080e7          	jalr	-1500(ra) # 80001554 <_Z4putcc>
        head = (head + 1) % cap;
    80004b38:	0104a783          	lw	a5,16(s1)
    80004b3c:	0017879b          	addiw	a5,a5,1
    80004b40:	0004a703          	lw	a4,0(s1)
    80004b44:	02e7e7bb          	remw	a5,a5,a4
    80004b48:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004b4c:	fc1ff06f          	j	80004b0c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80004b50:	02100513          	li	a0,33
    80004b54:	ffffd097          	auipc	ra,0xffffd
    80004b58:	a00080e7          	jalr	-1536(ra) # 80001554 <_Z4putcc>
    putc('\n');
    80004b5c:	00a00513          	li	a0,10
    80004b60:	ffffd097          	auipc	ra,0xffffd
    80004b64:	9f4080e7          	jalr	-1548(ra) # 80001554 <_Z4putcc>
    mem_free(buffer);
    80004b68:	0084b503          	ld	a0,8(s1)
    80004b6c:	ffffc097          	auipc	ra,0xffffc
    80004b70:	674080e7          	jalr	1652(ra) # 800011e0 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80004b74:	0204b503          	ld	a0,32(s1)
    80004b78:	ffffd097          	auipc	ra,0xffffd
    80004b7c:	89c080e7          	jalr	-1892(ra) # 80001414 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80004b80:	0184b503          	ld	a0,24(s1)
    80004b84:	ffffd097          	auipc	ra,0xffffd
    80004b88:	890080e7          	jalr	-1904(ra) # 80001414 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80004b8c:	0304b503          	ld	a0,48(s1)
    80004b90:	ffffd097          	auipc	ra,0xffffd
    80004b94:	884080e7          	jalr	-1916(ra) # 80001414 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80004b98:	0284b503          	ld	a0,40(s1)
    80004b9c:	ffffd097          	auipc	ra,0xffffd
    80004ba0:	878080e7          	jalr	-1928(ra) # 80001414 <_Z9sem_closeP4_sem>
}
    80004ba4:	01813083          	ld	ra,24(sp)
    80004ba8:	01013403          	ld	s0,16(sp)
    80004bac:	00813483          	ld	s1,8(sp)
    80004bb0:	02010113          	addi	sp,sp,32
    80004bb4:	00008067          	ret

0000000080004bb8 <start>:
    80004bb8:	ff010113          	addi	sp,sp,-16
    80004bbc:	00813423          	sd	s0,8(sp)
    80004bc0:	01010413          	addi	s0,sp,16
    80004bc4:	300027f3          	csrr	a5,mstatus
    80004bc8:	ffffe737          	lui	a4,0xffffe
    80004bcc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff46ef>
    80004bd0:	00e7f7b3          	and	a5,a5,a4
    80004bd4:	00001737          	lui	a4,0x1
    80004bd8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004bdc:	00e7e7b3          	or	a5,a5,a4
    80004be0:	30079073          	csrw	mstatus,a5
    80004be4:	00000797          	auipc	a5,0x0
    80004be8:	16078793          	addi	a5,a5,352 # 80004d44 <system_main>
    80004bec:	34179073          	csrw	mepc,a5
    80004bf0:	00000793          	li	a5,0
    80004bf4:	18079073          	csrw	satp,a5
    80004bf8:	000107b7          	lui	a5,0x10
    80004bfc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004c00:	30279073          	csrw	medeleg,a5
    80004c04:	30379073          	csrw	mideleg,a5
    80004c08:	104027f3          	csrr	a5,sie
    80004c0c:	2227e793          	ori	a5,a5,546
    80004c10:	10479073          	csrw	sie,a5
    80004c14:	fff00793          	li	a5,-1
    80004c18:	00a7d793          	srli	a5,a5,0xa
    80004c1c:	3b079073          	csrw	pmpaddr0,a5
    80004c20:	00f00793          	li	a5,15
    80004c24:	3a079073          	csrw	pmpcfg0,a5
    80004c28:	f14027f3          	csrr	a5,mhartid
    80004c2c:	0200c737          	lui	a4,0x200c
    80004c30:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004c34:	0007869b          	sext.w	a3,a5
    80004c38:	00269713          	slli	a4,a3,0x2
    80004c3c:	000f4637          	lui	a2,0xf4
    80004c40:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004c44:	00d70733          	add	a4,a4,a3
    80004c48:	0037979b          	slliw	a5,a5,0x3
    80004c4c:	020046b7          	lui	a3,0x2004
    80004c50:	00d787b3          	add	a5,a5,a3
    80004c54:	00c585b3          	add	a1,a1,a2
    80004c58:	00371693          	slli	a3,a4,0x3
    80004c5c:	00004717          	auipc	a4,0x4
    80004c60:	25470713          	addi	a4,a4,596 # 80008eb0 <timer_scratch>
    80004c64:	00b7b023          	sd	a1,0(a5)
    80004c68:	00d70733          	add	a4,a4,a3
    80004c6c:	00f73c23          	sd	a5,24(a4)
    80004c70:	02c73023          	sd	a2,32(a4)
    80004c74:	34071073          	csrw	mscratch,a4
    80004c78:	00000797          	auipc	a5,0x0
    80004c7c:	6e878793          	addi	a5,a5,1768 # 80005360 <timervec>
    80004c80:	30579073          	csrw	mtvec,a5
    80004c84:	300027f3          	csrr	a5,mstatus
    80004c88:	0087e793          	ori	a5,a5,8
    80004c8c:	30079073          	csrw	mstatus,a5
    80004c90:	304027f3          	csrr	a5,mie
    80004c94:	0807e793          	ori	a5,a5,128
    80004c98:	30479073          	csrw	mie,a5
    80004c9c:	f14027f3          	csrr	a5,mhartid
    80004ca0:	0007879b          	sext.w	a5,a5
    80004ca4:	00078213          	mv	tp,a5
    80004ca8:	30200073          	mret
    80004cac:	00813403          	ld	s0,8(sp)
    80004cb0:	01010113          	addi	sp,sp,16
    80004cb4:	00008067          	ret

0000000080004cb8 <timerinit>:
    80004cb8:	ff010113          	addi	sp,sp,-16
    80004cbc:	00813423          	sd	s0,8(sp)
    80004cc0:	01010413          	addi	s0,sp,16
    80004cc4:	f14027f3          	csrr	a5,mhartid
    80004cc8:	0200c737          	lui	a4,0x200c
    80004ccc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004cd0:	0007869b          	sext.w	a3,a5
    80004cd4:	00269713          	slli	a4,a3,0x2
    80004cd8:	000f4637          	lui	a2,0xf4
    80004cdc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004ce0:	00d70733          	add	a4,a4,a3
    80004ce4:	0037979b          	slliw	a5,a5,0x3
    80004ce8:	020046b7          	lui	a3,0x2004
    80004cec:	00d787b3          	add	a5,a5,a3
    80004cf0:	00c585b3          	add	a1,a1,a2
    80004cf4:	00371693          	slli	a3,a4,0x3
    80004cf8:	00004717          	auipc	a4,0x4
    80004cfc:	1b870713          	addi	a4,a4,440 # 80008eb0 <timer_scratch>
    80004d00:	00b7b023          	sd	a1,0(a5)
    80004d04:	00d70733          	add	a4,a4,a3
    80004d08:	00f73c23          	sd	a5,24(a4)
    80004d0c:	02c73023          	sd	a2,32(a4)
    80004d10:	34071073          	csrw	mscratch,a4
    80004d14:	00000797          	auipc	a5,0x0
    80004d18:	64c78793          	addi	a5,a5,1612 # 80005360 <timervec>
    80004d1c:	30579073          	csrw	mtvec,a5
    80004d20:	300027f3          	csrr	a5,mstatus
    80004d24:	0087e793          	ori	a5,a5,8
    80004d28:	30079073          	csrw	mstatus,a5
    80004d2c:	304027f3          	csrr	a5,mie
    80004d30:	0807e793          	ori	a5,a5,128
    80004d34:	30479073          	csrw	mie,a5
    80004d38:	00813403          	ld	s0,8(sp)
    80004d3c:	01010113          	addi	sp,sp,16
    80004d40:	00008067          	ret

0000000080004d44 <system_main>:
    80004d44:	fe010113          	addi	sp,sp,-32
    80004d48:	00813823          	sd	s0,16(sp)
    80004d4c:	00913423          	sd	s1,8(sp)
    80004d50:	00113c23          	sd	ra,24(sp)
    80004d54:	02010413          	addi	s0,sp,32
    80004d58:	00000097          	auipc	ra,0x0
    80004d5c:	0c4080e7          	jalr	196(ra) # 80004e1c <cpuid>
    80004d60:	00004497          	auipc	s1,0x4
    80004d64:	06048493          	addi	s1,s1,96 # 80008dc0 <started>
    80004d68:	02050263          	beqz	a0,80004d8c <system_main+0x48>
    80004d6c:	0004a783          	lw	a5,0(s1)
    80004d70:	0007879b          	sext.w	a5,a5
    80004d74:	fe078ce3          	beqz	a5,80004d6c <system_main+0x28>
    80004d78:	0ff0000f          	fence
    80004d7c:	00002517          	auipc	a0,0x2
    80004d80:	59c50513          	addi	a0,a0,1436 # 80007318 <CONSOLE_STATUS+0x308>
    80004d84:	00001097          	auipc	ra,0x1
    80004d88:	a78080e7          	jalr	-1416(ra) # 800057fc <panic>
    80004d8c:	00001097          	auipc	ra,0x1
    80004d90:	9cc080e7          	jalr	-1588(ra) # 80005758 <consoleinit>
    80004d94:	00001097          	auipc	ra,0x1
    80004d98:	158080e7          	jalr	344(ra) # 80005eec <printfinit>
    80004d9c:	00002517          	auipc	a0,0x2
    80004da0:	49c50513          	addi	a0,a0,1180 # 80007238 <CONSOLE_STATUS+0x228>
    80004da4:	00001097          	auipc	ra,0x1
    80004da8:	ab4080e7          	jalr	-1356(ra) # 80005858 <__printf>
    80004dac:	00002517          	auipc	a0,0x2
    80004db0:	53c50513          	addi	a0,a0,1340 # 800072e8 <CONSOLE_STATUS+0x2d8>
    80004db4:	00001097          	auipc	ra,0x1
    80004db8:	aa4080e7          	jalr	-1372(ra) # 80005858 <__printf>
    80004dbc:	00002517          	auipc	a0,0x2
    80004dc0:	47c50513          	addi	a0,a0,1148 # 80007238 <CONSOLE_STATUS+0x228>
    80004dc4:	00001097          	auipc	ra,0x1
    80004dc8:	a94080e7          	jalr	-1388(ra) # 80005858 <__printf>
    80004dcc:	00001097          	auipc	ra,0x1
    80004dd0:	4ac080e7          	jalr	1196(ra) # 80006278 <kinit>
    80004dd4:	00000097          	auipc	ra,0x0
    80004dd8:	148080e7          	jalr	328(ra) # 80004f1c <trapinit>
    80004ddc:	00000097          	auipc	ra,0x0
    80004de0:	16c080e7          	jalr	364(ra) # 80004f48 <trapinithart>
    80004de4:	00000097          	auipc	ra,0x0
    80004de8:	5bc080e7          	jalr	1468(ra) # 800053a0 <plicinit>
    80004dec:	00000097          	auipc	ra,0x0
    80004df0:	5dc080e7          	jalr	1500(ra) # 800053c8 <plicinithart>
    80004df4:	00000097          	auipc	ra,0x0
    80004df8:	078080e7          	jalr	120(ra) # 80004e6c <userinit>
    80004dfc:	0ff0000f          	fence
    80004e00:	00100793          	li	a5,1
    80004e04:	00002517          	auipc	a0,0x2
    80004e08:	4fc50513          	addi	a0,a0,1276 # 80007300 <CONSOLE_STATUS+0x2f0>
    80004e0c:	00f4a023          	sw	a5,0(s1)
    80004e10:	00001097          	auipc	ra,0x1
    80004e14:	a48080e7          	jalr	-1464(ra) # 80005858 <__printf>
    80004e18:	0000006f          	j	80004e18 <system_main+0xd4>

0000000080004e1c <cpuid>:
    80004e1c:	ff010113          	addi	sp,sp,-16
    80004e20:	00813423          	sd	s0,8(sp)
    80004e24:	01010413          	addi	s0,sp,16
    80004e28:	00020513          	mv	a0,tp
    80004e2c:	00813403          	ld	s0,8(sp)
    80004e30:	0005051b          	sext.w	a0,a0
    80004e34:	01010113          	addi	sp,sp,16
    80004e38:	00008067          	ret

0000000080004e3c <mycpu>:
    80004e3c:	ff010113          	addi	sp,sp,-16
    80004e40:	00813423          	sd	s0,8(sp)
    80004e44:	01010413          	addi	s0,sp,16
    80004e48:	00020793          	mv	a5,tp
    80004e4c:	00813403          	ld	s0,8(sp)
    80004e50:	0007879b          	sext.w	a5,a5
    80004e54:	00779793          	slli	a5,a5,0x7
    80004e58:	00005517          	auipc	a0,0x5
    80004e5c:	08850513          	addi	a0,a0,136 # 80009ee0 <cpus>
    80004e60:	00f50533          	add	a0,a0,a5
    80004e64:	01010113          	addi	sp,sp,16
    80004e68:	00008067          	ret

0000000080004e6c <userinit>:
    80004e6c:	ff010113          	addi	sp,sp,-16
    80004e70:	00813423          	sd	s0,8(sp)
    80004e74:	01010413          	addi	s0,sp,16
    80004e78:	00813403          	ld	s0,8(sp)
    80004e7c:	01010113          	addi	sp,sp,16
    80004e80:	ffffd317          	auipc	t1,0xffffd
    80004e84:	afc30067          	jr	-1284(t1) # 8000197c <main>

0000000080004e88 <either_copyout>:
    80004e88:	ff010113          	addi	sp,sp,-16
    80004e8c:	00813023          	sd	s0,0(sp)
    80004e90:	00113423          	sd	ra,8(sp)
    80004e94:	01010413          	addi	s0,sp,16
    80004e98:	02051663          	bnez	a0,80004ec4 <either_copyout+0x3c>
    80004e9c:	00058513          	mv	a0,a1
    80004ea0:	00060593          	mv	a1,a2
    80004ea4:	0006861b          	sext.w	a2,a3
    80004ea8:	00002097          	auipc	ra,0x2
    80004eac:	c5c080e7          	jalr	-932(ra) # 80006b04 <__memmove>
    80004eb0:	00813083          	ld	ra,8(sp)
    80004eb4:	00013403          	ld	s0,0(sp)
    80004eb8:	00000513          	li	a0,0
    80004ebc:	01010113          	addi	sp,sp,16
    80004ec0:	00008067          	ret
    80004ec4:	00002517          	auipc	a0,0x2
    80004ec8:	47c50513          	addi	a0,a0,1148 # 80007340 <CONSOLE_STATUS+0x330>
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	930080e7          	jalr	-1744(ra) # 800057fc <panic>

0000000080004ed4 <either_copyin>:
    80004ed4:	ff010113          	addi	sp,sp,-16
    80004ed8:	00813023          	sd	s0,0(sp)
    80004edc:	00113423          	sd	ra,8(sp)
    80004ee0:	01010413          	addi	s0,sp,16
    80004ee4:	02059463          	bnez	a1,80004f0c <either_copyin+0x38>
    80004ee8:	00060593          	mv	a1,a2
    80004eec:	0006861b          	sext.w	a2,a3
    80004ef0:	00002097          	auipc	ra,0x2
    80004ef4:	c14080e7          	jalr	-1004(ra) # 80006b04 <__memmove>
    80004ef8:	00813083          	ld	ra,8(sp)
    80004efc:	00013403          	ld	s0,0(sp)
    80004f00:	00000513          	li	a0,0
    80004f04:	01010113          	addi	sp,sp,16
    80004f08:	00008067          	ret
    80004f0c:	00002517          	auipc	a0,0x2
    80004f10:	45c50513          	addi	a0,a0,1116 # 80007368 <CONSOLE_STATUS+0x358>
    80004f14:	00001097          	auipc	ra,0x1
    80004f18:	8e8080e7          	jalr	-1816(ra) # 800057fc <panic>

0000000080004f1c <trapinit>:
    80004f1c:	ff010113          	addi	sp,sp,-16
    80004f20:	00813423          	sd	s0,8(sp)
    80004f24:	01010413          	addi	s0,sp,16
    80004f28:	00813403          	ld	s0,8(sp)
    80004f2c:	00002597          	auipc	a1,0x2
    80004f30:	46458593          	addi	a1,a1,1124 # 80007390 <CONSOLE_STATUS+0x380>
    80004f34:	00005517          	auipc	a0,0x5
    80004f38:	02c50513          	addi	a0,a0,44 # 80009f60 <tickslock>
    80004f3c:	01010113          	addi	sp,sp,16
    80004f40:	00001317          	auipc	t1,0x1
    80004f44:	5c830067          	jr	1480(t1) # 80006508 <initlock>

0000000080004f48 <trapinithart>:
    80004f48:	ff010113          	addi	sp,sp,-16
    80004f4c:	00813423          	sd	s0,8(sp)
    80004f50:	01010413          	addi	s0,sp,16
    80004f54:	00000797          	auipc	a5,0x0
    80004f58:	2fc78793          	addi	a5,a5,764 # 80005250 <kernelvec>
    80004f5c:	10579073          	csrw	stvec,a5
    80004f60:	00813403          	ld	s0,8(sp)
    80004f64:	01010113          	addi	sp,sp,16
    80004f68:	00008067          	ret

0000000080004f6c <usertrap>:
    80004f6c:	ff010113          	addi	sp,sp,-16
    80004f70:	00813423          	sd	s0,8(sp)
    80004f74:	01010413          	addi	s0,sp,16
    80004f78:	00813403          	ld	s0,8(sp)
    80004f7c:	01010113          	addi	sp,sp,16
    80004f80:	00008067          	ret

0000000080004f84 <usertrapret>:
    80004f84:	ff010113          	addi	sp,sp,-16
    80004f88:	00813423          	sd	s0,8(sp)
    80004f8c:	01010413          	addi	s0,sp,16
    80004f90:	00813403          	ld	s0,8(sp)
    80004f94:	01010113          	addi	sp,sp,16
    80004f98:	00008067          	ret

0000000080004f9c <kerneltrap>:
    80004f9c:	fe010113          	addi	sp,sp,-32
    80004fa0:	00813823          	sd	s0,16(sp)
    80004fa4:	00113c23          	sd	ra,24(sp)
    80004fa8:	00913423          	sd	s1,8(sp)
    80004fac:	02010413          	addi	s0,sp,32
    80004fb0:	142025f3          	csrr	a1,scause
    80004fb4:	100027f3          	csrr	a5,sstatus
    80004fb8:	0027f793          	andi	a5,a5,2
    80004fbc:	10079c63          	bnez	a5,800050d4 <kerneltrap+0x138>
    80004fc0:	142027f3          	csrr	a5,scause
    80004fc4:	0207ce63          	bltz	a5,80005000 <kerneltrap+0x64>
    80004fc8:	00002517          	auipc	a0,0x2
    80004fcc:	41050513          	addi	a0,a0,1040 # 800073d8 <CONSOLE_STATUS+0x3c8>
    80004fd0:	00001097          	auipc	ra,0x1
    80004fd4:	888080e7          	jalr	-1912(ra) # 80005858 <__printf>
    80004fd8:	141025f3          	csrr	a1,sepc
    80004fdc:	14302673          	csrr	a2,stval
    80004fe0:	00002517          	auipc	a0,0x2
    80004fe4:	40850513          	addi	a0,a0,1032 # 800073e8 <CONSOLE_STATUS+0x3d8>
    80004fe8:	00001097          	auipc	ra,0x1
    80004fec:	870080e7          	jalr	-1936(ra) # 80005858 <__printf>
    80004ff0:	00002517          	auipc	a0,0x2
    80004ff4:	41050513          	addi	a0,a0,1040 # 80007400 <CONSOLE_STATUS+0x3f0>
    80004ff8:	00001097          	auipc	ra,0x1
    80004ffc:	804080e7          	jalr	-2044(ra) # 800057fc <panic>
    80005000:	0ff7f713          	andi	a4,a5,255
    80005004:	00900693          	li	a3,9
    80005008:	04d70063          	beq	a4,a3,80005048 <kerneltrap+0xac>
    8000500c:	fff00713          	li	a4,-1
    80005010:	03f71713          	slli	a4,a4,0x3f
    80005014:	00170713          	addi	a4,a4,1
    80005018:	fae798e3          	bne	a5,a4,80004fc8 <kerneltrap+0x2c>
    8000501c:	00000097          	auipc	ra,0x0
    80005020:	e00080e7          	jalr	-512(ra) # 80004e1c <cpuid>
    80005024:	06050663          	beqz	a0,80005090 <kerneltrap+0xf4>
    80005028:	144027f3          	csrr	a5,sip
    8000502c:	ffd7f793          	andi	a5,a5,-3
    80005030:	14479073          	csrw	sip,a5
    80005034:	01813083          	ld	ra,24(sp)
    80005038:	01013403          	ld	s0,16(sp)
    8000503c:	00813483          	ld	s1,8(sp)
    80005040:	02010113          	addi	sp,sp,32
    80005044:	00008067          	ret
    80005048:	00000097          	auipc	ra,0x0
    8000504c:	3cc080e7          	jalr	972(ra) # 80005414 <plic_claim>
    80005050:	00a00793          	li	a5,10
    80005054:	00050493          	mv	s1,a0
    80005058:	06f50863          	beq	a0,a5,800050c8 <kerneltrap+0x12c>
    8000505c:	fc050ce3          	beqz	a0,80005034 <kerneltrap+0x98>
    80005060:	00050593          	mv	a1,a0
    80005064:	00002517          	auipc	a0,0x2
    80005068:	35450513          	addi	a0,a0,852 # 800073b8 <CONSOLE_STATUS+0x3a8>
    8000506c:	00000097          	auipc	ra,0x0
    80005070:	7ec080e7          	jalr	2028(ra) # 80005858 <__printf>
    80005074:	01013403          	ld	s0,16(sp)
    80005078:	01813083          	ld	ra,24(sp)
    8000507c:	00048513          	mv	a0,s1
    80005080:	00813483          	ld	s1,8(sp)
    80005084:	02010113          	addi	sp,sp,32
    80005088:	00000317          	auipc	t1,0x0
    8000508c:	3c430067          	jr	964(t1) # 8000544c <plic_complete>
    80005090:	00005517          	auipc	a0,0x5
    80005094:	ed050513          	addi	a0,a0,-304 # 80009f60 <tickslock>
    80005098:	00001097          	auipc	ra,0x1
    8000509c:	494080e7          	jalr	1172(ra) # 8000652c <acquire>
    800050a0:	00004717          	auipc	a4,0x4
    800050a4:	d2470713          	addi	a4,a4,-732 # 80008dc4 <ticks>
    800050a8:	00072783          	lw	a5,0(a4)
    800050ac:	00005517          	auipc	a0,0x5
    800050b0:	eb450513          	addi	a0,a0,-332 # 80009f60 <tickslock>
    800050b4:	0017879b          	addiw	a5,a5,1
    800050b8:	00f72023          	sw	a5,0(a4)
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	53c080e7          	jalr	1340(ra) # 800065f8 <release>
    800050c4:	f65ff06f          	j	80005028 <kerneltrap+0x8c>
    800050c8:	00001097          	auipc	ra,0x1
    800050cc:	098080e7          	jalr	152(ra) # 80006160 <uartintr>
    800050d0:	fa5ff06f          	j	80005074 <kerneltrap+0xd8>
    800050d4:	00002517          	auipc	a0,0x2
    800050d8:	2c450513          	addi	a0,a0,708 # 80007398 <CONSOLE_STATUS+0x388>
    800050dc:	00000097          	auipc	ra,0x0
    800050e0:	720080e7          	jalr	1824(ra) # 800057fc <panic>

00000000800050e4 <clockintr>:
    800050e4:	fe010113          	addi	sp,sp,-32
    800050e8:	00813823          	sd	s0,16(sp)
    800050ec:	00913423          	sd	s1,8(sp)
    800050f0:	00113c23          	sd	ra,24(sp)
    800050f4:	02010413          	addi	s0,sp,32
    800050f8:	00005497          	auipc	s1,0x5
    800050fc:	e6848493          	addi	s1,s1,-408 # 80009f60 <tickslock>
    80005100:	00048513          	mv	a0,s1
    80005104:	00001097          	auipc	ra,0x1
    80005108:	428080e7          	jalr	1064(ra) # 8000652c <acquire>
    8000510c:	00004717          	auipc	a4,0x4
    80005110:	cb870713          	addi	a4,a4,-840 # 80008dc4 <ticks>
    80005114:	00072783          	lw	a5,0(a4)
    80005118:	01013403          	ld	s0,16(sp)
    8000511c:	01813083          	ld	ra,24(sp)
    80005120:	00048513          	mv	a0,s1
    80005124:	0017879b          	addiw	a5,a5,1
    80005128:	00813483          	ld	s1,8(sp)
    8000512c:	00f72023          	sw	a5,0(a4)
    80005130:	02010113          	addi	sp,sp,32
    80005134:	00001317          	auipc	t1,0x1
    80005138:	4c430067          	jr	1220(t1) # 800065f8 <release>

000000008000513c <devintr>:
    8000513c:	142027f3          	csrr	a5,scause
    80005140:	00000513          	li	a0,0
    80005144:	0007c463          	bltz	a5,8000514c <devintr+0x10>
    80005148:	00008067          	ret
    8000514c:	fe010113          	addi	sp,sp,-32
    80005150:	00813823          	sd	s0,16(sp)
    80005154:	00113c23          	sd	ra,24(sp)
    80005158:	00913423          	sd	s1,8(sp)
    8000515c:	02010413          	addi	s0,sp,32
    80005160:	0ff7f713          	andi	a4,a5,255
    80005164:	00900693          	li	a3,9
    80005168:	04d70c63          	beq	a4,a3,800051c0 <devintr+0x84>
    8000516c:	fff00713          	li	a4,-1
    80005170:	03f71713          	slli	a4,a4,0x3f
    80005174:	00170713          	addi	a4,a4,1
    80005178:	00e78c63          	beq	a5,a4,80005190 <devintr+0x54>
    8000517c:	01813083          	ld	ra,24(sp)
    80005180:	01013403          	ld	s0,16(sp)
    80005184:	00813483          	ld	s1,8(sp)
    80005188:	02010113          	addi	sp,sp,32
    8000518c:	00008067          	ret
    80005190:	00000097          	auipc	ra,0x0
    80005194:	c8c080e7          	jalr	-884(ra) # 80004e1c <cpuid>
    80005198:	06050663          	beqz	a0,80005204 <devintr+0xc8>
    8000519c:	144027f3          	csrr	a5,sip
    800051a0:	ffd7f793          	andi	a5,a5,-3
    800051a4:	14479073          	csrw	sip,a5
    800051a8:	01813083          	ld	ra,24(sp)
    800051ac:	01013403          	ld	s0,16(sp)
    800051b0:	00813483          	ld	s1,8(sp)
    800051b4:	00200513          	li	a0,2
    800051b8:	02010113          	addi	sp,sp,32
    800051bc:	00008067          	ret
    800051c0:	00000097          	auipc	ra,0x0
    800051c4:	254080e7          	jalr	596(ra) # 80005414 <plic_claim>
    800051c8:	00a00793          	li	a5,10
    800051cc:	00050493          	mv	s1,a0
    800051d0:	06f50663          	beq	a0,a5,8000523c <devintr+0x100>
    800051d4:	00100513          	li	a0,1
    800051d8:	fa0482e3          	beqz	s1,8000517c <devintr+0x40>
    800051dc:	00048593          	mv	a1,s1
    800051e0:	00002517          	auipc	a0,0x2
    800051e4:	1d850513          	addi	a0,a0,472 # 800073b8 <CONSOLE_STATUS+0x3a8>
    800051e8:	00000097          	auipc	ra,0x0
    800051ec:	670080e7          	jalr	1648(ra) # 80005858 <__printf>
    800051f0:	00048513          	mv	a0,s1
    800051f4:	00000097          	auipc	ra,0x0
    800051f8:	258080e7          	jalr	600(ra) # 8000544c <plic_complete>
    800051fc:	00100513          	li	a0,1
    80005200:	f7dff06f          	j	8000517c <devintr+0x40>
    80005204:	00005517          	auipc	a0,0x5
    80005208:	d5c50513          	addi	a0,a0,-676 # 80009f60 <tickslock>
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	320080e7          	jalr	800(ra) # 8000652c <acquire>
    80005214:	00004717          	auipc	a4,0x4
    80005218:	bb070713          	addi	a4,a4,-1104 # 80008dc4 <ticks>
    8000521c:	00072783          	lw	a5,0(a4)
    80005220:	00005517          	auipc	a0,0x5
    80005224:	d4050513          	addi	a0,a0,-704 # 80009f60 <tickslock>
    80005228:	0017879b          	addiw	a5,a5,1
    8000522c:	00f72023          	sw	a5,0(a4)
    80005230:	00001097          	auipc	ra,0x1
    80005234:	3c8080e7          	jalr	968(ra) # 800065f8 <release>
    80005238:	f65ff06f          	j	8000519c <devintr+0x60>
    8000523c:	00001097          	auipc	ra,0x1
    80005240:	f24080e7          	jalr	-220(ra) # 80006160 <uartintr>
    80005244:	fadff06f          	j	800051f0 <devintr+0xb4>
	...

0000000080005250 <kernelvec>:
    80005250:	f0010113          	addi	sp,sp,-256
    80005254:	00113023          	sd	ra,0(sp)
    80005258:	00213423          	sd	sp,8(sp)
    8000525c:	00313823          	sd	gp,16(sp)
    80005260:	00413c23          	sd	tp,24(sp)
    80005264:	02513023          	sd	t0,32(sp)
    80005268:	02613423          	sd	t1,40(sp)
    8000526c:	02713823          	sd	t2,48(sp)
    80005270:	02813c23          	sd	s0,56(sp)
    80005274:	04913023          	sd	s1,64(sp)
    80005278:	04a13423          	sd	a0,72(sp)
    8000527c:	04b13823          	sd	a1,80(sp)
    80005280:	04c13c23          	sd	a2,88(sp)
    80005284:	06d13023          	sd	a3,96(sp)
    80005288:	06e13423          	sd	a4,104(sp)
    8000528c:	06f13823          	sd	a5,112(sp)
    80005290:	07013c23          	sd	a6,120(sp)
    80005294:	09113023          	sd	a7,128(sp)
    80005298:	09213423          	sd	s2,136(sp)
    8000529c:	09313823          	sd	s3,144(sp)
    800052a0:	09413c23          	sd	s4,152(sp)
    800052a4:	0b513023          	sd	s5,160(sp)
    800052a8:	0b613423          	sd	s6,168(sp)
    800052ac:	0b713823          	sd	s7,176(sp)
    800052b0:	0b813c23          	sd	s8,184(sp)
    800052b4:	0d913023          	sd	s9,192(sp)
    800052b8:	0da13423          	sd	s10,200(sp)
    800052bc:	0db13823          	sd	s11,208(sp)
    800052c0:	0dc13c23          	sd	t3,216(sp)
    800052c4:	0fd13023          	sd	t4,224(sp)
    800052c8:	0fe13423          	sd	t5,232(sp)
    800052cc:	0ff13823          	sd	t6,240(sp)
    800052d0:	ccdff0ef          	jal	ra,80004f9c <kerneltrap>
    800052d4:	00013083          	ld	ra,0(sp)
    800052d8:	00813103          	ld	sp,8(sp)
    800052dc:	01013183          	ld	gp,16(sp)
    800052e0:	02013283          	ld	t0,32(sp)
    800052e4:	02813303          	ld	t1,40(sp)
    800052e8:	03013383          	ld	t2,48(sp)
    800052ec:	03813403          	ld	s0,56(sp)
    800052f0:	04013483          	ld	s1,64(sp)
    800052f4:	04813503          	ld	a0,72(sp)
    800052f8:	05013583          	ld	a1,80(sp)
    800052fc:	05813603          	ld	a2,88(sp)
    80005300:	06013683          	ld	a3,96(sp)
    80005304:	06813703          	ld	a4,104(sp)
    80005308:	07013783          	ld	a5,112(sp)
    8000530c:	07813803          	ld	a6,120(sp)
    80005310:	08013883          	ld	a7,128(sp)
    80005314:	08813903          	ld	s2,136(sp)
    80005318:	09013983          	ld	s3,144(sp)
    8000531c:	09813a03          	ld	s4,152(sp)
    80005320:	0a013a83          	ld	s5,160(sp)
    80005324:	0a813b03          	ld	s6,168(sp)
    80005328:	0b013b83          	ld	s7,176(sp)
    8000532c:	0b813c03          	ld	s8,184(sp)
    80005330:	0c013c83          	ld	s9,192(sp)
    80005334:	0c813d03          	ld	s10,200(sp)
    80005338:	0d013d83          	ld	s11,208(sp)
    8000533c:	0d813e03          	ld	t3,216(sp)
    80005340:	0e013e83          	ld	t4,224(sp)
    80005344:	0e813f03          	ld	t5,232(sp)
    80005348:	0f013f83          	ld	t6,240(sp)
    8000534c:	10010113          	addi	sp,sp,256
    80005350:	10200073          	sret
    80005354:	00000013          	nop
    80005358:	00000013          	nop
    8000535c:	00000013          	nop

0000000080005360 <timervec>:
    80005360:	34051573          	csrrw	a0,mscratch,a0
    80005364:	00b53023          	sd	a1,0(a0)
    80005368:	00c53423          	sd	a2,8(a0)
    8000536c:	00d53823          	sd	a3,16(a0)
    80005370:	01853583          	ld	a1,24(a0)
    80005374:	02053603          	ld	a2,32(a0)
    80005378:	0005b683          	ld	a3,0(a1)
    8000537c:	00c686b3          	add	a3,a3,a2
    80005380:	00d5b023          	sd	a3,0(a1)
    80005384:	00200593          	li	a1,2
    80005388:	14459073          	csrw	sip,a1
    8000538c:	01053683          	ld	a3,16(a0)
    80005390:	00853603          	ld	a2,8(a0)
    80005394:	00053583          	ld	a1,0(a0)
    80005398:	34051573          	csrrw	a0,mscratch,a0
    8000539c:	30200073          	mret

00000000800053a0 <plicinit>:
    800053a0:	ff010113          	addi	sp,sp,-16
    800053a4:	00813423          	sd	s0,8(sp)
    800053a8:	01010413          	addi	s0,sp,16
    800053ac:	00813403          	ld	s0,8(sp)
    800053b0:	0c0007b7          	lui	a5,0xc000
    800053b4:	00100713          	li	a4,1
    800053b8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800053bc:	00e7a223          	sw	a4,4(a5)
    800053c0:	01010113          	addi	sp,sp,16
    800053c4:	00008067          	ret

00000000800053c8 <plicinithart>:
    800053c8:	ff010113          	addi	sp,sp,-16
    800053cc:	00813023          	sd	s0,0(sp)
    800053d0:	00113423          	sd	ra,8(sp)
    800053d4:	01010413          	addi	s0,sp,16
    800053d8:	00000097          	auipc	ra,0x0
    800053dc:	a44080e7          	jalr	-1468(ra) # 80004e1c <cpuid>
    800053e0:	0085171b          	slliw	a4,a0,0x8
    800053e4:	0c0027b7          	lui	a5,0xc002
    800053e8:	00e787b3          	add	a5,a5,a4
    800053ec:	40200713          	li	a4,1026
    800053f0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800053f4:	00813083          	ld	ra,8(sp)
    800053f8:	00013403          	ld	s0,0(sp)
    800053fc:	00d5151b          	slliw	a0,a0,0xd
    80005400:	0c2017b7          	lui	a5,0xc201
    80005404:	00a78533          	add	a0,a5,a0
    80005408:	00052023          	sw	zero,0(a0)
    8000540c:	01010113          	addi	sp,sp,16
    80005410:	00008067          	ret

0000000080005414 <plic_claim>:
    80005414:	ff010113          	addi	sp,sp,-16
    80005418:	00813023          	sd	s0,0(sp)
    8000541c:	00113423          	sd	ra,8(sp)
    80005420:	01010413          	addi	s0,sp,16
    80005424:	00000097          	auipc	ra,0x0
    80005428:	9f8080e7          	jalr	-1544(ra) # 80004e1c <cpuid>
    8000542c:	00813083          	ld	ra,8(sp)
    80005430:	00013403          	ld	s0,0(sp)
    80005434:	00d5151b          	slliw	a0,a0,0xd
    80005438:	0c2017b7          	lui	a5,0xc201
    8000543c:	00a78533          	add	a0,a5,a0
    80005440:	00452503          	lw	a0,4(a0)
    80005444:	01010113          	addi	sp,sp,16
    80005448:	00008067          	ret

000000008000544c <plic_complete>:
    8000544c:	fe010113          	addi	sp,sp,-32
    80005450:	00813823          	sd	s0,16(sp)
    80005454:	00913423          	sd	s1,8(sp)
    80005458:	00113c23          	sd	ra,24(sp)
    8000545c:	02010413          	addi	s0,sp,32
    80005460:	00050493          	mv	s1,a0
    80005464:	00000097          	auipc	ra,0x0
    80005468:	9b8080e7          	jalr	-1608(ra) # 80004e1c <cpuid>
    8000546c:	01813083          	ld	ra,24(sp)
    80005470:	01013403          	ld	s0,16(sp)
    80005474:	00d5179b          	slliw	a5,a0,0xd
    80005478:	0c201737          	lui	a4,0xc201
    8000547c:	00f707b3          	add	a5,a4,a5
    80005480:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005484:	00813483          	ld	s1,8(sp)
    80005488:	02010113          	addi	sp,sp,32
    8000548c:	00008067          	ret

0000000080005490 <consolewrite>:
    80005490:	fb010113          	addi	sp,sp,-80
    80005494:	04813023          	sd	s0,64(sp)
    80005498:	04113423          	sd	ra,72(sp)
    8000549c:	02913c23          	sd	s1,56(sp)
    800054a0:	03213823          	sd	s2,48(sp)
    800054a4:	03313423          	sd	s3,40(sp)
    800054a8:	03413023          	sd	s4,32(sp)
    800054ac:	01513c23          	sd	s5,24(sp)
    800054b0:	05010413          	addi	s0,sp,80
    800054b4:	06c05c63          	blez	a2,8000552c <consolewrite+0x9c>
    800054b8:	00060993          	mv	s3,a2
    800054bc:	00050a13          	mv	s4,a0
    800054c0:	00058493          	mv	s1,a1
    800054c4:	00000913          	li	s2,0
    800054c8:	fff00a93          	li	s5,-1
    800054cc:	01c0006f          	j	800054e8 <consolewrite+0x58>
    800054d0:	fbf44503          	lbu	a0,-65(s0)
    800054d4:	0019091b          	addiw	s2,s2,1
    800054d8:	00148493          	addi	s1,s1,1
    800054dc:	00001097          	auipc	ra,0x1
    800054e0:	a9c080e7          	jalr	-1380(ra) # 80005f78 <uartputc>
    800054e4:	03298063          	beq	s3,s2,80005504 <consolewrite+0x74>
    800054e8:	00048613          	mv	a2,s1
    800054ec:	00100693          	li	a3,1
    800054f0:	000a0593          	mv	a1,s4
    800054f4:	fbf40513          	addi	a0,s0,-65
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	9dc080e7          	jalr	-1572(ra) # 80004ed4 <either_copyin>
    80005500:	fd5518e3          	bne	a0,s5,800054d0 <consolewrite+0x40>
    80005504:	04813083          	ld	ra,72(sp)
    80005508:	04013403          	ld	s0,64(sp)
    8000550c:	03813483          	ld	s1,56(sp)
    80005510:	02813983          	ld	s3,40(sp)
    80005514:	02013a03          	ld	s4,32(sp)
    80005518:	01813a83          	ld	s5,24(sp)
    8000551c:	00090513          	mv	a0,s2
    80005520:	03013903          	ld	s2,48(sp)
    80005524:	05010113          	addi	sp,sp,80
    80005528:	00008067          	ret
    8000552c:	00000913          	li	s2,0
    80005530:	fd5ff06f          	j	80005504 <consolewrite+0x74>

0000000080005534 <consoleread>:
    80005534:	f9010113          	addi	sp,sp,-112
    80005538:	06813023          	sd	s0,96(sp)
    8000553c:	04913c23          	sd	s1,88(sp)
    80005540:	05213823          	sd	s2,80(sp)
    80005544:	05313423          	sd	s3,72(sp)
    80005548:	05413023          	sd	s4,64(sp)
    8000554c:	03513c23          	sd	s5,56(sp)
    80005550:	03613823          	sd	s6,48(sp)
    80005554:	03713423          	sd	s7,40(sp)
    80005558:	03813023          	sd	s8,32(sp)
    8000555c:	06113423          	sd	ra,104(sp)
    80005560:	01913c23          	sd	s9,24(sp)
    80005564:	07010413          	addi	s0,sp,112
    80005568:	00060b93          	mv	s7,a2
    8000556c:	00050913          	mv	s2,a0
    80005570:	00058c13          	mv	s8,a1
    80005574:	00060b1b          	sext.w	s6,a2
    80005578:	00005497          	auipc	s1,0x5
    8000557c:	a1048493          	addi	s1,s1,-1520 # 80009f88 <cons>
    80005580:	00400993          	li	s3,4
    80005584:	fff00a13          	li	s4,-1
    80005588:	00a00a93          	li	s5,10
    8000558c:	05705e63          	blez	s7,800055e8 <consoleread+0xb4>
    80005590:	09c4a703          	lw	a4,156(s1)
    80005594:	0984a783          	lw	a5,152(s1)
    80005598:	0007071b          	sext.w	a4,a4
    8000559c:	08e78463          	beq	a5,a4,80005624 <consoleread+0xf0>
    800055a0:	07f7f713          	andi	a4,a5,127
    800055a4:	00e48733          	add	a4,s1,a4
    800055a8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800055ac:	0017869b          	addiw	a3,a5,1
    800055b0:	08d4ac23          	sw	a3,152(s1)
    800055b4:	00070c9b          	sext.w	s9,a4
    800055b8:	0b370663          	beq	a4,s3,80005664 <consoleread+0x130>
    800055bc:	00100693          	li	a3,1
    800055c0:	f9f40613          	addi	a2,s0,-97
    800055c4:	000c0593          	mv	a1,s8
    800055c8:	00090513          	mv	a0,s2
    800055cc:	f8e40fa3          	sb	a4,-97(s0)
    800055d0:	00000097          	auipc	ra,0x0
    800055d4:	8b8080e7          	jalr	-1864(ra) # 80004e88 <either_copyout>
    800055d8:	01450863          	beq	a0,s4,800055e8 <consoleread+0xb4>
    800055dc:	001c0c13          	addi	s8,s8,1
    800055e0:	fffb8b9b          	addiw	s7,s7,-1
    800055e4:	fb5c94e3          	bne	s9,s5,8000558c <consoleread+0x58>
    800055e8:	000b851b          	sext.w	a0,s7
    800055ec:	06813083          	ld	ra,104(sp)
    800055f0:	06013403          	ld	s0,96(sp)
    800055f4:	05813483          	ld	s1,88(sp)
    800055f8:	05013903          	ld	s2,80(sp)
    800055fc:	04813983          	ld	s3,72(sp)
    80005600:	04013a03          	ld	s4,64(sp)
    80005604:	03813a83          	ld	s5,56(sp)
    80005608:	02813b83          	ld	s7,40(sp)
    8000560c:	02013c03          	ld	s8,32(sp)
    80005610:	01813c83          	ld	s9,24(sp)
    80005614:	40ab053b          	subw	a0,s6,a0
    80005618:	03013b03          	ld	s6,48(sp)
    8000561c:	07010113          	addi	sp,sp,112
    80005620:	00008067          	ret
    80005624:	00001097          	auipc	ra,0x1
    80005628:	1d8080e7          	jalr	472(ra) # 800067fc <push_on>
    8000562c:	0984a703          	lw	a4,152(s1)
    80005630:	09c4a783          	lw	a5,156(s1)
    80005634:	0007879b          	sext.w	a5,a5
    80005638:	fef70ce3          	beq	a4,a5,80005630 <consoleread+0xfc>
    8000563c:	00001097          	auipc	ra,0x1
    80005640:	234080e7          	jalr	564(ra) # 80006870 <pop_on>
    80005644:	0984a783          	lw	a5,152(s1)
    80005648:	07f7f713          	andi	a4,a5,127
    8000564c:	00e48733          	add	a4,s1,a4
    80005650:	01874703          	lbu	a4,24(a4)
    80005654:	0017869b          	addiw	a3,a5,1
    80005658:	08d4ac23          	sw	a3,152(s1)
    8000565c:	00070c9b          	sext.w	s9,a4
    80005660:	f5371ee3          	bne	a4,s3,800055bc <consoleread+0x88>
    80005664:	000b851b          	sext.w	a0,s7
    80005668:	f96bf2e3          	bgeu	s7,s6,800055ec <consoleread+0xb8>
    8000566c:	08f4ac23          	sw	a5,152(s1)
    80005670:	f7dff06f          	j	800055ec <consoleread+0xb8>

0000000080005674 <consputc>:
    80005674:	10000793          	li	a5,256
    80005678:	00f50663          	beq	a0,a5,80005684 <consputc+0x10>
    8000567c:	00001317          	auipc	t1,0x1
    80005680:	9f430067          	jr	-1548(t1) # 80006070 <uartputc_sync>
    80005684:	ff010113          	addi	sp,sp,-16
    80005688:	00113423          	sd	ra,8(sp)
    8000568c:	00813023          	sd	s0,0(sp)
    80005690:	01010413          	addi	s0,sp,16
    80005694:	00800513          	li	a0,8
    80005698:	00001097          	auipc	ra,0x1
    8000569c:	9d8080e7          	jalr	-1576(ra) # 80006070 <uartputc_sync>
    800056a0:	02000513          	li	a0,32
    800056a4:	00001097          	auipc	ra,0x1
    800056a8:	9cc080e7          	jalr	-1588(ra) # 80006070 <uartputc_sync>
    800056ac:	00013403          	ld	s0,0(sp)
    800056b0:	00813083          	ld	ra,8(sp)
    800056b4:	00800513          	li	a0,8
    800056b8:	01010113          	addi	sp,sp,16
    800056bc:	00001317          	auipc	t1,0x1
    800056c0:	9b430067          	jr	-1612(t1) # 80006070 <uartputc_sync>

00000000800056c4 <consoleintr>:
    800056c4:	fe010113          	addi	sp,sp,-32
    800056c8:	00813823          	sd	s0,16(sp)
    800056cc:	00913423          	sd	s1,8(sp)
    800056d0:	01213023          	sd	s2,0(sp)
    800056d4:	00113c23          	sd	ra,24(sp)
    800056d8:	02010413          	addi	s0,sp,32
    800056dc:	00005917          	auipc	s2,0x5
    800056e0:	8ac90913          	addi	s2,s2,-1876 # 80009f88 <cons>
    800056e4:	00050493          	mv	s1,a0
    800056e8:	00090513          	mv	a0,s2
    800056ec:	00001097          	auipc	ra,0x1
    800056f0:	e40080e7          	jalr	-448(ra) # 8000652c <acquire>
    800056f4:	02048c63          	beqz	s1,8000572c <consoleintr+0x68>
    800056f8:	0a092783          	lw	a5,160(s2)
    800056fc:	09892703          	lw	a4,152(s2)
    80005700:	07f00693          	li	a3,127
    80005704:	40e7873b          	subw	a4,a5,a4
    80005708:	02e6e263          	bltu	a3,a4,8000572c <consoleintr+0x68>
    8000570c:	00d00713          	li	a4,13
    80005710:	04e48063          	beq	s1,a4,80005750 <consoleintr+0x8c>
    80005714:	07f7f713          	andi	a4,a5,127
    80005718:	00e90733          	add	a4,s2,a4
    8000571c:	0017879b          	addiw	a5,a5,1
    80005720:	0af92023          	sw	a5,160(s2)
    80005724:	00970c23          	sb	s1,24(a4)
    80005728:	08f92e23          	sw	a5,156(s2)
    8000572c:	01013403          	ld	s0,16(sp)
    80005730:	01813083          	ld	ra,24(sp)
    80005734:	00813483          	ld	s1,8(sp)
    80005738:	00013903          	ld	s2,0(sp)
    8000573c:	00005517          	auipc	a0,0x5
    80005740:	84c50513          	addi	a0,a0,-1972 # 80009f88 <cons>
    80005744:	02010113          	addi	sp,sp,32
    80005748:	00001317          	auipc	t1,0x1
    8000574c:	eb030067          	jr	-336(t1) # 800065f8 <release>
    80005750:	00a00493          	li	s1,10
    80005754:	fc1ff06f          	j	80005714 <consoleintr+0x50>

0000000080005758 <consoleinit>:
    80005758:	fe010113          	addi	sp,sp,-32
    8000575c:	00113c23          	sd	ra,24(sp)
    80005760:	00813823          	sd	s0,16(sp)
    80005764:	00913423          	sd	s1,8(sp)
    80005768:	02010413          	addi	s0,sp,32
    8000576c:	00005497          	auipc	s1,0x5
    80005770:	81c48493          	addi	s1,s1,-2020 # 80009f88 <cons>
    80005774:	00048513          	mv	a0,s1
    80005778:	00002597          	auipc	a1,0x2
    8000577c:	c9858593          	addi	a1,a1,-872 # 80007410 <CONSOLE_STATUS+0x400>
    80005780:	00001097          	auipc	ra,0x1
    80005784:	d88080e7          	jalr	-632(ra) # 80006508 <initlock>
    80005788:	00000097          	auipc	ra,0x0
    8000578c:	7ac080e7          	jalr	1964(ra) # 80005f34 <uartinit>
    80005790:	01813083          	ld	ra,24(sp)
    80005794:	01013403          	ld	s0,16(sp)
    80005798:	00000797          	auipc	a5,0x0
    8000579c:	d9c78793          	addi	a5,a5,-612 # 80005534 <consoleread>
    800057a0:	0af4bc23          	sd	a5,184(s1)
    800057a4:	00000797          	auipc	a5,0x0
    800057a8:	cec78793          	addi	a5,a5,-788 # 80005490 <consolewrite>
    800057ac:	0cf4b023          	sd	a5,192(s1)
    800057b0:	00813483          	ld	s1,8(sp)
    800057b4:	02010113          	addi	sp,sp,32
    800057b8:	00008067          	ret

00000000800057bc <console_read>:
    800057bc:	ff010113          	addi	sp,sp,-16
    800057c0:	00813423          	sd	s0,8(sp)
    800057c4:	01010413          	addi	s0,sp,16
    800057c8:	00813403          	ld	s0,8(sp)
    800057cc:	00005317          	auipc	t1,0x5
    800057d0:	87433303          	ld	t1,-1932(t1) # 8000a040 <devsw+0x10>
    800057d4:	01010113          	addi	sp,sp,16
    800057d8:	00030067          	jr	t1

00000000800057dc <console_write>:
    800057dc:	ff010113          	addi	sp,sp,-16
    800057e0:	00813423          	sd	s0,8(sp)
    800057e4:	01010413          	addi	s0,sp,16
    800057e8:	00813403          	ld	s0,8(sp)
    800057ec:	00005317          	auipc	t1,0x5
    800057f0:	85c33303          	ld	t1,-1956(t1) # 8000a048 <devsw+0x18>
    800057f4:	01010113          	addi	sp,sp,16
    800057f8:	00030067          	jr	t1

00000000800057fc <panic>:
    800057fc:	fe010113          	addi	sp,sp,-32
    80005800:	00113c23          	sd	ra,24(sp)
    80005804:	00813823          	sd	s0,16(sp)
    80005808:	00913423          	sd	s1,8(sp)
    8000580c:	02010413          	addi	s0,sp,32
    80005810:	00050493          	mv	s1,a0
    80005814:	00002517          	auipc	a0,0x2
    80005818:	c0450513          	addi	a0,a0,-1020 # 80007418 <CONSOLE_STATUS+0x408>
    8000581c:	00005797          	auipc	a5,0x5
    80005820:	8c07a623          	sw	zero,-1844(a5) # 8000a0e8 <pr+0x18>
    80005824:	00000097          	auipc	ra,0x0
    80005828:	034080e7          	jalr	52(ra) # 80005858 <__printf>
    8000582c:	00048513          	mv	a0,s1
    80005830:	00000097          	auipc	ra,0x0
    80005834:	028080e7          	jalr	40(ra) # 80005858 <__printf>
    80005838:	00002517          	auipc	a0,0x2
    8000583c:	a0050513          	addi	a0,a0,-1536 # 80007238 <CONSOLE_STATUS+0x228>
    80005840:	00000097          	auipc	ra,0x0
    80005844:	018080e7          	jalr	24(ra) # 80005858 <__printf>
    80005848:	00100793          	li	a5,1
    8000584c:	00003717          	auipc	a4,0x3
    80005850:	56f72e23          	sw	a5,1404(a4) # 80008dc8 <panicked>
    80005854:	0000006f          	j	80005854 <panic+0x58>

0000000080005858 <__printf>:
    80005858:	f3010113          	addi	sp,sp,-208
    8000585c:	08813023          	sd	s0,128(sp)
    80005860:	07313423          	sd	s3,104(sp)
    80005864:	09010413          	addi	s0,sp,144
    80005868:	05813023          	sd	s8,64(sp)
    8000586c:	08113423          	sd	ra,136(sp)
    80005870:	06913c23          	sd	s1,120(sp)
    80005874:	07213823          	sd	s2,112(sp)
    80005878:	07413023          	sd	s4,96(sp)
    8000587c:	05513c23          	sd	s5,88(sp)
    80005880:	05613823          	sd	s6,80(sp)
    80005884:	05713423          	sd	s7,72(sp)
    80005888:	03913c23          	sd	s9,56(sp)
    8000588c:	03a13823          	sd	s10,48(sp)
    80005890:	03b13423          	sd	s11,40(sp)
    80005894:	00005317          	auipc	t1,0x5
    80005898:	83c30313          	addi	t1,t1,-1988 # 8000a0d0 <pr>
    8000589c:	01832c03          	lw	s8,24(t1)
    800058a0:	00b43423          	sd	a1,8(s0)
    800058a4:	00c43823          	sd	a2,16(s0)
    800058a8:	00d43c23          	sd	a3,24(s0)
    800058ac:	02e43023          	sd	a4,32(s0)
    800058b0:	02f43423          	sd	a5,40(s0)
    800058b4:	03043823          	sd	a6,48(s0)
    800058b8:	03143c23          	sd	a7,56(s0)
    800058bc:	00050993          	mv	s3,a0
    800058c0:	4a0c1663          	bnez	s8,80005d6c <__printf+0x514>
    800058c4:	60098c63          	beqz	s3,80005edc <__printf+0x684>
    800058c8:	0009c503          	lbu	a0,0(s3)
    800058cc:	00840793          	addi	a5,s0,8
    800058d0:	f6f43c23          	sd	a5,-136(s0)
    800058d4:	00000493          	li	s1,0
    800058d8:	22050063          	beqz	a0,80005af8 <__printf+0x2a0>
    800058dc:	00002a37          	lui	s4,0x2
    800058e0:	00018ab7          	lui	s5,0x18
    800058e4:	000f4b37          	lui	s6,0xf4
    800058e8:	00989bb7          	lui	s7,0x989
    800058ec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800058f0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800058f4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800058f8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800058fc:	00148c9b          	addiw	s9,s1,1
    80005900:	02500793          	li	a5,37
    80005904:	01998933          	add	s2,s3,s9
    80005908:	38f51263          	bne	a0,a5,80005c8c <__printf+0x434>
    8000590c:	00094783          	lbu	a5,0(s2)
    80005910:	00078c9b          	sext.w	s9,a5
    80005914:	1e078263          	beqz	a5,80005af8 <__printf+0x2a0>
    80005918:	0024849b          	addiw	s1,s1,2
    8000591c:	07000713          	li	a4,112
    80005920:	00998933          	add	s2,s3,s1
    80005924:	38e78a63          	beq	a5,a4,80005cb8 <__printf+0x460>
    80005928:	20f76863          	bltu	a4,a5,80005b38 <__printf+0x2e0>
    8000592c:	42a78863          	beq	a5,a0,80005d5c <__printf+0x504>
    80005930:	06400713          	li	a4,100
    80005934:	40e79663          	bne	a5,a4,80005d40 <__printf+0x4e8>
    80005938:	f7843783          	ld	a5,-136(s0)
    8000593c:	0007a603          	lw	a2,0(a5)
    80005940:	00878793          	addi	a5,a5,8
    80005944:	f6f43c23          	sd	a5,-136(s0)
    80005948:	42064a63          	bltz	a2,80005d7c <__printf+0x524>
    8000594c:	00a00713          	li	a4,10
    80005950:	02e677bb          	remuw	a5,a2,a4
    80005954:	00002d97          	auipc	s11,0x2
    80005958:	aecd8d93          	addi	s11,s11,-1300 # 80007440 <digits>
    8000595c:	00900593          	li	a1,9
    80005960:	0006051b          	sext.w	a0,a2
    80005964:	00000c93          	li	s9,0
    80005968:	02079793          	slli	a5,a5,0x20
    8000596c:	0207d793          	srli	a5,a5,0x20
    80005970:	00fd87b3          	add	a5,s11,a5
    80005974:	0007c783          	lbu	a5,0(a5)
    80005978:	02e656bb          	divuw	a3,a2,a4
    8000597c:	f8f40023          	sb	a5,-128(s0)
    80005980:	14c5d863          	bge	a1,a2,80005ad0 <__printf+0x278>
    80005984:	06300593          	li	a1,99
    80005988:	00100c93          	li	s9,1
    8000598c:	02e6f7bb          	remuw	a5,a3,a4
    80005990:	02079793          	slli	a5,a5,0x20
    80005994:	0207d793          	srli	a5,a5,0x20
    80005998:	00fd87b3          	add	a5,s11,a5
    8000599c:	0007c783          	lbu	a5,0(a5)
    800059a0:	02e6d73b          	divuw	a4,a3,a4
    800059a4:	f8f400a3          	sb	a5,-127(s0)
    800059a8:	12a5f463          	bgeu	a1,a0,80005ad0 <__printf+0x278>
    800059ac:	00a00693          	li	a3,10
    800059b0:	00900593          	li	a1,9
    800059b4:	02d777bb          	remuw	a5,a4,a3
    800059b8:	02079793          	slli	a5,a5,0x20
    800059bc:	0207d793          	srli	a5,a5,0x20
    800059c0:	00fd87b3          	add	a5,s11,a5
    800059c4:	0007c503          	lbu	a0,0(a5)
    800059c8:	02d757bb          	divuw	a5,a4,a3
    800059cc:	f8a40123          	sb	a0,-126(s0)
    800059d0:	48e5f263          	bgeu	a1,a4,80005e54 <__printf+0x5fc>
    800059d4:	06300513          	li	a0,99
    800059d8:	02d7f5bb          	remuw	a1,a5,a3
    800059dc:	02059593          	slli	a1,a1,0x20
    800059e0:	0205d593          	srli	a1,a1,0x20
    800059e4:	00bd85b3          	add	a1,s11,a1
    800059e8:	0005c583          	lbu	a1,0(a1)
    800059ec:	02d7d7bb          	divuw	a5,a5,a3
    800059f0:	f8b401a3          	sb	a1,-125(s0)
    800059f4:	48e57263          	bgeu	a0,a4,80005e78 <__printf+0x620>
    800059f8:	3e700513          	li	a0,999
    800059fc:	02d7f5bb          	remuw	a1,a5,a3
    80005a00:	02059593          	slli	a1,a1,0x20
    80005a04:	0205d593          	srli	a1,a1,0x20
    80005a08:	00bd85b3          	add	a1,s11,a1
    80005a0c:	0005c583          	lbu	a1,0(a1)
    80005a10:	02d7d7bb          	divuw	a5,a5,a3
    80005a14:	f8b40223          	sb	a1,-124(s0)
    80005a18:	46e57663          	bgeu	a0,a4,80005e84 <__printf+0x62c>
    80005a1c:	02d7f5bb          	remuw	a1,a5,a3
    80005a20:	02059593          	slli	a1,a1,0x20
    80005a24:	0205d593          	srli	a1,a1,0x20
    80005a28:	00bd85b3          	add	a1,s11,a1
    80005a2c:	0005c583          	lbu	a1,0(a1)
    80005a30:	02d7d7bb          	divuw	a5,a5,a3
    80005a34:	f8b402a3          	sb	a1,-123(s0)
    80005a38:	46ea7863          	bgeu	s4,a4,80005ea8 <__printf+0x650>
    80005a3c:	02d7f5bb          	remuw	a1,a5,a3
    80005a40:	02059593          	slli	a1,a1,0x20
    80005a44:	0205d593          	srli	a1,a1,0x20
    80005a48:	00bd85b3          	add	a1,s11,a1
    80005a4c:	0005c583          	lbu	a1,0(a1)
    80005a50:	02d7d7bb          	divuw	a5,a5,a3
    80005a54:	f8b40323          	sb	a1,-122(s0)
    80005a58:	3eeaf863          	bgeu	s5,a4,80005e48 <__printf+0x5f0>
    80005a5c:	02d7f5bb          	remuw	a1,a5,a3
    80005a60:	02059593          	slli	a1,a1,0x20
    80005a64:	0205d593          	srli	a1,a1,0x20
    80005a68:	00bd85b3          	add	a1,s11,a1
    80005a6c:	0005c583          	lbu	a1,0(a1)
    80005a70:	02d7d7bb          	divuw	a5,a5,a3
    80005a74:	f8b403a3          	sb	a1,-121(s0)
    80005a78:	42eb7e63          	bgeu	s6,a4,80005eb4 <__printf+0x65c>
    80005a7c:	02d7f5bb          	remuw	a1,a5,a3
    80005a80:	02059593          	slli	a1,a1,0x20
    80005a84:	0205d593          	srli	a1,a1,0x20
    80005a88:	00bd85b3          	add	a1,s11,a1
    80005a8c:	0005c583          	lbu	a1,0(a1)
    80005a90:	02d7d7bb          	divuw	a5,a5,a3
    80005a94:	f8b40423          	sb	a1,-120(s0)
    80005a98:	42ebfc63          	bgeu	s7,a4,80005ed0 <__printf+0x678>
    80005a9c:	02079793          	slli	a5,a5,0x20
    80005aa0:	0207d793          	srli	a5,a5,0x20
    80005aa4:	00fd8db3          	add	s11,s11,a5
    80005aa8:	000dc703          	lbu	a4,0(s11)
    80005aac:	00a00793          	li	a5,10
    80005ab0:	00900c93          	li	s9,9
    80005ab4:	f8e404a3          	sb	a4,-119(s0)
    80005ab8:	00065c63          	bgez	a2,80005ad0 <__printf+0x278>
    80005abc:	f9040713          	addi	a4,s0,-112
    80005ac0:	00f70733          	add	a4,a4,a5
    80005ac4:	02d00693          	li	a3,45
    80005ac8:	fed70823          	sb	a3,-16(a4)
    80005acc:	00078c93          	mv	s9,a5
    80005ad0:	f8040793          	addi	a5,s0,-128
    80005ad4:	01978cb3          	add	s9,a5,s9
    80005ad8:	f7f40d13          	addi	s10,s0,-129
    80005adc:	000cc503          	lbu	a0,0(s9)
    80005ae0:	fffc8c93          	addi	s9,s9,-1
    80005ae4:	00000097          	auipc	ra,0x0
    80005ae8:	b90080e7          	jalr	-1136(ra) # 80005674 <consputc>
    80005aec:	ffac98e3          	bne	s9,s10,80005adc <__printf+0x284>
    80005af0:	00094503          	lbu	a0,0(s2)
    80005af4:	e00514e3          	bnez	a0,800058fc <__printf+0xa4>
    80005af8:	1a0c1663          	bnez	s8,80005ca4 <__printf+0x44c>
    80005afc:	08813083          	ld	ra,136(sp)
    80005b00:	08013403          	ld	s0,128(sp)
    80005b04:	07813483          	ld	s1,120(sp)
    80005b08:	07013903          	ld	s2,112(sp)
    80005b0c:	06813983          	ld	s3,104(sp)
    80005b10:	06013a03          	ld	s4,96(sp)
    80005b14:	05813a83          	ld	s5,88(sp)
    80005b18:	05013b03          	ld	s6,80(sp)
    80005b1c:	04813b83          	ld	s7,72(sp)
    80005b20:	04013c03          	ld	s8,64(sp)
    80005b24:	03813c83          	ld	s9,56(sp)
    80005b28:	03013d03          	ld	s10,48(sp)
    80005b2c:	02813d83          	ld	s11,40(sp)
    80005b30:	0d010113          	addi	sp,sp,208
    80005b34:	00008067          	ret
    80005b38:	07300713          	li	a4,115
    80005b3c:	1ce78a63          	beq	a5,a4,80005d10 <__printf+0x4b8>
    80005b40:	07800713          	li	a4,120
    80005b44:	1ee79e63          	bne	a5,a4,80005d40 <__printf+0x4e8>
    80005b48:	f7843783          	ld	a5,-136(s0)
    80005b4c:	0007a703          	lw	a4,0(a5)
    80005b50:	00878793          	addi	a5,a5,8
    80005b54:	f6f43c23          	sd	a5,-136(s0)
    80005b58:	28074263          	bltz	a4,80005ddc <__printf+0x584>
    80005b5c:	00002d97          	auipc	s11,0x2
    80005b60:	8e4d8d93          	addi	s11,s11,-1820 # 80007440 <digits>
    80005b64:	00f77793          	andi	a5,a4,15
    80005b68:	00fd87b3          	add	a5,s11,a5
    80005b6c:	0007c683          	lbu	a3,0(a5)
    80005b70:	00f00613          	li	a2,15
    80005b74:	0007079b          	sext.w	a5,a4
    80005b78:	f8d40023          	sb	a3,-128(s0)
    80005b7c:	0047559b          	srliw	a1,a4,0x4
    80005b80:	0047569b          	srliw	a3,a4,0x4
    80005b84:	00000c93          	li	s9,0
    80005b88:	0ee65063          	bge	a2,a4,80005c68 <__printf+0x410>
    80005b8c:	00f6f693          	andi	a3,a3,15
    80005b90:	00dd86b3          	add	a3,s11,a3
    80005b94:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005b98:	0087d79b          	srliw	a5,a5,0x8
    80005b9c:	00100c93          	li	s9,1
    80005ba0:	f8d400a3          	sb	a3,-127(s0)
    80005ba4:	0cb67263          	bgeu	a2,a1,80005c68 <__printf+0x410>
    80005ba8:	00f7f693          	andi	a3,a5,15
    80005bac:	00dd86b3          	add	a3,s11,a3
    80005bb0:	0006c583          	lbu	a1,0(a3)
    80005bb4:	00f00613          	li	a2,15
    80005bb8:	0047d69b          	srliw	a3,a5,0x4
    80005bbc:	f8b40123          	sb	a1,-126(s0)
    80005bc0:	0047d593          	srli	a1,a5,0x4
    80005bc4:	28f67e63          	bgeu	a2,a5,80005e60 <__printf+0x608>
    80005bc8:	00f6f693          	andi	a3,a3,15
    80005bcc:	00dd86b3          	add	a3,s11,a3
    80005bd0:	0006c503          	lbu	a0,0(a3)
    80005bd4:	0087d813          	srli	a6,a5,0x8
    80005bd8:	0087d69b          	srliw	a3,a5,0x8
    80005bdc:	f8a401a3          	sb	a0,-125(s0)
    80005be0:	28b67663          	bgeu	a2,a1,80005e6c <__printf+0x614>
    80005be4:	00f6f693          	andi	a3,a3,15
    80005be8:	00dd86b3          	add	a3,s11,a3
    80005bec:	0006c583          	lbu	a1,0(a3)
    80005bf0:	00c7d513          	srli	a0,a5,0xc
    80005bf4:	00c7d69b          	srliw	a3,a5,0xc
    80005bf8:	f8b40223          	sb	a1,-124(s0)
    80005bfc:	29067a63          	bgeu	a2,a6,80005e90 <__printf+0x638>
    80005c00:	00f6f693          	andi	a3,a3,15
    80005c04:	00dd86b3          	add	a3,s11,a3
    80005c08:	0006c583          	lbu	a1,0(a3)
    80005c0c:	0107d813          	srli	a6,a5,0x10
    80005c10:	0107d69b          	srliw	a3,a5,0x10
    80005c14:	f8b402a3          	sb	a1,-123(s0)
    80005c18:	28a67263          	bgeu	a2,a0,80005e9c <__printf+0x644>
    80005c1c:	00f6f693          	andi	a3,a3,15
    80005c20:	00dd86b3          	add	a3,s11,a3
    80005c24:	0006c683          	lbu	a3,0(a3)
    80005c28:	0147d79b          	srliw	a5,a5,0x14
    80005c2c:	f8d40323          	sb	a3,-122(s0)
    80005c30:	21067663          	bgeu	a2,a6,80005e3c <__printf+0x5e4>
    80005c34:	02079793          	slli	a5,a5,0x20
    80005c38:	0207d793          	srli	a5,a5,0x20
    80005c3c:	00fd8db3          	add	s11,s11,a5
    80005c40:	000dc683          	lbu	a3,0(s11)
    80005c44:	00800793          	li	a5,8
    80005c48:	00700c93          	li	s9,7
    80005c4c:	f8d403a3          	sb	a3,-121(s0)
    80005c50:	00075c63          	bgez	a4,80005c68 <__printf+0x410>
    80005c54:	f9040713          	addi	a4,s0,-112
    80005c58:	00f70733          	add	a4,a4,a5
    80005c5c:	02d00693          	li	a3,45
    80005c60:	fed70823          	sb	a3,-16(a4)
    80005c64:	00078c93          	mv	s9,a5
    80005c68:	f8040793          	addi	a5,s0,-128
    80005c6c:	01978cb3          	add	s9,a5,s9
    80005c70:	f7f40d13          	addi	s10,s0,-129
    80005c74:	000cc503          	lbu	a0,0(s9)
    80005c78:	fffc8c93          	addi	s9,s9,-1
    80005c7c:	00000097          	auipc	ra,0x0
    80005c80:	9f8080e7          	jalr	-1544(ra) # 80005674 <consputc>
    80005c84:	ff9d18e3          	bne	s10,s9,80005c74 <__printf+0x41c>
    80005c88:	0100006f          	j	80005c98 <__printf+0x440>
    80005c8c:	00000097          	auipc	ra,0x0
    80005c90:	9e8080e7          	jalr	-1560(ra) # 80005674 <consputc>
    80005c94:	000c8493          	mv	s1,s9
    80005c98:	00094503          	lbu	a0,0(s2)
    80005c9c:	c60510e3          	bnez	a0,800058fc <__printf+0xa4>
    80005ca0:	e40c0ee3          	beqz	s8,80005afc <__printf+0x2a4>
    80005ca4:	00004517          	auipc	a0,0x4
    80005ca8:	42c50513          	addi	a0,a0,1068 # 8000a0d0 <pr>
    80005cac:	00001097          	auipc	ra,0x1
    80005cb0:	94c080e7          	jalr	-1716(ra) # 800065f8 <release>
    80005cb4:	e49ff06f          	j	80005afc <__printf+0x2a4>
    80005cb8:	f7843783          	ld	a5,-136(s0)
    80005cbc:	03000513          	li	a0,48
    80005cc0:	01000d13          	li	s10,16
    80005cc4:	00878713          	addi	a4,a5,8
    80005cc8:	0007bc83          	ld	s9,0(a5)
    80005ccc:	f6e43c23          	sd	a4,-136(s0)
    80005cd0:	00000097          	auipc	ra,0x0
    80005cd4:	9a4080e7          	jalr	-1628(ra) # 80005674 <consputc>
    80005cd8:	07800513          	li	a0,120
    80005cdc:	00000097          	auipc	ra,0x0
    80005ce0:	998080e7          	jalr	-1640(ra) # 80005674 <consputc>
    80005ce4:	00001d97          	auipc	s11,0x1
    80005ce8:	75cd8d93          	addi	s11,s11,1884 # 80007440 <digits>
    80005cec:	03ccd793          	srli	a5,s9,0x3c
    80005cf0:	00fd87b3          	add	a5,s11,a5
    80005cf4:	0007c503          	lbu	a0,0(a5)
    80005cf8:	fffd0d1b          	addiw	s10,s10,-1
    80005cfc:	004c9c93          	slli	s9,s9,0x4
    80005d00:	00000097          	auipc	ra,0x0
    80005d04:	974080e7          	jalr	-1676(ra) # 80005674 <consputc>
    80005d08:	fe0d12e3          	bnez	s10,80005cec <__printf+0x494>
    80005d0c:	f8dff06f          	j	80005c98 <__printf+0x440>
    80005d10:	f7843783          	ld	a5,-136(s0)
    80005d14:	0007bc83          	ld	s9,0(a5)
    80005d18:	00878793          	addi	a5,a5,8
    80005d1c:	f6f43c23          	sd	a5,-136(s0)
    80005d20:	000c9a63          	bnez	s9,80005d34 <__printf+0x4dc>
    80005d24:	1080006f          	j	80005e2c <__printf+0x5d4>
    80005d28:	001c8c93          	addi	s9,s9,1
    80005d2c:	00000097          	auipc	ra,0x0
    80005d30:	948080e7          	jalr	-1720(ra) # 80005674 <consputc>
    80005d34:	000cc503          	lbu	a0,0(s9)
    80005d38:	fe0518e3          	bnez	a0,80005d28 <__printf+0x4d0>
    80005d3c:	f5dff06f          	j	80005c98 <__printf+0x440>
    80005d40:	02500513          	li	a0,37
    80005d44:	00000097          	auipc	ra,0x0
    80005d48:	930080e7          	jalr	-1744(ra) # 80005674 <consputc>
    80005d4c:	000c8513          	mv	a0,s9
    80005d50:	00000097          	auipc	ra,0x0
    80005d54:	924080e7          	jalr	-1756(ra) # 80005674 <consputc>
    80005d58:	f41ff06f          	j	80005c98 <__printf+0x440>
    80005d5c:	02500513          	li	a0,37
    80005d60:	00000097          	auipc	ra,0x0
    80005d64:	914080e7          	jalr	-1772(ra) # 80005674 <consputc>
    80005d68:	f31ff06f          	j	80005c98 <__printf+0x440>
    80005d6c:	00030513          	mv	a0,t1
    80005d70:	00000097          	auipc	ra,0x0
    80005d74:	7bc080e7          	jalr	1980(ra) # 8000652c <acquire>
    80005d78:	b4dff06f          	j	800058c4 <__printf+0x6c>
    80005d7c:	40c0053b          	negw	a0,a2
    80005d80:	00a00713          	li	a4,10
    80005d84:	02e576bb          	remuw	a3,a0,a4
    80005d88:	00001d97          	auipc	s11,0x1
    80005d8c:	6b8d8d93          	addi	s11,s11,1720 # 80007440 <digits>
    80005d90:	ff700593          	li	a1,-9
    80005d94:	02069693          	slli	a3,a3,0x20
    80005d98:	0206d693          	srli	a3,a3,0x20
    80005d9c:	00dd86b3          	add	a3,s11,a3
    80005da0:	0006c683          	lbu	a3,0(a3)
    80005da4:	02e557bb          	divuw	a5,a0,a4
    80005da8:	f8d40023          	sb	a3,-128(s0)
    80005dac:	10b65e63          	bge	a2,a1,80005ec8 <__printf+0x670>
    80005db0:	06300593          	li	a1,99
    80005db4:	02e7f6bb          	remuw	a3,a5,a4
    80005db8:	02069693          	slli	a3,a3,0x20
    80005dbc:	0206d693          	srli	a3,a3,0x20
    80005dc0:	00dd86b3          	add	a3,s11,a3
    80005dc4:	0006c683          	lbu	a3,0(a3)
    80005dc8:	02e7d73b          	divuw	a4,a5,a4
    80005dcc:	00200793          	li	a5,2
    80005dd0:	f8d400a3          	sb	a3,-127(s0)
    80005dd4:	bca5ece3          	bltu	a1,a0,800059ac <__printf+0x154>
    80005dd8:	ce5ff06f          	j	80005abc <__printf+0x264>
    80005ddc:	40e007bb          	negw	a5,a4
    80005de0:	00001d97          	auipc	s11,0x1
    80005de4:	660d8d93          	addi	s11,s11,1632 # 80007440 <digits>
    80005de8:	00f7f693          	andi	a3,a5,15
    80005dec:	00dd86b3          	add	a3,s11,a3
    80005df0:	0006c583          	lbu	a1,0(a3)
    80005df4:	ff100613          	li	a2,-15
    80005df8:	0047d69b          	srliw	a3,a5,0x4
    80005dfc:	f8b40023          	sb	a1,-128(s0)
    80005e00:	0047d59b          	srliw	a1,a5,0x4
    80005e04:	0ac75e63          	bge	a4,a2,80005ec0 <__printf+0x668>
    80005e08:	00f6f693          	andi	a3,a3,15
    80005e0c:	00dd86b3          	add	a3,s11,a3
    80005e10:	0006c603          	lbu	a2,0(a3)
    80005e14:	00f00693          	li	a3,15
    80005e18:	0087d79b          	srliw	a5,a5,0x8
    80005e1c:	f8c400a3          	sb	a2,-127(s0)
    80005e20:	d8b6e4e3          	bltu	a3,a1,80005ba8 <__printf+0x350>
    80005e24:	00200793          	li	a5,2
    80005e28:	e2dff06f          	j	80005c54 <__printf+0x3fc>
    80005e2c:	00001c97          	auipc	s9,0x1
    80005e30:	5f4c8c93          	addi	s9,s9,1524 # 80007420 <CONSOLE_STATUS+0x410>
    80005e34:	02800513          	li	a0,40
    80005e38:	ef1ff06f          	j	80005d28 <__printf+0x4d0>
    80005e3c:	00700793          	li	a5,7
    80005e40:	00600c93          	li	s9,6
    80005e44:	e0dff06f          	j	80005c50 <__printf+0x3f8>
    80005e48:	00700793          	li	a5,7
    80005e4c:	00600c93          	li	s9,6
    80005e50:	c69ff06f          	j	80005ab8 <__printf+0x260>
    80005e54:	00300793          	li	a5,3
    80005e58:	00200c93          	li	s9,2
    80005e5c:	c5dff06f          	j	80005ab8 <__printf+0x260>
    80005e60:	00300793          	li	a5,3
    80005e64:	00200c93          	li	s9,2
    80005e68:	de9ff06f          	j	80005c50 <__printf+0x3f8>
    80005e6c:	00400793          	li	a5,4
    80005e70:	00300c93          	li	s9,3
    80005e74:	dddff06f          	j	80005c50 <__printf+0x3f8>
    80005e78:	00400793          	li	a5,4
    80005e7c:	00300c93          	li	s9,3
    80005e80:	c39ff06f          	j	80005ab8 <__printf+0x260>
    80005e84:	00500793          	li	a5,5
    80005e88:	00400c93          	li	s9,4
    80005e8c:	c2dff06f          	j	80005ab8 <__printf+0x260>
    80005e90:	00500793          	li	a5,5
    80005e94:	00400c93          	li	s9,4
    80005e98:	db9ff06f          	j	80005c50 <__printf+0x3f8>
    80005e9c:	00600793          	li	a5,6
    80005ea0:	00500c93          	li	s9,5
    80005ea4:	dadff06f          	j	80005c50 <__printf+0x3f8>
    80005ea8:	00600793          	li	a5,6
    80005eac:	00500c93          	li	s9,5
    80005eb0:	c09ff06f          	j	80005ab8 <__printf+0x260>
    80005eb4:	00800793          	li	a5,8
    80005eb8:	00700c93          	li	s9,7
    80005ebc:	bfdff06f          	j	80005ab8 <__printf+0x260>
    80005ec0:	00100793          	li	a5,1
    80005ec4:	d91ff06f          	j	80005c54 <__printf+0x3fc>
    80005ec8:	00100793          	li	a5,1
    80005ecc:	bf1ff06f          	j	80005abc <__printf+0x264>
    80005ed0:	00900793          	li	a5,9
    80005ed4:	00800c93          	li	s9,8
    80005ed8:	be1ff06f          	j	80005ab8 <__printf+0x260>
    80005edc:	00001517          	auipc	a0,0x1
    80005ee0:	54c50513          	addi	a0,a0,1356 # 80007428 <CONSOLE_STATUS+0x418>
    80005ee4:	00000097          	auipc	ra,0x0
    80005ee8:	918080e7          	jalr	-1768(ra) # 800057fc <panic>

0000000080005eec <printfinit>:
    80005eec:	fe010113          	addi	sp,sp,-32
    80005ef0:	00813823          	sd	s0,16(sp)
    80005ef4:	00913423          	sd	s1,8(sp)
    80005ef8:	00113c23          	sd	ra,24(sp)
    80005efc:	02010413          	addi	s0,sp,32
    80005f00:	00004497          	auipc	s1,0x4
    80005f04:	1d048493          	addi	s1,s1,464 # 8000a0d0 <pr>
    80005f08:	00048513          	mv	a0,s1
    80005f0c:	00001597          	auipc	a1,0x1
    80005f10:	52c58593          	addi	a1,a1,1324 # 80007438 <CONSOLE_STATUS+0x428>
    80005f14:	00000097          	auipc	ra,0x0
    80005f18:	5f4080e7          	jalr	1524(ra) # 80006508 <initlock>
    80005f1c:	01813083          	ld	ra,24(sp)
    80005f20:	01013403          	ld	s0,16(sp)
    80005f24:	0004ac23          	sw	zero,24(s1)
    80005f28:	00813483          	ld	s1,8(sp)
    80005f2c:	02010113          	addi	sp,sp,32
    80005f30:	00008067          	ret

0000000080005f34 <uartinit>:
    80005f34:	ff010113          	addi	sp,sp,-16
    80005f38:	00813423          	sd	s0,8(sp)
    80005f3c:	01010413          	addi	s0,sp,16
    80005f40:	100007b7          	lui	a5,0x10000
    80005f44:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005f48:	f8000713          	li	a4,-128
    80005f4c:	00e781a3          	sb	a4,3(a5)
    80005f50:	00300713          	li	a4,3
    80005f54:	00e78023          	sb	a4,0(a5)
    80005f58:	000780a3          	sb	zero,1(a5)
    80005f5c:	00e781a3          	sb	a4,3(a5)
    80005f60:	00700693          	li	a3,7
    80005f64:	00d78123          	sb	a3,2(a5)
    80005f68:	00e780a3          	sb	a4,1(a5)
    80005f6c:	00813403          	ld	s0,8(sp)
    80005f70:	01010113          	addi	sp,sp,16
    80005f74:	00008067          	ret

0000000080005f78 <uartputc>:
    80005f78:	00003797          	auipc	a5,0x3
    80005f7c:	e507a783          	lw	a5,-432(a5) # 80008dc8 <panicked>
    80005f80:	00078463          	beqz	a5,80005f88 <uartputc+0x10>
    80005f84:	0000006f          	j	80005f84 <uartputc+0xc>
    80005f88:	fd010113          	addi	sp,sp,-48
    80005f8c:	02813023          	sd	s0,32(sp)
    80005f90:	00913c23          	sd	s1,24(sp)
    80005f94:	01213823          	sd	s2,16(sp)
    80005f98:	01313423          	sd	s3,8(sp)
    80005f9c:	02113423          	sd	ra,40(sp)
    80005fa0:	03010413          	addi	s0,sp,48
    80005fa4:	00003917          	auipc	s2,0x3
    80005fa8:	e2c90913          	addi	s2,s2,-468 # 80008dd0 <uart_tx_r>
    80005fac:	00093783          	ld	a5,0(s2)
    80005fb0:	00003497          	auipc	s1,0x3
    80005fb4:	e2848493          	addi	s1,s1,-472 # 80008dd8 <uart_tx_w>
    80005fb8:	0004b703          	ld	a4,0(s1)
    80005fbc:	02078693          	addi	a3,a5,32
    80005fc0:	00050993          	mv	s3,a0
    80005fc4:	02e69c63          	bne	a3,a4,80005ffc <uartputc+0x84>
    80005fc8:	00001097          	auipc	ra,0x1
    80005fcc:	834080e7          	jalr	-1996(ra) # 800067fc <push_on>
    80005fd0:	00093783          	ld	a5,0(s2)
    80005fd4:	0004b703          	ld	a4,0(s1)
    80005fd8:	02078793          	addi	a5,a5,32
    80005fdc:	00e79463          	bne	a5,a4,80005fe4 <uartputc+0x6c>
    80005fe0:	0000006f          	j	80005fe0 <uartputc+0x68>
    80005fe4:	00001097          	auipc	ra,0x1
    80005fe8:	88c080e7          	jalr	-1908(ra) # 80006870 <pop_on>
    80005fec:	00093783          	ld	a5,0(s2)
    80005ff0:	0004b703          	ld	a4,0(s1)
    80005ff4:	02078693          	addi	a3,a5,32
    80005ff8:	fce688e3          	beq	a3,a4,80005fc8 <uartputc+0x50>
    80005ffc:	01f77693          	andi	a3,a4,31
    80006000:	00004597          	auipc	a1,0x4
    80006004:	0f058593          	addi	a1,a1,240 # 8000a0f0 <uart_tx_buf>
    80006008:	00d586b3          	add	a3,a1,a3
    8000600c:	00170713          	addi	a4,a4,1
    80006010:	01368023          	sb	s3,0(a3)
    80006014:	00e4b023          	sd	a4,0(s1)
    80006018:	10000637          	lui	a2,0x10000
    8000601c:	02f71063          	bne	a4,a5,8000603c <uartputc+0xc4>
    80006020:	0340006f          	j	80006054 <uartputc+0xdc>
    80006024:	00074703          	lbu	a4,0(a4)
    80006028:	00f93023          	sd	a5,0(s2)
    8000602c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006030:	00093783          	ld	a5,0(s2)
    80006034:	0004b703          	ld	a4,0(s1)
    80006038:	00f70e63          	beq	a4,a5,80006054 <uartputc+0xdc>
    8000603c:	00564683          	lbu	a3,5(a2)
    80006040:	01f7f713          	andi	a4,a5,31
    80006044:	00e58733          	add	a4,a1,a4
    80006048:	0206f693          	andi	a3,a3,32
    8000604c:	00178793          	addi	a5,a5,1
    80006050:	fc069ae3          	bnez	a3,80006024 <uartputc+0xac>
    80006054:	02813083          	ld	ra,40(sp)
    80006058:	02013403          	ld	s0,32(sp)
    8000605c:	01813483          	ld	s1,24(sp)
    80006060:	01013903          	ld	s2,16(sp)
    80006064:	00813983          	ld	s3,8(sp)
    80006068:	03010113          	addi	sp,sp,48
    8000606c:	00008067          	ret

0000000080006070 <uartputc_sync>:
    80006070:	ff010113          	addi	sp,sp,-16
    80006074:	00813423          	sd	s0,8(sp)
    80006078:	01010413          	addi	s0,sp,16
    8000607c:	00003717          	auipc	a4,0x3
    80006080:	d4c72703          	lw	a4,-692(a4) # 80008dc8 <panicked>
    80006084:	02071663          	bnez	a4,800060b0 <uartputc_sync+0x40>
    80006088:	00050793          	mv	a5,a0
    8000608c:	100006b7          	lui	a3,0x10000
    80006090:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006094:	02077713          	andi	a4,a4,32
    80006098:	fe070ce3          	beqz	a4,80006090 <uartputc_sync+0x20>
    8000609c:	0ff7f793          	andi	a5,a5,255
    800060a0:	00f68023          	sb	a5,0(a3)
    800060a4:	00813403          	ld	s0,8(sp)
    800060a8:	01010113          	addi	sp,sp,16
    800060ac:	00008067          	ret
    800060b0:	0000006f          	j	800060b0 <uartputc_sync+0x40>

00000000800060b4 <uartstart>:
    800060b4:	ff010113          	addi	sp,sp,-16
    800060b8:	00813423          	sd	s0,8(sp)
    800060bc:	01010413          	addi	s0,sp,16
    800060c0:	00003617          	auipc	a2,0x3
    800060c4:	d1060613          	addi	a2,a2,-752 # 80008dd0 <uart_tx_r>
    800060c8:	00003517          	auipc	a0,0x3
    800060cc:	d1050513          	addi	a0,a0,-752 # 80008dd8 <uart_tx_w>
    800060d0:	00063783          	ld	a5,0(a2)
    800060d4:	00053703          	ld	a4,0(a0)
    800060d8:	04f70263          	beq	a4,a5,8000611c <uartstart+0x68>
    800060dc:	100005b7          	lui	a1,0x10000
    800060e0:	00004817          	auipc	a6,0x4
    800060e4:	01080813          	addi	a6,a6,16 # 8000a0f0 <uart_tx_buf>
    800060e8:	01c0006f          	j	80006104 <uartstart+0x50>
    800060ec:	0006c703          	lbu	a4,0(a3)
    800060f0:	00f63023          	sd	a5,0(a2)
    800060f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800060f8:	00063783          	ld	a5,0(a2)
    800060fc:	00053703          	ld	a4,0(a0)
    80006100:	00f70e63          	beq	a4,a5,8000611c <uartstart+0x68>
    80006104:	01f7f713          	andi	a4,a5,31
    80006108:	00e806b3          	add	a3,a6,a4
    8000610c:	0055c703          	lbu	a4,5(a1)
    80006110:	00178793          	addi	a5,a5,1
    80006114:	02077713          	andi	a4,a4,32
    80006118:	fc071ae3          	bnez	a4,800060ec <uartstart+0x38>
    8000611c:	00813403          	ld	s0,8(sp)
    80006120:	01010113          	addi	sp,sp,16
    80006124:	00008067          	ret

0000000080006128 <uartgetc>:
    80006128:	ff010113          	addi	sp,sp,-16
    8000612c:	00813423          	sd	s0,8(sp)
    80006130:	01010413          	addi	s0,sp,16
    80006134:	10000737          	lui	a4,0x10000
    80006138:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000613c:	0017f793          	andi	a5,a5,1
    80006140:	00078c63          	beqz	a5,80006158 <uartgetc+0x30>
    80006144:	00074503          	lbu	a0,0(a4)
    80006148:	0ff57513          	andi	a0,a0,255
    8000614c:	00813403          	ld	s0,8(sp)
    80006150:	01010113          	addi	sp,sp,16
    80006154:	00008067          	ret
    80006158:	fff00513          	li	a0,-1
    8000615c:	ff1ff06f          	j	8000614c <uartgetc+0x24>

0000000080006160 <uartintr>:
    80006160:	100007b7          	lui	a5,0x10000
    80006164:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006168:	0017f793          	andi	a5,a5,1
    8000616c:	0a078463          	beqz	a5,80006214 <uartintr+0xb4>
    80006170:	fe010113          	addi	sp,sp,-32
    80006174:	00813823          	sd	s0,16(sp)
    80006178:	00913423          	sd	s1,8(sp)
    8000617c:	00113c23          	sd	ra,24(sp)
    80006180:	02010413          	addi	s0,sp,32
    80006184:	100004b7          	lui	s1,0x10000
    80006188:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000618c:	0ff57513          	andi	a0,a0,255
    80006190:	fffff097          	auipc	ra,0xfffff
    80006194:	534080e7          	jalr	1332(ra) # 800056c4 <consoleintr>
    80006198:	0054c783          	lbu	a5,5(s1)
    8000619c:	0017f793          	andi	a5,a5,1
    800061a0:	fe0794e3          	bnez	a5,80006188 <uartintr+0x28>
    800061a4:	00003617          	auipc	a2,0x3
    800061a8:	c2c60613          	addi	a2,a2,-980 # 80008dd0 <uart_tx_r>
    800061ac:	00003517          	auipc	a0,0x3
    800061b0:	c2c50513          	addi	a0,a0,-980 # 80008dd8 <uart_tx_w>
    800061b4:	00063783          	ld	a5,0(a2)
    800061b8:	00053703          	ld	a4,0(a0)
    800061bc:	04f70263          	beq	a4,a5,80006200 <uartintr+0xa0>
    800061c0:	100005b7          	lui	a1,0x10000
    800061c4:	00004817          	auipc	a6,0x4
    800061c8:	f2c80813          	addi	a6,a6,-212 # 8000a0f0 <uart_tx_buf>
    800061cc:	01c0006f          	j	800061e8 <uartintr+0x88>
    800061d0:	0006c703          	lbu	a4,0(a3)
    800061d4:	00f63023          	sd	a5,0(a2)
    800061d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800061dc:	00063783          	ld	a5,0(a2)
    800061e0:	00053703          	ld	a4,0(a0)
    800061e4:	00f70e63          	beq	a4,a5,80006200 <uartintr+0xa0>
    800061e8:	01f7f713          	andi	a4,a5,31
    800061ec:	00e806b3          	add	a3,a6,a4
    800061f0:	0055c703          	lbu	a4,5(a1)
    800061f4:	00178793          	addi	a5,a5,1
    800061f8:	02077713          	andi	a4,a4,32
    800061fc:	fc071ae3          	bnez	a4,800061d0 <uartintr+0x70>
    80006200:	01813083          	ld	ra,24(sp)
    80006204:	01013403          	ld	s0,16(sp)
    80006208:	00813483          	ld	s1,8(sp)
    8000620c:	02010113          	addi	sp,sp,32
    80006210:	00008067          	ret
    80006214:	00003617          	auipc	a2,0x3
    80006218:	bbc60613          	addi	a2,a2,-1092 # 80008dd0 <uart_tx_r>
    8000621c:	00003517          	auipc	a0,0x3
    80006220:	bbc50513          	addi	a0,a0,-1092 # 80008dd8 <uart_tx_w>
    80006224:	00063783          	ld	a5,0(a2)
    80006228:	00053703          	ld	a4,0(a0)
    8000622c:	04f70263          	beq	a4,a5,80006270 <uartintr+0x110>
    80006230:	100005b7          	lui	a1,0x10000
    80006234:	00004817          	auipc	a6,0x4
    80006238:	ebc80813          	addi	a6,a6,-324 # 8000a0f0 <uart_tx_buf>
    8000623c:	01c0006f          	j	80006258 <uartintr+0xf8>
    80006240:	0006c703          	lbu	a4,0(a3)
    80006244:	00f63023          	sd	a5,0(a2)
    80006248:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000624c:	00063783          	ld	a5,0(a2)
    80006250:	00053703          	ld	a4,0(a0)
    80006254:	02f70063          	beq	a4,a5,80006274 <uartintr+0x114>
    80006258:	01f7f713          	andi	a4,a5,31
    8000625c:	00e806b3          	add	a3,a6,a4
    80006260:	0055c703          	lbu	a4,5(a1)
    80006264:	00178793          	addi	a5,a5,1
    80006268:	02077713          	andi	a4,a4,32
    8000626c:	fc071ae3          	bnez	a4,80006240 <uartintr+0xe0>
    80006270:	00008067          	ret
    80006274:	00008067          	ret

0000000080006278 <kinit>:
    80006278:	fc010113          	addi	sp,sp,-64
    8000627c:	02913423          	sd	s1,40(sp)
    80006280:	fffff7b7          	lui	a5,0xfffff
    80006284:	00005497          	auipc	s1,0x5
    80006288:	e8b48493          	addi	s1,s1,-373 # 8000b10f <end+0xfff>
    8000628c:	02813823          	sd	s0,48(sp)
    80006290:	01313c23          	sd	s3,24(sp)
    80006294:	00f4f4b3          	and	s1,s1,a5
    80006298:	02113c23          	sd	ra,56(sp)
    8000629c:	03213023          	sd	s2,32(sp)
    800062a0:	01413823          	sd	s4,16(sp)
    800062a4:	01513423          	sd	s5,8(sp)
    800062a8:	04010413          	addi	s0,sp,64
    800062ac:	000017b7          	lui	a5,0x1
    800062b0:	01100993          	li	s3,17
    800062b4:	00f487b3          	add	a5,s1,a5
    800062b8:	01b99993          	slli	s3,s3,0x1b
    800062bc:	06f9e063          	bltu	s3,a5,8000631c <kinit+0xa4>
    800062c0:	00004a97          	auipc	s5,0x4
    800062c4:	e50a8a93          	addi	s5,s5,-432 # 8000a110 <end>
    800062c8:	0754ec63          	bltu	s1,s5,80006340 <kinit+0xc8>
    800062cc:	0734fa63          	bgeu	s1,s3,80006340 <kinit+0xc8>
    800062d0:	00088a37          	lui	s4,0x88
    800062d4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800062d8:	00003917          	auipc	s2,0x3
    800062dc:	b0890913          	addi	s2,s2,-1272 # 80008de0 <kmem>
    800062e0:	00ca1a13          	slli	s4,s4,0xc
    800062e4:	0140006f          	j	800062f8 <kinit+0x80>
    800062e8:	000017b7          	lui	a5,0x1
    800062ec:	00f484b3          	add	s1,s1,a5
    800062f0:	0554e863          	bltu	s1,s5,80006340 <kinit+0xc8>
    800062f4:	0534f663          	bgeu	s1,s3,80006340 <kinit+0xc8>
    800062f8:	00001637          	lui	a2,0x1
    800062fc:	00100593          	li	a1,1
    80006300:	00048513          	mv	a0,s1
    80006304:	00000097          	auipc	ra,0x0
    80006308:	5e4080e7          	jalr	1508(ra) # 800068e8 <__memset>
    8000630c:	00093783          	ld	a5,0(s2)
    80006310:	00f4b023          	sd	a5,0(s1)
    80006314:	00993023          	sd	s1,0(s2)
    80006318:	fd4498e3          	bne	s1,s4,800062e8 <kinit+0x70>
    8000631c:	03813083          	ld	ra,56(sp)
    80006320:	03013403          	ld	s0,48(sp)
    80006324:	02813483          	ld	s1,40(sp)
    80006328:	02013903          	ld	s2,32(sp)
    8000632c:	01813983          	ld	s3,24(sp)
    80006330:	01013a03          	ld	s4,16(sp)
    80006334:	00813a83          	ld	s5,8(sp)
    80006338:	04010113          	addi	sp,sp,64
    8000633c:	00008067          	ret
    80006340:	00001517          	auipc	a0,0x1
    80006344:	11850513          	addi	a0,a0,280 # 80007458 <digits+0x18>
    80006348:	fffff097          	auipc	ra,0xfffff
    8000634c:	4b4080e7          	jalr	1204(ra) # 800057fc <panic>

0000000080006350 <freerange>:
    80006350:	fc010113          	addi	sp,sp,-64
    80006354:	000017b7          	lui	a5,0x1
    80006358:	02913423          	sd	s1,40(sp)
    8000635c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006360:	009504b3          	add	s1,a0,s1
    80006364:	fffff537          	lui	a0,0xfffff
    80006368:	02813823          	sd	s0,48(sp)
    8000636c:	02113c23          	sd	ra,56(sp)
    80006370:	03213023          	sd	s2,32(sp)
    80006374:	01313c23          	sd	s3,24(sp)
    80006378:	01413823          	sd	s4,16(sp)
    8000637c:	01513423          	sd	s5,8(sp)
    80006380:	01613023          	sd	s6,0(sp)
    80006384:	04010413          	addi	s0,sp,64
    80006388:	00a4f4b3          	and	s1,s1,a0
    8000638c:	00f487b3          	add	a5,s1,a5
    80006390:	06f5e463          	bltu	a1,a5,800063f8 <freerange+0xa8>
    80006394:	00004a97          	auipc	s5,0x4
    80006398:	d7ca8a93          	addi	s5,s5,-644 # 8000a110 <end>
    8000639c:	0954e263          	bltu	s1,s5,80006420 <freerange+0xd0>
    800063a0:	01100993          	li	s3,17
    800063a4:	01b99993          	slli	s3,s3,0x1b
    800063a8:	0734fc63          	bgeu	s1,s3,80006420 <freerange+0xd0>
    800063ac:	00058a13          	mv	s4,a1
    800063b0:	00003917          	auipc	s2,0x3
    800063b4:	a3090913          	addi	s2,s2,-1488 # 80008de0 <kmem>
    800063b8:	00002b37          	lui	s6,0x2
    800063bc:	0140006f          	j	800063d0 <freerange+0x80>
    800063c0:	000017b7          	lui	a5,0x1
    800063c4:	00f484b3          	add	s1,s1,a5
    800063c8:	0554ec63          	bltu	s1,s5,80006420 <freerange+0xd0>
    800063cc:	0534fa63          	bgeu	s1,s3,80006420 <freerange+0xd0>
    800063d0:	00001637          	lui	a2,0x1
    800063d4:	00100593          	li	a1,1
    800063d8:	00048513          	mv	a0,s1
    800063dc:	00000097          	auipc	ra,0x0
    800063e0:	50c080e7          	jalr	1292(ra) # 800068e8 <__memset>
    800063e4:	00093703          	ld	a4,0(s2)
    800063e8:	016487b3          	add	a5,s1,s6
    800063ec:	00e4b023          	sd	a4,0(s1)
    800063f0:	00993023          	sd	s1,0(s2)
    800063f4:	fcfa76e3          	bgeu	s4,a5,800063c0 <freerange+0x70>
    800063f8:	03813083          	ld	ra,56(sp)
    800063fc:	03013403          	ld	s0,48(sp)
    80006400:	02813483          	ld	s1,40(sp)
    80006404:	02013903          	ld	s2,32(sp)
    80006408:	01813983          	ld	s3,24(sp)
    8000640c:	01013a03          	ld	s4,16(sp)
    80006410:	00813a83          	ld	s5,8(sp)
    80006414:	00013b03          	ld	s6,0(sp)
    80006418:	04010113          	addi	sp,sp,64
    8000641c:	00008067          	ret
    80006420:	00001517          	auipc	a0,0x1
    80006424:	03850513          	addi	a0,a0,56 # 80007458 <digits+0x18>
    80006428:	fffff097          	auipc	ra,0xfffff
    8000642c:	3d4080e7          	jalr	980(ra) # 800057fc <panic>

0000000080006430 <kfree>:
    80006430:	fe010113          	addi	sp,sp,-32
    80006434:	00813823          	sd	s0,16(sp)
    80006438:	00113c23          	sd	ra,24(sp)
    8000643c:	00913423          	sd	s1,8(sp)
    80006440:	02010413          	addi	s0,sp,32
    80006444:	03451793          	slli	a5,a0,0x34
    80006448:	04079c63          	bnez	a5,800064a0 <kfree+0x70>
    8000644c:	00004797          	auipc	a5,0x4
    80006450:	cc478793          	addi	a5,a5,-828 # 8000a110 <end>
    80006454:	00050493          	mv	s1,a0
    80006458:	04f56463          	bltu	a0,a5,800064a0 <kfree+0x70>
    8000645c:	01100793          	li	a5,17
    80006460:	01b79793          	slli	a5,a5,0x1b
    80006464:	02f57e63          	bgeu	a0,a5,800064a0 <kfree+0x70>
    80006468:	00001637          	lui	a2,0x1
    8000646c:	00100593          	li	a1,1
    80006470:	00000097          	auipc	ra,0x0
    80006474:	478080e7          	jalr	1144(ra) # 800068e8 <__memset>
    80006478:	00003797          	auipc	a5,0x3
    8000647c:	96878793          	addi	a5,a5,-1688 # 80008de0 <kmem>
    80006480:	0007b703          	ld	a4,0(a5)
    80006484:	01813083          	ld	ra,24(sp)
    80006488:	01013403          	ld	s0,16(sp)
    8000648c:	00e4b023          	sd	a4,0(s1)
    80006490:	0097b023          	sd	s1,0(a5)
    80006494:	00813483          	ld	s1,8(sp)
    80006498:	02010113          	addi	sp,sp,32
    8000649c:	00008067          	ret
    800064a0:	00001517          	auipc	a0,0x1
    800064a4:	fb850513          	addi	a0,a0,-72 # 80007458 <digits+0x18>
    800064a8:	fffff097          	auipc	ra,0xfffff
    800064ac:	354080e7          	jalr	852(ra) # 800057fc <panic>

00000000800064b0 <kalloc>:
    800064b0:	fe010113          	addi	sp,sp,-32
    800064b4:	00813823          	sd	s0,16(sp)
    800064b8:	00913423          	sd	s1,8(sp)
    800064bc:	00113c23          	sd	ra,24(sp)
    800064c0:	02010413          	addi	s0,sp,32
    800064c4:	00003797          	auipc	a5,0x3
    800064c8:	91c78793          	addi	a5,a5,-1764 # 80008de0 <kmem>
    800064cc:	0007b483          	ld	s1,0(a5)
    800064d0:	02048063          	beqz	s1,800064f0 <kalloc+0x40>
    800064d4:	0004b703          	ld	a4,0(s1)
    800064d8:	00001637          	lui	a2,0x1
    800064dc:	00500593          	li	a1,5
    800064e0:	00048513          	mv	a0,s1
    800064e4:	00e7b023          	sd	a4,0(a5)
    800064e8:	00000097          	auipc	ra,0x0
    800064ec:	400080e7          	jalr	1024(ra) # 800068e8 <__memset>
    800064f0:	01813083          	ld	ra,24(sp)
    800064f4:	01013403          	ld	s0,16(sp)
    800064f8:	00048513          	mv	a0,s1
    800064fc:	00813483          	ld	s1,8(sp)
    80006500:	02010113          	addi	sp,sp,32
    80006504:	00008067          	ret

0000000080006508 <initlock>:
    80006508:	ff010113          	addi	sp,sp,-16
    8000650c:	00813423          	sd	s0,8(sp)
    80006510:	01010413          	addi	s0,sp,16
    80006514:	00813403          	ld	s0,8(sp)
    80006518:	00b53423          	sd	a1,8(a0)
    8000651c:	00052023          	sw	zero,0(a0)
    80006520:	00053823          	sd	zero,16(a0)
    80006524:	01010113          	addi	sp,sp,16
    80006528:	00008067          	ret

000000008000652c <acquire>:
    8000652c:	fe010113          	addi	sp,sp,-32
    80006530:	00813823          	sd	s0,16(sp)
    80006534:	00913423          	sd	s1,8(sp)
    80006538:	00113c23          	sd	ra,24(sp)
    8000653c:	01213023          	sd	s2,0(sp)
    80006540:	02010413          	addi	s0,sp,32
    80006544:	00050493          	mv	s1,a0
    80006548:	10002973          	csrr	s2,sstatus
    8000654c:	100027f3          	csrr	a5,sstatus
    80006550:	ffd7f793          	andi	a5,a5,-3
    80006554:	10079073          	csrw	sstatus,a5
    80006558:	fffff097          	auipc	ra,0xfffff
    8000655c:	8e4080e7          	jalr	-1820(ra) # 80004e3c <mycpu>
    80006560:	07852783          	lw	a5,120(a0)
    80006564:	06078e63          	beqz	a5,800065e0 <acquire+0xb4>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	8d4080e7          	jalr	-1836(ra) # 80004e3c <mycpu>
    80006570:	07852783          	lw	a5,120(a0)
    80006574:	0004a703          	lw	a4,0(s1)
    80006578:	0017879b          	addiw	a5,a5,1
    8000657c:	06f52c23          	sw	a5,120(a0)
    80006580:	04071063          	bnez	a4,800065c0 <acquire+0x94>
    80006584:	00100713          	li	a4,1
    80006588:	00070793          	mv	a5,a4
    8000658c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006590:	0007879b          	sext.w	a5,a5
    80006594:	fe079ae3          	bnez	a5,80006588 <acquire+0x5c>
    80006598:	0ff0000f          	fence
    8000659c:	fffff097          	auipc	ra,0xfffff
    800065a0:	8a0080e7          	jalr	-1888(ra) # 80004e3c <mycpu>
    800065a4:	01813083          	ld	ra,24(sp)
    800065a8:	01013403          	ld	s0,16(sp)
    800065ac:	00a4b823          	sd	a0,16(s1)
    800065b0:	00013903          	ld	s2,0(sp)
    800065b4:	00813483          	ld	s1,8(sp)
    800065b8:	02010113          	addi	sp,sp,32
    800065bc:	00008067          	ret
    800065c0:	0104b903          	ld	s2,16(s1)
    800065c4:	fffff097          	auipc	ra,0xfffff
    800065c8:	878080e7          	jalr	-1928(ra) # 80004e3c <mycpu>
    800065cc:	faa91ce3          	bne	s2,a0,80006584 <acquire+0x58>
    800065d0:	00001517          	auipc	a0,0x1
    800065d4:	e9050513          	addi	a0,a0,-368 # 80007460 <digits+0x20>
    800065d8:	fffff097          	auipc	ra,0xfffff
    800065dc:	224080e7          	jalr	548(ra) # 800057fc <panic>
    800065e0:	00195913          	srli	s2,s2,0x1
    800065e4:	fffff097          	auipc	ra,0xfffff
    800065e8:	858080e7          	jalr	-1960(ra) # 80004e3c <mycpu>
    800065ec:	00197913          	andi	s2,s2,1
    800065f0:	07252e23          	sw	s2,124(a0)
    800065f4:	f75ff06f          	j	80006568 <acquire+0x3c>

00000000800065f8 <release>:
    800065f8:	fe010113          	addi	sp,sp,-32
    800065fc:	00813823          	sd	s0,16(sp)
    80006600:	00113c23          	sd	ra,24(sp)
    80006604:	00913423          	sd	s1,8(sp)
    80006608:	01213023          	sd	s2,0(sp)
    8000660c:	02010413          	addi	s0,sp,32
    80006610:	00052783          	lw	a5,0(a0)
    80006614:	00079a63          	bnez	a5,80006628 <release+0x30>
    80006618:	00001517          	auipc	a0,0x1
    8000661c:	e5050513          	addi	a0,a0,-432 # 80007468 <digits+0x28>
    80006620:	fffff097          	auipc	ra,0xfffff
    80006624:	1dc080e7          	jalr	476(ra) # 800057fc <panic>
    80006628:	01053903          	ld	s2,16(a0)
    8000662c:	00050493          	mv	s1,a0
    80006630:	fffff097          	auipc	ra,0xfffff
    80006634:	80c080e7          	jalr	-2036(ra) # 80004e3c <mycpu>
    80006638:	fea910e3          	bne	s2,a0,80006618 <release+0x20>
    8000663c:	0004b823          	sd	zero,16(s1)
    80006640:	0ff0000f          	fence
    80006644:	0f50000f          	fence	iorw,ow
    80006648:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000664c:	ffffe097          	auipc	ra,0xffffe
    80006650:	7f0080e7          	jalr	2032(ra) # 80004e3c <mycpu>
    80006654:	100027f3          	csrr	a5,sstatus
    80006658:	0027f793          	andi	a5,a5,2
    8000665c:	04079a63          	bnez	a5,800066b0 <release+0xb8>
    80006660:	07852783          	lw	a5,120(a0)
    80006664:	02f05e63          	blez	a5,800066a0 <release+0xa8>
    80006668:	fff7871b          	addiw	a4,a5,-1
    8000666c:	06e52c23          	sw	a4,120(a0)
    80006670:	00071c63          	bnez	a4,80006688 <release+0x90>
    80006674:	07c52783          	lw	a5,124(a0)
    80006678:	00078863          	beqz	a5,80006688 <release+0x90>
    8000667c:	100027f3          	csrr	a5,sstatus
    80006680:	0027e793          	ori	a5,a5,2
    80006684:	10079073          	csrw	sstatus,a5
    80006688:	01813083          	ld	ra,24(sp)
    8000668c:	01013403          	ld	s0,16(sp)
    80006690:	00813483          	ld	s1,8(sp)
    80006694:	00013903          	ld	s2,0(sp)
    80006698:	02010113          	addi	sp,sp,32
    8000669c:	00008067          	ret
    800066a0:	00001517          	auipc	a0,0x1
    800066a4:	de850513          	addi	a0,a0,-536 # 80007488 <digits+0x48>
    800066a8:	fffff097          	auipc	ra,0xfffff
    800066ac:	154080e7          	jalr	340(ra) # 800057fc <panic>
    800066b0:	00001517          	auipc	a0,0x1
    800066b4:	dc050513          	addi	a0,a0,-576 # 80007470 <digits+0x30>
    800066b8:	fffff097          	auipc	ra,0xfffff
    800066bc:	144080e7          	jalr	324(ra) # 800057fc <panic>

00000000800066c0 <holding>:
    800066c0:	00052783          	lw	a5,0(a0)
    800066c4:	00079663          	bnez	a5,800066d0 <holding+0x10>
    800066c8:	00000513          	li	a0,0
    800066cc:	00008067          	ret
    800066d0:	fe010113          	addi	sp,sp,-32
    800066d4:	00813823          	sd	s0,16(sp)
    800066d8:	00913423          	sd	s1,8(sp)
    800066dc:	00113c23          	sd	ra,24(sp)
    800066e0:	02010413          	addi	s0,sp,32
    800066e4:	01053483          	ld	s1,16(a0)
    800066e8:	ffffe097          	auipc	ra,0xffffe
    800066ec:	754080e7          	jalr	1876(ra) # 80004e3c <mycpu>
    800066f0:	01813083          	ld	ra,24(sp)
    800066f4:	01013403          	ld	s0,16(sp)
    800066f8:	40a48533          	sub	a0,s1,a0
    800066fc:	00153513          	seqz	a0,a0
    80006700:	00813483          	ld	s1,8(sp)
    80006704:	02010113          	addi	sp,sp,32
    80006708:	00008067          	ret

000000008000670c <push_off>:
    8000670c:	fe010113          	addi	sp,sp,-32
    80006710:	00813823          	sd	s0,16(sp)
    80006714:	00113c23          	sd	ra,24(sp)
    80006718:	00913423          	sd	s1,8(sp)
    8000671c:	02010413          	addi	s0,sp,32
    80006720:	100024f3          	csrr	s1,sstatus
    80006724:	100027f3          	csrr	a5,sstatus
    80006728:	ffd7f793          	andi	a5,a5,-3
    8000672c:	10079073          	csrw	sstatus,a5
    80006730:	ffffe097          	auipc	ra,0xffffe
    80006734:	70c080e7          	jalr	1804(ra) # 80004e3c <mycpu>
    80006738:	07852783          	lw	a5,120(a0)
    8000673c:	02078663          	beqz	a5,80006768 <push_off+0x5c>
    80006740:	ffffe097          	auipc	ra,0xffffe
    80006744:	6fc080e7          	jalr	1788(ra) # 80004e3c <mycpu>
    80006748:	07852783          	lw	a5,120(a0)
    8000674c:	01813083          	ld	ra,24(sp)
    80006750:	01013403          	ld	s0,16(sp)
    80006754:	0017879b          	addiw	a5,a5,1
    80006758:	06f52c23          	sw	a5,120(a0)
    8000675c:	00813483          	ld	s1,8(sp)
    80006760:	02010113          	addi	sp,sp,32
    80006764:	00008067          	ret
    80006768:	0014d493          	srli	s1,s1,0x1
    8000676c:	ffffe097          	auipc	ra,0xffffe
    80006770:	6d0080e7          	jalr	1744(ra) # 80004e3c <mycpu>
    80006774:	0014f493          	andi	s1,s1,1
    80006778:	06952e23          	sw	s1,124(a0)
    8000677c:	fc5ff06f          	j	80006740 <push_off+0x34>

0000000080006780 <pop_off>:
    80006780:	ff010113          	addi	sp,sp,-16
    80006784:	00813023          	sd	s0,0(sp)
    80006788:	00113423          	sd	ra,8(sp)
    8000678c:	01010413          	addi	s0,sp,16
    80006790:	ffffe097          	auipc	ra,0xffffe
    80006794:	6ac080e7          	jalr	1708(ra) # 80004e3c <mycpu>
    80006798:	100027f3          	csrr	a5,sstatus
    8000679c:	0027f793          	andi	a5,a5,2
    800067a0:	04079663          	bnez	a5,800067ec <pop_off+0x6c>
    800067a4:	07852783          	lw	a5,120(a0)
    800067a8:	02f05a63          	blez	a5,800067dc <pop_off+0x5c>
    800067ac:	fff7871b          	addiw	a4,a5,-1
    800067b0:	06e52c23          	sw	a4,120(a0)
    800067b4:	00071c63          	bnez	a4,800067cc <pop_off+0x4c>
    800067b8:	07c52783          	lw	a5,124(a0)
    800067bc:	00078863          	beqz	a5,800067cc <pop_off+0x4c>
    800067c0:	100027f3          	csrr	a5,sstatus
    800067c4:	0027e793          	ori	a5,a5,2
    800067c8:	10079073          	csrw	sstatus,a5
    800067cc:	00813083          	ld	ra,8(sp)
    800067d0:	00013403          	ld	s0,0(sp)
    800067d4:	01010113          	addi	sp,sp,16
    800067d8:	00008067          	ret
    800067dc:	00001517          	auipc	a0,0x1
    800067e0:	cac50513          	addi	a0,a0,-852 # 80007488 <digits+0x48>
    800067e4:	fffff097          	auipc	ra,0xfffff
    800067e8:	018080e7          	jalr	24(ra) # 800057fc <panic>
    800067ec:	00001517          	auipc	a0,0x1
    800067f0:	c8450513          	addi	a0,a0,-892 # 80007470 <digits+0x30>
    800067f4:	fffff097          	auipc	ra,0xfffff
    800067f8:	008080e7          	jalr	8(ra) # 800057fc <panic>

00000000800067fc <push_on>:
    800067fc:	fe010113          	addi	sp,sp,-32
    80006800:	00813823          	sd	s0,16(sp)
    80006804:	00113c23          	sd	ra,24(sp)
    80006808:	00913423          	sd	s1,8(sp)
    8000680c:	02010413          	addi	s0,sp,32
    80006810:	100024f3          	csrr	s1,sstatus
    80006814:	100027f3          	csrr	a5,sstatus
    80006818:	0027e793          	ori	a5,a5,2
    8000681c:	10079073          	csrw	sstatus,a5
    80006820:	ffffe097          	auipc	ra,0xffffe
    80006824:	61c080e7          	jalr	1564(ra) # 80004e3c <mycpu>
    80006828:	07852783          	lw	a5,120(a0)
    8000682c:	02078663          	beqz	a5,80006858 <push_on+0x5c>
    80006830:	ffffe097          	auipc	ra,0xffffe
    80006834:	60c080e7          	jalr	1548(ra) # 80004e3c <mycpu>
    80006838:	07852783          	lw	a5,120(a0)
    8000683c:	01813083          	ld	ra,24(sp)
    80006840:	01013403          	ld	s0,16(sp)
    80006844:	0017879b          	addiw	a5,a5,1
    80006848:	06f52c23          	sw	a5,120(a0)
    8000684c:	00813483          	ld	s1,8(sp)
    80006850:	02010113          	addi	sp,sp,32
    80006854:	00008067          	ret
    80006858:	0014d493          	srli	s1,s1,0x1
    8000685c:	ffffe097          	auipc	ra,0xffffe
    80006860:	5e0080e7          	jalr	1504(ra) # 80004e3c <mycpu>
    80006864:	0014f493          	andi	s1,s1,1
    80006868:	06952e23          	sw	s1,124(a0)
    8000686c:	fc5ff06f          	j	80006830 <push_on+0x34>

0000000080006870 <pop_on>:
    80006870:	ff010113          	addi	sp,sp,-16
    80006874:	00813023          	sd	s0,0(sp)
    80006878:	00113423          	sd	ra,8(sp)
    8000687c:	01010413          	addi	s0,sp,16
    80006880:	ffffe097          	auipc	ra,0xffffe
    80006884:	5bc080e7          	jalr	1468(ra) # 80004e3c <mycpu>
    80006888:	100027f3          	csrr	a5,sstatus
    8000688c:	0027f793          	andi	a5,a5,2
    80006890:	04078463          	beqz	a5,800068d8 <pop_on+0x68>
    80006894:	07852783          	lw	a5,120(a0)
    80006898:	02f05863          	blez	a5,800068c8 <pop_on+0x58>
    8000689c:	fff7879b          	addiw	a5,a5,-1
    800068a0:	06f52c23          	sw	a5,120(a0)
    800068a4:	07853783          	ld	a5,120(a0)
    800068a8:	00079863          	bnez	a5,800068b8 <pop_on+0x48>
    800068ac:	100027f3          	csrr	a5,sstatus
    800068b0:	ffd7f793          	andi	a5,a5,-3
    800068b4:	10079073          	csrw	sstatus,a5
    800068b8:	00813083          	ld	ra,8(sp)
    800068bc:	00013403          	ld	s0,0(sp)
    800068c0:	01010113          	addi	sp,sp,16
    800068c4:	00008067          	ret
    800068c8:	00001517          	auipc	a0,0x1
    800068cc:	be850513          	addi	a0,a0,-1048 # 800074b0 <digits+0x70>
    800068d0:	fffff097          	auipc	ra,0xfffff
    800068d4:	f2c080e7          	jalr	-212(ra) # 800057fc <panic>
    800068d8:	00001517          	auipc	a0,0x1
    800068dc:	bb850513          	addi	a0,a0,-1096 # 80007490 <digits+0x50>
    800068e0:	fffff097          	auipc	ra,0xfffff
    800068e4:	f1c080e7          	jalr	-228(ra) # 800057fc <panic>

00000000800068e8 <__memset>:
    800068e8:	ff010113          	addi	sp,sp,-16
    800068ec:	00813423          	sd	s0,8(sp)
    800068f0:	01010413          	addi	s0,sp,16
    800068f4:	1a060e63          	beqz	a2,80006ab0 <__memset+0x1c8>
    800068f8:	40a007b3          	neg	a5,a0
    800068fc:	0077f793          	andi	a5,a5,7
    80006900:	00778693          	addi	a3,a5,7
    80006904:	00b00813          	li	a6,11
    80006908:	0ff5f593          	andi	a1,a1,255
    8000690c:	fff6071b          	addiw	a4,a2,-1
    80006910:	1b06e663          	bltu	a3,a6,80006abc <__memset+0x1d4>
    80006914:	1cd76463          	bltu	a4,a3,80006adc <__memset+0x1f4>
    80006918:	1a078e63          	beqz	a5,80006ad4 <__memset+0x1ec>
    8000691c:	00b50023          	sb	a1,0(a0)
    80006920:	00100713          	li	a4,1
    80006924:	1ae78463          	beq	a5,a4,80006acc <__memset+0x1e4>
    80006928:	00b500a3          	sb	a1,1(a0)
    8000692c:	00200713          	li	a4,2
    80006930:	1ae78a63          	beq	a5,a4,80006ae4 <__memset+0x1fc>
    80006934:	00b50123          	sb	a1,2(a0)
    80006938:	00300713          	li	a4,3
    8000693c:	18e78463          	beq	a5,a4,80006ac4 <__memset+0x1dc>
    80006940:	00b501a3          	sb	a1,3(a0)
    80006944:	00400713          	li	a4,4
    80006948:	1ae78263          	beq	a5,a4,80006aec <__memset+0x204>
    8000694c:	00b50223          	sb	a1,4(a0)
    80006950:	00500713          	li	a4,5
    80006954:	1ae78063          	beq	a5,a4,80006af4 <__memset+0x20c>
    80006958:	00b502a3          	sb	a1,5(a0)
    8000695c:	00700713          	li	a4,7
    80006960:	18e79e63          	bne	a5,a4,80006afc <__memset+0x214>
    80006964:	00b50323          	sb	a1,6(a0)
    80006968:	00700e93          	li	t4,7
    8000696c:	00859713          	slli	a4,a1,0x8
    80006970:	00e5e733          	or	a4,a1,a4
    80006974:	01059e13          	slli	t3,a1,0x10
    80006978:	01c76e33          	or	t3,a4,t3
    8000697c:	01859313          	slli	t1,a1,0x18
    80006980:	006e6333          	or	t1,t3,t1
    80006984:	02059893          	slli	a7,a1,0x20
    80006988:	40f60e3b          	subw	t3,a2,a5
    8000698c:	011368b3          	or	a7,t1,a7
    80006990:	02859813          	slli	a6,a1,0x28
    80006994:	0108e833          	or	a6,a7,a6
    80006998:	03059693          	slli	a3,a1,0x30
    8000699c:	003e589b          	srliw	a7,t3,0x3
    800069a0:	00d866b3          	or	a3,a6,a3
    800069a4:	03859713          	slli	a4,a1,0x38
    800069a8:	00389813          	slli	a6,a7,0x3
    800069ac:	00f507b3          	add	a5,a0,a5
    800069b0:	00e6e733          	or	a4,a3,a4
    800069b4:	000e089b          	sext.w	a7,t3
    800069b8:	00f806b3          	add	a3,a6,a5
    800069bc:	00e7b023          	sd	a4,0(a5)
    800069c0:	00878793          	addi	a5,a5,8
    800069c4:	fed79ce3          	bne	a5,a3,800069bc <__memset+0xd4>
    800069c8:	ff8e7793          	andi	a5,t3,-8
    800069cc:	0007871b          	sext.w	a4,a5
    800069d0:	01d787bb          	addw	a5,a5,t4
    800069d4:	0ce88e63          	beq	a7,a4,80006ab0 <__memset+0x1c8>
    800069d8:	00f50733          	add	a4,a0,a5
    800069dc:	00b70023          	sb	a1,0(a4)
    800069e0:	0017871b          	addiw	a4,a5,1
    800069e4:	0cc77663          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    800069e8:	00e50733          	add	a4,a0,a4
    800069ec:	00b70023          	sb	a1,0(a4)
    800069f0:	0027871b          	addiw	a4,a5,2
    800069f4:	0ac77e63          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    800069f8:	00e50733          	add	a4,a0,a4
    800069fc:	00b70023          	sb	a1,0(a4)
    80006a00:	0037871b          	addiw	a4,a5,3
    80006a04:	0ac77663          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a08:	00e50733          	add	a4,a0,a4
    80006a0c:	00b70023          	sb	a1,0(a4)
    80006a10:	0047871b          	addiw	a4,a5,4
    80006a14:	08c77e63          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a18:	00e50733          	add	a4,a0,a4
    80006a1c:	00b70023          	sb	a1,0(a4)
    80006a20:	0057871b          	addiw	a4,a5,5
    80006a24:	08c77663          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a28:	00e50733          	add	a4,a0,a4
    80006a2c:	00b70023          	sb	a1,0(a4)
    80006a30:	0067871b          	addiw	a4,a5,6
    80006a34:	06c77e63          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a38:	00e50733          	add	a4,a0,a4
    80006a3c:	00b70023          	sb	a1,0(a4)
    80006a40:	0077871b          	addiw	a4,a5,7
    80006a44:	06c77663          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a48:	00e50733          	add	a4,a0,a4
    80006a4c:	00b70023          	sb	a1,0(a4)
    80006a50:	0087871b          	addiw	a4,a5,8
    80006a54:	04c77e63          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a58:	00e50733          	add	a4,a0,a4
    80006a5c:	00b70023          	sb	a1,0(a4)
    80006a60:	0097871b          	addiw	a4,a5,9
    80006a64:	04c77663          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a68:	00e50733          	add	a4,a0,a4
    80006a6c:	00b70023          	sb	a1,0(a4)
    80006a70:	00a7871b          	addiw	a4,a5,10
    80006a74:	02c77e63          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a78:	00e50733          	add	a4,a0,a4
    80006a7c:	00b70023          	sb	a1,0(a4)
    80006a80:	00b7871b          	addiw	a4,a5,11
    80006a84:	02c77663          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a88:	00e50733          	add	a4,a0,a4
    80006a8c:	00b70023          	sb	a1,0(a4)
    80006a90:	00c7871b          	addiw	a4,a5,12
    80006a94:	00c77e63          	bgeu	a4,a2,80006ab0 <__memset+0x1c8>
    80006a98:	00e50733          	add	a4,a0,a4
    80006a9c:	00b70023          	sb	a1,0(a4)
    80006aa0:	00d7879b          	addiw	a5,a5,13
    80006aa4:	00c7f663          	bgeu	a5,a2,80006ab0 <__memset+0x1c8>
    80006aa8:	00f507b3          	add	a5,a0,a5
    80006aac:	00b78023          	sb	a1,0(a5)
    80006ab0:	00813403          	ld	s0,8(sp)
    80006ab4:	01010113          	addi	sp,sp,16
    80006ab8:	00008067          	ret
    80006abc:	00b00693          	li	a3,11
    80006ac0:	e55ff06f          	j	80006914 <__memset+0x2c>
    80006ac4:	00300e93          	li	t4,3
    80006ac8:	ea5ff06f          	j	8000696c <__memset+0x84>
    80006acc:	00100e93          	li	t4,1
    80006ad0:	e9dff06f          	j	8000696c <__memset+0x84>
    80006ad4:	00000e93          	li	t4,0
    80006ad8:	e95ff06f          	j	8000696c <__memset+0x84>
    80006adc:	00000793          	li	a5,0
    80006ae0:	ef9ff06f          	j	800069d8 <__memset+0xf0>
    80006ae4:	00200e93          	li	t4,2
    80006ae8:	e85ff06f          	j	8000696c <__memset+0x84>
    80006aec:	00400e93          	li	t4,4
    80006af0:	e7dff06f          	j	8000696c <__memset+0x84>
    80006af4:	00500e93          	li	t4,5
    80006af8:	e75ff06f          	j	8000696c <__memset+0x84>
    80006afc:	00600e93          	li	t4,6
    80006b00:	e6dff06f          	j	8000696c <__memset+0x84>

0000000080006b04 <__memmove>:
    80006b04:	ff010113          	addi	sp,sp,-16
    80006b08:	00813423          	sd	s0,8(sp)
    80006b0c:	01010413          	addi	s0,sp,16
    80006b10:	0e060863          	beqz	a2,80006c00 <__memmove+0xfc>
    80006b14:	fff6069b          	addiw	a3,a2,-1
    80006b18:	0006881b          	sext.w	a6,a3
    80006b1c:	0ea5e863          	bltu	a1,a0,80006c0c <__memmove+0x108>
    80006b20:	00758713          	addi	a4,a1,7
    80006b24:	00a5e7b3          	or	a5,a1,a0
    80006b28:	40a70733          	sub	a4,a4,a0
    80006b2c:	0077f793          	andi	a5,a5,7
    80006b30:	00f73713          	sltiu	a4,a4,15
    80006b34:	00174713          	xori	a4,a4,1
    80006b38:	0017b793          	seqz	a5,a5
    80006b3c:	00e7f7b3          	and	a5,a5,a4
    80006b40:	10078863          	beqz	a5,80006c50 <__memmove+0x14c>
    80006b44:	00900793          	li	a5,9
    80006b48:	1107f463          	bgeu	a5,a6,80006c50 <__memmove+0x14c>
    80006b4c:	0036581b          	srliw	a6,a2,0x3
    80006b50:	fff8081b          	addiw	a6,a6,-1
    80006b54:	02081813          	slli	a6,a6,0x20
    80006b58:	01d85893          	srli	a7,a6,0x1d
    80006b5c:	00858813          	addi	a6,a1,8
    80006b60:	00058793          	mv	a5,a1
    80006b64:	00050713          	mv	a4,a0
    80006b68:	01088833          	add	a6,a7,a6
    80006b6c:	0007b883          	ld	a7,0(a5)
    80006b70:	00878793          	addi	a5,a5,8
    80006b74:	00870713          	addi	a4,a4,8
    80006b78:	ff173c23          	sd	a7,-8(a4)
    80006b7c:	ff0798e3          	bne	a5,a6,80006b6c <__memmove+0x68>
    80006b80:	ff867713          	andi	a4,a2,-8
    80006b84:	02071793          	slli	a5,a4,0x20
    80006b88:	0207d793          	srli	a5,a5,0x20
    80006b8c:	00f585b3          	add	a1,a1,a5
    80006b90:	40e686bb          	subw	a3,a3,a4
    80006b94:	00f507b3          	add	a5,a0,a5
    80006b98:	06e60463          	beq	a2,a4,80006c00 <__memmove+0xfc>
    80006b9c:	0005c703          	lbu	a4,0(a1)
    80006ba0:	00e78023          	sb	a4,0(a5)
    80006ba4:	04068e63          	beqz	a3,80006c00 <__memmove+0xfc>
    80006ba8:	0015c603          	lbu	a2,1(a1)
    80006bac:	00100713          	li	a4,1
    80006bb0:	00c780a3          	sb	a2,1(a5)
    80006bb4:	04e68663          	beq	a3,a4,80006c00 <__memmove+0xfc>
    80006bb8:	0025c603          	lbu	a2,2(a1)
    80006bbc:	00200713          	li	a4,2
    80006bc0:	00c78123          	sb	a2,2(a5)
    80006bc4:	02e68e63          	beq	a3,a4,80006c00 <__memmove+0xfc>
    80006bc8:	0035c603          	lbu	a2,3(a1)
    80006bcc:	00300713          	li	a4,3
    80006bd0:	00c781a3          	sb	a2,3(a5)
    80006bd4:	02e68663          	beq	a3,a4,80006c00 <__memmove+0xfc>
    80006bd8:	0045c603          	lbu	a2,4(a1)
    80006bdc:	00400713          	li	a4,4
    80006be0:	00c78223          	sb	a2,4(a5)
    80006be4:	00e68e63          	beq	a3,a4,80006c00 <__memmove+0xfc>
    80006be8:	0055c603          	lbu	a2,5(a1)
    80006bec:	00500713          	li	a4,5
    80006bf0:	00c782a3          	sb	a2,5(a5)
    80006bf4:	00e68663          	beq	a3,a4,80006c00 <__memmove+0xfc>
    80006bf8:	0065c703          	lbu	a4,6(a1)
    80006bfc:	00e78323          	sb	a4,6(a5)
    80006c00:	00813403          	ld	s0,8(sp)
    80006c04:	01010113          	addi	sp,sp,16
    80006c08:	00008067          	ret
    80006c0c:	02061713          	slli	a4,a2,0x20
    80006c10:	02075713          	srli	a4,a4,0x20
    80006c14:	00e587b3          	add	a5,a1,a4
    80006c18:	f0f574e3          	bgeu	a0,a5,80006b20 <__memmove+0x1c>
    80006c1c:	02069613          	slli	a2,a3,0x20
    80006c20:	02065613          	srli	a2,a2,0x20
    80006c24:	fff64613          	not	a2,a2
    80006c28:	00e50733          	add	a4,a0,a4
    80006c2c:	00c78633          	add	a2,a5,a2
    80006c30:	fff7c683          	lbu	a3,-1(a5)
    80006c34:	fff78793          	addi	a5,a5,-1
    80006c38:	fff70713          	addi	a4,a4,-1
    80006c3c:	00d70023          	sb	a3,0(a4)
    80006c40:	fec798e3          	bne	a5,a2,80006c30 <__memmove+0x12c>
    80006c44:	00813403          	ld	s0,8(sp)
    80006c48:	01010113          	addi	sp,sp,16
    80006c4c:	00008067          	ret
    80006c50:	02069713          	slli	a4,a3,0x20
    80006c54:	02075713          	srli	a4,a4,0x20
    80006c58:	00170713          	addi	a4,a4,1
    80006c5c:	00e50733          	add	a4,a0,a4
    80006c60:	00050793          	mv	a5,a0
    80006c64:	0005c683          	lbu	a3,0(a1)
    80006c68:	00178793          	addi	a5,a5,1
    80006c6c:	00158593          	addi	a1,a1,1
    80006c70:	fed78fa3          	sb	a3,-1(a5)
    80006c74:	fee798e3          	bne	a5,a4,80006c64 <__memmove+0x160>
    80006c78:	f89ff06f          	j	80006c00 <__memmove+0xfc>
	...
