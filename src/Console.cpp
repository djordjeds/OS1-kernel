//
// Created by DjordjeS on 1.8.2022.
//

#include "../h/syscall_cpp.hpp"

char Console::getc() {
    return ::getc();
}

void Console::putc(char c){
    ::putc(c);
}