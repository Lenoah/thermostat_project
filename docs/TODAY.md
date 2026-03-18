# Bilan de la Séance 3 : Capteur et Filtrage

## Ce qui a été réalisé :

- **Simulation de capteur** : Ajout d'un offset (+0.3°C), d'un bruit blanc et de glitches (pics aléatoires).
- **Filtrage numérique** : Implémentation d'un filtre IIR du 1er ordre (passe-bas) pour lisser la mesure.
- **Boucle fermée** : Le thermostat utilise désormais la température filtrée pour décider de l'état du chauffage.

## Observations :

- Le filtre introduit un léger retard (dû à la constante de temps tau=10s) mais stabilise la commande u(t).
- Sans le filtre, les glitches provoqueraient des arrêts/démarrages intempestifs du chauffage.
- Le bonus (marquage des glitches par des 'x' rouges) permet de vérifier visuellement l'efficacité du filtrage.
