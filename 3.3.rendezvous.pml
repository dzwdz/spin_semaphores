inline
semacquire(x)
{
	atomic {
		x > 0;
		x--;
	}
}

inline
semrelease(x)
{
	x++;
}


byte fin = 0;
byte sema = 0;
byte semb = 0;

active [1] proctype
a()
{
	fin++;
	semrelease(sema);
	semacquire(semb);
	assert fin == 2;
}

active [1] proctype
b()
{
	fin++;
	semrelease(semb);
	semacquire(sema);
	assert fin == 2;
}
