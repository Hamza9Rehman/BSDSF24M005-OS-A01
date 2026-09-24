#include "../include/mystrfunctions.h"

#include <stdio.h>

int mystrlen(const char* s) {
    if (s == NULL) {
        return 0;
    }
    
    int length = 0;
    while (s[length] != '\0') {
        length++;
    }
    return length;
}

int mystrcpy(char* dest, const char* src) {
    if (dest == NULL || src == NULL) {
        return -1;
    }

    int i = 0;
    while (src[i] != '\0') {
        dest[i] = src[i];
        i++;
    }
    dest[i] = '\0';

    return 0;
}

int mystrncpy(char* dest, const char* src, int n) {
    if (dest == NULL || src == NULL || n < 0) {
        return -1;
    }

    int i = 0;
    while (i < n && src[i] != '\0') {
        dest[i] = src[i];
        i++;
    }

    while (i < n) {
        dest[i] = '\0';
        i++;
    }

    return 0;
}

int mystrcat(char* dest, const char* src) {
    if (dest == NULL || src == NULL) {
        return -1;
    }

    int dest_len = 0;
    while (dest[dest_len] != '\0') {
        dest_len++;
    }

    int i = 0;
    while (src[i] != '\0') {
        dest[dest_len + i] = src[i];
        i++;
    }

    dest[dest_len + i] = '\0';

    return 0;
}