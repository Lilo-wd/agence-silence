#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# =============================================================== GALERIE ====
{
page_open \
 "Galerie — mariages et événements signés Agence Silence" \
 "Photos et vidéos des mariages, événements d’entreprise et soirées privées animés par l’Agence Silence en Haute-Garonne, dans le Tarn et l’Aude." \
 "/galerie/" "og-agence-silence.jpg"
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
      Mariages, événements d’entreprise et soirées privées, en région toulousaine et au-delà.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <!-- Visuels provisoires : a remplacer par les photos de Leo (questionnaire,
         section 13). Adapter les alt a ce que montre reellement chaque photo. -->
    <div class="gallery reveal">
      <figure><img src="/assets/img/galerie-01.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Toulouse — ouverture de bal en Haute-Garonne"><figcaption>Mariage &middot; Haute-Garonne</figcaption></figure>
      <figure><img src="/assets/img/galerie-02.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Castres — piste de danse pleine dans le Tarn"><figcaption>Mariage &middot; Tarn</figcaption></figure>
      <figure><img src="/assets/img/galerie-03.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Ramonville — soirée dansante près de Toulouse"><figcaption>Mariage &middot; Ramonville</figcaption></figure>
      <figure class="is-wide"><img src="/assets/img/galerie-09.svg" loading="lazy" decoding="async" width="1400" height="933" alt="DJ mariage Toulouse — piste de danse dans un domaine de Haute-Garonne"><figcaption>Mariage &middot; Toulouse</figcaption></figure>
      <figure><img src="/assets/img/galerie-04.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ événementiel Toulouse — soirée de gala d’entreprise sonorisée par Agence Silence"><figcaption>Événement d’entreprise</figcaption></figure>
      <figure><img src="/assets/img/galerie-05.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Toulouse — cérémonie laïque sonorisée"><figcaption>Cérémonie laïque</figcaption></figure>
      <figure><img src="/assets/img/galerie-06.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Aude — fin de soirée dansante"><figcaption>Mariage &middot; Aude</figcaption></figure>
      <figure class="is-wide"><img src="/assets/img/galerie-10.svg" loading="lazy" decoding="async" width="1400" height="933" alt="DJ mariage Castres — ouverture de bal avec fumée lourde"><figcaption>Ouverture de bal</figcaption></figure>
      <figure><img src="/assets/img/galerie-07.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ soirée privée Toulouse — anniversaire sonorisé en Haute-Garonne"><figcaption>Soirée privée</figcaption></figure>
      <figure><img src="/assets/img/galerie-08.svg" loading="lazy" decoding="async" width="900" height="1200" alt="DJ mariage Toulouse — photobooth vintage lors d’un mariage"><figcaption>Photobooth</figcaption></figure>
    </div>
  </div>
</section>

<!-- ============================================================== VIDEOS
     Leo dispose d'extraits de 20 s a 2 min en MP4 4K. Les reencoder en 1080p
     (quelques Mo) avant de les ajouter ici, en balise <video> locale :
     <video controls preload="none" poster="/assets/img/..." width="1920" height="1080">
       <source src="/assets/video/mariage-toulouse.mp4" type="video/mp4">
     </video>
     Pas d'iframe YouTube : score Lighthouse et politique de securite (CSP). -->
HTML
bande_cta "Vous vous projetez&nbsp;?" "Dites-nous la date, le lieu et le nombre d’invités. Nous vous répondons sous 24 heures."
page_close
} | page_write "galerie/index.html"


# =========================================================== TEMOIGNAGES ====
{
page_open \
 "Avis des mariés — Agence Silence, DJ mariage Toulouse" \
 "Les avis des mariés sur l’Agence Silence : 4,9/5 sur 59 avis Mariages.net et trois Wedding Awards. Une sélection d’avis reproduits en entier." \
 "/temoignages/" "og-agence-silence.jpg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Témoignages|/temoignages/')</script>"
cat <<'HTML'
<!-- Pas de balisage Review / AggregateRating sur cette page, volontairement.
     1. Les avis portent sur l'entreprise qui publie le site : Google n'affiche
        pas d'etoiles pour ces avis « auto-publies » (LocalBusiness/Organization).
     2. Ils proviennent de Mariages.net ; les consignes de Google demandent de
        ne pas reprendre dans son balisage des avis collectes sur un autre site.
     Les etoiles dans Google viendront de la fiche Google Business Profile. -->
HTML
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Témoignages|/temoignages/"
cat <<'HTML'
    <p class="eyebrow">Témoignages</p>
    <h1>Les avis des mariés</h1>
    <p class="lead">
      4,9&nbsp;sur&nbsp;5 sur 59 avis Mariages.net, et trois Wedding Awards (2024, 2025, 2026).
      Voici une sélection de huit avis, reproduits en entier tels que leurs auteurs les ont
      écrits, avec leur accord.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap wrap--narrow">
    <div class="grid" style="gap:1.5rem">

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Merci à l’agence pour cette prestation&nbsp;:)</p>
        <blockquote>
          <p>Nous avons été très contents de la prestation pour notre mariage<br>
          Léo est très réactif et à l’écoute.<br>
          Mention spéciale à Laurie (azla) qui a mis le feu à la soirée<br>
          Sans regret pour le choix de ce prestataire qui propose plusieurs options<br>
          À recommander sans hésiter&nbsp;!</p>
        </blockquote>
        <figcaption><strong>Serbellone</strong>Mariage du 5 septembre 2026</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Super prestataire&nbsp;!</p>
        <blockquote>
          <p>Nous avons fait appel à l’agence de Léo pour notre mariage, un succès&nbsp;! Très à l’écoute de nos gouts musicaux, Laurie a sû capter l’attention de nos invités du vin d’honneur à la soirée, dynamisant des moments clés de notre mariage. L’ambiance de la soirée était au rendez-vous, un grand MERCI à eux.</p>
        </blockquote>
        <figcaption><strong>Mathilde</strong>Mariage du 27 juin 2026</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Mariage 23/05/2026</p>
        <blockquote>
          <p>Nous avons beaucoup apprécié travailler avec Léo pour notre mariage. Professionnel et à l’écoute, les préparatifs se sont bien passés grâce à son accompagnement sur la partie DJ.</p>
          <p>Nous avons eu le plaisir d’avoir Romain aux platines du vin d’honneur jusqu’au lever du soleil. Très discret et à l’écoute, nous avons passé la meilleure soirée de notre vie et c’est en partie grâce à ses qualités de DJ mais aussi sa flexibilité et sa gentillesse. C’est sans hésitation que nous solliciterons à nouveau l’agence Silence pour de futurs événements&nbsp;!</p>
          <p>Emilie et Raphaël</p>
        </blockquote>
        <figcaption><strong>Emilie</strong>Mariage du 23 mai 2026</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Léo, un allié précieux pour la réussite de votre mariage&nbsp;!</p>
        <blockquote>
          <p>J’adore danser, donc le DJ était pour moi le choix de prestataire le plus critique pour mon mariage. Mais le talent de Léo ne s’arrête pas à la piste de danse. Il a été une pièce maîtresse de l’ensemble de notre mariage&nbsp;:</p>
          <ul>
            <li>Il a conseillé et rassuré nos témoins et amis intervenant lors de notre cérémonie laïque, avec beaucoup de bienveillance</li>
            <li>Il a géré avec nos témoins le timing et le déroulé de l’ensemble de la journée</li>
            <li>Il a fourni tout le matériel audio et vidéo pour les animations prévues par nos témoins. Il s’est aussi démené pour que le photobooth ne manque jamais de papier, malgré un grand nombre d’impressions…</li>
            <li>Et bien sûr, il nous a assuré une piste de danse pleine du début à la fin, faisant danser toutes les générations tout en s’adaptant à nos goûts.</li>
          </ul>
          <p>Et tout cela avec un grand professionnalisme, mais aussi tout en gentillesse et sourire, c’était un vrai plaisir&nbsp;! Tous nos invités étaient ravis et nous les premiers&nbsp;!</p>
          <p>Bref, je ne peux que recommander Léo et, si un jour je dois à nouveau faire appel à un DJ, j’espèrerai très fort qu’il soit disponible&nbsp;!</p>
        </blockquote>
        <figcaption><strong>Sabrina</strong>Mariage du 15 mai 2026</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Une ambiance de folie&nbsp;!</p>
        <blockquote>
          <p>Grâce à Léo et Laurie nous avons eu une ambiance de fou pour notre soirée de mariage.<br>
          La piste de danse est restée full jusqu’au petit matin, avec des convives plus déchainés les uns que les autres.<br>
          Notre choix d’avoir pris Léo et son équipe pour ambiancer notre soirée de mariage à clairement été l’un des meilleurs choix.<br>
          Du photobooth au téléphone d’or en passant par la musique, tout a été parfait.<br>
          Merci pour tout Léo et Laurie, on espère avoir l’occasion de refaire appel à vous pour d’autres événements&nbsp;!</p>
          <p>Charline et Gilles.</p>
        </blockquote>
        <figcaption><strong>Charline</strong>Mariage du 18 octobre 2025</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Un DJ au top</p>
        <blockquote>
          <p>Nous avons engagé Léo comme DJ pour notre mariage le 13/09/25.<br>
          Nous recommandons Léo, il est très pro et fait un super travail.<br>
          Le choix du DJ est très important pour l’ambiance d’un mariage et nous avons fait le bon choix.<br>
          Merci pour ta gentillesse, ton écoute et ton accompagnement depuis la cérémonie laïque jusqu’à la soirée.<br>
          Nous avons dansé jusqu’à l’heure de fermeture sans arrêt&nbsp;! Une soirée inoubliable grâce à Léo.</p>
        </blockquote>
        <figcaption><strong>Audrey</strong>Mariage du 13 septembre 2025</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Merci&nbsp;!!!!</p>
        <blockquote>
          <p>Léo, merci infiniment pour ta disponibilité, ton écoute, ta gentillesse et ta patience tout au long de la préparation. Et un immense merci à Laurie, présente le jour J, qui a littéralement mis le feu à la piste&nbsp;! Toujours souriante, à l’écoute et pleine d’énergie, elle a réussi à me faire danser sans m’arrêter pendant 4 heures. Tout était incroyable&nbsp;! Je voulais absolument éviter les DJs qui enchaînent animations lourdes et musiques banales&nbsp;: je cherchais un vrai DJ capable de créer une ambiance et de faire danser tout le monde. Pari réussi&nbsp;! Laurie a su adapter les styles musicaux selon les invités présents sur la piste, et le résultat a dépassé toutes nos attentes. Nos proches n’arrivaient plus à quitter la piste de danse tant l’ambiance était parfaite. Un souvenir inoubliable, merci encore à vous deux&nbsp;!</p>
        </blockquote>
        <figcaption><strong>Margaux</strong>Mariage du 6 septembre 2025</figcaption>
      </figure>

      <figure class="quote quote--long reveal">
        <p class="stars" aria-label="Note de 5 sur 5">&#9733;&#9733;&#9733;&#9733;&#9733;</p>
        <p class="quote__titre">Mémorable&nbsp;!</p>
        <blockquote>
          <p>Léo est une personne agréable, souriant et disponible des le premier contact. Il est extrement peofessionnel et maîtrise le déroulement des mariages à la perfection. Il a su gerer toutes nos attentes et surtout tout mon stress et mes angoisses ce qui n’était pas gagné. Il propose une offre complète… et un large panel d’option qui nous a ravi et nous a permis de ne pas faire appel à d’autre prestataires.. Comme le livre d’or audio et le photobooth. Son photobooth sort de l’ordinaire, se fond dans le décor amenant une touche personnalisée, vintage et tres classe. Le matériel est haut de gamme, le son est parfait, le jeu de lumière et création d’ambiance etait exactement comme nous l’avons imaginé. Pour l’ouverture de bal nous avons eu un vrai tapis de fumée au sol. Nous avons déjà été à des mariages où la fumée au sol etait succinct mais avec Léo nous avons compris pourquoi. Il a demandé à obtenir les conditions favorables avant de lancer l’ouverture de bal afin qu’on puisse avoir cet effet de fumée à la perfection. Ça en dit long sur son professionnalisme jusqu’au moindre détails. Il a été présent de la cérémonie laïque à la fin de soirée. A la ceremonie laique il fut d’une aide précieuse pour notre officiante tant pour le déroulement, le matériel, la musique mais aussi par sa qualité professionnelle et humaine pour aider et gerer les imprévus qui ont déstabiliser notre officiante (amie)</p>
          <p>Il a ete présent pour les temoins et surtout de précieux conseils pour nos temoins dans leur organisation du déroulé de leur animations. N’oublions pas que c’est une tache délicate pour les temoins et grâce à Leo, nos temoins sont passés pour des experts d’animation de mariage&#128521; Leo est très impliqué dans son rôle. Il a une écoute attentive à la demande des mariés et respecte parfaitement les souhaits des mariés sur le déroulé et le style de musique pour la soirée. Léo a grandement participer à la réussite de notre mariage. Et je l’en remercie encore énormément car j’avais beaucoup d’appréhension sur l’ambiance. Léo est un professionnel hors pair qui gère tout. Et est doté d’un œil d’expert sur toute la journée du mariage.</p>
        </blockquote>
        <figcaption><strong>Florine</strong>Mariage du 23 août 2025</figcaption>
      </figure>

    </div>
    <p class="form-note" style="margin-top:2.5rem">
      Avis publiés sur Mariages.net et reproduits sans modification, avec l’accord de leurs auteurs.
    </p>
    <div class="btn-row">
      <a class="btn btn--ghost" href="https://www.mariages.net/musique-mariage/leo-malhie--e274959" target="_blank" rel="noopener">Voir les 59 avis sur Mariages.net</a>
    </div>
  </div>
</section>
HTML
bande_cta "Le prochain avis sera peut-être le vôtre" "Commencez par la question la plus simple&nbsp;: votre date est-elle libre&nbsp;?"
page_close
} | page_write "temoignages/index.html"


# ====================================================== ZONE INTERVENTION ====
{
page_open \
 "Zone d’intervention — DJ Toulouse, Tarn, Aude" \
 "L’Agence Silence intervient en Haute-Garonne, dans le Tarn et l’Aude depuis Lauzerville, près de Toulouse. Déplacement gratuit dans 50 km, puis 0,60 € du kilomètre aller-retour." \
 "/zone-intervention/" "og-agence-silence.jpg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Zone d’intervention|/zone-intervention/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Zone d’intervention|/zone-intervention/"
cat <<'HTML'
    <p class="eyebrow">Zone d’intervention</p>
    <h1>DJ à Toulouse, dans le Tarn, l’Aude et au-delà</h1>
    <p class="lead">
      L’agence est installée à Lauzerville, à côté de Toulouse. Le déplacement est gratuit
      dans un rayon de 50&nbsp;km, et indiqué dès le devis au-delà.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="zone-grid">
      <div class="reveal">
        <p class="eyebrow">Le cœur d’activité</p>
        <h2>Haute-Garonne, Tarn et Aude</h2>
        <p>
          Les mariages de l’agence se déroulent principalement en Haute-Garonne, dans le
          Tarn et dans l’Aude. Les trois secteurs qui génèrent le plus de demandes&nbsp;:
          Toulouse, Castres et Ramonville. L’équipe joue aussi régulièrement en
          Tarn-et-Garonne, au Château de la Baronnie.
        </p>
        <h3 style="font-family:var(--sans);font-size:.9rem;font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40);margin-top:2.5rem">Pages dédiées</h3>
        <ul class="city-list" style="margin-top:1.25rem;columns:1">
          <li><a href="/dj-mariage-toulouse/">DJ mariage Toulouse et Haute-Garonne</a></li>
          <li><a href="/dj-mariage-castres/">DJ mariage Castres et Tarn</a></li>
        </ul>
        <h3 style="font-family:var(--sans);font-size:.9rem;font-weight:500;letter-spacing:.15em;text-transform:uppercase;color:var(--ink-40);margin-top:2.5rem">Lieux où l’agence joue régulièrement</h3>
        <ul class="city-list" style="margin-top:1.25rem;columns:1">
          <li><span>Domaine de Preissac &middot; Castelmaurou</span></li>
          <li><span>Domaine de Montjoie &middot; Ramonville-Saint-Agne</span></li>
          <li><span>Château de la Baronnie &middot; Lafrançaise</span></li>
        </ul>
      </div>

      <div class="reveal">
        <p class="eyebrow">Au-delà</p>
        <h2>Plus loin, et à l’étranger</h2>
        <p>
          L’agence se déplace aussi hors de la région, et à l’étranger&nbsp;: Séville,
          Budapest, Tenerife et Singapour, notamment pour des événements d’entreprise.
        </p>
        <p>
          Au-delà d’une heure vingt de route, le DJ dort à proximité la veille&nbsp;;
          l’hébergement est alors à la charge des clients.
        </p>

        <div class="card" style="margin-top:2.5rem;background:var(--ecru-deep);border-color:var(--line)">
          <h3>Comment le déplacement est facturé</h3>
          <p><strong>Jusqu’à 50&nbsp;km&nbsp;:</strong> gratuit.</p>
          <p><strong>Au-delà&nbsp;:</strong> 0,60&nbsp;€ du kilomètre aller-retour, indiqué dans le devis.</p>
          <p><strong>Au-delà d’1&nbsp;h&nbsp;20 de route&nbsp;:</strong> le DJ dort à proximité la veille, hébergement à la charge des clients.</p>
        </div>
      </div>
    </div>
  </div>
</section>
HTML
bande_cta "Où se déroule votre événement&nbsp;?" "Quel que soit le lieu, commencez par vérifier la disponibilité de votre date."
page_close
} | page_write "zone-intervention/index.html"


# =================================================================== FAQ ====
# Les questions reprennent celles que les clients posent reellement a Leo
# (questionnaire, section 8), avec ses reponses.
{
page_open \
 "FAQ — tarifs, déroulé, matériel et déplacement d’un DJ" \
 "Les questions que l’on pose vraiment à l’Agence Silence : prix d’un DJ de mariage, frais de déplacement, heure de fin, lumière, micros, rallonges, réservation et annulation." \
 "/faq/" "og-agence-silence.jpg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'FAQ|/faq/')</script>"
cat <<'HTML'
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "Combien coûte un DJ de mariage ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Le pack mariage (cocktail, dîner et soirée, avec son, lumière, micros, vidéoprojecteur et écran) est à 1 600 €, hors déplacement. Le prix varie selon la durée, la saison et le jour. TVA non applicable." } },
    { "@type": "Question", "name": "Combien coûte un DJ pour un anniversaire ou une entreprise ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Un anniversaire de 20 h à 2 h est à partir de 600 €. Une soirée d’entreprise est à partir de 500 €. Le pack son et lumière est toujours complet." } },
    { "@type": "Question", "name": "Y a-t-il des frais de déplacement ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Le déplacement est gratuit dans un rayon de 50 km. Au-delà, il est facturé 0,60 € du kilomètre aller-retour et figure dans le devis." } },
    { "@type": "Question", "name": "Combien de temps à l’avance faut-il réserver ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Idéalement un à deux ans à l’avance, les dates de haute saison partant très vite." } },
    { "@type": "Question", "name": "Quel acompte faut-il verser ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Un acompte de 30 % bloque la date. Le solde se règle une semaine avant l’événement. Tous les moyens de paiement sont acceptés." } },
    { "@type": "Question", "name": "Que se passe-t-il en cas d’annulation ou de report ?",
      "acceptedAnswer": { "@type": "Answer", "text": "En cas d’annulation, l’acompte est conservé. Un report reste possible, au même tarif." } },
    { "@type": "Question", "name": "À quelle heure se termine la prestation ?",
      "acceptedAnswer": { "@type": "Answer", "text": "À 4 h 30 du matin. Pour prolonger, des heures supplémentaires sont possibles et facturées." } },
    { "@type": "Question", "name": "Quel style de musique jouez-vous ?",
      "acceptedAnswer": { "@type": "Answer", "text": "L’agence est spécialisée dans l’événementiel et joue tous les styles, à l’exception des musiques façon Patrick Sébastien." } },
    { "@type": "Question", "name": "Pouvez-vous mixer en extérieur ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Oui, avec une sonorisation conçue pour l’extérieur." } },
    { "@type": "Question", "name": "Y a-t-il un jeu de lumière ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Oui, dans tous les devis : huit projecteurs PAR LED. Un éclairage plus dynamique, avec lyres, est disponible en option." } },
    { "@type": "Question", "name": "Combien de micros sont fournis ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Deux micros sans fil." } },
    { "@type": "Question", "name": "Faut-il prévoir des rallonges ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Non. Rallonges et multiprises sont comprises dans la prestation ; une prise 16 A suffit." } },
    { "@type": "Question", "name": "Le DJ vient-il seul ou accompagné ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Seul : un DJ est présent pour votre soirée." } },
    { "@type": "Question", "name": "Faut-il prévoir une nuit sur place pour le DJ ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Pas sur le lieu de réception. En revanche, au-delà d’1 h 20 de route, le DJ dort à proximité la veille et l’hébergement est à la charge des clients." } },
    { "@type": "Question", "name": "Le DJ a-t-il des allergies alimentaires ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Aucune." } },
    { "@type": "Question", "name": "Assurez-vous la cérémonie laïque ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Oui, en supplément du pack mariage." } },
    { "@type": "Question", "name": "Intervenez-vous à l’étranger ?",
      "acceptedAnswer": { "@type": "Answer", "text": "Oui. L’agence a notamment joué à Séville, Budapest, Tenerife et Singapour." } }
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
    <h1>Les questions que l’on nous pose vraiment</h1>
    <p class="lead">
      Tarifs, déroulé, matériel et déplacement. La première question, elle, est toujours
      la même&nbsp;: votre date est-elle libre&nbsp;?
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <h2 style="margin-bottom:1.75rem">Tarifs et réservation</h2>
    <div class="faq reveal" style="margin-bottom:4rem">
      <details><summary>Combien coûte un DJ de mariage&nbsp;?</summary><div class="faq__answer"><p>Le pack mariage — cocktail, dîner et soirée, avec son, lumière, micros, vidéoprojecteur et écran — est à 1&nbsp;600&nbsp;€, hors déplacement. Le prix varie selon la durée, la saison et le jour.</p><p>TVA non applicable, article 293&nbsp;B du CGI. Les tarifs des options figurent dans la brochure envoyée avec le devis. <a href="/prestations/dj-mariage/">Voir le pack mariage</a></p></div></details>
      <details><summary>Et pour un anniversaire ou une entreprise&nbsp;?</summary><div class="faq__answer"><p>Un anniversaire de 20&nbsp;h à 2&nbsp;h est à partir de 600&nbsp;€. Une soirée d’entreprise est à partir de 500&nbsp;€. Le pack son et lumière est toujours complet.</p></div></details>
      <details><summary>Y a-t-il des frais de déplacement&nbsp;?</summary><div class="faq__answer"><p>Le déplacement est gratuit dans un rayon de 50&nbsp;km. Au-delà, il est facturé 0,60&nbsp;€ du kilomètre aller-retour et figure dans le devis. <a href="/zone-intervention/">Voir la zone d’intervention</a></p></div></details>
      <details><summary>Combien de temps à l’avance faut-il réserver&nbsp;?</summary><div class="faq__answer"><p>Idéalement un à deux ans à l’avance&nbsp;: les dates de haute saison partent très vite.</p></div></details>
      <details><summary>Quel acompte faut-il verser&nbsp;?</summary><div class="faq__answer"><p>Un acompte de 30&nbsp;% bloque la date. Le solde se règle une semaine avant l’événement. Tous les moyens de paiement sont acceptés.</p></div></details>
      <details><summary>Que se passe-t-il en cas d’annulation ou de report&nbsp;?</summary><div class="faq__answer"><p>En cas d’annulation, l’acompte est conservé. Un report reste possible, au même tarif.</p></div></details>
    </div>

    <h2 style="margin-bottom:1.75rem">Le déroulé et la musique</h2>
    <div class="faq reveal" style="margin-bottom:4rem">
      <details><summary>À quelle heure se termine la prestation&nbsp;?</summary><div class="faq__answer"><p>À 4&nbsp;h&nbsp;30 du matin. Pour prolonger, des heures supplémentaires sont possibles et facturées.</p></div></details>
      <details><summary>Quel style de musique jouez-vous&nbsp;?</summary><div class="faq__answer"><p>L’agence est spécialisée dans l’événementiel&nbsp;: elle joue tous les styles, à l’exception des musiques façon Patrick Sébastien.</p></div></details>
      <details><summary>Peut-on choisir les musiques&nbsp;?</summary><div class="faq__answer"><p>Oui. Un questionnaire complet sert à cerner vos goûts, et vos playlists sont les bienvenues. Le jour J, les demandes des invités sont acceptées.</p></div></details>
      <details><summary>Le DJ prend-il le micro&nbsp;?</summary><div class="faq__answer"><p>Oui, pour les annonces de la soirée.</p></div></details>
      <details><summary>Assurez-vous la cérémonie laïque&nbsp;?</summary><div class="faq__answer"><p>Oui, en supplément du pack mariage. <a href="/prestations/options-mariage/">Voir les options</a></p></div></details>
      <details><summary>Pouvez-vous mixer en extérieur&nbsp;?</summary><div class="faq__answer"><p>Oui, avec une sonorisation conçue pour l’extérieur.</p></div></details>
    </div>

    <h2 style="margin-bottom:1.75rem">Matériel et logistique</h2>
    <div class="faq reveal" style="margin-bottom:4rem">
      <details><summary>Y a-t-il un jeu de lumière&nbsp;?</summary><div class="faq__answer"><p>Oui, dans tous les devis&nbsp;: huit projecteurs PAR LED. Un éclairage plus dynamique, avec lyres, est disponible en option.</p></div></details>
      <details><summary>Combien de micros sont fournis&nbsp;?</summary><div class="faq__answer"><p>Deux micros sans fil.</p></div></details>
      <details><summary>Faut-il prévoir des rallonges&nbsp;?</summary><div class="faq__answer"><p>Non. Rallonges et multiprises sont comprises dans la prestation&nbsp;: une prise 16&nbsp;A suffit, il n’y a rien à prévoir.</p></div></details>
      <details><summary>Notre salle a un limiteur de son, est-ce un problème&nbsp;?</summary><div class="faq__answer"><p>Non&nbsp;: la limite de décibels de la salle est respectée.</p></div></details>
      <details><summary>Le DJ vient-il seul ou accompagné&nbsp;?</summary><div class="faq__answer"><p>Seul&nbsp;: un DJ est présent pour votre soirée.</p></div></details>
      <details><summary>Faut-il prévoir une nuit sur place pour le DJ&nbsp;?</summary><div class="faq__answer"><p>Pas sur le lieu de réception. En revanche, au-delà d’1&nbsp;h&nbsp;20 de route, le DJ dort à proximité la veille et l’hébergement est à la charge des clients.</p></div></details>
      <details><summary>Le DJ a-t-il des allergies alimentaires&nbsp;?</summary><div class="faq__answer"><p>Aucune.</p></div></details>
      <details><summary>Le matériel est-il assuré&nbsp;?</summary><div class="faq__answer"><p>Oui. L’attestation d’assurance est fournie sur demande.</p></div></details>
    </div>

    <h2 style="margin-bottom:1.75rem">Au-delà de Toulouse</h2>
    <div class="faq reveal">
      <details><summary>Intervenez-vous à l’étranger&nbsp;?</summary><div class="faq__answer"><p>Oui. L’agence a notamment joué à Séville, Budapest, Tenerife et Singapour.</p></div></details>
      <details><summary>Parlez-vous anglais&nbsp;?</summary><div class="faq__answer"><p>Oui, Léo parle anglais&nbsp;: pratique pour les mariages franco-étrangers.</p></div></details>
    </div>
  </div>
</section>
HTML
bande_cta "Une question qui n’est pas ici&nbsp;?" "Posez-la directement&nbsp;: réponse sous 24 heures, week-end compris."
page_close
} | page_write "faq/index.html"


# =============================================================== CONTACT ====
{
page_open \
 "Contact &amp; devis — DJ mariage Toulouse, Agence Silence" \
 "Vérifiez la disponibilité de votre date et demandez un devis à l’Agence Silence. Réponse sous 24 heures, week-end compris. Tél. 06.20.25.66.63." \
 "/contact/" "og-agence-silence.jpg"
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
      Réponse sous 24 heures, week-end compris, avec la disponibilité de votre date
      et une proposition chiffrée.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap">
    <div class="split" style="align-items:start">
      <div class="reveal">
        <h2 style="margin-bottom:2rem">Votre demande</h2>

        <!-- FORMULAIRE — Netlify Forms
             Detecte par Netlify au deploiement grace a data-netlify. Les demandes
             apparaissent dans Netlify (Forms > devis) ; activer une notification
             e-mail vers leomalhie@yahoo.fr dans Site configuration > Forms.
             Sans JavaScript, le navigateur poste le formulaire et Netlify affiche
             /contact/merci/. Avec JavaScript, l'envoi se fait sans quitter la page. -->
        <form name="devis" method="POST" action="/contact/merci/" data-netlify="true" netlify-honeypot="bot-field" data-devis-form novalidate>
          <input type="hidden" name="form-name" value="devis">
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
              <textarea id="message" name="message" placeholder="Le déroulé envisagé, l’ambiance recherchée, les options qui vous intéressent…"></textarea>
              <p class="field__hint">Plus votre message est précis, plus le devis le sera.</p>
            </div>
            <!-- piege a robots : invisible pour les humains -->
            <p style="position:absolute;left:-9999px" aria-hidden="true">
              <label for="bot-field">Ne pas remplir</label>
              <input type="text" id="bot-field" name="bot-field" tabindex="-1" autocomplete="off">
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
HTML
cat <<HTML
        <!-- NAP : identique au footer et a la fiche Google Business Profile -->
        <dl class="contact-block">
          <dt>Téléphone</dt>
          <dd><a href="tel:$TEL_URI">$TEL_AFF</a></dd>
          <dt>E-mail</dt>
          <dd><a href="mailto:$MAIL">$MAIL</a></dd>
          <dt>Adresse</dt>
          <dd>Agence Silence<br>$RUE<br>$CP $VILLE</dd>
          <dt>Disponibilité</dt>
          <dd>Tous les jours, de 10&nbsp;h à 22&nbsp;h</dd>
        </dl>
HTML
cat <<'HTML'

        <div class="card" style="margin-top:2.75rem;background:var(--ecru-deep);border-color:var(--line)">
          <h3>Ce qui accélère la réponse</h3>
          <p style="font-size:.95rem">La <strong>date exacte</strong>, le <strong>lieu de réception</strong> et le <strong>nombre d’invités</strong>. Avec ces trois éléments, le devis est prêt rapidement.</p>
        </div>

        <div class="card" style="margin-top:1.25rem">
          <h3>La question qu’on nous pose en premier</h3>
          <p style="font-size:.95rem">«&nbsp;Êtes-vous disponible&nbsp;?&nbsp;» Les dates se réservent un à deux ans à l’avance&nbsp;: autant vérifier la vôtre dès maintenant.</p>
        </div>
      </div>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "contact/index.html"


# ========================================================= CONTACT : MERCI ==
# Page affichee par Netlify apres un envoi sans JavaScript.
{
page_open "Demande envoyée — Agence Silence" "Votre demande de devis a bien été envoyée à l’Agence Silence." "/contact/merci/" "og-agence-silence.jpg"
echo '<meta name="robots" content="noindex, follow">'
page_head_close
cat <<'HTML'
<section class="page-hero" style="text-align:center">
  <div class="wrap">
    <p class="eyebrow" style="justify-content:center">Demande envoyée</p>
    <h1 style="max-width:22ch;margin-inline:auto">Merci, votre demande est bien partie</h1>
    <p class="lead" style="margin-inline:auto">
      Vous recevrez une réponse sous 24 heures, avec la disponibilité de votre date
      et une proposition chiffrée.
    </p>
    <div class="btn-row btn-row--center">
      <a class="btn" href="/">Retour à l’accueil</a>
      <a class="btn btn--ghost" href="/temoignages/">Lire les avis des mariés</a>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "contact/merci/index.html"


# ======================================================== MENTIONS LEGALES ==
{
page_open \
 "Mentions légales — Agence Silence" \
 "Mentions légales du site de l’Agence Silence : éditeur, hébergeur, propriété intellectuelle et données personnelles." \
 "/mentions-legales/" "og-agence-silence.jpg"
echo '<meta name="robots" content="noindex, follow">'
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Mentions légales|/mentions-legales/"
cat <<HTML
    <p class="eyebrow">Informations légales</p>
    <h1>Mentions légales</h1>
  </div>
</section>

<section class="section">
  <div class="wrap wrap--narrow">
    <div class="prose">
      <h2 class="mt-0">Éditeur du site</h2>
      <p>
        Agence Silence &mdash; $NOM_LEGAL, entrepreneur individuel (micro-entreprise)<br>
        $RUE, $CP $VILLE, France<br>
        Téléphone&nbsp;: <a href="tel:$TEL_URI">$TEL_AFF</a><br>
        E-mail&nbsp;: <a href="mailto:$MAIL">$MAIL</a><br>
        SIRET&nbsp;: $SIRET_AFF<br>
        TVA non applicable, article 293&nbsp;B du Code général des impôts<br>
        Directeur de la publication&nbsp;: $NOM_LEGAL
      </p>
      <p>
        Responsabilité civile professionnelle souscrite auprès d’Allianz.
      </p>

      <h2>Hébergement</h2>
      <p>
        Le site est hébergé par Netlify, Inc., 101 2nd Street, San Francisco,
        CA 94105, États-Unis.
      </p>

      <h2>Propriété intellectuelle</h2>
      <p>
        L’ensemble des contenus du site — textes, visuels, identité visuelle et code —
        est protégé par le droit d’auteur. Les avis clients sont reproduits avec l’accord
        de leurs auteurs&nbsp;; ils ont été publiés à l’origine sur Mariages.net.
      </p>

      <h2>Données personnelles</h2>
      <p>
        Les données transmises via le formulaire de contact — nom, prénom, e-mail,
        téléphone, date, lieu, nombre d’invités et description de l’événement — sont
        utilisées exclusivement pour répondre à votre demande de devis. Elles ne sont ni
        cédées, ni louées, ni transmises à un tiers à des fins commerciales.
      </p>
      <p>
        Le formulaire est traité par l’hébergeur du site, Netlify, Inc. (États-Unis).
        Les données sont conservées trois ans à compter du dernier contact.
      </p>
      <p>
        Conformément au RGPD, vous disposez d’un droit d’accès, de rectification,
        d’effacement, de limitation et d’opposition&nbsp;: écrivez à
        <a href="mailto:$MAIL">$MAIL</a>. Vous pouvez également introduire une
        réclamation auprès de la CNIL.
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
        signalez-la à <a href="mailto:$MAIL">$MAIL</a>.
      </p>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "mentions-legales/index.html"


# ================================================================== 404 ====
{
page_open "Page introuvable — Agence Silence" "La page demandée n’existe pas ou a été déplacée." "/404.html" "og-agence-silence.jpg"
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
      <article class="card"><h3>Avis des mariés</h3><p>4,9/5 sur 59 avis Mariages.net.</p><a class="link-arrow" href="/temoignages/">Voir</a></article>
      <article class="card"><h3>Zone d’intervention</h3><p>Toulouse, Tarn, Aude et au-delà.</p><a class="link-arrow" href="/zone-intervention/">Voir</a></article>
    </div>
  </div>
</section>
HTML
page_close
} | page_write "404.html"
