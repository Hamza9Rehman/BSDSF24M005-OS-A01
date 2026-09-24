#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("=== TESTING STRING FUNCTIONS ===\n");

    const char* str = "Hello World";
    int len = mystrlen(str);
    printf("mystrlen(\"%s\") = %d\n", str, len);

    char dest1[50];
    mystrcpy(dest1, "C Programming");
    printf("mystrcpy -> dest1 = \"%s\"\n", dest1);

    char dest2[50];
    mystrncpy(dest2, "Copy complete text", 4);
    dest2[4] = '\0';
    printf("mystrncpy (4 chars) -> dest2 = \"%s\"\n", dest2);

    char dest3[50] = "Hello ";
    mystrcat(dest3, "World!");
    printf("mystrcat -> dest3 = \"%s\"\n\n", dest3);

    printf("=== TESTING FILE FUNCTIONS ===\n");

    FILE* temp = tmpfile();
    if (!temp) {
        printf("Error: Could not create temporary file.\n");
        return 1;
    }

    fputs("Hello World\nThis is a test file.\nHello again!\nAnother line.", temp);

    rewind(temp);
    int lines = 0, words = 0, chars = 0;
    if (wordCount(temp, &lines, &words, &chars) == 0) {
        printf("wordCount -> Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);
    } else {
        printf("wordCount failed.\n");
    }

    rewind(temp);
    char** matches = NULL;
    int count = mygrep(temp, "Hello", &matches);

    if (count >= 0) {
        printf("mygrep found %d matching line(s) for \"Hello\":\n", count);
        for (int i = 0; i < count; i++) {
            printf("  [%d] %s", i + 1, matches[i]);
            free(matches[i]);
        }
        free(matches);
    } else {
        printf("mygrep failed.\n");
    }

    fclose(temp);
    return 0;
}