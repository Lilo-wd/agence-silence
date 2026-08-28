#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# ville <slug> <ville> <titre> <desc> <h1> <intro> <img> <region> <corps-html>
ville () {
local SLUG=$1 VILLE_N=$2 TITRE=$3 DESC=$4 H1=$5 INTRO=$6 IMG=$7 REGION=$8 CORPS=$9
{
page_open "$TITRE" "$DESC" "/$SLUG/" "$IMG"
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
         alt="DJ mariage $VILLE_N — Léo, Agence Silence, en soirée de mariage à $VILLE_N">
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
      <p class="eyebrow">Aussi disponible</p>
      <h2>Les autres villes couvertes par l’Agence Silence</h2>
    </div>
    <ul class="city-list reveal" style="columns:2">
      <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
      <li><a href="/dj-mariage-bordeaux/">DJ mariage Bordeaux</a></li>
      <li><a href="/dj-mariage-montpellier/">DJ mariage Montpellier</a></li>
      <li><a href="/dj-mariage-paris/">DJ mariage Paris</a></li>
      <li><a href="/zone-intervention/">Toute la France</a></li>
      <li><a href="/prestations/dj-mariage/">La prestation mariage en détail</a></li>
    </ul>
  </div>
</section>
HTML
bande_cta "Votre mariage à $VILLE_N&nbsp;?" "Donnez-nous la date et le lieu de réception : nous confirmons la disponibilité sous 24 heures ouvrées, avec un devis déplacement inclus."
page_close
} | page_write "$SLUG/index.html"
}

# ============================================================== TOULOUSE ====
read -r -d '' C_TLS <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Sur place</p>
        <h2>Toulouse, c’est la maison</h2>
        <p>
          L’Agence Silence est basée à Toulouse. Ce n’est pas une mention de façade&nbsp;:
          la majorité des mariages de la saison se déroulent en Haute-Garonne, et le repérage
          d’un lieu à trente minutes de la ville se fait souvent dès la semaine du devis.
        </p>
        <p>
          Les domaines du Lauragais, les propriétés des coteaux au nord de la ville, les
          bastides le long de la Garonne et les grandes salles du centre&nbsp;: chacun de ces
          lieux a ses contraintes propres, du limiteur sonore à la puissance électrique
          disponible dans une grange rénovée.
        </p>
      </div>
      <div class="reveal">
        <h3 style="font-size:.95rem;font-family:var(--sans);font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40)">Secteurs desservis sans frais de déplacement</h3>
        <ul class="city-list" style="margin-top:1.5rem">
          <li><span>Toulouse centre et Capitole</span></li>
          <li><span>Blagnac, Colomiers, Tournefeuille</span></li>
          <li><span>Balma, L’Union, Saint-Jean</span></li>
          <li><span>Ramonville, Castanet, Escalquens</span></li>
          <li><span>Muret et le Volvestre</span></li>
          <li><span>Lauragais et Villefranche</span></li>
          <li><span>Grenade et la vallée de la Save</span></li>
          <li><span>Fronton et le nord toulousain</span></li>
        </ul>
        <p style="margin-top:1.5rem;font-size:.9rem;color:var(--ink-40)">
          Au-delà de 50&nbsp;km, le déplacement apparaît comme une ligne distincte et chiffrée du devis.
        </p>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Spécificités locales</p>
      <h2>Ce qu’il faut savoir pour un mariage en Haute-Garonne</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal">
        <h3>Le limiteur sonore</h3>
        <p>De nombreux domaines de la couronne toulousaine sont équipés d’un limiteur qui coupe l’alimentation au-delà d’un seuil. Nous relevons le modèle en amont et calibrons le système en conséquence&nbsp;: aucune coupure en pleine soirée.</p>
      </article>
      <article class="card reveal">
        <h3>Les soirées en extérieur</h3>
        <p>L’été toulousain permet de danser dehors jusqu’à tard, mais l’arrêté préfectoral et le voisinage imposent souvent un repli en intérieur à une heure précise. Ce basculement se prépare, il ne s’improvise pas.</p>
      </article>
      <article class="card reveal">
        <h3>Les granges et bâtiments anciens</h3>
        <p>La pierre et la charpente en bois créent des réverbérations difficiles. Le placement des enceintes compte plus que leur puissance&nbsp;: c’est l’objet du repérage.</p>
      </article>
    </div>
  </div>
</section>

<section class="section dark">
  <div class="wrap">
    <div class="section-head section-head--center reveal">
      <p class="eyebrow">Mariages toulousains</p>
      <h2>Ils se sont mariés près de Toulouse</h2>
    </div>
    <div class="grid grid--2">
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Notre domaine avait un limiteur redouté de tous les prestataires. Léo est venu le repérer un mois avant. Le jour J, pas une seule coupure.</p></blockquote>
        <figcaption><strong>Camille &amp; Antoine</strong>Mariage &middot; Lauragais, Haute-Garonne &middot; Juin 2025</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Nous cherchions un DJ toulousain qui ne fasse pas « animation ». Exactement ce que nous avons eu&nbsp;: discret, et redoutable sur la fin de soirée.</p></blockquote>
        <figcaption><strong>Léa &amp; Thomas</strong>Mariage &middot; Coteaux du nord toulousain &middot; Septembre 2025</figcaption>
      </figure>
    </div>
  </div>
</section>
HTML

ville "dj-mariage-toulouse" "Toulouse" \
 "DJ mariage Toulouse — Agence Silence, DJ Léo en Haute-Garonne" \
 "DJ mariage à Toulouse et en Haute-Garonne. Agence Silence sonorise cérémonies laïques, vins d’honneur et soirées dansantes dans les domaines de la couronne toulousaine. Devis sous 24 h." \
 "DJ mariage à Toulouse et en Haute-Garonne" \
 "Basé à Toulouse depuis 2015. Les domaines du Lauragais, les coteaux du nord et les bastides de la Garonne, Léo les connaît un par un — limiteurs sonores compris." \
 "ville-toulouse.svg" "Haute-Garonne" "$C_TLS"

# ============================================================== BORDEAUX ====
read -r -d '' C_BDX <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Gironde</p>
        <h2>Les mariages girondins, entre châteaux et Bassin</h2>
        <p>
          Deux heures et demie séparent Toulouse de Bordeaux. C’est la deuxième région
          la plus demandée de l’agence, portée par les mariages en propriété viticole
          du Médoc, de l’Entre-deux-Mers et du Libournais.
        </p>
        <p>
          Les chais et les orangeries sont des lieux magnifiques et acoustiquement
          exigeants&nbsp;: volumes hauts, surfaces dures, très peu d’absorption. Le repérage
          y est systématique, y compris pour une date unique.
        </p>
      </div>
      <div class="reveal">
        <h3 style="font-size:.95rem;font-family:var(--sans);font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40)">Secteurs couverts</h3>
        <ul class="city-list" style="margin-top:1.5rem">
          <li><span>Bordeaux et la métropole</span></li>
          <li><span>Médoc et Margaux</span></li>
          <li><span>Saint-Émilion et Libournais</span></li>
          <li><span>Entre-deux-Mers</span></li>
          <li><span>Bassin d’Arcachon et Cap-Ferret</span></li>
          <li><span>Sauternes et Graves</span></li>
        </ul>
        <p style="margin-top:1.5rem;font-size:.9rem;color:var(--ink-40)">
          Le déplacement et l’hébergement sont chiffrés dès le premier devis, sans variable cachée.
        </p>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Organisation</p>
      <h2>Un mariage à Bordeaux, préparé depuis Toulouse</h2>
      <p>La distance ne change rien à la méthode. Elle change simplement le calendrier.</p>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><p class="card__num">J-90</p><h3>Repérage groupé</h3><p>Le déplacement de repérage est regroupé avec d’autres dates girondines, ce qui allège la ligne « déplacement » de votre devis.</p></article>
      <article class="card reveal"><p class="card__num">J-30</p><h3>Point technique</h3><p>Échange avec le régisseur du château ou du domaine sur l’alimentation, les accès et l’heure limite de la musique amplifiée.</p></article>
      <article class="card reveal"><p class="card__num">J-1</p><h3>Arrivée la veille</h3><p>Au-delà de deux heures de route, Léo arrive la veille. Aucune prestation ne démarre après huit heures de conduite.</p></article>
    </div>
  </div>
</section>
HTML

ville "dj-mariage-bordeaux" "Bordeaux" \
 "DJ mariage Bordeaux et Gironde — Agence Silence" \
 "DJ mariage à Bordeaux et en Gironde : châteaux du Médoc, chais de Saint-Émilion, Bassin d’Arcachon. Repérage acoustique systématique, déplacement chiffré au devis." \
 "DJ mariage à Bordeaux et en Gironde" \
 "Châteaux du Médoc, chais du Libournais, orangeries de l’Entre-deux-Mers. Des lieux somptueux et acoustiquement redoutables, qui se préparent avant le jour J." \
 "ville-bordeaux.svg" "Gironde" "$C_BDX"

# =========================================================== MONTPELLIER ====
read -r -d '' C_MTP <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Hérault</p>
        <h2>Montpellier, les mas et la mer</h2>
        <p>
          Deux heures de Toulouse par l’autoroute des Deux-Mers. Montpellier et sa région
          concentrent un type de mariage très particulier&nbsp;: le mariage en extérieur,
          du début à la fin, sous les pins ou face à l’étang.
        </p>
        <p>
          C’est le contexte le plus exigeant pour un DJ. Sans murs, le son ne porte pas&nbsp;;
          avec du vent, il se déplace. La configuration se décide sur place, jamais depuis
          une photo.
        </p>
      </div>
      <div class="reveal">
        <h3 style="font-size:.95rem;font-family:var(--sans);font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40)">Secteurs couverts</h3>
        <ul class="city-list" style="margin-top:1.5rem">
          <li><span>Montpellier et sa métropole</span></li>
          <li><span>Pic Saint-Loup</span></li>
          <li><span>Sète et le bassin de Thau</span></li>
          <li><span>Béziers et le Biterrois</span></li>
          <li><span>Nîmes et la Camargue</span></li>
          <li><span>Uzès et le Gard</span></li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Mariages en extérieur</p>
      <h2>Trois règles pour une soirée en plein air réussie</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><h3>Doubler les points de diffusion</h3><p>En extérieur, une seule paire d’enceintes crée une zone forte devant et un vide derrière. Nous répartissons plusieurs points à faible volume plutôt qu’un seul poussé fort.</p></article>
      <article class="card reveal"><h3>Anticiper le vent et l’humidité</h3><p>Le matériel est bâché et surélevé, les câbles protégés. La rosée méditerranéenne de fin de nuit fait plus de dégâts qu’une averse.</p></article>
      <article class="card reveal"><h3>Connaître l’heure limite</h3><p>Les arrêtés municipaux de l’Hérault sont stricts sur la musique amplifiée en extérieur. Le repli en intérieur est prévu au déroulé, à l’heure près.</p></article>
    </div>
  </div>
</section>
HTML

ville "dj-mariage-montpellier" "Montpellier" \
 "DJ mariage Montpellier et Hérault — Agence Silence" \
 "DJ mariage à Montpellier et dans l’Hérault : mas, domaines du Pic Saint-Loup, mariages en extérieur face à l’étang. Sonorisation adaptée au plein air et aux arrêtés locaux." \
 "DJ mariage à Montpellier et dans l’Hérault" \
 "Mas du Pic Saint-Loup, domaines du bassin de Thau, soirées face à l’étang. La région du mariage en extérieur intégral — le format le plus exigeant qui soit pour un DJ." \
 "ville-montpellier.svg" "Hérault" "$C_MTP"

# ================================================================= PARIS ====
read -r -d '' C_PAR <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Île-de-France</p>
        <h2>Monter à Paris, un mariage à la fois</h2>
        <p>
          Chaque saison, une poignée de couples franciliens fait appel à l’Agence Silence.
          Souvent des Toulousains installés à Paris, parfois des mariés qui ont dansé
          à un mariage du Sud-Ouest et ont voulu le même DJ.
        </p>
        <p>
          Les prestations parisiennes se concentrent sur les châteaux et orangeries de la
          couronne&nbsp;: Yvelines, Essonne, Seine-et-Marne, Oise. Léo monte la veille,
          systématiquement.
        </p>
      </div>
      <div class="reveal">
        <h3 style="font-size:.95rem;font-family:var(--sans);font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40)">Secteurs couverts</h3>
        <ul class="city-list" style="margin-top:1.5rem">
          <li><span>Paris intra-muros</span></li>
          <li><span>Yvelines et Rambouillet</span></li>
          <li><span>Essonne et Chevreuse</span></li>
          <li><span>Seine-et-Marne et Fontainebleau</span></li>
          <li><span>Val-d’Oise et Chantilly</span></li>
          <li><span>Oise et Compiègne</span></li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Logistique</p>
      <h2>Ce qu’implique une prestation parisienne</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><h3>Déplacement forfaitaire</h3><p>Une ligne unique au devis couvrant le trajet aller-retour, l’hébergement de la veille et le transport du matériel. Aucun ajustement après signature.</p></article>
      <article class="card reveal"><h3>Rendez-vous en visio</h3><p>La préparation se fait à distance, en deux ou trois échanges d’une heure. Le repérage du lieu se fait la veille de l’événement, en amont de l’installation.</p></article>
      <article class="card reveal"><h3>Matériel transporté</h3><p>L’intégralité du système voyage avec Léo, secours compris. Aucune location sur place, donc aucune surprise sur la qualité du matériel.</p></article>
    </div>
  </div>
</section>
HTML

ville "dj-mariage-paris" "Paris" \
 "DJ mariage Paris et Île-de-France — Agence Silence" \
 "DJ mariage à Paris et en Île-de-France : châteaux des Yvelines, orangeries de Seine-et-Marne, domaines de l’Oise. Déplacement forfaitaire, matériel transporté, arrivée la veille." \
 "DJ mariage à Paris et en Île-de-France" \
 "Châteaux des Yvelines, orangeries de Seine-et-Marne, domaines de l’Oise. Léo monte la veille avec l’intégralité du système, secours compris." \
 "ville-paris.svg" "Île-de-France" "$C_PAR"
