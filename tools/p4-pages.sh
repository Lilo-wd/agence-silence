#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# =============================================================== GALERIE ====
{
page_open \
 "Galerie — mariages et événements signés Agence Silence" \
 "Photos et vidéos de mariages, d’événements d’entreprise et de soirées privées sonorisés par Agence Silence, à Toulouse, en Occitanie et partout en France." \
 "/galerie/" "galerie-01.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Galerie|/galerie/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Galerie|/galerie/"
cat <<'HTML'
    <p class="eyebrow">Galerie</p>
    <h1>Mariages et événements signés Agence Silence</h1>
    <p class="lead">
      Des soirées réelles, photographiées par les photographes des mariés.
      Aucune image de banque, aucun néon.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="gallery reveal">
      <figure><img src="/assets/img/galerie-01.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Toulouse — ouverture de bal dans un domaine du Lauragais, Haute-Garonne"><figcaption>Mariage &middot; Lauragais, Haute-Garonne</figcaption></figure>
      <figure><img src="/assets/img/galerie-02.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Gers — piste de danse pleine en fin de soirée près d’Auch"><figcaption>Mariage &middot; Auch, Gers</figcaption></figure>
      <figure><img src="/assets/img/galerie-03.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Tarn — vin d’honneur sonorisé dans un château près d’Albi"><figcaption>Mariage &middot; Albi, Tarn</figcaption></figure>
      <figure class="is-wide"><img src="/assets/img/galerie-09.svg" loading="lazy" decoding="async" width="1400" height="933" alt="DJ mariage Bordeaux — soirée dansante dans un chai du Médoc, Gironde"><figcaption>Mariage &middot; Médoc, Gironde</figcaption></figure>
      <figure><img src="/assets/img/galerie-04.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ événementiel Toulouse — soirée de gala d’entreprise sonorisée par Agence Silence"><figcaption>Corporate &middot; Toulouse</figcaption></figure>
      <figure><img src="/assets/img/galerie-05.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Montpellier — cérémonie laïque en extérieur dans un mas de l’Hérault"><figcaption>Mariage &middot; Pic Saint-Loup, Hérault</figcaption></figure>
      <figure><img src="/assets/img/galerie-06.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Aude — fin de soirée dansante dans un domaine près de Carcassonne"><figcaption>Mariage &middot; Carcassonne, Aude</figcaption></figure>
      <figure class="is-wide"><img src="/assets/img/galerie-10.svg" loading="lazy" decoding="async" width="1400" height="933" alt="DJ mariage Paris — soirée dansante dans une orangerie des Yvelines"><figcaption>Mariage &middot; Yvelines, Île-de-France</figcaption></figure>
      <figure><img src="/assets/img/galerie-07.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ soirée privée Toulouse — anniversaire sonorisé dans une propriété de Haute-Garonne"><figcaption>Soirée privée &middot; Haute-Garonne</figcaption></figure>
      <figure><img src="/assets/img/galerie-08.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Lot-et-Garonne — installation son et lumière avant l’arrivée des invités près d’Agen"><figcaption>Mariage &middot; Agen, Lot-et-Garonne</figcaption></figure>
    </div>
    <p class="form-note" style="margin-top:2.5rem">
      Toutes les photographies sont publiées avec l’accord écrit des mariés et de leur photographe.
    </p>
  </div>
</section>

<!-- ============================================================== VIDEOS
     Pour ajouter une vidéo, remplacer ce bloc par une balise <video> locale :
     <video controls preload="none" poster="/assets/img/galerie-09.svg" width="1400" height="788">
       <source src="/assets/video/mariage-toulouse.mp4" type="video/mp4">
     </video>
     Ne pas utiliser d’iframe YouTube : cela ferait chuter le score Lighthouse. -->
HTML
bande_cta "Vous vous projetez&nbsp;?" "Dites-nous la date, le lieu et le nombre d’invités. Nous vous répondons sous 24 heures ouvrées."
page_close
} | page_write "galerie/index.html"


# =========================================================== TEMOIGNAGES ====
{
page_open \
 "Témoignages — avis des mariés sur Agence Silence, DJ Toulouse" \
 "Les avis des mariés et des entreprises sur les prestations d’Agence Silence : DJ mariage à Toulouse, en Occitanie et partout en France. Témoignages complets, publiés sur le site." \
 "/temoignages/" "galerie-02.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Témoignages|/temoignages/')</script>"
cat <<'HTML'
<!-- =====================================================================
     DONNEES STRUCTUREES AVIS — A ACTIVER UNIQUEMENT AVEC DE VRAIS AVIS

     Les témoignages ci-dessous sont des exemples de mise en page.
     Publier un balisage Review / AggregateRating sur de faux avis est une
     violation des regles Google sur les donnees structurees, sanctionnee par
     une action manuelle. Ne decommentez ce bloc qu'une fois les vrais avis
     de Leo integres, et alignez les valeurs sur les avis reellement affiches.

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "@id": "https://agence-silence.fr/#organisation",
  "name": "Agence Silence",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.9",
    "reviewCount": "63",
    "bestRating": "5"
  },
  "review": [{
    "@type": "Review",
    "author": { "@type": "Person", "name": "Prenom N." },
    "datePublished": "2025-06-21",
    "reviewRating": { "@type": "Rating", "ratingValue": "5", "bestRating": "5" },
    "reviewBody": "Texte exact de l avis, recopie sans modification."
  }]
}
</script>
     ===================================================================== -->
HTML
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Témoignages|/temoignages/"
cat <<'HTML'
    <p class="eyebrow">Témoignages</p>
    <h1>Ce que disent les mariés et les entreprises</h1>
    <p class="lead">
      Des retours complets, publiés ici et non renvoyés vers une page externe.
      Chaque témoignage précise le lieu et la date de l’événement.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="grid grid--2">
      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote>
          <p>Nous avions peur d’un DJ qui prenne le micro toutes les dix minutes. Léo n’a parlé que deux fois de la soirée, aux deux bons moments. Le reste du temps, il a simplement lu la salle. À 4 h du matin, il restait quarante personnes sur la piste.</p>
        </blockquote>
        <figcaption><strong>Camille &amp; Antoine</strong>Mariage &middot; Lauragais, Haute-Garonne &middot; Juin 2025</figcaption>
      </figure>

      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote>
          <p>Notre domaine avait un limiteur sonore réputé impossible. Léo est venu le repérer un mois avant, a échangé avec le régisseur, et a calé son système en conséquence. Aucune coupure de toute la nuit, alors que le mariage précédent en avait eu quatre.</p>
        </blockquote>
        <figcaption><strong>Léa &amp; Thomas</strong>Mariage &middot; Coteaux du nord toulousain &middot; Septembre 2025</figcaption>
      </figure>

      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote>
          <p>Mariage franco-britannique avec deux publics qui n’écoutent pas la même chose. Nous ne voyions pas comment ça pouvait fonctionner. Léo a construit la soirée par vagues, et personne n’a eu l’impression d’attendre son tour.</p>
        </blockquote>
        <figcaption><strong>Marie &amp; James</strong>Mariage &middot; Médoc, Gironde &middot; Août 2025</figcaption>
      </figure>

      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote>
          <p>Nous faisons appel à l’Agence Silence pour notre soirée annuelle depuis trois ans. Devis clair, facture conforme, attestation d’assurance envoyée sans qu’on la redemande, et zéro incident technique sur trois éditions. Pour un service événementiel, c’est rare.</p>
        </blockquote>
        <figcaption><strong>Sophie D.</strong>Responsable événementiel &middot; Groupe toulousain &middot; Décembre 2025</figcaption>
      </figure>

      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote>
          <p>Mariage entièrement en extérieur dans l’Hérault, avec un vent qui s’est levé vers 21 h. Léo avait prévu le repli, le matériel était bâché, et le basculement s’est fait sans que les invités ne s’en rendent compte.</p>
        </blockquote>
        <figcaption><strong>Chloé &amp; Nicolas</strong>Mariage &middot; Pic Saint-Loup, Hérault &middot; Juillet 2025</figcaption>
      </figure>

      <figure class="quote reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <blockquote>
          <p>Pour les 70 ans de mon père, je voulais autre chose qu’une enceinte posée dans un coin. Le repérage du jardin a servi&nbsp;: le son portait partout sans jamais gêner les conversations à table.</p>
        </blockquote>
        <figcaption><strong>Julien M.</strong>Soirée privée &middot; Haute-Garonne &middot; Mai 2025</figcaption>
      </figure>
    </div>

    <p class="form-note" style="margin-top:3rem">
      Ces témoignages sont des exemples de mise en page, en attente des avis réels de Léo.
      Ils devront être remplacés par les avis authentiques avant la mise en ligne.
    </p>
  </div>
</section>
HTML
bande_cta "Le prochain témoignage sera peut-être le vôtre" "Commencez par la question la plus simple : votre date est-elle libre&nbsp;?"
page_close
} | page_write "temoignages/index.html"


# ====================================================== ZONE INTERVENTION ====
{
page_open \
 "Zone d’intervention — DJ Toulouse, Occitanie, France" \
 "Agence Silence intervient à Toulouse, en Haute-Garonne et dans toute l’Occitanie, ainsi que partout en France et à l’étranger sur demande. Déplacement chiffré dès le devis." \
 "/zone-intervention/" "ville-toulouse.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Zone d’intervention|/zone-intervention/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Zone d’intervention|/zone-intervention/"
cat <<'HTML'
    <p class="eyebrow">Zone d’intervention</p>
    <h1>DJ à Toulouse, en Occitanie et dans toute la France</h1>
    <p class="lead">
      L’ancrage est toulousain, la couverture est nationale. Le déplacement est
      chiffré dès le premier devis, jamais ajouté après coup.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="zone-grid">
      <div class="reveal">
        <p class="eyebrow">Le cœur d’activité</p>
        <h2>Toulouse et les départements voisins</h2>
        <p>
          Environ trois quarts des mariages de la saison se déroulent à moins de deux heures
          de Toulouse. Sur ce périmètre, le repérage du lieu se fait sans supplément et
          souvent dès la signature du devis.
        </p>
        <h3 style="font-family:var(--sans);font-size:.9rem;font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40);margin-top:2.5rem">Sans frais de déplacement — 50 km autour de Toulouse</h3>
        <ul class="city-list" style="margin-top:1.25rem">
          <li><span>Toulouse</span></li><li><span>Blagnac</span></li>
          <li><span>Colomiers</span></li><li><span>Tournefeuille</span></li>
          <li><span>Balma</span></li><li><span>Muret</span></li>
          <li><span>Castanet-Tolosan</span></li><li><span>Ramonville</span></li>
          <li><span>Grenade</span></li><li><span>Villefranche-de-Lauragais</span></li>
        </ul>
        <h3 style="font-family:var(--sans);font-size:.9rem;font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40);margin-top:2.5rem">Occitanie et Sud-Ouest</h3>
        <ul class="city-list" style="margin-top:1.25rem">
          <li><span>Albi &middot; Tarn</span></li><li><span>Castres &middot; Tarn</span></li>
          <li><span>Auch &middot; Gers</span></li><li><span>Condom &middot; Gers</span></li>
          <li><span>Carcassonne &middot; Aude</span></li><li><span>Narbonne &middot; Aude</span></li>
          <li><span>Agen &middot; Lot-et-Garonne</span></li><li><span>Montauban &middot; Tarn-et-Garonne</span></li>
          <li><span>Cahors &middot; Lot</span></li><li><span>Rodez &middot; Aveyron</span></li>
          <li><span>Foix &middot; Ariège</span></li><li><span>Tarbes &middot; Hautes-Pyrénées</span></li>
          <li><span>Pau &middot; Pyrénées-Atlantiques</span></li><li><span>Perpignan &middot; Pyrénées-Orientales</span></li>
        </ul>
      </div>

      <div class="reveal">
        <p class="eyebrow">Au-delà</p>
        <h2>Partout en France</h2>
        <p>
          Léo se déplace toute l’année sur l’ensemble du territoire, et à l’étranger sur
          demande (Espagne, Italie, Portugal notamment). Au-delà de deux heures de route,
          il arrive systématiquement la veille&nbsp;: aucune prestation ne démarre après
          une longue conduite.
        </p>
        <h3 style="font-family:var(--sans);font-size:.9rem;font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40);margin-top:2.5rem">Pages dédiées</h3>
        <ul class="city-list" style="margin-top:1.25rem;columns:1">
          <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse</a></li>
          <li><a href="/dj-mariage-bordeaux/">DJ mariage Bordeaux</a></li>
          <li><a href="/dj-mariage-montpellier/">DJ mariage Montpellier</a></li>
          <li><a href="/dj-mariage-paris/">DJ mariage Paris</a></li>
        </ul>

        <div class="card" style="margin-top:2.5rem;background:var(--ecru-deep);border-color:var(--line)">
          <h3>Comment le déplacement est facturé</h3>
          <p><strong>0 à 50 km de Toulouse :</strong> inclus dans la prestation.</p>
          <p><strong>50 à 200 km :</strong> une ligne « déplacement » calculée sur le trajet réel.</p>
          <p><strong>Au-delà de 200 km :</strong> forfait unique couvrant trajet, transport du matériel et hébergement de la veille. Montant fixé au devis, sans révision.</p>
        </div>
      </div>
    </div>
  </div>
</section>
HTML
bande_cta "Où se déroule votre événement&nbsp;?" "Quel que soit le département, commencez par vérifier la disponibilité de votre date."
page_close
} | page_write "zone-intervention/index.html"


# =================================================================== FAQ ====
{
page_open \
 "FAQ — tarifs, matériel, déplacement et réservation d’un DJ" \
 "Toutes les réponses avant de réserver un DJ : tarifs d’un DJ de mariage à Toulouse, délai de réservation, matériel, déplacement, SACEM, acompte et annulation." \
 "/faq/" "prestation-mariage.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'FAQ|/faq/')</script>"
cat <<'HTML'
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "Combien coûte un DJ de mariage à Toulouse ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Une prestation de mariage complète démarre autour de 1 200 € TTC et se situe le plus souvent entre 1 500 € et 2 500 € selon la durée, le nombre d’espaces à sonoriser et l’éclairage souhaité. Le devis est détaillé ligne par ligne, déplacement inclus." } },
    { "@type": "Question", "name": "Combien de temps à l’avance faut-il réserver un DJ de mariage ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Pour un samedi entre juin et septembre, il faut compter douze à dix-huit mois. Les dates de haute saison sont réservées très tôt. Hors saison, trois à six mois suffisent généralement." } },
    { "@type": "Question", "name": "Le déplacement hors de Toulouse est-il facturé ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Le déplacement est inclus dans un rayon de 50 km autour de Toulouse. Entre 50 et 200 km, il apparaît comme une ligne distincte calculée sur le trajet réel. Au-delà de 200 km, un forfait unique couvre le trajet, le transport du matériel et l’hébergement de la veille." } },
    { "@type": "Question", "name": "Quel matériel de sonorisation est utilisé ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Un système d’enceintes actives dimensionné selon la salle, avec caissons de basses dédiés, complété par un éclairage LED architectural. Les éléments critiques — contrôleur, table de mixage, ordinateur, câblage — sont doublés sur chaque prestation." } },
    { "@type": "Question", "name": "Que se passe-t-il en cas de panne de matériel ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Un doublon des éléments critiques est présent sur chaque prestation. Le basculement prend moins de deux minutes et reste inaudible pour les invités." } },
    { "@type": "Question", "name": "Faut-il déclarer la SACEM pour un mariage ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Oui, la diffusion de musique lors d’un événement privé avec prestataire fait l’objet d’une déclaration SACEM. Elle incombe à l’organisateur de l’événement. Nous vous indiquons la procédure et les éléments à fournir." } },
    { "@type": "Question", "name": "Quel acompte faut-il verser pour réserver une date ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Un acompte de 30 % à la signature du contrat bloque définitivement la date. Le solde est réglé le jour de l’événement pour les particuliers, à trente jours pour les entreprises." } },
    { "@type": "Question", "name": "Peut-on choisir les musiques du mariage ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Oui. Une liste de morceaux souhaités et une liste de morceaux à éviter sont construites avec vous lors du rendez-vous de préparation. Les demandes des invités le jour J sont acceptées si elles servent la soirée." } },
    { "@type": "Question", "name": "Le DJ prend-il le micro pendant la soirée ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Uniquement aux moments convenus avec vous : annonce de l’entrée des mariés, ouverture de bal, pièce montée. Agence Silence n’assure pas de rôle d’animateur." } },
    { "@type": "Question", "name": "Que se passe-t-il en cas d’annulation ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Les conditions figurent au contrat. En cas de report pour cause de force majeure, la date est transférée sans frais sous réserve de disponibilité, et l’acompte reste acquis à la nouvelle date." } }
  ]
}
</script>
HTML
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "FAQ|/faq/"
cat <<'HTML'
    <p class="eyebrow">Questions fréquentes</p>
    <h1>Tout ce qu’il faut savoir avant de réserver un DJ</h1>
    <p class="lead">
      Tarifs, délais, matériel, déplacement, SACEM et conditions d’annulation.
      Si votre question n’y figure pas, elle mérite un appel.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <h2 style="margin-bottom:1.75rem">Tarifs et réservation</h2>
    <div class="faq reveal" style="margin-bottom:4rem">
      <details><summary>Combien coûte un DJ de mariage à Toulouse&nbsp;?</summary><div class="faq__answer"><p>Une prestation de mariage complète démarre autour de 1&nbsp;200&nbsp;€ TTC et se situe le plus souvent entre 1&nbsp;500&nbsp;€ et 2&nbsp;500&nbsp;€ selon la durée, le nombre d’espaces à sonoriser et l’éclairage souhaité.</p><p>Le devis est détaillé ligne par ligne, déplacement inclus. Le montant du devis est celui de la facture&nbsp;: il n’y a pas d’option ajoutée en cours de route.</p></div></details>
      <details><summary>Combien de temps à l’avance faut-il réserver&nbsp;?</summary><div class="faq__answer"><p>Pour un samedi entre juin et septembre, comptez douze à dix-huit mois. Les dates de haute saison partent très tôt, souvent avant même que le lieu de réception ne soit confirmé.</p><p>Hors saison, trois à six mois suffisent généralement. Une demande à trois semaines n’est jamais absurde&nbsp;: il arrive qu’une date se libère.</p></div></details>
      <details><summary>Quel acompte faut-il verser&nbsp;?</summary><div class="faq__answer"><p>Un acompte de 30&nbsp;% à la signature du contrat bloque définitivement la date. Le solde est réglé le jour de l’événement pour les particuliers, à trente jours après l’événement pour les entreprises.</p></div></details>
      <details><summary>Que se passe-t-il en cas d’annulation ou de report&nbsp;?</summary><div class="faq__answer"><p>Les conditions figurent noir sur blanc au contrat. En cas de report pour cause de force majeure, la date est transférée sans frais sous réserve de disponibilité, et l’acompte reste acquis à la nouvelle date.</p></div></details>
    </div>

    <h2 style="margin-bottom:1.75rem">Matériel et technique</h2>
    <div class="faq reveal" style="margin-bottom:4rem">
      <details><summary>Quel matériel de sonorisation est utilisé&nbsp;?</summary><div class="faq__answer"><p>Un système d’enceintes actives dimensionné selon la salle — de deux à six points de diffusion — avec caissons de basses dédiés, et un éclairage LED architectural qui met en valeur le lieu.</p><p>Aucun laser ni stroboscope, sauf demande explicite de votre part.</p></div></details>
      <details><summary>Que se passe-t-il si le matériel tombe en panne&nbsp;?</summary><div class="faq__answer"><p>Les éléments critiques — contrôleur, table de mixage, ordinateur, alimentation, câblage — sont doublés sur chaque prestation, sans supplément. Le basculement prend moins de deux minutes et reste inaudible pour vos invités.</p></div></details>
      <details><summary>Notre lieu a un limiteur sonore, est-ce un problème&nbsp;?</summary><div class="faq__answer"><p>Non, à condition de le savoir en amont. Nous relevons le modèle et le seuil lors du repérage, puis calibrons le système en conséquence. Un limiteur bien anticipé ne coupe jamais.</p></div></details>
      <details><summary>Faut-il prévoir une alimentation électrique particulière&nbsp;?</summary><div class="faq__answer"><p>Une simple prise 16&nbsp;A dédiée suffit dans la grande majorité des cas. Pour les lieux atypiques — grange, jardin, propriété isolée — le point est fait au repérage, avec le loueur de groupe électrogène si nécessaire.</p></div></details>
    </div>

    <h2 style="margin-bottom:1.75rem">Déroulé et musique</h2>
    <div class="faq reveal" style="margin-bottom:4rem">
      <details><summary>Peut-on choisir les musiques&nbsp;?</summary><div class="faq__answer"><p>Oui. Une liste de morceaux souhaités et — tout aussi important — une liste de morceaux à éviter sont construites avec vous lors du rendez-vous de préparation.</p><p>Les demandes des invités le jour J sont acceptées quand elles servent la soirée. C’est le rôle du DJ d’arbitrer.</p></div></details>
      <details><summary>Le DJ prend-il le micro&nbsp;?</summary><div class="faq__answer"><p>Uniquement aux moments convenus avec vous&nbsp;: annonce de l’entrée des mariés, ouverture de bal, pièce montée. Agence Silence n’assure pas de rôle d’animateur, et n’intervient jamais entre deux morceaux.</p></div></details>
      <details><summary>Jusqu’à quelle heure la soirée peut-elle durer&nbsp;?</summary><div class="faq__answer"><p>Cela dépend de votre lieu et de l’arrêté municipal applicable. La plupart des domaines autorisent la musique amplifiée jusqu’à 3&nbsp;h ou 4&nbsp;h. L’heure limite figure au devis.</p></div></details>
      <details><summary>Assurez-vous la cérémonie laïque&nbsp;?</summary><div class="faq__answer"><p>Oui, elle est incluse dans la formule Journée&nbsp;: sonorisation en extérieur, micros HF pour l’officiant et les témoins, entrées et sorties musicales calées au signal.</p></div></details>
    </div>

    <h2 style="margin-bottom:1.75rem">Déplacement et administratif</h2>
    <div class="faq reveal">
      <details><summary>Le déplacement hors de Toulouse est-il facturé&nbsp;?</summary><div class="faq__answer"><p>Il est inclus dans un rayon de 50&nbsp;km autour de Toulouse. Entre 50 et 200&nbsp;km, il apparaît comme une ligne distincte du devis, calculée sur le trajet réel. Au-delà, un forfait unique couvre trajet, transport du matériel et hébergement de la veille.</p><p><a href="/zone-intervention/">Voir la zone d’intervention détaillée</a></p></div></details>
      <details><summary>Intervenez-vous à l’étranger&nbsp;?</summary><div class="faq__answer"><p>Oui, sur demande, principalement en Espagne, en Italie et au Portugal. Le devis intègre alors le transport du matériel et les contraintes douanières éventuelles.</p></div></details>
      <details><summary>Faut-il déclarer la SACEM&nbsp;?</summary><div class="faq__answer"><p>Oui. La diffusion de musique lors d’un événement privé avec prestataire fait l’objet d’une déclaration SACEM, qui incombe à l’organisateur. Nous vous indiquons la procédure et les éléments à fournir.</p></div></details>
      <details><summary>Êtes-vous assuré&nbsp;?</summary><div class="faq__answer"><p>Oui, responsabilité civile professionnelle. L’attestation est fournie sur simple demande&nbsp;: la plupart des domaines et des lieux de réception l’exigent avant votre événement.</p></div></details>
    </div>
  </div>
</section>
HTML
bande_cta "Une question qui n’est pas ici&nbsp;?" "Posez-la directement. Léo répond lui-même, sous 24 heures ouvrées."
page_close
} | page_write "faq/index.html"


# =============================================================== CONTACT ====
{
page_open \
 "Contact &amp; devis — DJ mariage Toulouse, Agence Silence" \
 "Vérifiez la disponibilité de votre date et demandez un devis à Agence Silence, DJ mariage et événementiel à Toulouse. Réponse sous 24 heures ouvrées." \
 "/contact/" "prestation-mariage.svg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Contact|/contact/')</script>"
cat <<JSON
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ContactPage",
  "url": "$SITE/contact/",
  "mainEntity": {
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
      "addressRegion": "Occitanie",
      "addressCountry": "FR"
    }
  }
}
</script>
JSON
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Contact|/contact/"
cat <<'HTML'
    <p class="eyebrow">Contact</p>
    <h1>Vérifier ma date et demander un devis</h1>
    <p class="lead">
      Une réponse sous 24 heures ouvrées, avec la disponibilité de votre date
      et une proposition chiffrée si le créneau est libre.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <h2 style="margin-bottom:2rem">Votre demande</h2>

        <!-- FORMULAIRE
             Remplacer l'attribut action par votre endpoint reel :
             - Formspree : https://formspree.io/f/xxxxxxxx
             - Netlify Forms : action="/contact/" + attribut netlify sur le <form>
             Tant que "VOTRE_ID" est present, le JS affiche un message
             invitant a passer par le telephone plutot que de perdre la demande. -->
        <form data-devis-form action="https://formspree.io/f/VOTRE_ID" method="POST" novalidate>
          <div class="form-grid">
            <div class="field">
              <label for="prenom">Prénom <span class="req">*</span></label>
              <input type="text" id="prenom" name="prenom" autocomplete="given-name" required>
            </div>
            <div class="field">
              <label for="nom">Nom <span class="req">*</span></label>
              <input type="text" id="nom" name="nom" autocomplete="family-name" required>
            </div>
            <div class="field">
              <label for="email">E-mail <span class="req">*</span></label>
              <input type="email" id="email" name="email" autocomplete="email" required>
            </div>
            <div class="field">
              <label for="tel">Téléphone</label>
              <input type="tel" id="tel" name="telephone" autocomplete="tel">
            </div>
            <div class="field">
              <label for="type">Type d’événement <span class="req">*</span></label>
              <select id="type" name="type_evenement" required>
                <option value="">Choisir…</option>
                <option>Mariage</option>
                <option>Événement d’entreprise</option>
                <option>Soirée privée</option>
                <option>Autre</option>
              </select>
            </div>
            <div class="field">
              <label for="date">Date de l’événement <span class="req">*</span></label>
              <input type="date" id="date" name="date_evenement" required>
            </div>
            <div class="field">
              <label for="lieu">Lieu ou ville <span class="req">*</span></label>
              <input type="text" id="lieu" name="lieu" placeholder="Domaine, château, ville…" required>
            </div>
            <div class="field">
              <label for="invites">Nombre d’invités</label>
              <input type="number" id="invites" name="nombre_invites" min="1" max="2000" inputmode="numeric">
            </div>
            <div class="field field--full">
              <label for="message">Votre projet</label>
              <textarea id="message" name="message" placeholder="Le déroulé envisagé, l’ambiance recherchée, vos contraintes de lieu…"></textarea>
              <p class="field__hint">Plus votre message est précis, plus le devis le sera.</p>
            </div>
            <!-- piege a robots : invisible pour les humains -->
            <p style="position:absolute;left:-9999px" aria-hidden="true">
              <label for="site-web">Ne pas remplir</label>
              <input type="text" id="site-web" name="_gotcha" tabindex="-1" autocomplete="off">
            </p>
            <div class="consent">
              <input type="checkbox" id="rgpd" name="consentement_rgpd" required>
              <label for="rgpd" style="font-size:.88rem;letter-spacing:0;text-transform:none;font-weight:400;color:var(--ink-60)">
                J’accepte que mes données soient utilisées pour traiter ma demande de devis. <span class="req">*</span>
              </label>
            </div>
          </div>

          <div class="btn-row">
            <button class="btn" type="submit">Envoyer ma demande</button>
          </div>
          <p class="form-status" data-form-status hidden role="status" aria-live="polite"></p>
          <p class="form-note">
            Vos coordonnées ne servent qu’à répondre à cette demande. Aucune donnée
            n’est transmise à un tiers ni utilisée à des fins commerciales.
          </p>
        </form>
      </div>

      <div class="reveal">
        <h2 style="margin-bottom:2rem">Directement</h2>
        <!-- NAP : identique au footer et a la fiche Google Business Profile -->
        <dl class="contact-block">
          <dt>Téléphone</dt>
          <dd><a href="tel:+33612345678">06 12 34 56 78</a></dd>
          <dt>E-mail</dt>
          <dd><a href="mailto:contact@agence-silence.fr">contact@agence-silence.fr</a></dd>
          <dt>Adresse</dt>
          <dd>Agence Silence<br>12 rue de la Pomme<br>31000 Toulouse</dd>
          <dt>Disponibilité</dt>
          <dd>Du lundi au samedi, 9 h – 19 h</dd>
        </dl>

        <div class="card" style="margin-top:2.75rem;background:var(--ecru-deep);border-color:var(--line)">
          <h3>Ce qui accélère la réponse</h3>
          <p style="font-size:.95rem">La <strong>date exacte</strong>, le <strong>lieu de réception</strong> et le <strong>nombre d’invités</strong>. Avec ces trois éléments, le devis part souvent dans la journée.</p>
        </div>

        <div class="card" style="margin-top:1.25rem">
          <h3>Haute saison</h3>
          <p style="font-size:.95rem">De mai à septembre, Léo est en prestation le week-end. Une demande envoyée le samedi reçoit sa réponse le lundi.</p>
        </div>
      </div>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "contact/index.html"


# ======================================================== MENTIONS LEGALES ==
{
page_open \
 "Mentions légales — Agence Silence" \
 "Mentions légales, éditeur, hébergeur et politique de confidentialité du site de l’Agence Silence, DJ événementiel à Toulouse." \
 "/mentions-legales/" "prestation-corporate.svg"
cat <<'HTML'
<meta name="robots" content="noindex, follow">
HTML
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Mentions légales|/mentions-legales/"
cat <<'HTML'
    <p class="eyebrow">Informations légales</p>
    <h1>Mentions légales</h1>
  </div>
</section>

<section class="section">
  <div class="wrap wrap--narrow">
    <div class="prose">
      <!-- A COMPLETER avec les informations reelles de l entreprise de Leo -->
      <p style="background:var(--lavande-pale);border-left:2px solid var(--lavande);padding:1rem 1.25rem">
        <strong>À compléter</strong> avec les informations réelles de l’entreprise&nbsp;:
        raison sociale, statut juridique, SIRET, numéro de TVA, adresse du siège et
        nom du directeur de la publication.
      </p>

      <h2 class="mt-0">Éditeur du site</h2>
      <p>
        Agence Silence<br>
        12 rue de la Pomme, 31000 Toulouse, France<br>
        Téléphone&nbsp;: <a href="tel:+33612345678">06 12 34 56 78</a><br>
        E-mail&nbsp;: <a href="mailto:contact@agence-silence.fr">contact@agence-silence.fr</a><br>
        SIRET&nbsp;: [à compléter] &mdash; TVA intracommunautaire&nbsp;: [à compléter]<br>
        Directeur de la publication&nbsp;: [à compléter]
      </p>

      <h2>Hébergement</h2>
      <p>
        Le site est hébergé par Netlify, Inc., 512 2nd Street, Suite 200,
        San Francisco, CA 94107, États-Unis.
      </p>

      <h2>Propriété intellectuelle</h2>
      <p>
        L’ensemble des contenus du site — textes, photographies, identité visuelle
        et code — est protégé par le droit d’auteur. Les photographies publiées
        dans la galerie le sont avec l’accord des mariés et de leurs photographes,
        et restent la propriété de ces derniers.
      </p>

      <h2>Données personnelles</h2>
      <p>
        Les données transmises via le formulaire de contact — nom, prénom, e-mail,
        téléphone, date, lieu et description de l’événement — sont utilisées
        exclusivement pour répondre à votre demande de devis. Elles ne sont ni
        cédées, ni louées, ni transmises à un tiers à des fins commerciales.
      </p>
      <p>
        Elles sont conservées trois ans à compter du dernier contact. Conformément
        au RGPD, vous disposez d’un droit d’accès, de rectification, d’effacement,
        de limitation et d’opposition&nbsp;: écrivez à
        <a href="mailto:contact@agence-silence.fr">contact@agence-silence.fr</a>.
        Vous pouvez également introduire une réclamation auprès de la CNIL.
      </p>

      <h2>Cookies</h2>
      <p>
        Ce site ne dépose aucun cookie de mesure d’audience, de publicité ou de
        traçage. Aucun bandeau de consentement n’est donc nécessaire.
      </p>

      <h2>Accessibilité</h2>
      <p>
        Le site est conçu pour rester utilisable au clavier, avec un contraste
        conforme aux recommandations WCAG&nbsp;AA et un contenu intégralement
        lisible sans JavaScript. Si vous rencontrez une difficulté d’accès,
        signalez-la à <a href="mailto:contact@agence-silence.fr">contact@agence-silence.fr</a>.
      </p>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "mentions-legales/index.html"


# ================================================================== 404 ====
{
page_open "Page introuvable — Agence Silence" "La page demandée n’existe pas ou a été déplacée." "/404.html" "hero-mariage.svg"
echo '<meta name="robots" content="noindex, follow">'
page_head_close
cat <<'HTML'
<section class="page-hero" style="text-align:center">
  <div class="wrap">
    <p class="eyebrow" style="justify-content:center">Erreur 404</p>
    <h1 style="max-width:22ch;margin-inline:auto">Cette page a quitté la piste</h1>
    <p class="lead" style="margin-inline:auto">
      L’adresse demandée n’existe pas ou a été déplacée. Voici par où reprendre.
    </p>
    <div class="btn-row btn-row--center">
      <a class="btn" href="/">Retour à l’accueil</a>
      <a class="btn btn--ghost" href="/contact/">Vérifier ma date</a>
    </div>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="grid grid--3">
      <article class="card"><h3>Prestations</h3><p>Mariage, entreprise, soirée privée.</p><a class="link-arrow" href="/prestations/">Voir</a></article>
      <article class="card"><h3>Galerie</h3><p>Les soirées déjà signées.</p><a class="link-arrow" href="/galerie/">Voir</a></article>
      <article class="card"><h3>Zone d’intervention</h3><p>Toulouse et toute la France.</p><a class="link-arrow" href="/zone-intervention/">Voir</a></article>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "404.html"
