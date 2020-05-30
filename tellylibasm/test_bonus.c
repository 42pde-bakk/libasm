/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_bonus.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: abobas <abobas@student.codam.nl>             +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/04/30 15:02:09 by abobas        #+#    #+#                 */
/*   Updated: 2020/05/06 20:06:56 by pde-bakk      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef struct          s_list
{
    void                *data;
    struct s_list       *next;
}                       t_list;

int         ft_strlen(char *str);
char        *ft_strcpy(char *dst, char *src);
int         ft_strcmp(char *s1, char *s2);
ssize_t     ft_write(int fd, const void *buf, size_t count);
ssize_t     ft_read(int fd, void *buf, size_t count);
char        *ft_strdup(const char *s);

int         ft_atoi_base(char *str, char *base);
void        ft_list_push_front(t_list **begin_list, void *data);
int         ft_list_size(t_list *begin_list);
int         ft_list_sort(t_list **begin_list, int (*cmp)());
int         ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

void    print_lists(t_list *list)
{
    int i = 1;
    printf("ft_list_size = %d\n", ft_list_size(list));
    while (list)
    {   
        printf("element_%d_data = %s\n", i++, (char*)list->data);
        list = list->next;
    }
}

int     main(void)
{
    char *ptr = 0;

    printf("\n");
    printf("atoi_base = %d\n", atoi("235235"));
    printf("ft_atoi_base = %d\n", ft_atoi_base("235235", "0123456789"));
    printf("atoi_base = %d\n", atoi("99999999999999999"));
    printf("ft_atoi_base = %d\n", ft_atoi_base("99999999999999999", "0123456789"));
    printf("atoi_base = %d\n", atoi("9999999999999999988888888888888888888888"));
    printf("ft_atoi_base = %d\n", ft_atoi_base("9999999999999999988888888888888888888888", "0123456789"));
    printf("atoi_base = %d\n", atoi("-9999999999999999988888888888888888888888"));
    printf("ft_atoi_base = %d\n", ft_atoi_base("-9999999999999999988888888888888888888888", "0123456789"));
    printf("atoi_base = %lu\n", strtoul("75bcd15", &ptr, 16));
    printf("ft_atoi_base = %d\n", ft_atoi_base("75bcd15", "0123456789abcdef"));
    printf("atoi_base = %lu\n", strtoul("987654", &ptr, 16));
    printf("ft_atoi_base = %d\n", ft_atoi_base("987654", "0123456789abcdef"));
    printf("atoi_base = %lu\n", strtoul("2a", &ptr, 16));
    printf("ft_atoi_base = %d\n", ft_atoi_base("2a", "0123456789abcdef"));
    printf("atoi_base = %lu\n", strtoul("ffffaa", &ptr, 16));
    printf("ft_atoi_base = %d\n\n", ft_atoi_base("ffffaa", "0123456789abcdef"));

    printf("1. ft_atoi_base = %d\n", ft_atoi_base("abcdef", "abcdef"));
    printf("2. ft_atoi_base = %d\n", ft_atoi_base("-235235", "0123456789"));
    printf("3. ft_atoi_base = %d\n", ft_atoi_base("-+2a", "0123456789abcdef"));
    printf("4. ft_atoi_base = %d\n", ft_atoi_base("+-235235", "0123456789"));
    printf("5. ft_atoi_base = %d\n", ft_atoi_base("+-2a", "0123456789abcdef"));
    printf("6. ft_atoi_base = %d\n", ft_atoi_base("-+235235", "0123456789"));
    printf("7. ft_atoi_base = %d\n", ft_atoi_base("-2a", "0123456789abcdef"));
    printf("8. ft_atoi_base = %d\n", ft_atoi_base("345.,.", "0123456789"));
    printf("9. ft_atoi_base = %d\n", ft_atoi_base("zxc", "0123456789abcdef"));
    printf("10. ft_atoi_base = %d\n", ft_atoi_base("zxc", "zxc"));
    printf("11. ft_atoi_base = %d\n", ft_atoi_base("bullshit", "zxc"));
    printf("12. ft_atoi_base = %d\n", ft_atoi_base(0, "zxd"));
    printf("13. ft_atoi_base = %d\n", ft_atoi_base("20", 0));
    printf("14. ft_atoi_base = %d\n", ft_atoi_base("235235", "0123452"));
    printf("15. ft_atoi_base = %d\n", ft_atoi_base("1000000", "01"));
    printf("16. ft_atoi_base = %d\n", ft_atoi_base("111111111", "1"));

    t_list  list_start;
    t_list  list_next;
    t_list  list_last;
    t_list  *test = &list_start;

    list_start.data = strdup("8");
    list_start.next = &list_next;
    list_next.data = strdup("5");
    list_next.next = &list_last;
    list_last.data = strdup("3");
    list_last.next = 0;

    printf("\noriginal list content:\n");
    print_lists(&list_start);
    
    printf("\ncontent list after ft_list_push_front:\n");
    ft_list_push_front(&test, strdup("9"));
    print_lists(test);
    
    printf("\ncontent list after ft_list_sort:\n");
    ft_list_sort(&test, &strcmp);
    print_lists(test);
    printf("\n");

    printf("\ncontent list after ft_list_remove_if:\n");
    ft_list_remove_if(&test, "10", &ft_strcmp);
    print_lists(test);
    printf("\n");
    return (0);
}
