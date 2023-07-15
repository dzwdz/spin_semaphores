#include "sema.pml"

#define TOTAL 5

byte fin = 0;

byte count = 0;
byte mut1 = 1;
byte mut2 = 0;

inline
rendezvous()
{
	semacquire(mut1);
	count++;
	if
	:: (count == TOTAL) -> semrelease(mut2);
	:: (count != TOTAL);
	fi
	semrelease(mut1);

	semacquire(mut2);
	semrelease(mut2);
}

active [TOTAL] proctype
user()
{
	fin++;
	rendezvous();
	assert fin == TOTAL;
}
