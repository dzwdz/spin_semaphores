#include "sema.pml"

#define TOTAL 5
#define MAX 2

byte counter = 0;
byte mutex = MAX;

active [TOTAL] proctype
user()
{
	semacquire(mutex);
		counter++;
		assert counter <= MAX;
		printf("%d\n", counter); /* must be manually verified */
		counter--;
	semrelease(mutex);
}
