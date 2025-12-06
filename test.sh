#!/bin/sh

tester () {
	rm -f outfile/original outfile/pipex
	< $1 $2 | $3 > outfile/pipex
	../pipex "$1" "$2" "$3" outfile/original

	if diff outfile/pipex outfile/original > /dev/null 2>&1
	then
		echo -n "\033[32;1m[OK]\033[0m"
	else
		echo -n "\033[21;1m[KO]\033[0m"
	fi
	echo ": < $1 $2 | $3 > out"
}

tester_3 () {
	rm -f outfile/original outfile/pipex
	< $1 $2 | $3 | $4 > outfile/pipex
	../pipex "$1" "$2" "$3" "$4" outfile/original

	if diff outfile/pipex outfile/original > /dev/null 2>&1
	then
		echo -n "\033[32;1m[OK]\033[0m"
	else
		echo -n "\033[21;1m[KO]\033[0m"
	fi
	echo ": < $1 $2 | $3 | $4 > out"
}

tester_4 () {
	rm -f outfile/original outfile/pipex
	< $1 $2 | $3 | $4 | $5 > outfile/pipex
	./.pipex "$1" "$2" "$3" "$4" "$5" outfile/original

	if diff outfile/pipex outfile/original > /dev/null 2>&1
	then
		echo -n "\033[32;1m[OK]\033[0m"
	else
		echo -n "\033[21;1m[KO]\033[0m"
	fi
	echo ": < $1 $2 | $3 | $4 | $5 > out"
}



tester "Makefile" "ls" "wc -l"
tester "Makefile" "cat" "grep a"
tester "Makefile" "test" "wc -c"
tester "Makefile" "tr z a" "tr a z"
tester "Makefile" "sort" "uniq"
tester "Makefile" "head -n 5" "tail -n 2"
tester "Makefile" "wc -l" "rev"
tester "Makefile" "rev" "rev"
tester "Makefile" "cat -e" "tr '$' '#'"
tester "Makefile" "grep -i test" "wc -w"
tester "Makefile" "grep -v a" "grep -v b"
tester "Makefile" "env" "sort"
tester "Makefile" "cat" "grep ."
tester "Makefile" "rev" "sort"
tester "Makefile" "cat" "uniq"
tester_4 "Makefile" "cat -e" "cat -e" "cat -e" "cat -e"
