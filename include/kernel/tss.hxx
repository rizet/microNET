#pragma once

#include <stdint.h>

#define CONFIG_MAX_CPUS 1

namespace cpu {
    namespace tss {
        typedef struct tss {
            uint32_t prev_tss;
            uint64_t rsp[3];
            uint64_t reserved0;
            uint64_t ist[7];
            uint64_t reserved1;
            uint16_t reserved2;
            uint16_t io_map;
        } __attribute__((packed)) tss_t;

        void tss_init();
        extern "C" void tss_install(int num_cpu, uint64_t cpu_stack);

        void tss_setstack(int num_cpu, uint64_t stack);

        extern "C" void   load_tss(uint16_t);
        extern "C" tss_t* tss_get(int num_cpu);
    }
}