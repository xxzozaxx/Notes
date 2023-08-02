#include <stdio.h>
#include <time.h>

int
main(void)
{
        /**
         * the idea is to get both number of seconds before and after
         * then used difftime(3) to get human readable difference between them

         double
         difftime(time_t time1, time_t time0);

            the difference between two calendar times, (time1 - time0), expressed in seconds.
        */
    time_t start, end;
    volatile long unsigned c; /* counter */

    start = time(NULL);

    for(c=0; c<50000000000; c++)
            ;
    end = time(NULL);
    printf("the lope used %f seconds\n", difftime(end, start));
    return 0;
}
