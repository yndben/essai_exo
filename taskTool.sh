#!/bin/bash
#fonction 1
ajouter_tache() {
	#demander la description
	read -p "entrez la description de la tache : " description

	#verifier si le fchier exixte, si non le créer

	if [ ! -f tasks.txt]; then
		touch tasks.txt
	fi

	#pour généré un ID  automatiquemnet 
	id=$(wc -l < tasks.sh)
	id=$((id +1))

	# ajouter la tache avec statu 0
	echo "$id|$description|0 >> tasks.txt

	echo "tache ajouter avec ID $id"



}

supprimer_tache() {
	read -p "Entrer l'ID de la tache à supprimer : " id_a_supprimer

	fichier_source="tasts.txt"
	fichier_temp="task_temp.txt"

	>"$fichier_temp"

	while IFS= read -r ligne || [ -n "$ligne"]; do

		current_id=$(echo"$ligne" | cut -d'|' -f1)

		if [ "$current_id" != "$id_a_supprimrt" ]; then
			echo "$ligne" >> $fichier_temp"

		fi

	done < "$fichier_source"

	mv "$fichier_temp" "$fichier_source"

	echo "la tache $id_a_supprimer a été supprimer avec succès."

}


marquer_terminee() {
    # 1. Demander l'ID de la tâche
    read -p "Entrez l'ID de la tâche terminée : " id_a_marquer

   fichier_sourceE="tasks.txt"
   fichier_temp=="tasks_temp.txt"
    > "$fichier_temp"

    # 2. Parcourir le fichier ligne par ligne
    while IFS= read -r ligne || [ -n "$ligne" ]; do
        # Extraire l'ID (champ 1)
        current_id=$(echo "$ligne" | cut -d'|' -f1)

        # 3. Si l'ID correspond, on remplace le statut (supposé être le dernier champ)
        if [ "$current_id" == "$id_a_marquer" ]; then
            # On utilise sed pour remplacer le 0 par 1 en fin de ligne
            nouvelle_ligne=$(echo "$ligne" | sed 's/0$/1/')
            echo "$nouvelle_ligne" >> "$fichier_temp"
        else
            # Sinon on recopie la ligne telle quelle
            echo "$ligne" >> "$fichier_temp"
        fi
    done < "$fichier_source"

    # 4. Réécrire le fichier
    mv "$FICHIER_TEMP" "$FICHIER_SOURCE"
    echo "Statut mis à jour pour la tâche $id_a_marquer."
}

afficher_taches() {
    FICHIER="tasks.txt"

    # 1. Vérifier si le fichier existe
    if [ ! -f "$FICHIER" ]; then
        echo "Erreur : Le fichier $FICHIER n'existe pas encore."
        return # On arrête la fonction ici
    fi

    # 2. Afficher un en-tête lisible
    echo "-----------------------------------------------------"
    echo " ID  | TÂCHE                | STATUT "
    echo "-----------------------------------------------------"

    # 3. Parcourir et afficher chaque tâche
    while IFS='|' read -r id description statut; do
        # 4. Distinguer visuellement (0 = En cours, 1 = Terminé)
        if [ "$statut" == "1" ]; then
            echo " [$id] | $description | ✅ TERMINEE"
        else
            echo " [$id] | $description | ⏳ EN COURS"
        fi
    done < "$FICHIER"
    echo "-----------------------------------------------------"
}
