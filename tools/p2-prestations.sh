#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# ============================================================== A PROPOS ====
{
page_open \
 "Léo Malhie, DJ événementiel à Toulouse — Agence Silence" \
 "Léo Malhie a fondé l’Agence Silence en 2019 : plus de 500 mariages, 200 événements d’entreprise, une équipe de DJ et un choix assumé, l’événementiel plutôt que le club." \
 "/a-propos/" "og-agence-silence.jpg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Le DJ|/a-propos/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Le DJ|/a-propos/"
cat <<'HTML'
    <p class="eyebrow">Le DJ</p>
    <h1>Léo Malhie, DJ de mariage en région toulousaine depuis 2019</h1>
    <p class="lead">
      Plus de 500 mariages, dont une centaine l’an dernier, et une devise qui n’a pas
      changé&nbsp;: à l’écoute, discret, mais toujours présent.
    </p>
  </div>
</section>

<section class="section section--white">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <figure class="reveal" style="margin:0">
        <img src="/assets/img/leo-portrait.svg" loading="lazy" decoding="async" width="1100" height="1375"
             alt="Portrait de Léo Malhie, DJ mariage Toulouse, fondateur de l’Agence Silence">
      </figure>
      <div class="reveal">
        <h2>Un autodidacte élevé à la musique</h2>
        <p>
          Son père est mélomane&nbsp;: Léo a toujours grandi entouré de musique. Le métier
          de DJ, il l’a appris seul, en autodidacte.
        </p>
        <p>
          Son premier mariage date de 2019. «&nbsp;C’était stressant, mais l’ambiance était
          incroyable.&nbsp;» Sept ans plus tard, l’agence a animé plus de 500 mariages et plus
          de 200 événements d’entreprise.
        </p>

        <h2>Ni club, ni bar&nbsp;: l’événementiel</h2>
        <p>
          Léo a joué dans des ambiances très différentes. En bar comme en club, c’est
          toujours la même soirée. Il a choisi l’événementiel, où chaque mariage, chaque
          gala et chaque anniversaire est différent du précédent.
        </p>
        <p>
          Ce qui le rend le plus fier&nbsp;? Voir toutes les générations danser et s’amuser
          ensemble. La seule ambiance qu’il refuse&nbsp;: celle de la fête foraine.
        </p>

        <h2>Quand les mariés lui font confiance</h2>
        <p>
          Un couple voulait une soirée entièrement techno. L’équipe a respecté leur choix,
          mais personne ne dansait. Les mariés sont venus voir Léo&nbsp;: «&nbsp;On te fait
          confiance.&nbsp;» La piste est restée pleine jusqu’à 5&nbsp;heures du matin.
        </p>

        <h2>Une agence, une équipe</h2>
        <p>
          L’Agence Silence réunit Léo et une équipe de DJ, avec un réseau de remplacement.
          Selon la date, c’est Léo ou l’un de ses DJ qui est aux platines&nbsp;; la
          préparation, elle, se fait toujours avec lui. Léo parle anglais, un atout pour
          les mariages franco-étrangers.
        </p>
      </div>
    </div>
  </div>
</section>

<section class="section section--ecru-deep">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Le matériel</p>
      <h2>Un camion, pas une voiture</h2>
      <p>
        Léo se déplace en camion. Ça change tout&nbsp;: il emporte des enceintes plus grandes
        et de meilleure qualité que ce qui tient dans un coffre. C’est ce que vos invités entendent.
      </p>
    </div>
    <div class="grid grid--4" style="grid-template-columns:repeat(auto-fit,minmax(min(100%,240px),1fr))">
      <article class="card reveal">
        <p class="card__num">Son</p>
        <h3>Enceintes Yamaha DXR15 et DZR15</h3>
        <p>Des enceintes actives professionnelles, pour des événements jusqu’à 600 invités. Pour les très grands événements, du matériel complémentaire est loué.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Mix</p>
        <h3>Pioneer DJ XDJ-RX3</h3>
        <p>Une console professionnelle tout-en-un, et deux micros sans fil pour les discours et les annonces.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Lumière</p>
        <h3>PAR LED et lyres</h3>
        <p>Huit projecteurs PAR LED inclus dans chaque prestation. En option, un éclairage plus dynamique avec des lyres.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">Logistique</p>
        <h3>Rien à prévoir</h3>
        <p>Deux heures d’installation, une heure de démontage. Une prise 16&nbsp;A suffit&nbsp;: rallonges et multiprises sont fournies.</p>
      </article>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="stat-row reveal">
      <div class="stat"><span class="stat__value">500+</span><span class="stat__label">Mariages</span></div>
      <div class="stat"><span class="stat__value">200+</span><span class="stat__label">Événements d’entreprise</span></div>
      <div class="stat"><span class="stat__value">7</span><span class="stat__label">Ans d’activité</span></div>
      <div class="stat"><span class="stat__value">5/5</span><span class="stat__label">Sur Mariages.net</span></div>
      <div class="stat"><span class="stat__value">100&nbsp;%</span><span class="stat__label">Dates honorées</span></div>
    </div>
  </div>
</section>
HTML
bande_cta "Parlons de votre soirée" "Autant de rendez-vous que nécessaire pour préparer votre événement. Réponse sous 24 heures, week-end compris."
page_close
} | page_write "a-propos/index.html"


# ========================================================= PRESTATIONS HUB ==
{
page_open \
 "Prestations DJ à Toulouse : mariage, entreprise, privé" \
 "Les prestations de l’Agence Silence : DJ mariage à 1 600 €, événement d’entreprise dès 500 €, soirée privée dès 600 €. Pack son et lumière complet, tarifs affichés." \
 "/prestations/" "og-agence-silence.jpg"
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
      Trois formats, le même pack complet son et lumière, et des tarifs affichés dès le départ.
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
          <p>Cocktail, dîner et soirée jusqu’à 4&nbsp;h&nbsp;30. Plus de 500 mariages depuis 2019.</p>
          <ul>
            <li>Pack complet&nbsp;: 1&nbsp;600&nbsp;€</li>
            <li>Vidéoprojecteur et écran inclus</li>
            <li>Cérémonie laïque en option</li>
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
          <p>Tous les formats, de la conférence à la soirée de gala. Plus de 200 événements.</p>
          <ul>
            <li>Sonorisation de conférence</li>
            <li>Soirée dansante de clôture</li>
            <li>À partir de 500&nbsp;€</li>
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
          <p>Anniversaires, fiançailles, fêtes de famille&nbsp;: toutes les soirées privées.</p>
          <ul>
            <li>Anniversaire de 20&nbsp;h à 2&nbsp;h</li>
            <li>Aucun minimum d’invités</li>
            <li>À partir de 600&nbsp;€</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-soiree-privee/">Voir le détail</a>
        </div>
      </article>
    </div>
    <p style="margin-top:2.5rem"><a class="link-arrow" href="/prestations/options-mariage/">Photobooth, fumée lourde, livre d’or audio&nbsp;: les options</a></p>
  </div>
</section>

<section class="section section--white">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Dans chaque prestation</p>
      <h2>Ce qui est toujours compris</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><h3>Le pack son et lumière</h3><p>Enceintes Yamaha, console Pioneer DJ et huit projecteurs PAR LED, dans tous les devis.</p></article>
      <article class="card reveal"><h3>Deux micros sans fil</h3><p>Pour les discours, les annonces et les interventions de vos proches.</p></article>
      <article class="card reveal"><h3>Rien à prévoir</h3><p>Une prise 16&nbsp;A suffit. Rallonges et multiprises sont fournies, l’installation prend deux heures.</p></article>
      <article class="card reveal"><h3>Une préparation sur mesure</h3><p>Autant de rendez-vous que vous le souhaitez, et un questionnaire musical complet.</p></article>
      <article class="card reveal"><h3>Matériel assuré</h3><p>Attestation d’assurance fournie sur demande, pour les lieux de réception qui l’exigent.</p></article>
      <article class="card reveal"><h3>Des tarifs clairs</h3><p>Prix affichés, acompte de 30&nbsp;% pour réserver, solde une semaine avant. TVA non applicable.</p></article>
    </div>
  </div>
</section>
HTML
bande_cta "Quelle prestation pour votre événement&nbsp;?" "Donnez-nous la date, le lieu et le nombre d’invités&nbsp;: nous revenons vers vous sous 24 heures avec un devis."
page_close
} | page_write "prestations/index.html"


# ================================================ PAGES PRESTATION DETAIL ==
# presta <slug> <titre-page> <description> <h1> <intro> <img> <nom-service> <bloc-html> <libelle>
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
    "@id": "$SITE/#organisation",
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
    { "@type": "AdministrativeArea", "name": "Haute-Garonne" },
    { "@type": "AdministrativeArea", "name": "Tarn" },
    { "@type": "AdministrativeArea", "name": "Aude" }
  ]
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
      <a class="btn btn--ghost" href="/temoignages/">Lire les avis</a>
    </div>
  </div>
</section>
$CORPS
HTML
bande_cta "Un devis pour votre événement" "Réponse sous 24 heures, avec la disponibilité de la date et une proposition chiffrée."
page_close
} | page_write "prestations/$SLUG/index.html"
}

# Bloc « conditions » partage par les pages avec un tarif
read -r -d '' CONDITIONS <<'HTML' || true
      <article class="card reveal">
        <p class="card__num">Conditions</p>
        <h3>Réservation et paiement</h3>
        <p>Un acompte de 30&nbsp;% bloque la date. Le solde se règle une semaine avant l’événement. Tous les moyens de paiement sont acceptés.</p>
        <p>En cas d’annulation, l’acompte est conservé. Un report reste possible, au même tarif.</p>
        <p>Déplacement gratuit dans un rayon de 50&nbsp;km, puis 0,60&nbsp;€ du kilomètre. TVA non applicable, article 293&nbsp;B du CGI.</p>
      </article>
HTML

# ------------------------------------------------------------- DJ MARIAGE --
read -r -d '' CORPS_MARIAGE <<HTML || true
<section class="section section--white">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <p class="eyebrow">Le déroulé</p>
        <h2>Une journée de mariage, moment par moment</h2>
        <p>
          Environ quinze heures de présence le jour J, installation comprise. Le déroulé se
          prépare avec vous, en autant de rendez-vous que vous le souhaitez.
        </p>
        <p>
          Pour la musique, un questionnaire complet sur vos goûts&nbsp;; vos playlists sont
          les bienvenues. Tous les styles sont possibles, sauf l’ambiance fête foraine.
        </p>
      </div>
      <div class="reveal">
        <div class="faq" style="border-top-color:var(--line)">
          <details open>
            <summary>Cérémonie laïque — en option</summary>
            <div class="faq__answer"><p>Sonorisation de la cérémonie et micros pour l’officiant et les témoins. Léo les aide aussi à préparer le déroulé et leurs interventions.</p></div>
          </details>
          <details>
            <summary>Vin d’honneur et cocktail — inclus</summary>
            <div class="faq__answer"><p>La musique accompagne le cocktail et installe l’ambiance de la journée.</p></div>
          </details>
          <details>
            <summary>Dîner — inclus</summary>
            <div class="faq__answer"><p>Micros pour les discours, vidéoprojecteur et écran pour les animations préparées par vos témoins.</p></div>
          </details>
          <details>
            <summary>Ouverture de bal</summary>
            <div class="faq__answer"><p>Votre morceau monté sur mesure, et une répétition si vous le souhaitez. En option, un tapis de fumée lourde au sol.</p></div>
          </details>
          <details>
            <summary>Soirée dansante — jusqu’à 4 h 30</summary>
            <div class="faq__answer"><p>Les demandes de vos invités sont acceptées, les annonces se font au micro quand il le faut. Pour prolonger, des heures supplémentaires sont possibles.</p></div>
          </details>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Tarif</p>
      <h2>Le pack mariage</h2>
      <p>Un prix affiché plutôt qu’une fourchette&nbsp;: c’est l’une des raisons pour lesquelles les mariés choisissent l’agence.</p>
    </div>
    <div class="grid grid--2">
      <article class="card reveal">
        <p class="card__num">Cocktail, dîner et soirée</p>
        <h3>1&nbsp;600&nbsp;€</h3>
        <p>Hors déplacement. Le prix peut varier selon la durée, la saison et le jour de la semaine.</p>
        <ul style="margin:0 0 0;padding-left:1.1rem;color:var(--ink-60);font-size:.95rem">
          <li>Sonorisation complète, enceintes Yamaha</li>
          <li>Huit projecteurs PAR LED</li>
          <li>Deux micros sans fil</li>
          <li>Vidéoprojecteur et écran</li>
          <li>Soirée jusqu’à 4&nbsp;h&nbsp;30</li>
        </ul>
      </article>
$CONDITIONS
    </div>
    <p style="margin-top:2.5rem"><a class="link-arrow" href="/prestations/options-mariage/">Cérémonie laïque, photobooth, fumée lourde&nbsp;: voir les options</a></p>
  </div>
</section>

<section class="section section--ecru-deep">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Où</p>
      <h2>Des mariages en Haute-Garonne, dans le Tarn et l’Aude</h2>
    </div>
    <ul class="city-list reveal" style="columns:3">
      <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
      <li><a href="/dj-mariage-castres/">DJ mariage Castres</a></li>
      <li><a href="/zone-intervention/">Zone d’intervention</a></li>
      <li><a href="/blog/choisir-dj-mariage-toulouse/">Comment choisir son DJ</a></li>
      <li><a href="/blog/budget-dj-mariage/">Quel budget prévoir</a></li>
      <li><a href="/faq/">Questions fréquentes</a></li>
    </ul>
  </div>
</section>
HTML

presta "dj-mariage" \
 "Prestation DJ mariage : pack à 1 600 € et options" \
 "Le pack mariage de l’Agence Silence : cocktail, dîner et soirée jusqu’à 4 h 30, son, lumière, micros, vidéoprojecteur et écran pour 1 600 € hors déplacement. Cérémonie laïque en option." \
 "La prestation DJ mariage, du cocktail au bout de la nuit" \
 "Plus de 500 mariages depuis 2019. Un pack complet et clair, une quinzaine d’heures de présence le jour J, et des options pour aller plus loin." \
 "og-agence-silence.jpg" \
 "DJ mariage" \
 "$CORPS_MARIAGE" \
 "DJ mariage"

# --------------------------------------------------------- OPTIONS MARIAGE --
read -r -d '' CORPS_OPTIONS <<'HTML' || true
<section class="section section--white">
  <div class="wrap">
    <div class="grid grid--3">
      <article class="card reveal"><p class="card__num">Cérémonie</p><h3>Cérémonie laïque</h3><p>Sonorisation, micros pour l’officiant et les témoins, et l’aide de Léo pour préparer le déroulé et les interventions.</p></article>
      <article class="card reveal"><p class="card__num">Cérémonie</p><h3>Feux de couleur</h3><p>Des feux de couleur pour sublimer la cérémonie laïque.</p></article>
      <article class="card reveal"><p class="card__num">Ouverture de bal</p><h3>Fumée lourde</h3><p>Un vrai tapis de fumée au sol pour l’ouverture de bal, lancé quand les conditions de la salle le permettent.</p></article>
      <article class="card reveal"><p class="card__num">Ambiance</p><h3>Ciel étoilé</h3><p>Un effet ciel étoilé pour l’ambiance de la soirée.</p></article>
      <article class="card reveal"><p class="card__num">Lumière</p><h3>Éclairage dynamique</h3><p>Des lyres et un éclairage plus dynamique, en complément des huit PAR LED inclus.</p></article>
      <article class="card reveal"><p class="card__num">Souvenirs</p><h3>Photobooth</h3><p>Un photobooth au style vintage, qui se fond dans le décor de votre réception.</p></article>
      <article class="card reveal"><p class="card__num">Souvenirs</p><h3>Livre d’or audio</h3><p>Le «&nbsp;téléphone d’or&nbsp;»&nbsp;: vos invités décrochent et vous laissent un message.</p></article>
      <article class="card reveal"><p class="card__num">Live</p><h3>Musiciens</h3><p>Saxophoniste ou pianiste, en complément du DJ.</p></article>
      <article class="card reveal"><p class="card__num">Soirée</p><h3>Heures supplémentaires</h3><p>Pour prolonger la fête au-delà de 4&nbsp;h&nbsp;30.</p></article>
    </div>
    <p class="form-note" style="margin-top:2.5rem">Les tarifs des options figurent dans la brochure, envoyée avec le devis.</p>
  </div>
</section>

<section class="section dark">
  <div class="wrap wrap--narrow">
    <figure class="quote reveal" style="margin:0">
      <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
      <blockquote><p>Il propose une offre complète… et un large panel d’option qui nous a ravi et nous a permis de ne pas faire appel à d’autre prestataires.</p></blockquote>
      <figcaption><strong>Florine</strong>Mariage &middot; Août 2025 &middot; Avis Mariages.net</figcaption>
    </figure>
  </div>
</section>
HTML

presta "options-mariage" \
 "Options mariage : photobooth, fumée lourde, livre d’or audio" \
 "Les options de l’Agence Silence pour votre mariage : cérémonie laïque, photobooth, livre d’or audio, fumée lourde pour l’ouverture de bal, feux de couleur, ciel étoilé, éclairage dynamique et musiciens." \
 "Les options pour votre mariage" \
 "Le pack comprend déjà le son, la lumière, les micros, le vidéoprojecteur et l’écran. Les options réunissent le reste chez un même prestataire." \
 "og-agence-silence.jpg" \
 "Options mariage" \
 "$CORPS_OPTIONS" \
 "Options mariage"

# ----------------------------------------------------------- DJ ENTREPRISE --
read -r -d '' CORPS_CORPO <<HTML || true
<section class="section section--white">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <p class="eyebrow">Formats</p>
        <h2>Tous les formats d’événement d’entreprise</h2>
        <p>
          Séminaires, soirées de gala, fêtes de fin d’année, lancements&nbsp;: l’agence couvre
          la partie conférence comme la partie festive, avec un seul prestataire.
        </p>
        <p>
          Plus de 200 événements d’entreprise à ce jour, en France et à l’étranger&nbsp;:
          Séville, Budapest, Tenerife, Singapour.
        </p>
      </div>
      <div class="reveal">
        <div class="grid" style="gap:1.25rem">
          <article class="card"><h3>Conférences et séminaires</h3><p>Sonorisation de la plénière et micros sans fil pour les intervenants.</p></article>
          <article class="card"><h3>Galas et soirées de fin d’année</h3><p>Du cocktail à la soirée dansante, avec le pack complet son et lumière.</p></article>
          <article class="card"><h3>Tous les secteurs</h3><p>Défense, aéronautique, cosmétique, coiffure, BTP&nbsp;: de la start-up à la multinationale.</p></article>
          <article class="card"><h3>Des clients fidèles</h3><p>Certaines entreprises font appel à l’agence chaque année depuis cinq ans.</p></article>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">En pratique</p>
      <h2>Ce qu’il faut savoir avant de réserver</h2>
    </div>
    <div class="grid grid--3">
      <article class="card reveal"><h3>À partir de 500&nbsp;€</h3><p>Le tarif varie selon la durée, la saison et le jour. Déplacement gratuit dans un rayon de 50&nbsp;km, puis 0,60&nbsp;€ du kilomètre.</p></article>
      <article class="card reveal"><h3>Micro-entreprise immatriculée</h3><p>SIRET $SIRET_AFF. TVA non applicable, article 293&nbsp;B du CGI.</p></article>
      <article class="card reveal"><h3>Paiement</h3><p>Un acompte bloque la date, le solde se règle une semaine avant l’événement. Tous les moyens de paiement sont acceptés.</p></article>
      <article class="card reveal"><h3>Matériel assuré</h3><p>Attestation d’assurance fournie sur demande.</p></article>
      <article class="card reveal"><h3>Jusqu’à 600 personnes</h3><p>Le matériel couvre les événements jusqu’à 600 invités&nbsp;; au-delà, du matériel complémentaire est loué.</p></article>
      <article class="card reveal"><h3>En anglais</h3><p>Léo parle anglais, pour les événements internationaux et les équipes étrangères.</p></article>
    </div>
  </div>
</section>
HTML

presta "dj-entreprise" \
 "DJ événement d’entreprise à Toulouse — Agence Silence" \
 "DJ et sonorisation pour séminaires, galas et soirées d’entreprise à Toulouse : plus de 200 événements, jusqu’à Singapour et Budapest. Conférence et soirée, à partir de 500 €." \
 "DJ événement d’entreprise à Toulouse" \
 "Plus de 200 événements d’entreprise, jusqu’à Singapour, Budapest ou Tenerife. La conférence comme la soirée, avec un seul prestataire." \
 "og-agence-silence.jpg" \
 "DJ événement d’entreprise" \
 "$CORPS_CORPO" \
 "DJ événement d’entreprise"

# --------------------------------------------------------- DJ SOIREE PRIVEE --
read -r -d '' CORPS_PRIVE <<HTML || true
<section class="section section--white">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <p class="eyebrow">Occasions</p>
        <h2>Toutes les soirées privées</h2>
        <p>
          Anniversaires, fiançailles, retours de noces, fêtes de famille&nbsp;: l’agence accepte
          toutes les soirées privées, sans minimum d’invités ni de durée.
        </p>
        <p>
          Le pack est le même qu’un mariage&nbsp;: son, lumière et micros. Et le même objectif,
          faire danser toutes les générations.
        </p>
      </div>
      <div class="reveal">
        <div class="grid" style="gap:1.25rem">
          <article class="card"><h3>Anniversaires</h3><p>Une soirée de 20&nbsp;h à 2&nbsp;h, construite avec vos goûts musicaux et vos playlists.</p></article>
          <article class="card"><h3>Fiançailles et retours de noces</h3><p>Le même soin qu’un mariage, sur un format plus court.</p></article>
          <article class="card"><h3>Fêtes de famille</h3><p>Toutes les générations sur la piste&nbsp;: c’est précisément ce que l’agence sait faire.</p></article>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Tarif</p>
      <h2>La soirée anniversaire</h2>
    </div>
    <div class="grid grid--2">
      <article class="card reveal">
        <p class="card__num">De 20 h à 2 h</p>
        <h3>À partir de 600&nbsp;€</h3>
        <p>Pack son et lumière complet, hors déplacement. Aucun minimum d’invités.</p>
      </article>
$CONDITIONS
    </div>
  </div>
</section>
HTML

presta "dj-soiree-privee" \
 "DJ soirée privée à Toulouse — anniversaires et fêtes" \
 "DJ pour anniversaire, fiançailles ou fête de famille près de Toulouse : pack son et lumière complet, soirée de 20 h à 2 h à partir de 600 €. Aucun minimum d’invités." \
 "DJ soirée privée à Toulouse" \
 "Anniversaires, fiançailles, fêtes de famille&nbsp;: toutes les soirées privées, avec le même pack son et lumière qu’un mariage." \
 "og-agence-silence.jpg" \
 "DJ soirée privée" \
 "$CORPS_PRIVE" \
 "DJ soirée privée"
