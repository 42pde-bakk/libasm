/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: Peer <pde-bakk@student.codam.nl>             +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/05/06 16:51:14 by Peer          #+#    #+#                 */
/*   Updated: 2020/07/23 19:31:22 by pde-bakk      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <limits.h>

void	ft_strlentest(void)
{
	char	*str;
	size_t	out;
	size_t	ref;

	str = "abcdef0123";
	out = ft_strlen(str);
	ref = strlen(str);
	printf("str = %s, my strlen = %zu, real strlen = %zu\n", str, out, ref);
	if (out == ref)
		printf("strlen succesfull\n\n");
	else
		printf("strlen failed. str = %s, my output = %ld, real = %ld\n\n", str, out, ref);	
}

void	ft_strcpytest(void)
{
	char	*s1 = malloc(sizeof(char) * 10);
	char	*s2 = malloc(sizeof(char) * 10);

	s2 = "hallodoei";
    printf("ft_strcpy\t= %s\n", ft_strcpy(s1, s2));
    printf("strcpy\t\t= %s\n", strcpy(s1, s2));
    printf("strcpy\t\t= %s\n", strcpy(s1, "Hello world!!!"));
    printf("ft_strcpy\t= %s\n", ft_strcpy(s1, "Hello world!!!"));
    printf("ft_strcpy\t= %s\n", ft_strcpy(s1, 0));
    printf("ft_strcpy\t= %s\n\n", ft_strcpy(0, s1));
}

void	ft_strcmptest(void)
{
	char	s1[] = "hoezee";
	char	s2[] = "hoezo";
	char	s3[] = "hoezee";

	printf("Strcmp: \n");
	printf("s1: %s, s2: %s, my return: %i\n", s1, s2, ft_strcmp(s1, s2));
	printf("s1: %s, s2: %s, og return: %i\n", s1, s2, strcmp(s1, s2));
	printf("s1: %s, s3: %s, my return: %i\n", s1, s3, ft_strcmp(s1, s3));
	printf("s1: %s, s3: %s, og return: %i\n\n", s1, s3, strcmp(s1, s3));
}

void	ft_writetest(void)
{
	char	s1[] = "yeet\n";

	int a = write(1, s1, sizeof(s1));
	int	b = ft_write(1, s1, sizeof(s1));
	printf("write returned %i and ft_write returned %i\n", a, b);
    a = write(FOPEN_MAX + 1, "abcdefghijklmnopqrstuvwxyz\n", 27);
	perror("write errno");
	errno = 0;
    b = ft_write(FOPEN_MAX + 1, "abcdefghijklmnopqrstuvwxyz\n", 27);
	perror("ft_write errno");
    printf("return write = %d\nreturn ft_write = %d\n", a, b);
	// int testfd = open("hats.c", O_RDWR | O_CREAT, 0644);
	int	testfd = OPEN_MAX + 1;
	if (testfd > 2)
	{
		int c = ft_write(testfd, "hatsssssss", 8);
		if (c < 0)
			perror("my write error");
		int d = write(testfd, "hatsssssss", 8);
		if (d < 0)
			perror("real write error");
		printf("hats mine: %d, real: %d\n", c, d);
	}
	printf("\n");
}

void	ft_readtest(void)
{
	char	buf1[21];
	char	buf2[21];

	bzero(&buf1, 21); bzero(&buf2, 21);
	int	fd = open("hats", O_RDONLY);
	int	a = read(fd, buf1, 20);
	printf("test1: buf1 = %s\n", buf1);
	close(fd);
	fd = open("hats", O_RDONLY);
	printf("fd = %d\n", fd);
	int	b = ft_read(fd, buf2, 20);
	printf("test1: buf1 = %s\n", buf1);
	printf("read returned %d and ft_read returned %d\n", a, b);
	printf("strcmp(buf1, buf2) = %d\n", strcmp(buf1, buf2));
	    a = read(333, buf1, 20);
	perror("read errno");
	errno = 100;
    b = ft_read(333, buf2, 20);
	perror("ft_read errno");
    printf("return read = %d\nreturn ft_read = %d\n", a, b);
    printf("strcmp(buffer_read, buffer_ft_read) = %d\n", ft_strcmp(buf1, buf2));
    close(fd);
    fd = open("hats", O_RDONLY);
    a = read(fd, NULL, 20);
	perror("read errno");
	errno = 100;
    b = ft_read(fd, NULL, 20);
	perror("ft_read errno");
    printf("return read = %d\nreturn ft_read = %d\n\n", a, b);
}

void	ft_strduptest(void)
{
	char	*official;
	char	*mine;

	official = strdup("Hallo wereld");
	mine = ft_strdup("Hallo wereld");
	printf("official: %s\nmine: %s\n", official, mine);
	free(official); free(mine);
	official = strdup("");
	mine = ft_strdup("");
	printf("official: %s$\t and\tmine: %s$\n", official, mine);
	free(official); free(mine);
	errno = 0;
	mine = ft_strdup(NULL);
	if (fork() == 0)
	{
		strdup(NULL);
		printf("this fucking piece of shit crashes\n");
	}
	perror("strdup null");
	printf("mine: %s\n\n", mine);
	free(mine);
}

int	main(void)
{
	ft_strlentest();
	ft_strcpytest();
	ft_strcmptest();
	ft_writetest();
	ft_readtest();
	ft_strduptest();
}