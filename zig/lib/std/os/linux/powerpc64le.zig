usingnamespace @import("../bits.zig");

pub fn syscall0(number: SYS) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number))
        : "memory", "cr0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn syscall1(number: SYS, arg1: usize) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number)),
          [arg1] "{r3}" (arg1)
        : "memory", "cr0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn syscall2(number: SYS, arg1: usize, arg2: usize) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number)),
          [arg1] "{r3}" (arg1),
          [arg2] "{r4}" (arg2)
        : "memory", "cr0", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn syscall3(number: SYS, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number)),
          [arg1] "{r3}" (arg1),
          [arg2] "{r4}" (arg2),
          [arg3] "{r5}" (arg3)
        : "memory", "cr0", "r6", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn syscall4(number: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number)),
          [arg1] "{r3}" (arg1),
          [arg2] "{r4}" (arg2),
          [arg3] "{r5}" (arg3),
          [arg4] "{r6}" (arg4)
        : "memory", "cr0", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn syscall5(number: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number)),
          [arg1] "{r3}" (arg1),
          [arg2] "{r4}" (arg2),
          [arg3] "{r5}" (arg3),
          [arg4] "{r6}" (arg4),
          [arg5] "{r7}" (arg5)
        : "memory", "cr0", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn syscall6(
    number: SYS,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
) usize {
    return asm volatile ("sc"
        : [ret] "={r3}" (-> usize)
        : [number] "{r0}" (@enumToInt(number)),
          [arg1] "{r3}" (arg1),
          [arg2] "{r4}" (arg2),
          [arg3] "{r5}" (arg3),
          [arg4] "{r6}" (arg4),
          [arg5] "{r7}" (arg5),
          [arg6] "{r8}" (arg6)
        : "memory", "cr0", "r9", "r10", "r11", "r12"
    );
}

/// This matches the libc clone function.
pub extern fn clone(func: extern fn (arg: usize) u8, stack: usize, flags: u32, arg: usize, ptid: *i32, tls: usize, ctid: *i32) usize;

pub fn restore() callconv(.Naked) void {
    return asm volatile ("sc"
        :
        : [number] "={r3}" (@enumToInt(SYS.sigreturn))
        : "memory", "cr0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}

pub fn restore_rt() callconv(.Naked) void {
    return asm volatile ("sc"
        :
        : [number] "={r3}" (@enumToInt(SYS.rt_sigreturn))
        : "memory", "cr0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12"
    );
}
