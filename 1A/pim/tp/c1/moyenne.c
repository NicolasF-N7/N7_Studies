#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// Definition du type t_note
struct t_note {
    float note;
    float coef;
};
typedef struct t_note t_note;

// Definition d'un tableau de notes t_tab_notes de 5 éléments.
typedef t_note t_tab_notes[5];

/**
 * \brief Initialiser une note
 * \param[out] note note à initialiser
 * \param[in] valeur nombre de points
 * \param[in] coef coefficient
 * \pre valeur <= 20 && valeur >= 0
 * \pre coef <= 1 && coef >= 0
 */
void initialiser(t_note* note, float valeur, float coef){
    assert(valeur <= 20 && valeur >= 0);
    assert(coef <= 20 && coef >= 0);
    note->note=valeur;
    note->coef=coef;
}


/**
 * \brief Calculer la moyenne des notes du tableau 
 * \param[in] tab_notes tableau de nodes
 * \param[in] nb_notes nombre de notes
 */ 
float moyenne(t_tab_notes tab_notes, int nb_notes){
    float moy=0;
    for(int i=0; i <nb_notes;i++){
        moy += tab_notes[i].note*tab_notes[i].coef;
    }
    return moy;
}


int main(void){
    t_tab_notes notes;
    
    //Initialiser les éléments d'une variable tableau à 0.0
    initialiser(&notes[0], 10, 0.2);
    initialiser(&notes[1], 1, 0.3);
    initialiser(&notes[2], 12, 0.5);
    
    //Calculer la moyenne des 3 notes
    float moy = moyenne(notes, 3);
    printf("moyFuncton: %f, moyExacte: %f",moy, 10*0.2+0.3+12*0.5);
    assert(moy == 8.300000);
    return EXIT_SUCCESS;
}
