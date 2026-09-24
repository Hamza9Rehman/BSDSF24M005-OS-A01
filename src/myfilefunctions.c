#include "../include/myfilefunctions.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/types.h>

int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (file == NULL || lines == NULL || words == NULL || chars == NULL) {
        return -1;
    }

    *lines = 0;
    *words = 0;
    *chars = 0;

    int ch;
    int in_word = 0;

    while ((ch = fgetc(file)) != EOF) {
        (*chars)++;

        if (ch == '\n') {
            (*lines)++;
        }

        if (isspace(ch)) {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            (*words)++;
        }
    }

    if (ferror(file)) {
        return -1;
    }

    return 0;
}

int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (fp == NULL || search_str == NULL || matches == NULL) {
        return -1;
    }

    *matches = NULL;
    int match_count = 0;
    int capacity = 0;

    char* line = NULL;
    size_t len = 0;
    ssize_t read;

    while ((read = getline(&line, &len, fp)) != -1) {
        if (strstr(line, search_str) != NULL) {
            if (match_count >= capacity) {
                int new_capacity = (capacity == 0) ? 4 : capacity * 2;
                char** new_matches = realloc(*matches, new_capacity * sizeof(char*));
                if (new_matches == NULL) {
                    free(line);
                    for (int i = 0; i < match_count; i++) {
                        free((*matches)[i]);
                    }
                    free(*matches);
                    *matches = NULL;
                    return -1;
                }
                *matches = new_matches;
                capacity = new_capacity;
            }

            (*matches)[match_count] = strdup(line);
            if ((*matches)[match_count] == NULL) {
                free(line);
                for (int i = 0; i < match_count; i++) {
                    free((*matches)[i]);
                }
                free(*matches);
                *matches = NULL;
                return -1;
            }
            match_count++;
        }
    }

    free(line);

    if (ferror(fp)) {
        for (int i = 0; i < match_count; i++) {
            free((*matches)[i]);
        }
        free(*matches);
        *matches = NULL;
        return -1;
    }

    return match_count;
}