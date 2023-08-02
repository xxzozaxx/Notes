#include <stdio.h>
#include <time.h>

int
main()
{
    /* Make a var */
    /* The time() function returns the number of seconds elapsed since
     * Jan 1 1970 00:00:00 UTC. This value is also written to now
     * unless now is NULL. */
    time_t sec;
    sec = time(NULL);

    printf("Horse since Jan 1, 1970 is %d \n", sec/3600);

    /**

     char *
     ctime(const time_t *clock);


     * The ctime() function converts a time_t, pointed to by clock,
     * representing the time in seconds since
     * 00:00:00 UTC, 1970-01-01, and returns a pointer to a
     * string of the form Thu Nov 24 18:22:48 1986\n */
    printf("%s", ctime(&sec));

    return 0;
}
