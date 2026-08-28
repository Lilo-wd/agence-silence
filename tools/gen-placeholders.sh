#!/usr/bin/env bash
# Genere des visuels d'attente SVG sobres pour Agence Silence.
# A supprimer / remplacer par les vraies photos de DJ Leo.
set -e
OUT="C:/Users/lilos/OneDrive/Documents/agence-silence/assets/img"
mkdir -p "$OUT"

# make <fichier> <largeur> <hauteur> <couleur1> <couleur2> <couleur3> <opacite-grain>
make () {
  local f=$1 w=$2 h=$3 c1=$4 c2=$5 c3=$6 g=$7
  cat > "$OUT/$f" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $w $h" width="$w" height="$h" role="img" aria-hidden="true">
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="$c1"/>
      <stop offset="52%" stop-color="$c2"/>
      <stop offset="100%" stop-color="$c3"/>
    </linearGradient>
    <radialGradient id="l" cx="32%" cy="24%" r="72%">
      <stop offset="0%" stop-color="#FFFFFF" stop-opacity=".38"/>
      <stop offset="100%" stop-color="#FFFFFF" stop-opacity="0"/>
    </radialGradient>
    <filter id="n" x="0" y="0" width="100%" height="100%">
      <feTurbulence type="fractalNoise" baseFrequency="0.9" numOctaves="3" stitchTiles="stitch"/>
      <feColorMatrix type="saturate" values="0"/>
    </filter>
  </defs>
  <rect width="$w" height="$h" fill="url(#g)"/>
  <rect width="$w" height="$h" fill="url(#l)"/>
  <rect width="$w" height="$h" filter="url(#n)" opacity="$g"/>
</svg>
SVG
}

# --- Hero pleine page (sombre, ambiance fin de soiree elegante) ---
make hero-mariage-toulouse.svg 2000 1250 "#F7F2EA" "#E6DEEE" "#C9C1DF" ".07"
make hero-mariage.svg           2000 1250 "#F5F0E8" "#E3DBEC" "#C5BDDB" ".07"
make hero-corporate.svg         2000 1250 "#F3F2F0" "#DFDDEA" "#C2C0D8" ".07"

# --- Villes (une nuance par ville pour differencier les pages) ---
make ville-toulouse.svg    1800 1000 "#F6F1E9" "#E5DCEF" "#C6BDE0" ".07"
make ville-bordeaux.svg    1800 1000 "#F4F0EA" "#E2DCEB" "#C2BBD9" ".07"
make ville-montpellier.svg 1800 1000 "#F3F2EC" "#DEDFEE" "#BDBEDD" ".07"
make ville-paris.svg       1800 1000 "#F2F1EC" "#DFDCEC" "#BFBBD8" ".07"
make ville-lyon.svg        1800 1000 "#F5F1EB" "#E4DDEE" "#C4BCDD" ".07"

# --- Prestations (clair, lumiere naturelle) ---
make prestation-mariage.svg   1400 1050 "#F6F1EA" "#E4DCEF" "#CFC8E6" ".07"
make prestation-corporate.svg 1400 1050 "#F2F1F0" "#DEDCE8" "#C6C4DC" ".07"
make prestation-privee.svg    1400 1050 "#F7F2EC" "#E8DFE6" "#D3C9DE" ".07"

# --- Portrait de Leo ---
make leo-portrait.svg 1100 1375 "#EFE9E1" "#DCD5E4" "#BEB6D2" ".08"

# --- Galerie : 8 portraits + 2 paysages ---
make galerie-01.svg  900 1200 "#EDE7DF" "#D8D2E6" "#B9B2D0" ".08"
make galerie-02.svg  900 1200 "#2F2B3A" "#544D70" "#1A1822" ".12"
make galerie-03.svg  900 1200 "#F1ECE4" "#E0DAE8" "#C4BDD8" ".08"
make galerie-04.svg  900 1200 "#332F3D" "#5F587C" "#1C1A24" ".12"
make galerie-05.svg  900 1200 "#F4EFE7" "#DDD6E9" "#BEB7D4" ".08"
make galerie-06.svg  900 1200 "#2C2937" "#4E4869" "#171620" ".12"
make galerie-07.svg  900 1200 "#F0EBE3" "#DBD4E5" "#BAB3CF" ".08"
make galerie-08.svg  900 1200 "#302C3B" "#585073" "#1A1823" ".12"
make galerie-09.svg 1400  933 "#F2EDE5" "#DFD8EA" "#C0B9D5" ".08"
make galerie-10.svg 1400  933 "#2E2A39" "#524B6E" "#181721" ".12"

# --- Blog ---
make blog-choisir-dj.svg     1400 933 "#F3EEE6" "#DED7E9" "#C1BAD6" ".08"
make blog-tendances-2027.svg 1400 933 "#EFEAE3" "#DAD3E7" "#BAB3D1" ".08"
make blog-budget-dj.svg      1400 933 "#F1EDE8" "#DCD6E6" "#BEB8D3" ".08"

ls -1 "$OUT" | wc -l
