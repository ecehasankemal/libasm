#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

extern size_t   ft_strlen(const char *str);
extern char     *ft_strcpy(char *dest, const char *src);
extern int     ft_strcmp(const char *s1, const char *s2);
extern int      ft_write(int fd, const void *buf, size_t count);
extern int      ft_read(int fd, void *buf, size_t count);
extern void     *ft_strdup(const char *str);

void
    doldur(char *str, size_t size, char *src)
{
    size_t i = 0;

    while (i < size)
    {
        src[i] = str[i];
        i++;
    }
    src[i] = '\0';
    printf("---------------------%s\n", src);
}

int
    main(void)
{
    const char *my_string = "Hello, World!";
    size_t      length = 0;
    char        dest[20];
    char        src[20];
    char        src2[] = "test";
    char        src3[] = "test";
    char        src4[] = "test2";
    char        reac_src[20];
    int         fd;

    fd = open("test.txt", O_RDWR | O_CREAT | O_TRUNC, 0644);
    doldur("Hello, World!", 20, src);
    ft_strcpy(dest, src);
    length = ft_strlen(my_string);
    printf("The length of the string is: %zu\n", length);
    printf("The copied string is: %s\n", dest);
    printf("-------------------------------------------------------------------------------------------·\n");
    printf("ft_strcmp: %d\n", ft_strcmp(src2, src3));
    printf("ft_strcmp: %d\n", ft_strcmp(src2, src4));
    printf("-------------------------------------------------------------------------------------------·\n");
    printf("strcmp: %d\n", strcmp(src2, src3));
    printf("strcmp: %d\n", strcmp(src2, src4));
    ft_write(1, "\n", 1);
    ft_write(fd, "Hello, World! in ft_write\n", ft_strlen("Hello, World! in ft_write\n"));
    lseek(fd, 0, SEEK_SET);
    ft_read(fd, reac_src, ft_strlen("Hello, World! in ft_write\n"));
    reac_src[ft_strlen("Hello, World! in ft_write\n") - 1] = '\0';
    printf("reac_src: %s\n", reac_src);
    printf("-------------------------------------------------------------------------------------------·\n");
    write(1, "\n", 1);
    char    *str = ft_strdup("Hello, World! in ft_strdup\n");
    write(1, str, ft_strlen(str));
    write(1, "\n", 1);
    close(fd);
    return (0);
}



