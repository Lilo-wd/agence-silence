#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# ============================================================== ACCUEIL ====
{
page_open \
 "DJ mariage Toulouse &amp; événementiel — Agence Silence" \
 "Agence Silence, DJ mariage à Toulouse depuis 2019 : plus de 500 mariages, note de 4,9/5 sur 59 avis Mariages.net. Pack cocktail, dîner et soirée à 1 600 €, son et lumière compris." \
 "/" "og-agence-silence.jpg"

# Pas de balisage AggregateRating / Review : les avis viennent de Mariages.net
# et portent sur l'entreprise elle-meme. Google n'affiche pas d'etoiles pour
# des avis « auto-publies » et deconseille de reprendre les avis d'un autre
# site dans son propre balisage. Voir README.
cat <<HTML
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "LocalBusiness",
      "@id": "$SITE/#organisation",
      "name": "Agence Silence",
      "legalName": "$NOM_LEGAL",
      "description": "Agence de DJ événementiel en région toulousaine : mariages, événements d’entreprise et soirées privées. Plus de 500 mariages depuis 2019.",
      "url": "$SITE/",
      "telephone": "$TEL_URI",
      "email": "$MAIL",
      "priceRange": "€€",
      "foundingDate": "2019",
      "image": "$SITE/assets/img/og-agence-silence.jpg",
      "logo": "$SITE/assets/img/logo-empile.webp",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "$RUE",
        "addressLocality": "$VILLE",
        "postalCode": "$CP",
        "addressRegion": "Occitanie",
        "addressCountry": "FR"
      },
      "areaServed": [
        { "@type": "City", "name": "Toulouse" },
        { "@type": "City", "name": "Castres" },
        { "@type": "City", "name": "Ramonville-Saint-Agne" },
        { "@type": "AdministrativeArea", "name": "Haute-Garonne" },
        { "@type": "AdministrativeArea", "name": "Tarn" },
        { "@type": "AdministrativeArea", "name": "Aude" },
        { "@type": "AdministrativeArea", "name": "Tarn-et-Garonne" }
      ],
      "knowsLanguage": ["fr", "en"],
      "openingHoursSpecification": [{
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],
        "opens": "10:00", "closes": "22:00"
      }],
      "founder": { "@id": "$SITE/#leo" },
      "sameAs": [
        "https://www.instagram.com/agencesilence/",
        "https://www.mariages.net/musique-mariage/leo-malhie--e274959"
      ],
      "award": ["Wedding Awards Mariages.net 2024", "Wedding Awards Mariages.net 2025", "Wedding Awards Mariages.net 2026"],
      "hasOfferCatalog": {
        "@type": "OfferCatalog",
        "name": "Prestations DJ",
        "itemListElement": [
          { "@type": "Offer", "price": "1600", "priceCurrency": "EUR",
            "itemOffered": { "@type": "Service", "name": "DJ mariage — cocktail, dîner et soirée", "url": "$SITE/prestations/dj-mariage/" } },
          { "@type": "Offer",
            "priceSpecification": { "@type": "PriceSpecification", "minPrice": "500", "priceCurrency": "EUR" },
            "itemOffered": { "@type": "Service", "name": "DJ événement d’entreprise", "url": "$SITE/prestations/dj-entreprise/" } },
          { "@type": "Offer",
            "priceSpecification": { "@type": "PriceSpecification", "minPrice": "600", "priceCurrency": "EUR" },
            "itemOffered": { "@type": "Service", "name": "DJ soirée privée", "url": "$SITE/prestations/dj-soiree-privee/" } }
        ]
      }
    },
    {
      "@type": "WebSite",
      "@id": "$SITE/#site",
      "url": "$SITE/",
      "name": "Agence Silence",
      "inLanguage": "fr-FR",
      "publisher": { "@id": "$SITE/#organisation" }
    },
    {
      "@type": "Person",
      "@id": "$SITE/#leo",
      "name": "Léo Malhie",
      "jobTitle": "DJ événementiel, fondateur de l’Agence Silence",
      "knowsLanguage": ["fr", "en"],
      "worksFor": { "@id": "$SITE/#organisation" },
      "url": "$SITE/a-propos/"
    }
  ]
}
</script>
HTML

page_head_close

cat <<'HTML'
<section class="bande-fixe bande-fixe--sombre">
  <div class="bande-fixe__media" aria-hidden="true">
    <img src="/assets/img/hero-dj-platines.webp"
         alt="DJ mariage Toulouse — DJ aux platines pendant une soirée"
         width="1376" height="768" fetchpriority="high" decoding="async">
  </div>
  <div class="wrap bande-fixe__contenu">
    <p class="eyebrow">Agence Silence &middot; Léo Malhie &middot; Toulouse</p>
    <h1>DJ de mariage à Toulouse, pour des fêtes que l’on raconte encore dix ans après.</h1>
    <p class="bande-fixe__lead">
      Un son haut de gamme, des tarifs clairs et une piste qui fait danser
      toutes les générations, du cocktail jusqu’au bout de la nuit.
    </p>
    <div class="btn-row">
      <a class="btn btn--light" href="/contact/">Vérifier la disponibilité de ma date</a>
      <a class="btn btn--outline-light" href="/temoignages/">Lire les avis des mariés</a>
    </div>
    <p class="bande-fixe__meta">
      <span>+500 mariages depuis 2019</span>
      <span>4,9/5 sur 59 avis Mariages.net</span>
      <span>Wedding Awards 2024, 2025, 2026</span>
    </p>
  </div>
</section>

<!-- ===================================================== INTRO / APPROCHE -->
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">La façon de travailler</p>
        <h2>À l’écoute, discret, mais toujours présent.</h2>
      </div>
      <div class="reveal">
        <p class="lead">
          Autant de rendez-vous que vous le souhaitez pour préparer la journée,
          un questionnaire musical complet, vos playlists si vous en avez&nbsp;:
          la soirée se construit avec vous.
        </p>
        <p>
          Le jour J, le DJ prend le micro pour les annonces, lit la piste en continu
          et accepte les demandes de vos invités. Un seul objectif, celui dont Léo
          est le plus fier&nbsp;: voir toutes les générations danser ensemble.
        </p>
        <p><a class="link-arrow" href="/a-propos/">Découvrir Léo et l’agence</a></p>
      </div>
    </div>
  </div>
</section>

<!-- ========================================================== PRESTATIONS -->
<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Prestations</p>
      <h2>Trois formats, des tarifs affichés</h2>
      <p>
        L’Agence Silence ne joue ni en club ni en bar&nbsp;: c’est une agence
        d’événementiel. Chaque prestation comprend le pack complet, son et lumière.
      </p>
    </div>

    <div class="grid grid--3">
      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-mariage.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ mariage Toulouse — piste de danse d’un mariage en Haute-Garonne">
        </div>
        <div class="service-card__body">
          <h3>Mariages</h3>
          <p>Le cœur du métier&nbsp;: plus de 500 mariages depuis 2019, du cocktail jusqu’à 4&nbsp;h&nbsp;30.</p>
          <ul>
            <li>Cocktail, dîner et soirée&nbsp;: 1&nbsp;600&nbsp;€</li>
            <li>Vidéoprojecteur et écran inclus</li>
            <li>Cérémonie laïque en option</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-mariage/">DJ mariage</a>
        </div>
      </article>

      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-corporate.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ événementiel Toulouse — soirée d’entreprise sonorisée par Agence Silence">
        </div>
        <div class="service-card__body">
          <h3>Événements d’entreprise</h3>
          <p>Plus de 200 événements d’entreprise, en France comme à Singapour ou Budapest.</p>
          <ul>
            <li>Conférence et soirée, un seul prestataire</li>
            <li>Gala, séminaire, fin d’année</li>
            <li>À partir de 500&nbsp;€</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-entreprise/">DJ entreprise</a>
        </div>
      </article>

      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-privee.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ soirée privée Toulouse — anniversaire sonorisé près de Toulouse">
        </div>
        <div class="service-card__body">
          <h3>Soirées privées</h3>
          <p>Anniversaires, fiançailles, fêtes de famille, avec le même pack son et lumière.</p>
          <ul>
            <li>Anniversaire de 20&nbsp;h à 2&nbsp;h&nbsp;: dès 600&nbsp;€</li>
            <li>Aucun minimum d’invités</li>
            <li>Toutes les soirées privées</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-soiree-privee/">DJ soirée privée</a>
        </div>
      </article>
    </div>
  </div>
</section>

<!-- ============================================================ METHODE -->
<section class="section section--ecru-deep">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Comment ça se passe</p>
      <h2>De la première question au dernier morceau</h2>
    </div>
    <div class="grid grid--4" style="grid-template-columns:repeat(auto-fit,minmax(min(100%,240px),1fr))">
      <article class="card reveal">
        <p class="card__num">01</p>
        <h3>Vérification de la date</h3>
        <p>Donnez-nous la date et le lieu&nbsp;: réponse sous 24&nbsp;h, week-end compris.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">02</p>
        <h3>Devis et réservation</h3>
        <p>Un devis clair, aux tarifs affichés. Un acompte de 30&nbsp;% bloque la date, le solde se règle une semaine avant.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">03</p>
        <h3>Préparation</h3>
        <p>Questionnaire musical, playlists, ouverture de bal&nbsp;: en autant de rendez-vous que vous le souhaitez.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">04</p>
        <h3>Le jour J</h3>
        <p>Deux heures d’installation avant vos invités. Soirée jusqu’à 4&nbsp;h&nbsp;30, heures supplémentaires possibles.</p>
      </article>
    </div>
  </div>
</section>

<!-- ============================================================ GALERIE -->
<section class="section section--white">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">En images</p>
      <h2>Quelques soirées signées Agence Silence</h2>
    </div>
    <div class="gallery reveal">
      <figure>
        <img src="/assets/img/galerie-01.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ mariage Toulouse — ouverture de bal en Haute-Garonne">
        <figcaption>Mariage &middot; Haute-Garonne</figcaption>
      </figure>
      <figure>
        <img src="/assets/img/galerie-02.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ mariage Castres — piste de danse pleine dans le Tarn">
        <figcaption>Mariage &middot; Tarn</figcaption>
      </figure>
      <figure>
        <img src="/assets/img/galerie-03.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ mariage Aude — soirée dansante dans un domaine">
        <figcaption>Mariage &middot; Aude</figcaption>
      </figure>
      <figure>
        <img src="/assets/img/galerie-04.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ événementiel Toulouse — soirée d’entreprise sonorisée par Agence Silence">
        <figcaption>Événement d’entreprise</figcaption>
      </figure>
    </div>
    <div class="btn-row">
      <a class="btn btn--ghost" href="/galerie/">Voir toute la galerie</a>
    </div>
  </div>
</section>

<!-- ======================================================== TEMOIGNAGES -->
<section class="section dark">
  <div class="wrap">
    <div class="section-head section-head--center reveal">
      <p class="eyebrow">Ils ont dansé</p>
      <h2>Ce que disent les mariés</h2>
      <p>4,9&nbsp;sur&nbsp;5 sur 59 avis Mariages.net, et trois Wedding Awards consécutifs.</p>
    </div>
    <div class="grid grid--3">
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Nous avons dansé jusqu’à l’heure de fermeture sans arrêt&nbsp;! Une soirée inoubliable grâce à Léo.</p></blockquote>
        <figcaption><strong>Audrey</strong>Mariage &middot; Septembre 2025</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>…il nous a assuré une piste de danse pleine du début à la fin, faisant danser toutes les générations tout en s’adaptant à nos goûts.</p></blockquote>
        <figcaption><strong>Sabrina</strong>Mariage &middot; Mai 2026</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Le matériel est haut de gamme, le son est parfait… Léo est un professionnel hors pair qui gère tout.</p></blockquote>
        <figcaption><strong>Florine</strong>Mariage &middot; Août 2025</figcaption>
      </figure>
    </div>
    <div class="btn-row btn-row--center">
      <a class="btn btn--outline-light" href="/temoignages/">Lire les avis en entier</a>
    </div>
  </div>
</section>

<!-- ================================================= ZONE D INTERVENTION -->
<section class="section">
  <div class="wrap">
    <div class="zone-grid">
      <div class="reveal">
        <p class="eyebrow">Zone d’intervention</p>
        <h2>Installé aux portes de Toulouse, jusqu’à l’étranger</h2>
        <p>
          L’agence est basée à Lauzerville, à côté de Toulouse. Les mariages se
          concentrent en Haute-Garonne, dans le Tarn et dans l’Aude&nbsp;: Toulouse,
          Castres et Ramonville en tête.
        </p>
        <p>
          Déplacement gratuit dans un rayon de 50&nbsp;km. Au-delà, 0,60&nbsp;€ du
          kilomètre aller-retour, indiqué dès le devis.
        </p>
        <p><a class="link-arrow" href="/zone-intervention/">Voir la zone détaillée</a></p>
      </div>
      <div class="reveal">
        <h3 style="font-size:1.05rem;font-family:var(--sans);font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--ink-40);margin-bottom:1.5rem">Où l’agence joue</h3>
        <ul class="city-list">
          <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
          <li><a href="/dj-mariage-castres/">DJ mariage Castres</a></li>
          <li><span>Ramonville &middot; Haute-Garonne</span></li>
          <li><span>Tarn</span></li>
          <li><span>Aude &middot; Tarn-et-Garonne</span></li>
          <li><span>Séville, Budapest, Tenerife, Singapour</span></li>
        </ul>
      </div>
    </div>
  </div>
</section>

<!-- ================================================================ FAQ -->
<section class="section section--white">
  <div class="wrap">
    <div class="section-head section-head--center reveal">
      <p class="eyebrow">Questions fréquentes</p>
      <h2>Les réponses que l’on nous demande le plus</h2>
    </div>
    <div class="faq faq--center reveal">
      <details>
        <summary>Combien coûte un DJ de mariage&nbsp;?</summary>
        <div class="faq__answer">
          <p>Le pack mariage — cocktail, dîner et soirée, avec son, lumière, micros, vidéoprojecteur et écran — est à 1&nbsp;600&nbsp;€, hors déplacement. Le prix varie selon la durée, la saison et le jour. TVA non applicable.</p>
        </div>
      </details>
      <details>
        <summary>Combien de temps à l’avance faut-il réserver&nbsp;?</summary>
        <div class="faq__answer">
          <p>Idéalement un à deux ans à l’avance&nbsp;: les dates de haute saison partent très vite.</p>
        </div>
      </details>
      <details>
        <summary>Y a-t-il des frais de déplacement&nbsp;?</summary>
        <div class="faq__answer">
          <p>Le déplacement est gratuit dans un rayon de 50&nbsp;km. Au-delà, il est facturé 0,60&nbsp;€ du kilomètre aller-retour et figure dans le devis.</p>
        </div>
      </details>
      <details>
        <summary>À quelle heure se termine la soirée&nbsp;?</summary>
        <div class="faq__answer">
          <p>À 4&nbsp;h&nbsp;30 du matin. Pour prolonger, des heures supplémentaires sont possibles et facturées.</p>
        </div>
      </details>
    </div>
    <div class="btn-row btn-row--center">
      <a class="btn btn--ghost" href="/faq/">Toutes les questions</a>
    </div>
  </div>
</section>
HTML

bande_cta \
 "Votre date est-elle encore libre&nbsp;?" \
 "Donnez-nous la date et le lieu de votre événement&nbsp;: nous vous répondons sous 24 heures, avec une proposition chiffrée si le créneau est disponible."

page_close
} | page_write "index.html"
