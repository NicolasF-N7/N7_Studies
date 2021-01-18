 /* Exemple d'illustration des primitives Unix : Un père et ses fils */
/* Création de fils : fork et exit */
 
#include <stdio.h>    /* entrées sorties */
 #include <unistd.h>   /* pimitives de base : fork, ...*/
 #include <stdlib.h>   /* exit */
 
 #define NB_FILS 3     /* nombre de fils */
 
 int main()
 {
     int fils, retour ;
     int duree_sommeil = 120 ;
 
     printf("\nJe suis le processus principal de pid %d\n", getpid()) ;
     fflush(stdout);
     for (fils = 1 ; fils <= NB_FILS ; fils++) {
         retour = fork() ;
 
         /* Bonne pratique : tester systématiquement le retour des appels système */
         if (retour < 0) {   /* échec du fork */
             printf("Erreur fork\n") ;
             /* Convention : s'arrêter avec une valeur > 0 en cas d'erreur */
             exit(1) ;
         }
 
        /* fils */
         if (retour == 0) {
             printf("\n     Processus fils numero %d, de pid %d, de pere %d.\n", 
                     fils, getpid(), getppid()) ;
             //sleep(duree_sommeil) ;
             /* Important : terminer un processus par exit */
             exit(EXIT_SUCCESS) ;   /* Terminaison normale (0 = sans erreur) */
         }
 
         /* pere */
         else {
             printf("\nProcessus de pid %d a cree un fils numero %d, de pid %d \n", 
                     getpid(), fils, retour) ;
	     fflush(stdout);
         }
     }
     sleep(duree_sommeil);
    return EXIT_SUCCESS ;
}
