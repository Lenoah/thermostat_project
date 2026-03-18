// --- Initialisation Séance 2 ---
exec("src/plant.sci", -1);
exec("src/controller.sci", -1); // Chargement du nouveau contrôleur 

// --- Paramètres de référence  ---
dt = 1;
t_end = 30 * 60; // 30 minutes
t = 0:dt:t_end;
n = length(t);

Text = 18;
alpha = 0.035;
beta = 0.002;

Tset = 22;
h = 1.0;
Tlow = Tset - h/2;   // 21.5°C 
Thigh = Tset + h/2;  // 22.5°C 

// --- Initialisation des vecteurs ---
T = zeros(1, n);
u = zeros(1, n);
T(1) = 20;
heat_on = %f; // État initial du chauffage (OFF) 

// --- Boucle de simulation dynamique  ---
for k = 1:n-1
    // 1. Le thermostat décide (u) en fonction de la température actuelle
    [u(k), heat_on] = thermostat_step(T(k), heat_on, Tset, h);
    
    // 2. Le modèle physique calcule la température suivante (T_next)
    T(k+1) = plant_step(T(k), u(k), Text, dt, alpha, beta);
end
// La dernière commande u(n) est calculée pour le graphe
[u(n), heat_on] = thermostat_step(T(n), heat_on, Tset, h);


// --- Figure 1 : Température + Seuil ---
scf(1); clf();
plot(t/60, T, "b-", "LineWidth", 2);
// Tracer les seuils (lignes horizontales)
plot(t/60, Tlow * ones(1,n), "r--");
plot(t/60, Thigh * ones(1,n), "r--");
xlabel("Temps (minutes)");
ylabel("Température (°C)");
title("Régulation par hystérésis");
hl = legend(["Température"; "Seuil Bas (Tlow)"; "Seuil Haut (Thigh)"]);
xgrid();

// --- Figure 2 : Commande chauffage  ---
scf(2); clf();
plot(t/60, u, "r-", "LineWidth", 2);
xlabel("Temps (minutes)");
ylabel("Chauffage u (0/1)");
title("État du thermostat");
gca().data_bounds = [0, -0.1 ; t_end/60, 1.1];
xgrid();
