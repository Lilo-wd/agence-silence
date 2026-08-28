#!/usr/bin/env bash
# Briques communes a toutes les pages du site Agence Silence.
set -e

ROOT="C:/Users/lilos/OneDrive/Documents/agence-silence"
SITE="https://agence-silence.fr"

TEL_AFF="06 12 34 56 78"
TEL_URI="+33612345678"
MAIL="contact@agence-silence.fr"
RUE="12 rue de la Pomme"
CP="31000"
VILLE="Toulouse"

# ---------------------------------------------------------------- PREPROD --
# 1 = le site est en ligne mais invisible pour Google, et affiche un bandeau
#     d'avertissement. C'est l'etat a garder tant que les temoignages, le
#     telephone et l'adresse sont des exemples.
#
# Pourquoi ce garde-fou : laisser Google indexer un NAP (nom / adresse /
# telephone) faux, puis le corriger plus tard, cree une incoherence entre
# l'index et la fiche Google Business Profile. C'est precisement le signal
# sur lequel repose tout le referencement local du projet — l'abimer des le
# depart coute plus cher que d'attendre quelques semaines.
#
# A passer a 0 le jour ou le contenu reel remplace les exemples, puis
# relancer la generation (voir README §4).
PREPROD=${PREPROD:-1}

if [ "$PREPROD" = "1" ]; then
  ROBOTS="noindex, nofollow"
  BANDEAU='<aside class="bandeau-apercu">
  <b>Aperçu</b>
  <span>Site en cours de construction. Les photos, témoignages, tarifs et coordonnées sont des exemples provisoires&nbsp;: aucun n’est réel.</span>
</aside>'
else
  ROBOTS="index, follow, max-image-preview:large, max-snippet:-1"
  BANDEAU=""
fi

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
<link rel="stylesheet" href="/assets/css/style.css">
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
         Dimensions natives 430x120, affiche a 46 px de haut (2,6x pour les
         ecrans haute densite). Fichier maitre : tools/logo-source/ -->
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
      <a href="/blog/">Journal</a>
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
bande_cta () {
cat <<HTML
<section class="section cta-band">
  <div class="wrap">
    <p class="eyebrow" style="justify-content:center">Disponibilités 2026 &middot; 2027</p>
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
        <!-- Version empilee, parties noires passees en blanc pour le fond sombre.
             Le violet est conserve : 4,8:1 sur #1A1A1A, conforme AA. -->
        <img src="/assets/img/logo-empile-blanc.webp" width="284" height="230"
             alt="Agence Silence, DJ mariage et événementiel à Toulouse" loading="lazy" decoding="async">
        <p>DJ événementiel à Toulouse. Mariages, événements d’entreprise et soirées privées, partout en France.</p>
      </div>

      <div>
        <p class="footer-title">Prestations</p>
        <ul class="footer-list">
          <li><a href="/prestations/dj-mariage/">DJ mariage</a></li>
          <li><a href="/prestations/dj-entreprise/">DJ événement d’entreprise</a></li>
          <li><a href="/prestations/dj-soiree-privee/">DJ soirée privée</a></li>
          <li><a href="/prestations/">Toutes les prestations</a></li>
        </ul>
      </div>

      <div>
        <p class="footer-title">Où intervient Léo</p>
        <ul class="footer-list">
          <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
          <li><a href="/dj-mariage-bordeaux/">DJ mariage Bordeaux</a></li>
          <li><a href="/dj-mariage-montpellier/">DJ mariage Montpellier</a></li>
          <li><a href="/dj-mariage-paris/">DJ mariage Paris</a></li>
          <li><a href="/zone-intervention/">Toute la France</a></li>
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
      <p style="margin:0">&copy; <span data-annee>2026</span> Agence Silence &mdash; DJ mariage et événementiel, Toulouse.</p>
      <nav aria-label="Liens de bas de page">
        <a href="/contact/">Contact</a>
        <a href="/faq/">FAQ</a>
        <a href="/mentions-legales/">Mentions légales</a>
      </nav>
    </div>
  </div>
</footer>

$BANDEAU

<script src="/assets/js/main.js" defer></script>
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
