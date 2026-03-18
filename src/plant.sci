function T_next = plant_step(T, u, Text, dt, alpha, beta)
    // Calcul de l'évolution de la température selon le modèle discret
    // T : Température actuelle
    // u : Commande chauffage (0 ou 1)
    
    T_next = T + dt * (alpha * u - beta * (T - Text));
endfunction
