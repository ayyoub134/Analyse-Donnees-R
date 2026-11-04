=======================
# Exercice 1
=======================
  
# 1. Priorité des opérations
8 + 4 * 3   # Renvoie 20 (la multiplication est prioritaire)
(8 + 4) * 3 # Renvoie 36 (les parenthèses forcent l'addition d'abord)

# 2. Puissance, reste et quotient
2^10      # Renvoie 1024
17 %% 5   # Renvoie 2 (reste de la division euclidienne)
17 %/% 5  # Renvoie 3 (quotient entier)

# 3. PIB par habitant
# Multiplicateur
4672.5 / 1499.1 
# Pourcentage d'augmentation : ((Valeur Finale - Valeur Initiale) / Valeur Initiale) * 100
((4672.5 - 1499.1) / 1499.1) * 100 

# 4. PIB total
# Augmentation absolue
182.37 - 30.18 
# Facteur de multiplication
182.37 / 30.18

=======================
  # Exercice 2
=======================
  
  # 1. Création des objets
  pib_1990 <- 30.18
pib_2025 <- 182.37
pib_1990
pib_2025

# 2. Calcul du facteur
facteur_pib <- pib_2025 / pib_1990
facteur_pib

# 3. Taux de croissance annuel moyen (TCAM)
tcam <- facteur_pib^(1/35) - 1
tcam
# Cela représente le pourcentage de croissance moyen par an sur ces 35 ans.

# 4. Accroissement de la population
pop_1990 <- 24.376
pop_2025 <- 38.431
((pop_2025 - pop_1990) / pop_1990) * 100

# 5. Erreurs d'affectation
# 1pib <- 5       : Erreur car un nom de variable ne peut pas commencer par un chiffre.
# prix sucre <- 5 : Erreur car les espaces sont interdits (utiliser prix_sucre).
# pib_hab <- pib_2000 : Erreur "objet 'pib_2000' introuvable" car il n'a pas été créé au préalable.

=======================
  # Exercice 3
=======================
  
  # 1. Fonctions mathématiques
  sqrt(196) # Racine carrée : 14
log(100)  # Logarithme népérien (base e)
log(100, base = 10) # Logarithme décimal : 2
# Les deux diffèrent car la fonction log() utilise la base 'e' par défaut.

# 2. Arrondis
round(123.456, 2)
round(123.456, digits = 2)
# Constat : Le résultat est identique, qu'on nomme l'argument ("digits =") ou qu'on respecte sa position.

# 3. Racine de 2
racine_de_deux <- sqrt(2)
racine_de_deux
round(racine_de_deux, 4) # Arrondi à 4 décimales

=======================
  # Exercice 4
=======================
  
  # 1. Vecteurs
  produits <- c("thé", "sucre", "huile", "farine", "vinaigre")
prix_panier <- c(25, 26, 30, 40, 5)
quantites <- c(1, 1, 2, 1, 4)

produits
prix_panier
quantites
length(prix_panier) # Affiche 5

# 2. Dépense par produit
depense_produit <- prix_panier * quantites
depense_produit
# Cette propriété de R s'appelle la "vectorisation" (le calcul s'applique élément par élément).

# 3. Statistiques descriptives
depense_totale <- sum(depense_produit)
mean(prix_panier)  # Prix moyen
sd(prix_panier)    # Écart-type
min(prix_panier)   # Prix minimum
max(prix_panier)   # Prix maximum

# 4. Indexation
prix_panier[4]                    # Prix de la farine
prix_panier[2:4]                  # Prix des produits 2 à 4
prix_panier[-length(prix_panier)] # Tous sauf le dernier (vinaigre)

# 5. Augmentation des prix
prix_panier_majore <- prix_panier * 1.05
nouvelle_depense_totale <- sum(prix_panier_majore * quantites)

# 6. Gestion des valeurs manquantes (NA)
prix_panier_na <- c(25, 26, 30, 40, NA)
mean(prix_panier_na)               # Renvoie NA
mean(prix_panier_na, na.rm = TRUE) # Calcule la moyenne en ignorant le NA (25+26+30+40)/4

# 7. Vecteur d'indicateurs et export
indicateurs_panier <- c(depense_totale, mean(prix_panier), min(prix_panier), max(prix_panier), sd(prix_panier))
indicateurs_panier
write.csv2(indicateurs_panier, file = "Chap01/output/indicateurs_panier.csv")

=======================
  # Exercice 5
=======================
  
  # 1. Aide sur mean
  ?mean
# Le rôle de na.rm est d'indiquer si les valeurs manquantes doivent être retirées avant le calcul. Sa valeur par défaut est FALSE.

# 2. Aide sur seq
?seq
# 'from' est la valeur de départ, 'to' est la valeur de fin, 'by' est le pas (l'incrément).

# 3. Recherche globale
??csv
# '?mean' ouvre la page d'aide exacte de la fonction mean.
# '??csv' lance une recherche globale sur le mot "csv" dans toute la documentation et les packages.

=======================
  # Exercice 6
=======================
  
  # 1. Importation
  population_ma <- read.csv2("Chap01/data/maroc_population_mini.csv")

# 2. Exploration
head(population_ma)
tail(population_ma)
nrow(population_ma) # Nombre d'observations (lignes).
# Les années vont de 1990 à 2025 (selon l'énoncé de la page 1).

# 3. Résumés
summary(population_ma)
str(population_ma) 
# str() nous apprend la structure de l'objet (un data.frame), le nombre d'observations/variables et le type des données (ex: int, num).

# 4. Population en 2000
head(population_ma, n = 11)
# En lisant la 11ème ligne de la sortie, on obtient la population de 2000.

# 5. Croissance 2000-2025
pop_2000 <- population_ma$pop_M[population_ma$annee == 2000]
pop_2025 <- population_ma$pop_M[population_ma$annee == 2025]
croissance_pct <- ((pop_2025 - pop_2000) / pop_2000) * 100
croissance_pct
# Commentaire : La population a augmenté de X % en un quart de siècle.

# 6. Exportation
write.csv2(tail(population_ma, 6), file = "Chap01/output/population_recente.csv", row.names = FALSE)
read.csv2("Chap01/output/population_recente.csv") # Vérification

# 7. Graphique
plot(population_ma$annee, population_ma$pop_M, 
     type = "l", 
     main = "Évolution de la population du Maroc", 
     xlab = "Année", 
     ylab = "Population (en millions)")

=======================
  # Exercice 7
=======================
  
  # 1. Importation et affichage
  pib_ma <- read.csv2("Chap01/data/maroc_pib_minimal.csv")
head(pib_ma)
tail(pib_ma)
summary(pib_ma)

# 2. Croissance moyenne
mean(pib_ma$crois_pib_pct)
# Interprétation : Sur la période 1990-2025, le PIB marocain a cru en moyenne de X % par an.

# 3. Pire et meilleure année
# Dans les résultats de summary(), repérez le 'Min.' et le 'Max.' de crois_pib_pct.
# Pour le faire informatiquement :
pib_ma$annee[which.min(pib_ma$crois_pib_pct)] # Pire année
pib_ma$annee[which.max(pib_ma$crois_pib_pct)] # Meilleure année

# 4. Doublement ou triplement du PIB par habitant
pib_hab_2000 <- pib_ma$pib_hab_usd[pib_ma$annee == 2000]
pib_hab_2025 <- pib_ma$pib_hab_usd[pib_ma$annee == 2025]
ratio_pib <- pib_hab_2025 / pib_hab_2000
ratio_pib
# Si le ratio est proche de 3, il a triplé (ce qui coïncide avec 4672.5 / 1499.1 = ~3.11 calculé à l'ex 1).

# 5. Export des 6 dernières années
write.csv2(tail(pib_ma, 6), file = "Chap01/output/pib_recent.csv", row.names = FALSE)

# 6. Histogramme
hist(pib_ma$crois_pib_pct, 
     main = "Histogramme de la croissance du PIB",
     xlab = "Croissance annuelle (%)")
# Sur l'histogramme, la barre la plus haute indique l'intervalle où se situent la plupart des années.
# Les années extrêmes (réponse Q3) se trouveront tout à fait à gauche (pire) et tout à fait à droite (meilleure).
