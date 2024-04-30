#!/bin/bash


#Fonction qui change le i-eme chiffre du secret temporaire en zéro
modif(){

	#On récupère la position du chiffre à changer
	local pos=$1
	
	#On récupère les nombres présents avant et après le chiffre à la position "pos"
	avant=$((secretTemp / 10 ** pos))
	apres=$((secretTemp % 10 ** (pos - 1)))
	
	#On crée le nouveau secret avec le 0 à la place
	secretTemp=$((avant * 10 ** pos + apres))
}


#Fonction qui vérifie la tentative proposée en la comparant avec la solution.
verif() {
	bon=0
	mal=0
	
	#On copie le code secret pour pouvoir y apporter des modifications après
	#On pense a rajouter un 1 avant, car au cas où un 0 est remplacé en première position, il ne faut pas que le nombre secret ait un chiffre de moins
	secretTemp=$((10 ** n + secret))
	
	#On parcours tous les chiffres de la combinaison test
	for ((i=1; i<=$n; i++))
	do
		chiffreTeste=$(((essai % 10 ** i) / 10 ** (i - 1)))
		
		#Pour chaque chiffre test, on regarde sa correspondance avec chaque chiffre du secret.
		for ((j=1; j<=n ; j++))
		do
			chiffreSolution=$(((secretTemp % 10 ** j) / 10 ** (j - 1)))
			
			#Si le chiffre à la i-ème position de l'essai correspond au j-ème du secret
			if [ $chiffreSolution -eq $chiffreTeste ]
			then
				if [ $j -eq $i ]
				then
					bon=$((bon + 1))
					modif $j
					j=$n
				else
					if [ $chiffreSolution -eq $(((essai % 10 ** j) / 10 ** (j - 1))) ];
					then
						bon=$((bon + 1))
						modif $j
						j=$n
					else
						mal=$((mal + 1))
						modif $j
						j=$n
					fi
				fi
			fi
		done
	done
	echo "Nombre de chiffres présents et bien placés : $bon"
	echo "Nombre de chiffres présents mais mal placés : $mal"
}


#Paramètres par défaut du jeu
n=5
b=5
try=10


while true
do
	echo -e "$(tput clear)\e[1m\n\t"
	

	echo -e " _      __  ___    / /  _____  ____    ____ ___   ___          / /_  ____ "
	echo -e "| | /| / / / _ \\  / /  / ___/ / __ \  / __ \`__ \\ / _ \\        / __/ / __ \\"
	echo -e "| |/ |/ / /  __/ / /  / /__  / /_/ / / / / / / //  __/       / /_  / /_/ /"
	echo -e "|__/|__/  \\___/ /_/   \\___/  \\____/ /_/ /_/ /_/ \\___/        \\__/  \\____/\e[0m\n"
		                                          
	echo "	░▒▓██████████████▓▒░   ░▒▓██████▓▒░   ░▒▓███████▓▒░ ░▒▓████████▓▒░ ░▒▓████████▓▒░ ░▒▓███████▓▒░  ░▒▓██████████████▓▒░  ░▒▓█▓▒░ ░▒▓███████▓▒░  ░▒▓███████▓▒░  "
	echo "	░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░           ░▒▓█▓▒░     ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ "
	echo "	░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░           ░▒▓█▓▒░     ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ "
	echo "	░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░  ░▒▓██████▓▒░     ░▒▓█▓▒░     ░▒▓██████▓▒░   ░▒▓███████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ "
	echo "	░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ "
	echo "	░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ "
	echo "	░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓███████▓▒░     ░▒▓█▓▒░     ░▒▓████████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓███████▓▒░  "


	echo -e "\n\nMenu Principal\n\n\nEntrez Y pour démarrer une partie."
	echo "Entrez P pour voir ou modifier les paramètres."
	echo "Entrez Q pour quitter le jeu."
	
	echo -e -n "\nQue choisissez-vous de faire ? "
	read -n 1 asked
	echo ""

	#Ecran des paramètres
	if [ $asked = "P" ];
	then
		echo "$(tput clear)Paramètres par défaut :"
		echo ""
		echo "Nombre de chiffres pour le code : $n."
		echo "Les chiffres du code seront compris entre 1 et $b."
		echo "Le nombre d'essais par joueur sera : $try."
		echo -e -n "\nVoulez-vous changer les paramètre ? (Y/N)"
		read -n 1 asked
		
		if [ $asked = "Y" ];
		then
			echo -n -e "\nCombien de chiffres pour le code ? "
			read -n 1 n
			echo -n -e "\nValeur maximale d'un chiffre ? "
			read -n 1 b
			echo -n -e "\nCombien d'essais par joueur ? "
			read -n 1 try
		fi
		
		echo -e "\nRetour au menu principal..."
		sleep 2
		continue
	fi

	#Démarrage d'une partie
	if [ $asked = "Y" ];
	then
		echo -n "Combien de joueurs joueront cette partie ? (9 max) "
		read -n 1 nb
		echo "$(tput clear)"
		
		if [ $nb -lt 1 ];
		then
			echo -e "Erreur dans l'entrée du nombre de joueurs.\nRetour au menu principal..."
			sleep 3
			continue
		fi
		
		
		#Génération du code secret à trouver
		secret=0
		for ((i=1; i<=$n; i++))
		do
			nombre=$(shuf -i 1-$b -n 1)
			secret=$((secret * 10 + nombre))
		done

		#Boucle de la partie
		
		cpt=0
		nbTours=0
		
		while [ $nbTours != $try ];
		do
			if [ $nb -gt 1 ]
			then
				echo -e "\tC'est au tour du joueur $(((cpt % nb) + 1))"
			fi
			
			echo -e "(Il vous reste $((try - nbTours)) essais)"
			echo -n "Quelle est la combinaison à tester ? "
			read essai
			bool1=false
			
			#On vérifie que le joueur n'ait pas tapé n'importe quoi
			if [ $((essai / 10 ** n))  -gt 0 -o $((essai % 10 ** (n - 1))) -eq $essai ]
			then
				echo -e "\nIl faut entrer un nombre de $n chiffres !"
				echo -e "Recommence.\n"
				continue
			fi
			for ((i=1; i<=$n; i++))
			do
				if [ $(((essai % 10 ** i) / 10 ** (i - 1))) -lt 1 -o $(((essai % 10 ** i) / 10 ** (i - 1))) -gt $b ]
				then
					echo -e "\nErreur : un des chiffres entrés n'est pas compris dans la plage [1;$b]"
					echo -e "Recommence.\n"
					bool1=true
					break
				fi
			done
			if $bool1; then continue; fi
			
			
			#Etape la plus importante de vérification de la combinaison test.
			verif
			
			
			if [ $bon -eq $n ]
			then
				echo -e "\n\n\tBravo ! tu as trouvé la combinaison secrète !"
				echo "Il s'agissait de $secret."
				break
			fi
			
			
			
			cpt=$((cpt + 1))
			if [ $((cpt % nb)) -eq 0 ]
			then
				nbTours=$((nbTours + 1))
			fi
			
			if [ $nbTours -eq $try ]; then
				echo -e "\n\n\tDommage ! Tu as perdu, retente ta chance !"
				echo "Le secret était : $secret."
				break
			fi
			
			echo -e "\n\n"
		done
	elif [ $asked = "Q" ];
	then
		echo "Tant pis, une prochaine fois !"
		break
	else
		echo "Echec de de compréhension, veuillez réessayer."
		continue
	fi
	echo -e -n "\nMerci d'avoir joué ! Appuyez sur n'importe quelle touche pour revenir au menu principal."
	read -n 1 asked
	continue
done
