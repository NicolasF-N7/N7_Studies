#include <stdlib.h> 
#include <stdio.h>

int main(int argc, char* argv[]){
    printf("Les arguments sont : \n");
    for(int i=0;i<argc;i++){
    	printf("Argument %i : %s\n", i, argv[i]);
    }
    
    return EXIT_SUCCESS;
}
