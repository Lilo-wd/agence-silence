#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# ============================================================== ACCUEIL ====
{
page_open \
 "DJ mariage Toulouse &amp; événementiel — Agence Silence, DJ Léo" \
 "DJ mariage à Toulouse et dans toute la France. Agence Silence signe des mariages haut de gamme, des événements d’entreprise et des soirées privées. Vérifiez la disponibilité de votre date." \
 "/" "hero-mariage-toulouse.svg"

cat <<'HTML'
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "LocalBusiness",
      "@id": "https://agence-silence.fr/#organisation",
      "name": "Agence Silence",
      "alternateName": "Agence Silence — DJ Léo",
      "description": "DJ événementiel à Toulouse spécialisé dans les mariages haut de gamme, les événements d’entreprise et les soirées privées. Intervient dans toute la France.",
      "url": "https://agence-silence.fr/",
      "telephone": "+33612345678",
      "email": "contact@agence-silence.fr",
      "priceRange": "€€€",
      "image": "https://agence-silence.fr/assets/img/hero-mariage-toulouse.svg",
      "logo": "https://agence-silence.fr/assets/img/logo-empile.png",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "12 rue de la Pomme",
        "addressLocality": "Toulouse",
        "postalCode": "31000",
        "addressRegion": "Occitanie",
        "addressCountry": "FR"
      },
      "geo": { "@type": "GeoCoordinates", "latitude": 43.604652, "longitude": 1.444209 },
      "areaServed": [
        { "@type": "City", "name": "Toulouse" },
        { "@type": "City", "name": "Bordeaux" },
        { "@type": "City", "name": "Montpellier" },
        { "@type": "City", "name": "Paris" },
        { "@type": "Country", "name": "France" }
      ],
      "knowsLanguage": ["fr", "en"],
      "openingHoursSpecification": [{
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],
        "opens": "09:00", "closes": "19:00"
      }],
      "sameAs": [
        "https://www.instagram.com/agencesilence",
        "https://www.google.com/maps"
      ],
      "hasOfferCatalog": {
        "@type": "OfferCatalog",
        "name": "Prestations DJ",
        "itemListElement": [
          { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "DJ mariage", "url": "https://agence-silence.fr/prestations/dj-mariage/" } },
          { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "DJ événement d’entreprise", "url": "https://agence-silence.fr/prestations/dj-entreprise/" } },
          { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "DJ soirée privée", "url": "https://agence-silence.fr/prestations/dj-soiree-privee/" } }
        ]
      }
    },
    {
      "@type": "WebSite",
      "@id": "https://agence-silence.fr/#site",
      "url": "https://agence-silence.fr/",
      "name": "Agence Silence",
      "inLanguage": "fr-FR",
      "publisher": { "@id": "https://agence-silence.fr/#organisation" }
    },
    {
      "@type": "Person",
      "@id": "https://agence-silence.fr/#leo",
      "name": "Léo",
      "jobTitle": "DJ événementiel",
      "worksFor": { "@id": "https://agence-silence.fr/#organisation" },
      "url": "https://agence-silence.fr/a-propos/"
    }
  ]
}
</script>
HTML

page_head_close

cat <<'HTML'
<section class="hero-ed">
  <div class="hero-ed__text">
    <div class="hero-ed__inner">
      <p class="eyebrow">Agence Silence &middot; DJ Léo &middot; Toulouse</p>
      <h1>DJ de mariage à Toulouse, pour des fêtes que l’on raconte encore dix ans après.</h1>
      <p class="hero-ed__lead">
        Pas de néons, pas d’animateur au micro. Une lecture fine de votre soirée, un son
        irréprochable et une piste qui ne se vide pas. Mariages, événements d’entreprise
        et soirées privées, à Toulouse comme partout en France.
      </p>
      <div class="btn-row">
        <a class="btn" href="/contact/">Vérifier la disponibilité de ma date</a>
        <a class="btn btn--ghost" href="/galerie/">Voir les prestations passées</a>
      </div>
      <p class="hero-ed__meta">
        <span>+150 mariages</span>
        <span>Toulouse &amp; toute la France</span>
        <span>Devis sous 24&nbsp;h</span>
      </p>
    </div>
  </div>
  <div class="hero-ed__media">
    <img src="/assets/img/hero-mariage-toulouse.svg"
         alt="DJ mariage Toulouse — Léo, Agence Silence, en fin de soirée dans un domaine de Haute-Garonne"
         width="2000" height="1250" fetchpriority="high" decoding="async">
  </div>
</section>

<!-- ===================================================== INTRO / APPROCHE -->
<section class="section section--white">
  <div class="wrap">
    <div class="split">
      <div class="reveal">
        <p class="eyebrow">L’approche</p>
        <h2>Le silence avant la fête, c’est le travail. Vous n’entendez que le résultat.</h2>
      </div>
      <div class="reveal">
        <p class="lead">
          Une soirée réussie ne tient pas à une playlist. Elle tient à la façon dont on enchaîne
          l’arrivée des mariés, le dîner, le discours du témoin qui déborde de dix minutes,
          et la bascule vers la piste.
        </p>
        <p>
          Léo prépare chaque événement en amont : appel de cadrage, repérage du lieu, calage
          technique avec le traiteur et le photographe. Le jour J, tout est en place avant
          l’arrivée du premier invité. C’est ce travail invisible qui donne l’impression
          que la soirée s’est déroulée toute seule.
        </p>
        <p><a class="link-arrow" href="/a-propos/">Découvrir Léo</a></p>
      </div>
    </div>
  </div>
</section>

<!-- ========================================================== PRESTATIONS -->
<section class="section">
  <div class="wrap">
    <div class="section-head reveal">
      <p class="eyebrow">Prestations</p>
      <h2>Trois formats, une même exigence</h2>
      <p>
        Agence Silence n’intervient ni en club ni en bar. L’activité est entièrement dédiée
        aux événements privés et professionnels, où la qualité d’écoute compte autant que
        le volume sonore.
      </p>
    </div>

    <div class="grid grid--3">
      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-mariage.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ mariage Toulouse — table dressée et piste de danse d’un mariage en Haute-Garonne">
        </div>
        <div class="service-card__body">
          <h3>Mariages</h3>
          <p>Le cœur du métier. De la cérémonie laïque au dernier morceau, une continuité sonore pensée pour vos invités.</p>
          <ul>
            <li>Cérémonie laïque sonorisée</li>
            <li>Cocktail et dîner</li>
            <li>Ouverture de bal et soirée dansante</li>
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
          <p>Séminaires, soirées de gala, lancements produit, arbres de Noël. Un interlocuteur unique, une facturation claire.</p>
          <ul>
            <li>Sonorisation de conférence et keynote</li>
            <li>Cocktail dînatoire et remise de prix</li>
            <li>Soirée dansante de fin d’événement</li>
          </ul>
          <a class="link-arrow" href="/prestations/dj-entreprise/">DJ entreprise</a>
        </div>
      </article>

      <article class="service-card reveal">
        <div class="service-card__media">
          <img src="/assets/img/prestation-privee.svg" loading="lazy" decoding="async" width="1400" height="1050"
               alt="DJ soirée privée Toulouse — anniversaire sonorisé dans une propriété près de Toulouse">
        </div>
        <div class="service-card__body">
          <h3>Soirées privées</h3>
          <p>Anniversaires, fiançailles, fêtes de famille. Le même matériel et la même préparation que pour un mariage.</p>
          <ul>
            <li>Anniversaires et fiançailles</li>
            <li>Fêtes de famille et retours de noces</li>
            <li>Soirées en villa ou en propriété</li>
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
      <h2>Quatre étapes, zéro mauvaise surprise</h2>
    </div>
    <div class="grid grid--4" style="grid-template-columns:repeat(auto-fit,minmax(min(100%,240px),1fr))">
      <article class="card reveal">
        <p class="card__num">01</p>
        <h3>Vérification de la date</h3>
        <p>Vous nous donnez votre date et votre lieu. Réponse sous 24&nbsp;h ouvrées sur la disponibilité, sans engagement.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">02</p>
        <h3>Rendez-vous et devis</h3>
        <p>Un échange d’une heure, sur place ou en visio, pour comprendre votre soirée. Le devis est chiffré et détaillé.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">03</p>
        <h3>Préparation</h3>
        <p>Repérage du lieu, calage du déroulé avec vos prestataires, construction de la sélection musicale avec vous.</p>
      </article>
      <article class="card reveal">
        <p class="card__num">04</p>
        <h3>Le jour J</h3>
        <p>Installation terminée avant l’arrivée des invités. Matériel de secours systématique. Léo reste jusqu’au dernier morceau.</p>
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
             alt="DJ mariage Toulouse — ouverture de bal dans un domaine de Haute-Garonne">
        <figcaption>Mariage &middot; Domaine, Haute-Garonne</figcaption>
      </figure>
      <figure>
        <img src="/assets/img/galerie-02.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ mariage Gers — piste de danse pleine en fin de soirée près d’Auch">
        <figcaption>Mariage &middot; Gers</figcaption>
      </figure>
      <figure>
        <img src="/assets/img/galerie-03.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ mariage Tarn — cocktail sonorisé dans un château près d’Albi">
        <figcaption>Mariage &middot; Tarn</figcaption>
      </figure>
      <figure>
        <img src="/assets/img/galerie-04.svg" loading="lazy" decoding="async" width="900" height="1200"
             alt="DJ événementiel Toulouse — soirée de gala d’entreprise sonorisée par Agence Silence">
        <figcaption>Corporate &middot; Toulouse</figcaption>
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
    </div>
    <div class="grid grid--3">
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Léo a compris notre mariage mieux que nous. La piste ne s’est pas vidée une seule fois entre 22&nbsp;h et 4&nbsp;h du matin.</p></blockquote>
        <figcaption><strong>Camille &amp; Antoine</strong>Mariage &middot; Domaine de Bordeneuve, Haute-Garonne &middot; Juin 2025</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Discret toute la journée, décisif le soir. Aucun micro intempestif, exactement ce que nous cherchions.</p></blockquote>
        <figcaption><strong>Marie &amp; Julien</strong>Mariage &middot; Château, Gers &middot; Septembre 2025</figcaption>
      </figure>
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote><p>Nous faisons appel à l’Agence Silence pour notre soirée annuelle depuis trois ans. Zéro incident technique.</p></blockquote>
        <figcaption><strong>Sophie D.</strong>Responsable événementiel &middot; Groupe toulousain</figcaption>
      </figure>
    </div>
    <div class="btn-row btn-row--center">
      <a class="btn btn--outline-light" href="/temoignages/">Lire tous les témoignages</a>
    </div>
  </div>
</section>

<!-- ================================================= ZONE D INTERVENTION -->
<section class="section">
  <div class="wrap">
    <div class="zone-grid">
      <div class="reveal">
        <p class="eyebrow">Zone d’intervention</p>
        <h2>Basé à Toulouse, présent partout en France</h2>
        <p>
          L’ancrage est toulousain : la majorité des mariages se déroulent en Haute-Garonne,
          dans le Gers, le Tarn et l’Aude. Mais Léo se déplace toute l’année en France,
          et à l’étranger sur demande.
        </p>
        <p>
          Le déplacement est intégré au devis dès le premier chiffrage : pas de frais
          annexes découverts trois semaines avant la date.
        </p>
        <p><a class="link-arrow" href="/zone-intervention/">Voir la zone détaillée</a></p>
      </div>
      <div class="reveal">
        <h3 style="font-size:1.05rem;font-family:var(--sans);font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--ink-40);margin-bottom:1.5rem">Pages dédiées</h3>
        <ul class="city-list">
          <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
          <li><a href="/dj-mariage-bordeaux/">DJ mariage Bordeaux</a></li>
          <li><a href="/dj-mariage-montpellier/">DJ mariage Montpellier</a></li>
          <li><a href="/dj-mariage-paris/">DJ mariage Paris</a></li>
          <li><span>Albi &middot; Tarn</span></li>
          <li><span>Auch &middot; Gers</span></li>
          <li><span>Carcassonne &middot; Aude</span></li>
          <li><span>Agen &middot; Lot-et-Garonne</span></li>
          <li><span>Castres &middot; Tarn</span></li>
          <li><span>Montauban &middot; Tarn-et-Garonne</span></li>
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
        <summary>Combien coûte un DJ de mariage à Toulouse&nbsp;?</summary>
        <div class="faq__answer">
          <p>Une prestation de mariage complète démarre autour de 1&nbsp;200&nbsp;€ TTC et se situe le plus souvent entre 1&nbsp;500&nbsp;€ et 2&nbsp;500&nbsp;€ selon la durée, le nombre d’espaces à sonoriser et l’éclairage. Le devis est toujours détaillé ligne par ligne, déplacement inclus.</p>
        </div>
      </details>
      <details>
        <summary>Combien de temps à l’avance faut-il réserver&nbsp;?</summary>
        <div class="faq__answer">
          <p>Pour un samedi de juin à septembre, comptez douze à dix-huit mois. Les dates de haute saison partent très tôt. Hors saison, trois à six mois suffisent généralement.</p>
        </div>
      </details>
      <details>
        <summary>Le déplacement hors de Toulouse est-il facturé&nbsp;?</summary>
        <div class="faq__answer">
          <p>Il est inclus dans un rayon de 50&nbsp;km autour de Toulouse. Au-delà, il apparaît comme une ligne distincte du devis, calculée sur le trajet réel, avec l’hébergement quand la distance l’impose.</p>
        </div>
      </details>
      <details>
        <summary>Que se passe-t-il si le matériel tombe en panne&nbsp;?</summary>
        <div class="faq__answer">
          <p>Chaque prestation part avec un doublon des éléments critiques : contrôleur, table de mixage, ordinateur et câblage. Un basculement prend moins de deux minutes et reste inaudible pour vos invités.</p>
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
 "Donnez-nous la date et le lieu de votre événement : nous vous répondons sous 24 heures ouvrées, avec une proposition chiffrée si le créneau est disponible."

page_close
} | page_write "index.html"
