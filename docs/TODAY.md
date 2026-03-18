# Bilan de la Séance 2

- Ce qui marche :
  - Implémentation du contrôleur ON/OFF avec hystérésis.
  - La simulation est autonome : le chauffage s'adapte à la température.
  - Visualisation des seuils Tlow (21.5°C) et Thigh (22.5°C) sur le graphique.
- Comment tester :
  - Exécuter `run_demo.sce`. Observer que T(t) reste entre les deux lignes de seuils rouges.
- Ce qui reste à faire :
  - Optimiser la consommation d'énergie ou tester des perturbations extérieures (ouverture de fenêtre).
