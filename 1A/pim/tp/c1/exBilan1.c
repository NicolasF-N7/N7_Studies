/*********************************************************************
 *  Auteur  : Nicolas Foin
 *  Version : 1.0.0
 *  Objectif : Conversion pouces/centimètres
 ********************************************************************/

#include <stdio.h>
#include <stdlib.h>

const float UnPouce = 2.54;// unite: cm/pouce

int main()
{
    int continuer=0;//type bool n'existe pas en C mais en C++

    /* Saisir la longueur */do{
        float val;
        char unite;
        printf("Saisissez la longueur ainsi que l'unite associee. (m pour mètres, c pour centimètres, p pour pouces)");
        scanf("%f", &val);
        scanf(" %c", &unite);
    
        /* Calculer la longueur en pouces et en centimètres */
        float lg_p;
        float lg_cm;
        switch(unite){
            case 'm':
            case 'M':
                lg_cm = val*100;
                lg_p=lg_cm/UnPouce;
                break;
            case 'c':
            case 'C':
                lg_cm = val;
                lg_p=lg_cm/UnPouce;
                break;
            case 'p':
            case 'P':
                lg_p=val;
                lg_cm = val*UnPouce;
                break;
            default:
                lg_p=-1;
                lg_cm = -1;
        }
    
        printf("La longueur correspond à: %1.2f p=%1.2f cm \n", lg_p, lg_cm);
        printf("Voulez vous continuer ? (o/n)");
        char c;
	//skip_line
	while(getchar() != '\n'){
	}
	
        scanf("%c", &c);
        continuer = (c=='o');
    }while(continuer);
    

    /* Afficher la longueur en pouces et en centimètres */

    return EXIT_SUCCESS;
}
