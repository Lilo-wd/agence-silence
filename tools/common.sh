#!/usr/bin/env bash
# Briques communes a toutes les pages du site Agence Silence.
set -e

# Racine du projet deduite de l'emplacement de ce fichier : le dossier peut
# etre deplace ou clone ailleurs sans que les generateurs n'ecrivent vers un
# ancien chemin (c'etait le cas quand ROOT etait code en dur).
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Nom de domaine retenu par Leo dans le questionnaire (septembre 2026).
# Pas encore achete : il etait libre au registre le 16 sept. 2026.
SITE="https://agence-silence.com"

# ------------------------------------------------------------------- NAP --
# Nom / adresse / telephone : strictement identiques partout (site, fiche
# Google Business Profile, Mariages.net, Instagram). Le telephone est ecrit
# comme Leo l'a demande, avec des points.
TEL_AFF="06.20.25.66.63"
TEL_URI="+33620256663"
MAIL="leomalhie@yahoo.fr"
RUE="53 impasse du Communal"
CP="31650"
VILLE="Lauzerville"
NOM_LEGAL="Léo Malhie"
SIRET_AFF="848 624 722 00015"

# ---------------------------------------------------------------- PREPROD --
# 1 = le site est en ligne mais invisible pour Google, avec un bandeau.
#
# Les coordonnees, tarifs et temoignages sont desormais reels. Le site reste
# ferme aux moteurs pour deux raisons :
#   - le domaine agence-silence.com n'est pas encore achete ; les balises
#     canoniques pointeraient vers une adresse qui ne repond pas ;
#   - les photos sont encore provisoires (et l'image du hero generee par IA).
# A passer a 0 une fois le domaine branche et les vraies photos en place.
PREPROD=${PREPROD:-1}

# ------------------------------------------------------- CACHE DES ASSETS --
# _headers sert /assets/* en `immutable, max-age=31536000`. Sans empreinte
# dans l'URL, un CSS ou un JS modifie n'atteint jamais les visiteurs deja
# venus. L'empreinte change des que le fichier change.
empreinte () {
  if [ -f "$1" ]; then md5sum "$1" | cut -c1-8; else echo "0"; fi
}
CSS_V=$(empreinte "$ROOT/assets/css/style.css")
JS_V=$(empreinte "$ROOT/assets/js/main.js")

if [ "$PREPROD" = "1" ]; then
  ROBOTS="noindex, nofollow"
  BANDEAU='<aside class="bandeau-apercu">
  <b>Aperçu</b>
  <span>Site en cours de finalisation&nbsp;: les photos sont encore provisoires.</span>
</aside>'
else
  ROBOTS="index, follow, max-image-preview:large, max-snippet:-1"
  BANDEAU=""
fi

# ================================================================ TARIFS ==
# Retour de Leo (sept. 2026) : les prix etaient disperses dans des phrases
# qui melangeaient durees, distances et montants (« 0,60 € du kilometre
# aller-retour au-dela de 50 km… »), et « 0,60 € » se lisait « 60 € ».
# Regle desormais : les tarifs ne s'ecrivent QUE dans ces blocs, une
# information par ligne (libelle a gauche, valeur a droite). Les autres
# pages y renvoient (/tarifs/) au lieu de recopier les chiffres.

read -r -d '' TARIF_MARIAGE <<'HTML' || true
<article class="tarif tarif--phare">
  <p class="tarif__nom">Mariage</p>
  <p class="tarif__prix">1&nbsp;600&nbsp;€</p>
  <p class="tarif__note">Forfait complet, hors déplacement.</p>
  <ul class="lignes">
    <li><span>Moments couverts</span><strong>Cocktail, dîner, soirée</strong></li>
    <li><span>Fin de soirée</span><strong>4&nbsp;h&nbsp;30</strong></li>
    <li><span>Son et lumière</span><strong>Inclus</strong></li>
    <li><span>Deux micros sans fil</span><strong>Inclus</strong></li>
    <li><span>Vidéoprojecteur et écran</span><strong>Inclus</strong></li>
  </ul>
  <a class="link-arrow" href="/prestations/dj-mariage/">La prestation mariage</a>
</article>
HTML

read -r -d '' TARIF_PRIVEE <<'HTML' || true
<article class="tarif">
  <p class="tarif__nom">Soirée privée</p>
  <span class="tarif__depuis">À partir de</span>
  <p class="tarif__prix">600&nbsp;€</p>
  <p class="tarif__note">Hors déplacement.</p>
  <ul class="lignes">
    <li><span>Occasions</span><strong>Anniversaire, fête de famille</strong></li>
    <li><span>Horaires</span><strong>De 20&nbsp;h à 2&nbsp;h</strong></li>
    <li><span>Nombre d’invités</span><strong>Aucun minimum</strong></li>
    <li><span>Son et lumière</span><strong>Inclus</strong></li>
  </ul>
  <a class="link-arrow" href="/prestations/dj-soiree-privee/">La prestation soirée privée</a>
</article>
HTML

read -r -d '' TARIF_ENTREPRISE <<'HTML' || true
<article class="tarif">
  <p class="tarif__nom">Entreprise</p>
  <span class="tarif__depuis">À partir de</span>
  <p class="tarif__prix">500&nbsp;€</p>
  <p class="tarif__note">Hors déplacement.</p>
  <ul class="lignes">
    <li><span>Formats</span><strong>Soirée, gala, séminaire</strong></li>
    <li><span>Conférence sonorisée</span><strong>Possible</strong></li>
    <li><span>Son et lumière</span><strong>Inclus</strong></li>
    <li><span>Micros sans fil</span><strong>Inclus</strong></li>
  </ul>
  <a class="link-arrow" href="/prestations/dj-entreprise/">La prestation entreprise</a>
</article>
HTML

read -r -d '' BLOC_DEPLACEMENT <<'HTML' || true
<div class="tableau-prix" id="deplacement">
  <p class="tarif__nom">Déplacement</p>
  <h3>Les frais de déplacement</h3>
  <p>Calculés depuis l’agence, à Lauzerville, près de Toulouse.</p>
  <ul class="lignes">
    <li><span>Jusqu’à 50&nbsp;km</span><strong>Offert</strong></li>
    <li><span>Au-delà de 50&nbsp;km</span><strong>0,60&nbsp;€ le kilomètre</strong></li>
    <li><span>Trajet compté</span><strong>Aller et retour</strong></li>
    <li><span>Plus d’1&nbsp;h&nbsp;20 de route</span><strong>Nuit de la veille à votre charge</strong></li>
    <li><span>Montant exact</span><strong>Écrit sur le devis</strong></li>
  </ul>
</div>
HTML

read -r -d '' BLOC_RESERVATION <<'HTML' || true
<div class="tableau-prix" id="reservation">
  <p class="tarif__nom">Réservation</p>
  <h3>Réserver et payer</h3>
  <p>Le prix affiché est le prix payé&nbsp;: pas de TVA en plus.</p>
  <ul class="lignes">
    <li><span>Pour bloquer la date</span><strong>Acompte de 30&nbsp;%</strong></li>
    <li><span>Le solde</span><strong>Une semaine avant</strong></li>
    <li><span>Moyens de paiement</span><strong>Tous acceptés</strong></li>
    <li><span>Changement de date</span><strong>Possible, même prix</strong></li>
    <li><span>Annulation</span><strong>Acompte non remboursé</strong></li>
  </ul>
</div>
HTML

read -r -d '' BLOC_OPTIONS <<'HTML' || true
<div class="tableau-prix" id="options">
  <p class="tarif__nom">Options</p>
  <h3>Les options mariage</h3>
  <p>À ajouter au forfait si vous le souhaitez. Leurs prix sont dans la brochure, envoyée avec votre devis.</p>
  <ul class="city-list" style="margin-top:1.5rem">
    <li><span>Cérémonie laïque</span></li>
    <li><span>Heures supplémentaires</span></li>
    <li><span>Photobooth</span></li>
    <li><span>Livre d’or audio</span></li>
    <li><span>Fumée lourde</span></li>
    <li><span>Feux de couleur</span></li>
    <li><span>Ciel étoilé</span></li>
    <li><span>Éclairage dynamique</span></li>
    <li><span>Saxophoniste ou pianiste</span></li>
  </ul>
  <p style="margin-top:1rem"><a class="link-arrow" href="/prestations/options-mariage/">Le détail des options</a></p>
</div>
HTML

# page_open <titre> <description> <chemin-canonique> <image-og>
page_open () {
local TITRE=$1 DESC=$2 CANON=$3 OGIMG=$4
cat <<HTML
<!doctype html>
<html lang="fr" class="no-js">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$TITRE</title>
<meta name="description" content="$DESC">
<link rel="canonical" href="$SITE$CANON">
<meta name="robots" content="$ROBOTS">
<meta name="author" content="Agence Silence">
<meta name="theme-color" content="#1A1A1A">

<meta property="og:type" content="website">
<meta property="og:locale" content="fr_FR">
<meta property="og:site_name" content="Agence Silence">
<meta property="og:title" content="$TITRE">
<meta property="og:description" content="$DESC">
<meta property="og:url" content="$SITE$CANON">
<meta property="og:image" content="$SITE/assets/img/$OGIMG">
<meta name="twitter:card" content="summary_large_image">

<script>document.documentElement.className=document.documentElement.className.replace('no-js','js');</script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="/assets/css/style.css?v=$CSS_V">
<link rel="stylesheet" media="print" onload="this.media='all'"
      href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;1,400&amp;family=Inter:wght@300;400;500&amp;display=swap">
<noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;1,400&amp;family=Inter:wght@300;400;500&amp;display=swap"></noscript>
<link rel="icon" href="/favicon.png" type="image/png" sizes="64x64">
<link rel="apple-touch-icon" href="/assets/img/apple-touch-icon.png">
HTML
}

# page_head_close : ferme <head>, ouvre <body> + header
page_head_close () {
cat <<HTML
</head>
<body>
<a class="skip-link" href="#contenu">Aller au contenu principal</a>

<header class="site-header">
  <div class="wrap site-header__inner">
    <!-- Verrou horizontal : icone + wordmark, extrait du logo fourni.
         Dimensions natives 430x120, affiche a 46 px de haut. -->
    <a class="brand" href="/" aria-label="Agence Silence, retour à l’accueil">
      <img src="/assets/img/logo.webp" width="430" height="120"
           alt="Agence Silence, DJ mariage et événementiel à Toulouse">
    </a>

    <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="nav-principal">
      <span></span><span class="visually-hidden">Ouvrir le menu</span>
    </button>

    <nav class="nav" id="nav-principal" aria-label="Navigation principale">
      <a href="/a-propos/">Le DJ</a>
      <a href="/prestations/">Prestations</a>
      <a href="/galerie/">Galerie</a>
      <a href="/temoignages/">Témoignages</a>
      <a href="/zone-intervention/">Zone d’intervention</a>
      <a href="/tarifs/">Tarifs</a>
      <a class="btn header-cta" href="/contact/">Vérifier ma date</a>
    </nav>
  </div>
</header>

<main id="contenu">
HTML
}

# breadcrumb "Libelle|/url" ...  (le dernier est la page courante)
breadcrumb () {
  local items=("$@") i=0 n=${#items[@]} label url
  echo '<nav class="breadcrumb" aria-label="Fil d’Ariane"><ol>'
  echo '<li><a href="/">Accueil</a></li>'
  for it in "${items[@]}"; do
    i=$((i+1))
    label=${it%%|*}; url=${it#*|}
    if [ $i -eq $n ]; then
      echo "<li aria-current=\"page\">$label</li>"
    else
      echo "<li><a href=\"$url\">$label</a></li>"
    fi
  done
  echo '</ol></nav>'
}

# schema_breadcrumb "Libelle|/url" ...
schema_breadcrumb () {
  local i=1 it label url
  local out='{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":['
  out="$out"'{"@type":"ListItem","position":1,"name":"Accueil","item":"'"$SITE"'/"}'
  for it in "$@"; do
    i=$((i+1))
    label=${it%%|*}; url=${it#*|}
    out="$out"',{"@type":"ListItem","position":'"$i"',"name":"'"$label"'","item":"'"$SITE$url"'"}'
  done
  echo "$out]}"
}

# bande_cta <titre> <paragraphe>
# Leo recommande de reserver 1 a 2 ans a l'avance : on affiche les deux
# saisons qui se reservent en ce moment.
bande_cta () {
cat <<HTML
<section class="section cta-band">
  <div class="wrap">
    <p class="eyebrow" style="justify-content:center">Réservations 2027 &middot; 2028</p>
    <h2>$1</h2>
    <p>$2</p>
    <div class="btn-row btn-row--center">
      <a class="btn btn--light" href="/contact/">Vérifier ma date</a>
      <a class="btn btn--outline-light" href="tel:$TEL_URI">$TEL_AFF</a>
    </div>
  </div>
</section>
HTML
}

page_close () {
cat <<HTML
</main>

<footer class="site-footer">
  <div class="wrap">
    <div class="footer-grid">
      <div class="footer-brand">
        <img src="/assets/img/logo-empile-blanc.webp" width="284" height="230"
             alt="Agence Silence, DJ mariage et événementiel à Toulouse" loading="lazy" decoding="async">
        <p>Agence de DJ événementiel en région toulousaine, fondée en 2019 par Léo Malhie. Mariages, événements d’entreprise et soirées privées.</p>
        <p style="display:flex;flex-wrap:wrap;gap:.4rem 1.4rem;margin-top:1.2rem">
          <a href="https://www.instagram.com/agencesilence/" target="_blank" rel="noopener">Instagram</a>
          <a href="https://www.mariages.net/musique-mariage/leo-malhie--e274959" target="_blank" rel="noopener">Avis Mariages.net</a>
        </p>
      </div>

      <div>
        <p class="footer-title">Prestations</p>
        <ul class="footer-list">
          <li><a href="/prestations/dj-mariage/">DJ mariage</a></li>
          <li><a href="/prestations/options-mariage/">Options mariage</a></li>
          <li><a href="/prestations/dj-entreprise/">DJ événement d’entreprise</a></li>
          <li><a href="/prestations/dj-soiree-privee/">DJ soirée privée</a></li>
          <li><a href="/tarifs/">Tarifs</a></li>
        </ul>
      </div>

      <div>
        <p class="footer-title">Où intervient l’agence</p>
        <ul class="footer-list">
          <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
          <li><a href="/dj-mariage-castres/">DJ mariage Castres</a></li>
          <li><a href="/zone-intervention/">Zone d’intervention</a></li>
        </ul>
      </div>

      <div>
        <p class="footer-title">Contact</p>
        <!-- NAP : nom / adresse / téléphone strictement identiques à la fiche Google Business Profile -->
        <address class="contact-block" style="font-size:.92rem;line-height:1.9;font-style:normal">
          <span style="color:#fff">Agence Silence</span><br>
          $RUE<br>$CP $VILLE<br>
          <a href="tel:$TEL_URI">$TEL_AFF</a><br>
          <a href="mailto:$MAIL">$MAIL</a>
        </address>
      </div>
    </div>

    <div class="footer-bottom">
      <p style="margin:0">&copy; <span data-annee>2026</span> Agence Silence &mdash; Léo Malhie, DJ mariage et événementiel en région toulousaine.</p>
      <nav aria-label="Liens de bas de page">
        <a href="/contact/">Contact</a>
        <a href="/faq/">FAQ</a>
        <a href="/blog/">Journal</a>
        <a href="/mentions-legales/">Mentions légales</a>
      </nav>
    </div>
  </div>
</footer>

$BANDEAU

<script src="/assets/js/main.js?v=$JS_V" defer></script>
</body>
</html>
HTML
}

# page_write <chemin-relatif>  (lit le HTML sur stdin)
page_write () {
  local dest="$ROOT/$1"
  mkdir -p "$(dirname "$dest")"
  cat > "$dest"
  echo "  ecrit  $1"
}
