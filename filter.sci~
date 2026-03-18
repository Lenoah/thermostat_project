function y_f = iir_step(y, y_f_prev, tau, dt)
    // y : la mesure brute actuelle (T_meas)
    // y_f_prev : la valeur filtrée à l'instant précédent
    // tau : constante de temps du filtre
    // dt : pas d'échantillonnage
    
    // Calcul du coefficient de lissage
    a = dt / (tau + dt);
    
    // Application de l'équation du filtre
    y_f = y_f_prev + a * (y - y_f_prev);
endfunction
