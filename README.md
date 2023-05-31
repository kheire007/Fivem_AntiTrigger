# Kheire007
----info-----
    Il initialise une variable ESX en utilisant TriggerEvent pour obtenir l'objet partagé ESX.
    Il définit une table antitriggerserverent qui contient les événements à contrôler.
	Chaque événement est défini avec différentes propriétés, telles que onlystaff (seulement pour le personnel),
	joballowed (travail autorisé), kick (expulser le joueur), ban (bannir le joueur), etc.
    Il définit une fonction CheckEvent qui est appelée pour chaque événement déclenché.
	Cette fonction vérifie les conditions spécifiées pour l'événement en cours et prend des mesures en fonction des résultats.
    Il boucle à travers la table antitriggerserverent et enregistre les événements côté serveur en utilisant RegisterServerEvent.
	Pour chaque événement, il ajoute un gestionnaire qui appelle la fonction CheckEvent en passant les données de l'événement et la source du déclenchement.
    Lorsque l'événement est déclenché côté serveur, le gestionnaire correspondant est appelé, et la fonction CheckEvent est exécutée pour effectuer les vérifications nécessaires.
	Selon les conditions spécifiées, des actions telles que l'expulsion du joueur, le bannissement, l'affichage de notifications peuvent être effectuées.
    -----------------------------------------info------------------------------------------------------------------
	
	It initializes an ESX variable using TriggerEvent to get the ESX shared object.
    It defines an antitriggerserverent table that contains the events to monitor.
    Each event is defined with different properties, such as onlystaff (only for staff),
    joballowed (allowed work), kick (eject the player), ban (ban the player), etc.
    It defines a CheckEvent function which is called for each triggered event.
     This function checks the conditions specified for the current event and takes action based on the results.
    It loops through the antitriggerserverent table and registers server-side events using RegisterServerEvent.
    For each event, it adds a handler that calls the CheckEvent function passing the event data and trigger source.
    When the event is triggered on the server side, the corresponding handler is called, and the CheckEvent function is executed to perform the necessary checks.
    Depending on the specified conditions, actions such as kicking the player, banning, showing notifications can be performed.
     AT


## License
©Copyright Kheire007
