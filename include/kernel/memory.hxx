#pragma once
#include "stdint.h"
#include "stddef.h"
#include "kernel/boot.hxx"
#include "kernel/kutil.hxx"
#include "kernel/io.hxx"

namespace memory {

	extern size_t free_memory_size;
	extern size_t total_memory_size;
	extern size_t used_memory_size;
	extern size_t reserved_memory_size;

	namespace paging {	
		struct page_directory_entry {
			bool present : 1;
			bool read_write : 1;
			bool user_super : 1;
			bool write_through : 1;
			bool cache_disabled : 1;
			bool accessed : 1;
			bool ignore_0 : 1; 
			bool larger_pages : 1;
			bool ignore_1 : 1;
			uint8_t available : 3;
			uint64_t address : 52;
		};

		struct page_table { 
			page_directory_entry entries [512];
		}__attribute__((aligned(0x1000)));

		class page_map_indexer {
		public:
			page_map_indexer(uint64_t virtual_address);
			uint64_t pdp_i;
			uint64_t pd_i;
			uint64_t pt_i;
			uint64_t p_i;
		};

		extern page_table* pml_4;

		void map_memory(void* virtual_memory, void* physical_memory);

		namespace allocation {
			void 	free_page(void* address);
    		void 	free_pages(void* address, uint64_t page_count);
    		void 	lock_page(void* address);
    		void	lock_pages(void* address, uint64_t page_count);
   			void* 	request_page();
		}
	};

	namespace allocation {
		typedef struct s_memory_info {
			size_t 				memory_size; // bytes
			void* 				kernel_heap;
			size_t 		   kernel_heap_size; // bytes
			void*				  user_heap;
			size_t 			 user_heap_size; // bytes
		} memory_info;

		typedef struct s_conv_mem_chunk {
			void* start;
			size_t pages;
		} conventional_memory_chunk;

		void* 		malloc(size_t bytes);
		void 		free(void* data);
		void* 		kmalloc(size_t bytes);
		void 		kfree(void* data);
		void 		start_malloc();
		void		map_memory(boot::memory_map_descriptor* memory_map, uint64_t map_size, uint64_t desc_size);
		uint64_t	get_total_memory_size(boot::memory_map_descriptor* memory_map, uint64_t map_size, uint64_t desc_size);
	};

	namespace operations {	
		void*	memcpy(void* __restrict dst, const void* __restrict src, size_t size);
		void* 	memset(void* buf, int value, size_t size);
	};
};