#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int change_me = 0;
    char buffer[20];

    printf("Input for echo machine: ");
    fgets(buffer, sizeof buffer, stdin);
    
    printf(buffer, &change_me);
    printf("\n");

    if (change_me != 0) {
        setreuid(geteuid(), geteuid());
        system("/bin/bash");
    } else {
        printf("Not good enough!");
    }
    printf("\n");

    return 0;
}
