# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ryan.sh                                            :+:    :+:             #
#                                                      +:+                     #
#    By: pde-bakk <pde-bakk@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/10 12:52:43 by pde-bakk      #+#    #+#                  #
#    Updated: 2020/10/10 12:56:27 by pde-bakk      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if [ ! -d "libasm_unit_test" ]
then
	git clone https://github.com/rlucas585/libasm_unit_test.git
fi
make re
cd libasm_unit_test
cp ../libasm.a .

./run.sh nocrit
