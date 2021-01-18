/* Exemple d'illustration des primitives Unix : Un père et ses fils */
/* execl */

#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */


int main(int argc, char* args[])
{
//    printf("Prog dormir, args: %s%s", args[1], args[2]);
    printf("Prog dormir");
    sleep(120);
    return EXIT_SUCCESS;
}
