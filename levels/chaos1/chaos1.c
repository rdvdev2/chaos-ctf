#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

int main(int argc, char* argv[]) {
    int fd;
    int size = 0;
    char buf[256];

    if (argc != 2) {
        printf("Usage: %s <file> (only chaos1 owned files allowed!)\n", argv[0]);
        return 1;
    }

    struct stat stat_data;
    if (stat(argv[1], &stat_data) < 0) {
        fprintf(stderr, "Failed to stat %s: %s\n", argv[1], strerror(errno));
        return 1;
    }

    if (stat_data.st_uid != 1001) {
        fprintf(stderr, "File %s isn't owned by chaos1\n", argv[1]);
        return 1;
    }

    fd = open(argv[1], O_RDONLY);

    if (fd <= 0) {
        fprintf(stderr, "Couldn't open %s\n", argv[1]);
        return 1;
    }

    do {
        size = read(fd, buf, 256);
        write(1, buf, size);
    } while(size > 0);

}
