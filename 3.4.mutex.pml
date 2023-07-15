#include "sema.pml"

#define TOTAL 5

byte counter = 0;
byte fin = 0;
byte mutex = 1;

active [TOTAL] proctype
user()
{
	semacquire(mutex);
	byte reg; /* simulate non atomic increment */
	reg = counter;
	counter = reg + 1;
	semrelease(mutex);

	fin++;
}

init {
	fin == TOTAL;
	assert counter == TOTAL;
}
