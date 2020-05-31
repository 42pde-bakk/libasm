/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: Peer <pde-bakk@student.codam.nl>             +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/05/06 17:09:49 by Peer          #+#    #+#                 */
/*   Updated: 2020/05/06 17:14:50 by Peer          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
__ssize_t	ft_read(int fd, void *buf, size_t count);
__ssize_t	ft_write(int fd, const void *buf, size_t count);

# endif