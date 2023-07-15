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
