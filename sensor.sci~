function [y, is_glitch] = sensor_read(T_true, cfg)
    // cfg est une structure contenant : offset, sigma, p_glitch, glitch_amp
    
    // 1. Ajout de l'offset et du bruit blanc (gaussien)
    // rand(1,1,"normal") génère un nombre aléatoire selon une loi normale
    y = T_true + cfg.offset + cfg.sigma * rand(1, 1, "normal");
    
    // 2. Gestion des glitches (pics aberrants)
    is_glitch = %f;
    if rand(1, 1, "uniform") < cfg.p_glitch then
        // On ajoute ou retranche l'amplitude du glitch au hasard
        direction = sign(rand(1, 1, "normal")); 
        y = y + direction * cfg.glitch_amp;
        is_glitch = %t;
    end
endfunction
