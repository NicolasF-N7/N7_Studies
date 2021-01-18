#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

#define TAILLE_PORTE_MONNAIE 5

// Definition du type monnaie
struct monnaie{
	float valeur;
	char devise;
};

typedef struct monnaie monnaie;
/**
 * \brief Initialiser une monnaie 
 * \param[]
 * \pre 
 * val >=0.0
 */ 
void initialiser(monnaie* m, float val, char dev) {
    m->valeur=val;
    m->devise=dev;
}


/**
 * \brief Ajouter une monnaie m2 à une monnaie m1 
 * \param[]
 * Pre: true
 */ 
bool ajouter(monnaie* m1, const monnaie* m2) {
    if(m1->devise != m2->devise)
	return 0;
    else
    	m1->valeur = m1->valeur + m2->valeur;
    return 1;
}


/**
 * \brief Tester Initialiser 
 * \param[]
 * pre: true
 */ 
void tester_initialiser() {
    monnaie m;
    initialiser(&m, 27.05, 'e');
    printf("val: %f, dev: %c\n", m.valeur, m.devise);
}

/**
 * \brief Tester Ajouter 
 * \param[]
 * // TODO
 */ 
void tester_ajouter() {
    monnaie m1;
    monnaie m2;

    initialiser(&m1, 17, 'e');
    initialiser(&m2, 25, 'e');

    ajouter(&m1,&m2);
    printf("somme: %f\n", m1.valeur);
}

void vider_buffer(){
    while(getchar() != '\n'){
    }
}

int main(void) {
    // Déclarer un tableau de 5 monnaies
    monnaie porte_monnaie[TAILLE_PORTE_MONNAIE];

    //Initialiser les monnaies
    for(int i=0; i<TAILLE_PORTE_MONNAIE; i++){
	printf("Choisissez la valeur de la monnaie %i, puis sa devise(e : euros, $: dolars, £: livre sterling...)", i+1);
	float val;
	char dev;
	scanf("%f", &val);
	scanf(" %c", &dev);
	porte_monnaie[i].valeur=val;
	porte_monnaie[i].devise=dev;
	vider_buffer();
    }
 
    // Afficher la somme de toutes les monnaies qui sont dans une devise entrée par l'utilisateur.
    printf("Dans quelle devise doit etre la somme ?");
    char dev;
    scanf("%c", &dev);

    float sum=0.0;
    for(int i=0; i<TAILLE_PORTE_MONNAIE;i++){
	if(porte_monnaie[i].devise == dev)
	    sum += porte_monnaie[i].valeur;
    }

    printf("La somme est: %f\n", sum);
    return EXIT_SUCCESS;
}
