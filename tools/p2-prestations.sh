#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# ============================================================== A PROPOS ====
{
page_open \
 "DJ Léo, DJ événementiel à Toulouse — Agence Silence" \
 "Qui est Léo, le DJ derrière Agence Silence : dix ans de mariages, une approche sobre du métier, un parti pris assumé de ne faire ni club ni bar. Basé à Toulouse." \
 "/a-propos/" "leo-portrait.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Le DJ|/a-propos/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Le DJ|/a-propos/"
cat <<'HTML'
    <p class="eyebrow">Le DJ</p>
    <h1>Léo, DJ événementiel à Toulouse depuis 2015</h1>
    <p class="lead">
      Dix ans, plus de cent cinquante mariages, et une conviction qui n’a pas bougé :
      un bon DJ ne se remarque pas, il se ressent.
    </p>
  </div>
</section>

<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <figure class="reveal" style="margin:0">
        <img src="/assets/img/leo-portrait.svg" loading="lazy" decoding="async" width="1100" height="1375"
             alt="Portrait de Léo, DJ mariage Toulouse, fondateur de l’Agence Silence">
      </figure>
      <div class="reveal">
        <h2>Un parcours, pas une posture</h2>
        <p>
          Léo commence la musique à quinze ans, en autodidacte, sur un contrôleur d’occasion.
          Les premières soirées sont des anniversaires de lycée, puis des associations
          étudiantes toulousaines. En 2015, un premier mariage arrive par hasard&nbsp;: une amie
          dont le DJ s’était désisté trois semaines avant la date.
        </p>
        <p>
          Ce soir-là, il comprend que le mariage est un métier à part entière. Rien à voir avec
          une soirée où tout le monde vient déjà pour danser. Il faut réunir quatre-vingts
          personnes qui ne se connaissent pas, gérer trois générations, tenir un déroulé précis
          et savoir se taire au bon moment.
        </p>
        <h2>Ni club, ni bar. C’est un choix.</h2>
        <p>
          Agence Silence ne prend aucune résidence en club ni en bar. Ce n’est pas un manque
          d’expérience&nbsp;: c’est un arbitrage. Un DJ de club travaille pour une foule anonyme
          et un volume constant. Un DJ de mariage travaille pour <em>vos</em> invités,
          avec leurs prénoms, leurs surnoms et leur chanson.
        </p>
        <p>
          Concentrer l’activité sur les mariages, les événements d’entreprise et les soirées
          privées permet de préparer sérieusement chaque date, plutôt que d’en enchaîner trois
          par week-end.
        </p>
      </div>
    </div>
  </div>
</section>

<section class="section section--ecru-deep">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Le matériel</p>
      <h2>Du son de sonorisation, pas de la hi-fi poussée à bout</h2>
      <p>
        L’essentiel du budget matériel part dans les enceintes et les caissons.
        C’est ce que vos invités entendent&nbsp;; le reste n’est que confort de travail.
      </p>
    </div>
    <div class="grid grid--3">
      <article class="card reveal">
        <p class="card__num">Son</p>
        <h3>Système line-array compact</h3>
        <p>Deux à six enceintes actives selon la taille de la salle, caissons de basses dédiés, réglage au sonomètre à l’installation pour rester dans les limites légales sans étouffer la fête.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Lumière</p>
        <h3>Éclairage architectural</h3>
        <p>Des projecteurs LED chauds qui mettent en valeur la pierre, la charpente ou les arbres. Aucun laser, aucun stroboscope, sauf demande explicite.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Secours</p>
        <h3>Doublon systématique</h3>
        <p>Contrôleur, table de mixage, ordinateur, alimentation et câblage en double sur chaque prestation. Le basculement prend moins de deux minutes.</p>
      </article>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="stat-row reveal">
      <div class="stat"><span class="stat__value">150+</span><span class="stat__label">Mariages</span></div>
      <div class="stat"><span class="stat__value">10</span><span class="stat__label">Ans d’activité</span></div>
      <div class="stat"><span class="stat__value">4.9</span><span class="stat__label">Note moyenne</span></div>
      <div class="stat"><span class="stat__value">100 %</span><span class="stat__label">Dates honorées</span></div>
    </div>
  </div>
</section>
HTML
bande_cta "Parlons de votre soirée" "Un échange d’une heure suffit pour savoir si l’on se comprend. Sans engagement, et sans commercial au téléphone."
page_close
} | page_write "a-propos/index.html"


# ========================================================= PRESTATIONS HUB ==
{
page_open \
 "Prestations DJ à Toulouse : mariage, entreprise, privé" \
 "Les trois prestations d’Agence Silence : DJ mariage, DJ événement d’entreprise et DJ soirée privée. Sonorisation, éclairage et préparation sur mesure, au départ de Toulouse." \
 "/prestations/" "prestation-mariage.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Prestations|/prestations/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Prestations|/prestations/"
cat <<'HTML'
    <p class="eyebrow">Prestations</p>
    <h1>Prestations DJ à Toulouse : mariage, entreprise, soirée privée</h1>
    <p class="lead">
      Trois contextes différents, une seule méthode de travail : comprendre le déroulé
      avant de choisir la musique.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="grid grid--3">
      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-mariage.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ mariage Toulouse — sonorisation et éclairage d’une soirée de mariage par Agence Silence">
        </div>
        <div class="service-card__body">
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.75rem">DJ mariage</h2>
          <p>De la cérémonie laïque au dernier morceau. L’activité principale de l’agence, quasi exclusive de mai à septembre.</p>
          <ul>
            <li>Cérémonie laïque et vin d’honneur</li>
            <li>Dîner et animations</li>
            <li>Ouverture de bal, soirée dansante</li>
            <li>Éclairage d’ambiance inclus</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-mariage/">Voir le détail</a>
        </div>
      </article>

      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-corporate.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ événement d’entreprise Toulouse — soirée de gala sonorisée par Agence Silence">
        </div>
        <div class="service-card__body">
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.75rem">DJ événement d’entreprise</h2>
          <p>Séminaires, galas, lancements produit, soirées de fin d’année. Devis, facture et assurance en règle.</p>
          <ul>
            <li>Sonorisation de plénière et keynote</li>
            <li>Micros HF et régie son</li>
            <li>Cocktail, remise de prix, dîner</li>
            <li>Soirée dansante de clôture</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-entreprise/">Voir le détail</a>
        </div>
      </article>

      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-privee.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ soirée privée Toulouse — anniversaire sonorisé par Agence Silence">
        </div>
        <div class="service-card__body">
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.75rem">DJ soirée privée</h2>
          <p>Anniversaires, fiançailles, fêtes de famille, soirées en propriété. Format allégé possible.</p>
          <ul>
            <li>Anniversaires et fiançailles</li>
            <li>Fêtes de famille, retours de noces</li>
            <li>Soirées en villa ou en jardin</li>
            <li>Formule courte 4&nbsp;h disponible</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-soiree-privee/">Voir le détail</a>
        </div>
      </article>
    </div>
  </div>
</section>

<section class="section section--white">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Ce qui est toujours compris</p>
      <h2>Le socle commun à toutes les prestations</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><h3>Rendez-vous de préparation</h3><p>Un à trois échanges selon le format, sur place ou en visio, pour construire le déroulé et la sélection musicale.</p></article>
      <article class="card reveal"><h3>Repérage du lieu</h3><p>Prise de contact avec le lieu de réception : contraintes acoustiques, limiteur sonore, accès, alimentation électrique.</p></article>
      <article class="card reveal"><h3>Installation en amont</h3><p>Le matériel est monté et testé avant l’arrivée des invités. Aucun réglage ne se fait pendant votre événement.</p></article>
      <article class="card reveal"><h3>Matériel de secours</h3><p>Doublon des éléments critiques sur chaque date, sans supplément.</p></article>
      <article class="card reveal"><h3>Assurance RC professionnelle</h3><p>Attestation fournie sur simple demande, exigée par la plupart des domaines et des lieux de réception.</p></article>
      <article class="card reveal"><h3>Devis détaillé, prix ferme</h3><p>Chaque ligne est chiffrée, déplacement inclus. Le montant du devis est celui de la facture.</p></article>
    </div>
  </div>
</section>
HTML
bande_cta "Quelle prestation pour votre événement&nbsp;?" "Décrivez-nous la date, le lieu et le nombre d’invités : nous revenons vers vous avec la formule adaptée et son prix."
page_close
} | page_write "prestations/index.html"


# ================================================ PAGES PRESTATION DETAIL ==
# presta <slug> <titre-page> <description> <h1> <intro> <img> <nom-service> <bloc-html>
presta () {
local SLUG=$1 TITRE=$2 DESC=$3 H1=$4 INTRO=$5 IMG=$6 SERVICE=$7 CORPS=$8 LIBELLE=$9
{
page_open "$TITRE" "$DESC" "/prestations/$SLUG/" "$IMG"
cat <<JSON
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "$SERVICE",
  "serviceType": "$SERVICE",
  "url": "$SITE/prestations/$SLUG/",
  "description": "$DESC",
  "provider": {
    "@type": "LocalBusiness",
    "name": "Agence Silence",
    "telephone": "$TEL_URI",
    "email": "$MAIL",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "$RUE",
      "addressLocality": "$VILLE",
      "postalCode": "$CP",
      "addressCountry": "FR"
    }
  },
  "areaServed": [
    { "@type": "City", "name": "Toulouse" },
    { "@type": "Country", "name": "France" }
  ],
  "audience": { "@type": "Audience", "audienceType": "Particuliers et entreprises" }
}
</script>
JSON
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Prestations|/prestations/' "$LIBELLE|/prestations/$SLUG/")</script>"
page_head_close
cat <<HTML
<section class="page-hero">
  <div class="wrap">
$(breadcrumb "Prestations|/prestations/" "$LIBELLE|/prestations/$SLUG/")
    <p class="eyebrow">Prestation</p>
    <h1>$H1</h1>
    <p class="lead">$INTRO</p>
    <div class="btn-row">
      <a class="btn" href="/contact/">Vérifier ma date</a>
      <a class="btn btn--ghost" href="/temoignages/">Lire les témoignages</a>
    </div>
  </div>
</section>
$CORPS
HTML
bande_cta "Un devis pour votre événement" "Réponse sous 24 heures ouvrées, avec la disponibilité de la date et une proposition chiffrée détaillée."
page_close
} | page_write "prestations/$SLUG/index.html"
}

# ------------------------------------------------------------- DJ MARIAGE --
read -r -d '' CORPS_MARIAGE <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Le déroulé</p>
        <h2>Une journée de mariage, heure par heure</h2>
        <p>
          La musique d’un mariage n’est pas une playlist de huit heures. C’est une succession
          de moments qui n’ont ni le même volume, ni le même rôle, ni le même public.
        </p>
        <p>
          Le déroulé ci-contre est celui que nous construisons avec vous lors du rendez-vous
          de préparation. Il sert de référence commune à tous vos prestataires le jour J.
        </p>
      </div>
      <div class="reveal">
        <div class="faq" style="border-top-color:var(--line)">
          <details open>
            <summary>Cérémonie laïque</summary>
            <div class="faq__answer"><p>Sonorisation discrète en extérieur, micros HF pour l’officiant et les témoins, entrées et sorties musicales calées au signal. Le matériel est monté avant l’arrivée des invités.</p></div>
          </details>
          <details>
            <summary>Vin d’honneur et cocktail</summary>
            <div class="faq__answer"><p>Un volume qui laisse parler. Une sélection instrumentale ou soul, suffisamment présente pour installer une ambiance, assez basse pour que vos invités se rencontrent.</p></div>
          </details>
          <details>
            <summary>Dîner et animations</summary>
            <div class="faq__answer"><p>Gestion des micros pour les discours et les surprises des témoins, coordination avec le traiteur pour le rythme des services, et montée progressive vers la soirée.</p></div>
          </details>
          <details>
            <summary>Ouverture de bal</summary>
            <div class="faq__answer"><p>Montage de votre morceau si vous avez travaillé une chorégraphie, ou choix d’une version adaptée à la durée que vous souhaitez tenir. Répétition possible en amont.</p></div>
          </details>
          <details>
            <summary>Soirée dansante</summary>
            <div class="faq__answer"><p>C’est là que se joue la réputation d’un DJ. Lecture de la salle en continu, alternance des générations, et une fin de soirée tenue jusqu’au dernier morceau.</p></div>
          </details>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Formules</p>
      <h2>Trois formules de DJ mariage</h2>
      <p>
        Les montants ci-dessous sont indicatifs, TTC, pour un mariage dans un rayon de 50&nbsp;km
        autour de Toulouse. Chaque devis reste établi sur mesure après échange.
      </p>
    </div>
    <div class="grid grid--3">
      <article class="card reveal">
        <p class="card__num">Formule Soirée</p>
        <h3>à partir de 1&nbsp;200&nbsp;€</h3>
        <p>Vin d’honneur, dîner et soirée dansante jusqu’à 3&nbsp;h. Sonorisation de la salle de réception et éclairage d’ambiance.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Formule Journée</p>
        <h3>à partir de 1&nbsp;700&nbsp;€</h3>
        <p>La formule la plus demandée. Cérémonie laïque incluse, deux espaces sonorisés, soirée jusqu’à 4&nbsp;h, micros HF et éclairage architectural.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Formule Signature</p>
        <h3>sur devis</h3>
        <p>Mariages sur plusieurs jours, lieux atypiques, contraintes acoustiques particulières, brunch du lendemain, prestations à l’étranger.</p>
      </article>
    </div>
  </div>
</section>

<section class="section section--ecru-deep">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Où</p>
      <h2>Des mariages à Toulouse et bien au-delà</h2>
      <p>
        La Haute-Garonne et ses départements voisins concentrent l’essentiel des dates,
        mais Léo se déplace partout en France. Chaque grande ville dispose de sa page dédiée.
      </p>
    </div>
    <ul class="city-list reveal" style="columns:3">
      <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
      <li><a href="/dj-mariage-bordeaux/">DJ mariage Bordeaux</a></li>
      <li><a href="/dj-mariage-montpellier/">DJ mariage Montpellier</a></li>
      <li><a href="/dj-mariage-paris/">DJ mariage Paris</a></li>
      <li><a href="/zone-intervention/">Toute la France</a></li>
      <li><a href="/blog/choisir-dj-mariage-toulouse/">Comment choisir son DJ</a></li>
    </ul>
  </div>
</section>
HTML

presta "dj-mariage" \
 "Prestation DJ mariage : déroulé, formules et tarifs" \
 "DJ mariage à Toulouse et dans toute la France : cérémonie laïque, vin d’honneur, dîner, ouverture de bal et soirée dansante. Formules à partir de 1 200 € TTC. Devis sous 24 h." \
 "La prestation DJ mariage, de la cérémonie au dernier morceau" \
 "L’activité principale de l’Agence Silence, et quasi exclusive de mai à septembre. Une préparation en amont, un déroulé calé avec vos prestataires, et une piste qui tient jusqu’au bout." \
 "prestation-mariage.svg" \
 "DJ mariage" \
 "$CORPS_MARIAGE" \
 "DJ mariage"

# ----------------------------------------------------------- DJ ENTREPRISE --
read -r -d '' CORPS_CORPO <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Formats couverts</p>
        <h2>Du séminaire au dernier morceau de la soirée de gala</h2>
        <p>
          Un événement d’entreprise se juge sur la fluidité. Un micro qui siffle pendant
          le discours du directeur général coûte plus cher à l’image que n’importe quel poste
          du budget.
        </p>
        <p>
          Agence Silence intervient sur l’ensemble de la chaîne sonore : plénière, cocktail,
          dîner, remise de prix, puis soirée dansante. Un seul interlocuteur, un seul devis.
        </p>
      </div>
      <div class="reveal">
        <div class="grid" style="gap:1.25rem">
          <article class="card"><h3>Séminaires et conventions</h3><p>Sonorisation de plénière, micros HF main et cravate, diffusion des vidéos, retour pour l’intervenant.</p></article>
          <article class="card"><h3>Soirées de gala et remises de prix</h3><p>Cocktail dînatoire, jingles d’annonce, gestion du micro pour les remises, bascule vers la soirée.</p></article>
          <article class="card"><h3>Lancements produit et inaugurations</h3><p>Ambiance sonore continue, montée d’intensité calée sur le moment de dévoilement.</p></article>
          <article class="card"><h3>Soirées de fin d’année et arbres de Noël</h3><p>Format familial en journée, format dansant en soirée. Sélection adaptée à un public multigénérationnel.</p></article>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Cadre administratif</p>
      <h2>Ce que votre service achats va demander</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><h3>SIRET et devis conforme</h3><p>Entreprise déclarée, devis normé, facture avec TVA. Enregistrement fournisseur possible en amont.</p></article>
      <article class="card reveal"><h3>Attestation RC professionnelle</h3><p>Fournie sur demande, à jour, avec les montants de garantie exigés par la plupart des lieux de réception.</p></article>
      <article class="card reveal"><h3>Déclaration SACEM</h3><p>Nous vous indiquons la procédure et les éléments nécessaires à la déclaration de votre événement.</p></article>
      <article class="card reveal"><h3>Délais de paiement</h3><p>Acompte à la réservation, solde à trente jours après l’événement pour les entreprises.</p></article>
      <article class="card reveal"><h3>Repérage technique</h3><p>Visite du lieu ou point technique en visio avec votre prestataire salle, inclus dans la prestation.</p></article>
      <article class="card reveal"><h3>Confidentialité</h3><p>Aucune photo ni mention publique de votre événement sans accord écrit préalable.</p></article>
    </div>
  </div>
</section>
HTML

presta "dj-entreprise" \
 "DJ événement d’entreprise à Toulouse — Agence Silence" \
 "DJ pour séminaire, soirée de gala, lancement produit ou arbre de Noël à Toulouse et partout en France. Sonorisation, micros HF, régie et soirée dansante. Devis conforme et assurance RC pro." \
 "DJ événement d’entreprise à Toulouse" \
 "Séminaires, soirées de gala, lancements produit et fêtes de fin d’année. Une prestation technique carrée, un dossier administratif complet, et une soirée qui ne retombe pas après le dessert." \
 "prestation-corporate.svg" \
 "DJ événement d’entreprise" \
 "$CORPS_CORPO" \
 "DJ événement d’entreprise"

# --------------------------------------------------------- DJ SOIREE PRIVEE --
read -r -d '' CORPS_PRIVE <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">Occasions</p>
        <h2>Les soirées qui méritent autre chose qu’une enceinte Bluetooth</h2>
        <p>
          Un quarantième anniversaire, des fiançailles, un départ à la retraite ou une fête
          de famille dans une propriété : ces soirées réunissent souvent le même public
          qu’un mariage, avec les mêmes attentes.
        </p>
        <p>
          Le matériel et la préparation sont identiques à ceux d’un mariage. Seule la durée
          change, ce qui permet une formule courte plus accessible.
        </p>
      </div>
      <div class="reveal">
        <div class="grid" style="gap:1.25rem">
          <article class="card"><h3>Anniversaires</h3><p>Trentaines, quarantaines, cinquantaines, quatre-vingts ans. Sélection construite avec la personne fêtée ou avec ses proches, en secret si nécessaire.</p></article>
          <article class="card"><h3>Fiançailles et retours de noces</h3><p>Format plus intime que le mariage, souvent en extérieur, avec une sonorisation légère et un éclairage doux.</p></article>
          <article class="card"><h3>Fêtes de famille et soirées en propriété</h3><p>Villas, jardins, granges. Repérage préalable systématique pour le voisinage et l’alimentation électrique.</p></article>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Formules</p>
      <h2>Deux formats de soirée privée</h2>
      <p>Montants indicatifs TTC, dans un rayon de 50&nbsp;km autour de Toulouse.</p>
    </div>
    <div class="grid grid--2">
      <article class="card reveal">
        <p class="card__num">Format court</p>
        <h3>à partir de 750&nbsp;€</h3>
        <p>Quatre heures de prestation, un espace sonorisé, éclairage d’ambiance simple. Idéal pour un anniversaire ou des fiançailles.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Format complet</p>
        <h3>à partir de 1&nbsp;100&nbsp;€</h3>
        <p>Apéritif, dîner et soirée dansante jusqu’à 3&nbsp;h, deux espaces sonorisés, micros HF et éclairage architectural.</p>
      </article>
    </div>
  </div>
</section>
HTML

presta "dj-soiree-privee" \
 "DJ soirée privée à Toulouse — anniversaires et fêtes" \
 "DJ pour soirée privée à Toulouse : anniversaires, fiançailles, fêtes de famille et soirées en propriété. Formule courte à partir de 750 € TTC. Même matériel que pour un mariage." \
 "DJ soirée privée à Toulouse" \
 "Anniversaires, fiançailles, fêtes de famille et soirées en propriété. Le même matériel et la même préparation que pour un mariage, sur un format plus souple." \
 "prestation-privee.svg" \
 "DJ soirée privée" \
 "$CORPS_PRIVE" \
 "DJ soirée privée"
