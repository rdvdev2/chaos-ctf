#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int change_me = 0;
    char buffer[20];

    printf("Username: ");
    gets(buffer);
    
    printf("Checking access...\n");

    if (change_me != 0) {
        setreuid(geteuid(), geteuid());
        system("/bin/bash");
    } else {
        printf("Unauthorized!");
    }
    printf("\n");

    return 0;
}
