#!/bin/bash
#fonction 1
ajouter_tache() {
	#demander la description
	read -p "entrez la description de la tache : " description

	#verifier si le fchier exixte, si non le créer

	if [! -f tasks.txt]; then
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


