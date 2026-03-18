function [u, heat_on_next] = thermostat_step(T, heat_on_prev, Tset, h)
    // 1. Calcul des seuils
    Tlow = Tset - h/2;
    Thigh = Tset + h/2;
    
    // 2. Logique d'hystérésis
    if (heat_on_prev == %t) & (T >= Thigh) then
        heat_on_next = %f; // On éteint si on dépasse le seuil haut
    elseif (heat_on_prev == %f) & (T <= Tlow) then
        heat_on_next = %t; // On allume si on descend sous le seuil bas
    else
        heat_on_next = heat_on_prev; // Sinon, on garde l'état actuel
    end
    
    // 3. Conversion en commande numérique (0 ou 1)
    if heat_on_next then
        u = 1;
    else
        u = 0;
    end
endfunction
