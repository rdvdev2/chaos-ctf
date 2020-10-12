#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
    FILE *f;
    char s;

    if (argc != 2) {
        printf("Usage: %s <file>\n", argv[0]);
        return 1;
    }

    if (strstr(argv[1], "chaos4") != 0) {
        printf("You thought this was too easy!\n");
        return 1;
    }

    f = fopen(argv[1], "r");
    if (f == NULL) {
        printf("Can't read file!\n");
        return 1;
    }

    do {
        s = fgetc(f);
        printf("%c", s);
    } while (s != EOF);
    fclose(f);

    return 0;
}