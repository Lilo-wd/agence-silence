#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# Pages villes : uniquement les secteurs ou l'agence joue reellement, d'apres
# le questionnaire de Leo (sept. 2026) : Toulouse, Castres, Ramonville en tete
# des demandes ; mariages en Haute-Garonne, dans le Tarn et l'Aude.
# Les anciennes pages Bordeaux, Montpellier et Paris ont ete retirees : Leo n'y
# a jamais officie, elles contenaient des affirmations fausses. Redirections
# 301 dans netlify.toml.

# ville <slug> <ville> <titre> <desc> <h1> <intro> <img> <departement> <corps-html>
ville () {
local SLUG=$1 VILLE_N=$2 TITRE=$3 DESC=$4 H1=$5 INTRO=$6 IMG=$7 REGION=$8 CORPS=$9
{
page_open "$TITRE" "$DESC" "/$SLUG/" "og-agence-silence.jpg"
cat <<JSON
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "DJ mariage $VILLE_N",
  "serviceType": "DJ mariage",
  "url": "$SITE/$SLUG/",
  "description": "$DESC",
  "provider": {
    "@type": "LocalBusiness",
    "@id": "$SITE/#organisation",
    "name": "Agence Silence",
    "telephone": "$TEL_URI",
    "email": "$MAIL",
    "url": "$SITE/",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "$RUE",
      "addressLocality": "$VILLE",
      "postalCode": "$CP",
      "addressRegion": "Occitanie",
      "addressCountry": "FR"
    }
  },
  "offers": { "@type": "Offer", "price": "1600", "priceCurrency": "EUR" },
  "areaServed": { "@type": "City", "name": "$VILLE_N", "containedInPlace": { "@type": "AdministrativeArea", "name": "$REGION" } }
}
</script>
JSON
echo "<script type=\"application/ld+json\">$(schema_breadcrumb "Zone d’intervention|/zone-intervention/" "DJ mariage $VILLE_N|/$SLUG/")</script>"
page_head_close
cat <<HTML
<section class="hero hero--clair" style="min-height:min(68svh,600px)">
  <div class="hero__media">
    <img src="/assets/img/$IMG" width="1800" height="1000" fetchpriority="high" decoding="async"
         alt="DJ mariage $VILLE_N — soirée de mariage dans le secteur de $VILLE_N">
  </div>
  <div class="hero__inner">
    <p class="eyebrow">Agence Silence &middot; $REGION</p>
    <h1>$H1</h1>
    <p class="hero__lead">$INTRO</p>
    <div class="btn-row">
      <a class="btn" href="/contact/">Vérifier ma date à $VILLE_N</a>
      <a class="btn btn--ghost" href="tel:$TEL_URI">$TEL_AFF</a>
    </div>
  </div>
</section>

<div class="wrap" style="padding-top:2rem">
$(breadcrumb "Zone d’intervention|/zone-intervention/" "DJ mariage $VILLE_N|/$SLUG/")
</div>

$CORPS

<section class="section section--ecru-deep">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">À lire aussi</p>
      <h2>La prestation en détail</h2>
    </div>
    <ul class="city-list reveal" style="columns:2">
      <li><a href="/tarifs/">Tous les tarifs</a></li>
      <li><a href="/prestations/options-mariage/">Les options mariage</a></li>
      <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
      <li><a href="/dj-mariage-castres/">DJ mariage Castres</a></li>
      <li><a href="/zone-intervention/">Zone d’intervention</a></li>
      <li><a href="/temoignages/">Les avis des mariés</a></li>
    </ul>
  </div>
</section>
HTML
bande_cta "Votre mariage à $VILLE_N&nbsp;?" "Indiquez-nous la date et le lieu. Vous avez une réponse sous 24 heures, avec un devis complet."
page_close
} | page_write "$SLUG/index.html"
}

# Encadre tarif des pages villes : blocs communs de common.sh
FORFAIT="<div class=\"tarifs\" style=\"grid-template-columns:1fr\">
$TARIF_MARIAGE
$BLOC_DEPLACEMENT
</div>"

# ============================================================== TOULOUSE ====
read -r -d '' C_TLS <<HTML || true
<section class="section section--white">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <p class="eyebrow">Sur place</p>
        <h2>La région toulousaine, c’est la maison</h2>
        <p>
          L’agence est installée à Lauzerville, à quelques kilomètres de Toulouse. Une
          centaine de mariages y ont été animés, et Toulouse comme Ramonville font partie
          des secteurs qui génèrent le plus de demandes.
        </p>
        <p>
          Domaines, châteaux, chais&nbsp;: l’équipe a joué dans tous les types de lieux de
          la région, et revient régulièrement au Domaine de Preissac à Castelmaurou comme
          au Domaine de Montjoie à Ramonville-Saint-Agne.
        </p>
        <p>
          Beaucoup de salles limitent le volume sonore. Cette limite est toujours respectée.
        </p>
        <p>
          Un détail qui compte&nbsp;: éteindre les lumières du domaine au bon moment.
          L’éclairage de la soirée prend alors toute sa place.
        </p>
      </div>
      <div class="reveal">
$FORFAIT
      </div>
    </div>
  </div>
</section>

<section class="section dark">
  <div class="wrap">
    <div class="section-head section-head--center reveal">
      <p class="eyebrow">Avis Mariages.net</p>
      <h2>Ce que disent les mariés</h2>
    </div>
    <div class="grid grid--2">
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Je voulais absolument éviter les DJs qui enchaînent animations lourdes et musiques banales&nbsp;: je cherchais un vrai DJ capable de créer une ambiance et de faire danser tout le monde. Pari réussi&nbsp;!</p></blockquote>
        <figcaption><strong>Margaux</strong>Mariage &middot; Septembre 2025</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Très discret et à l’écoute, nous avons passé la meilleure soirée de notre vie…</p></blockquote>
        <figcaption><strong>Emilie et Raphaël</strong>Mariage &middot; Mai 2026</figcaption>
      </figure>
    </div>
  </div>
</section>
HTML

ville "dj-mariage-toulouse" "Toulouse" \
 "DJ mariage Toulouse et Haute-Garonne — Agence Silence" \
 "DJ mariage à Toulouse : une centaine de mariages dans les domaines, châteaux et chais de la région. Forfait cocktail, dîner et soirée à 1 600 €. Déplacement offert jusqu’à 50 km." \
 "DJ mariage à Toulouse et en Haute-Garonne" \
 "Une centaine de mariages dans la région toulousaine, dans les domaines, les châteaux et les chais. L’agence est installée à Lauzerville, aux portes de Toulouse." \
 "ville-toulouse.svg" "Haute-Garonne" "$C_TLS"

# =============================================================== CASTRES ====
read -r -d '' C_CAS <<HTML || true
<section class="section section--white">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <p class="eyebrow">Tarn</p>
        <h2>Castres, l’un des secteurs les plus demandés</h2>
        <p>
          Avec Toulouse et Ramonville, Castres fait partie des trois secteurs où l’Agence
          Silence reçoit le plus de demandes de mariage. L’équipe a animé des mariages dans
          tout le Tarn.
        </p>
        <p>
          Castres est à environ une heure de route de l’agence.
          Le forfait et les options sont les mêmes qu’à Toulouse.
        </p>
        <p>
          Selon votre lieu, des frais de déplacement peuvent s’ajouter.
          Ils sont détaillés ci-contre et écrits sur votre devis.
        </p>
      </div>
      <div class="reveal">
$FORFAIT
      </div>
    </div>
  </div>
</section>

<section class="section dark">
  <div class="wrap">
    <div class="section-head section-head--center reveal">
      <p class="eyebrow">Avis Mariages.net</p>
      <h2>Ce que disent les mariés</h2>
    </div>
    <div class="grid grid--2">
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>La piste de danse est restée full jusqu’au petit matin, avec des convives plus déchainés les uns que les autres.</p></blockquote>
        <figcaption><strong>Charline et Gilles</strong>Mariage &middot; Octobre 2025</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>L’ambiance de la soirée était au rendez-vous, un grand MERCI à eux.</p></blockquote>
        <figcaption><strong>Mathilde</strong>Mariage &middot; Juin 2026</figcaption>
      </figure>
    </div>
  </div>
</section>
HTML

ville "dj-mariage-castres" "Castres" \
 "DJ mariage Castres et Tarn — Agence Silence" \
 "DJ mariage à Castres et dans le Tarn : l’un des secteurs les plus demandés de l’Agence Silence. Forfait cocktail, dîner et soirée à 1 600 €, son et lumière compris." \
 "DJ mariage à Castres et dans le Tarn" \
 "Avec Toulouse et Ramonville, Castres fait partie des secteurs où l’Agence Silence reçoit le plus de demandes de mariage." \
 "ville-castres.svg" "Tarn" "$C_CAS"
