#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int number = 1;
    unsigned int a;

    printf("Here's the deal: Input a positive number and we will sum it to 1. Make the result negative to get your last shell: ");
    scanf("%i", &a);

    number += a;
    printf("The result is %i!\n", number);

    if (number < 0) {
        printf("You outsmarted me! Here you go:\n");
        setreuid(geteuid(), geteuid());
        system("/bin/bash");
    } else {
        printf("Good luck next time!\n");
    }
    return 0;
}