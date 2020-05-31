/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: Peer <pde-bakk@student.codam.nl>             +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/05/06 16:51:14 by Peer          #+#    #+#                 */
/*   Updated: 2020/05/31 15:11:08 by Peer          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <unistd.h>
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
	if (out == ref)
		printf("strlen succesfull\n");
	else
		printf("strlen failed. str = %s, my output = %ld, real = %ld\n", str, out, ref);	
}

void	ft_strcpytest(void)
{
	char	*dst;
	char	*src;
	char	*ret;

	dst = "bigboss";
	src = ":)";
	ret = NULL;
	printf("STRCPY: \n");
	printf("before copying:\ndest: %s, src: %s, ret: %p\n", dst, src, ret);
	ret = ft_strcpy(dst, src);
	printf("after copying:\ndest: %s, src: %s, ret: %p\n", dst, src, ret);
}

void	ft_strcmptest(void)
{
	char	s1[] = "hoezee";
	char	s2[] = "hoezo";
	char	s3[] = "hoezee";

	printf("Strcmp: \n");
	printf("s1: %s, s2: %s, return: %i\n", s1, s2, ft_strcmp(s1, s2));
	printf("s1: %s, s3: %s, return: %i\n", s1, s3, ft_strcmp(s1, s3));
}

void	ft_writetest(void)
{
	char	s1[] = "yeet";

	int a = write(1, s1, sizeof(s1));
	int	b = ft_write(1, s1, sizeof(s1));
	printf("write returned %i and ft_write returned %i\n", a, b);
    a = write(FOPEN_MAX + 1, "abcdefghijklmnopqrstuvwxyz\n", 27);
	perror("write errno");
	errno = 100;
    b = ft_write(FOPEN_MAX + 1, "abcdefghijklmnopqrstuvwxyz\n", 27);
	perror("ft_write errno");
    printf("return write = %d\nreturn ft_write = %d\n", a, b);
	int testfd = open("hats.c", O_RDWR | O_CREAT, 0644);
	int c = 0;
	if (testfd > 2)
		c = ft_write(testfd, "hatsssssss", 8);
	printf("hats return value = %d\n", c);
}

void	ft_readtest(void)
{
	char	buf1[300];
	char	buf2[300];

	int	fd = open("src/ft_read.s", O_RDONLY);
	int	a = read(fd, buf1, 250);
	close(fd);
	fd = open("src/ft_read.s", O_RDONLY);
	int	b = ft_read(fd, buf2, 250);
	printf("read returned %d and ft_read returned %d\n", a, b);
	printf("strcmp(buf1, buf2) = %d\n", strcmp(buf1, buf2));
	    a = read(333, buf1, 250);
	perror("read errno");
	errno = 100;
    b = ft_read(333, buf2, 250);
	perror("ft_read errno");
    printf("return read = %d\nreturn ft_read = %d\n", a, b);
    printf("strcmp(buffer_read, buffer_ft_read) = %d\n", ft_strcmp(buf1, buf2));
    close(fd);
    fd = open("ft_read.s", O_RDONLY);
    a = read(fd, NULL, 250);
	perror("read errno");
	errno = 100;
    b = ft_read(fd, NULL, 250);
	perror("ft_read errno");
    printf("return read = %d\nreturn ft_read = %d\n\n", a, b);
}

int	main(void)
{
	ft_strlentest();
	ft_strcpytest();
	ft_strcmptest();
	ft_writetest();
	ft_readtest();
	// ft_strduptest();
}