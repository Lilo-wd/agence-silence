#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# Date de la mise a jour des articles avec les informations reelles de Leo.
MODIF="2026-09-16"

# ============================================================ BLOG INDEX ====
{
page_open \
 "Journal — conseils pour choisir son DJ de mariage" \
 "Le journal de l’Agence Silence : comment choisir son DJ de mariage à Toulouse, quel budget prévoir, et les tendances mariage 2027. Par Léo Malhie." \
 "/blog/" "og-agence-silence.jpg"
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Journal|/blog/')</script>"
page_head_close
cat <<'HTML'
<section class="page-hero">
  <div class="wrap">
HTML
breadcrumb "Journal|/blog/"
cat <<'HTML'
    <p class="eyebrow">Journal</p>
    <h1>Conseils pour choisir et préparer son DJ de mariage</h1>
    <p class="lead">
      Ce que plus de 500 mariages ont appris à l’agence, mis par écrit.
    </p>
  </div>
</section>

<section class="section">
  <div class="wrap wrap--narrow">
    <div class="post-list">
      <a class="post-item" href="/blog/choisir-dj-mariage-toulouse/">
        <p class="post-item__date"><time datetime="2026-08-12">12 août 2026</time></p>
        <div>
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.5rem">Comment choisir son DJ de mariage à Toulouse</h2>
          <p>Sept questions à poser avant de signer, et trois réponses qui doivent vous alerter.</p>
        </div>
      </a>

      <a class="post-item" href="/blog/budget-dj-mariage/">
        <p class="post-item__date"><time datetime="2026-06-24">24 juin 2026</time></p>
        <div>
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.5rem">Quel budget prévoir pour un DJ de mariage ?</h2>
          <p>Un tarif réel plutôt qu’une fourchette&nbsp;: ce que comprend un forfait, ce qui fait varier le prix, et ce qu’il faut vérifier dans un devis.</p>
        </div>
      </a>

      <a class="post-item" href="/blog/tendances-mariage-2027/">
        <p class="post-item__date"><time datetime="2026-04-08">8 avril 2026</time></p>
        <div>
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.5rem">Les tendances mariage 2027 vues de la cabine</h2>
          <p>Cérémonies laïques plus riches, retour du live, effets au bon moment, souvenirs sonores&nbsp;: ce qui change dans la soirée.</p>
        </div>
      </a>
    </div>
  </div>
</section>
HTML
bande_cta "Une question qui mériterait un article&nbsp;?" "Écrivez-nous. Les meilleurs articles de ce journal viennent de questions de mariés."
page_close
} | page_write "blog/index.html"


# ============================================================== ARTICLES ====
# article <slug> <titre> <desc> <h1> <chapo> <img> <date-iso> <date-affichee> <corps>
article () {
local SLUG=$1 TITRE=$2 DESC=$3 H1=$4 CHAPO=$5 IMG=$6 DISO=$7 DAFF=$8 CORPS=$9
{
page_open "$TITRE" "$DESC" "/blog/$SLUG/" "og-agence-silence.jpg"
cat <<JSON
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "$H1",
  "description": "$DESC",
  "image": "$SITE/assets/img/og-agence-silence.jpg",
  "datePublished": "$DISO",
  "dateModified": "$MODIF",
  "inLanguage": "fr-FR",
  "mainEntityOfPage": { "@type": "WebPage", "@id": "$SITE/blog/$SLUG/" },
  "author": { "@type": "Person", "name": "Léo Malhie", "url": "$SITE/a-propos/" },
  "publisher": {
    "@type": "Organization",
    "name": "Agence Silence",
    "url": "$SITE/",
    "logo": { "@type": "ImageObject", "url": "$SITE/assets/img/logo-empile.webp" }
  }
}
</script>
JSON
echo "<script type=\"application/ld+json\">$(schema_breadcrumb 'Journal|/blog/' "$H1|/blog/$SLUG/")</script>"
page_head_close
cat <<HTML
<section class="page-hero">
  <div class="wrap wrap--narrow">
$(breadcrumb "Journal|/blog/" "$H1|/blog/$SLUG/")
    <p class="eyebrow">Journal &middot; <time datetime="$DISO">$DAFF</time></p>
    <h1>$H1</h1>
    <p class="lead">$CHAPO</p>
  </div>
</section>

<section class="section">
  <div class="wrap wrap--narrow">
    <figure style="margin:0 0 3.5rem">
      <img src="/assets/img/$IMG" loading="lazy" decoding="async" width="1400" height="933"
           alt="$H1 — Agence Silence, DJ mariage Toulouse">
    </figure>
    <div class="prose">
$CORPS
    </div>
  </div>
</section>
HTML
bande_cta "Votre date est-elle libre&nbsp;?" "Le plus simple reste encore de poser la question. Réponse sous 24 heures."
page_close
} | page_write "blog/$SLUG/index.html"
}

# ------------------------------------------------------------- ARTICLE 1 --
read -r -d '' A1 <<'HTML' || true
<p class="mt-0">
  Le DJ est le prestataire dont on parle le moins pendant les préparatifs, et celui
  dont vos invités se souviendront le plus. C’est aussi celui qu’on choisit souvent
  en dernier, quand le budget est déjà largement engagé.
</p>

<h2>Commencez par vérifier qu’il fait vraiment du mariage</h2>
<p>
  Beaucoup de DJ font du mariage <em>en plus</em> du club, du bar ou des soirées
  étudiantes. Les deux métiers n’ont pourtant presque rien en commun.
</p>
<p>
  En club, le public vient pour danser et la soirée se ressemble d’un week-end à
  l’autre. À un mariage, des invités qui ne se connaissent pas doivent passer d’un
  cocktail bavard à une piste pleine, avec trois générations dans la même salle.
</p>
<p>
  Demandez combien de mariages il a faits <strong>l’année dernière</strong>, pas depuis
  le début de sa carrière.
</p>

<h2>Les sept questions à poser avant de signer</h2>
<ol>
  <li><strong>Qui sera aux platines le jour J&nbsp;?</strong> Beaucoup de DJ de mariage
      travaillent en agence, avec une équipe. Ce n’est pas un défaut, à condition de savoir
      qui mixera et qui prépare la journée avec vous.</li>
  <li><strong>Le prix est-il affiché&nbsp;?</strong> Un tarif clair dès le premier échange
      vaut mieux qu’une fourchette qui se précise trois semaines avant la date.</li>
  <li><strong>Qu’est-ce qui est inclus&nbsp;?</strong> Lumière, micros, vidéoprojecteur,
      rallonges&nbsp;: tout ce qui n’est pas écrit risque d’être facturé à part.</li>
  <li><strong>À quelle heure se termine la soirée, et combien coûte une heure de plus&nbsp;?</strong>
      La réponse doit figurer au devis.</li>
  <li><strong>Quels sont les frais de déplacement&nbsp;?</strong> Un rayon gratuit, puis un
      prix au kilomètre&nbsp;: c’est simple à vérifier.</li>
  <li><strong>Prenez-vous le micro&nbsp;?</strong> Question de goût, mais la réponse doit
      correspondre au mariage que vous voulez.</li>
  <li><strong>Que se passe-t-il en cas d’empêchement&nbsp;?</strong> Un professionnel sérieux
      dispose d’un réseau de remplacement.</li>
</ol>

<h2>Trois réponses qui doivent vous alerter</h2>
<blockquote>« On verra ça le jour J, j’ai l’habitude. »</blockquote>
<p>
  L’habitude ne remplace pas la préparation. Un DJ qui refuse de construire la soirée
  avec vous improvisera aussi le reste.
</p>
<blockquote>« Envoyez-moi juste votre playlist. »</blockquote>
<p>
  Une playlist n’est pas une soirée. Le travail consiste à décider quel morceau passer,
  et surtout <em>quand</em>, en fonction de ce qui se passe sur la piste.
</p>
<blockquote>« Le déplacement, on verra plus tard. »</blockquote>
<p>
  C’est la ligne du budget qui dérape le plus souvent. Elle doit être chiffrée avant signature.
</p>

<h2>Autour de Toulouse</h2>
<p>
  La région ne manque pas de lieux&nbsp;: domaines, châteaux, chais. Un DJ qui y travaille
  régulièrement connaît déjà les salles, et respecte simplement la limite de décibels
  fixée par chacune.
</p>

<h2>Quand réserver&nbsp;?</h2>
<p>
  Idéalement un à deux ans à l’avance. Les bons DJ de mariage sont réservés avant
  beaucoup d’autres prestataires, et c’est presque toujours la première question qu’on
  leur pose&nbsp;: «&nbsp;Êtes-vous disponible&nbsp;?&nbsp;»
</p>

<hr style="border:none;border-top:1px solid var(--line);margin:3.5rem 0">
<p>
  <a href="/prestations/dj-mariage/">Voir le forfait mariage</a> &middot;
  <a href="/dj-mariage-toulouse/">DJ mariage à Toulouse</a> &middot;
  <a href="/faq/">Toutes les questions fréquentes</a>
</p>
HTML

article "choisir-dj-mariage-toulouse" \
 "Comment choisir son DJ de mariage à Toulouse — Agence Silence" \
 "Sept questions à poser à un DJ de mariage avant de signer, trois réponses qui doivent vous alerter, et quand réserver. Le guide de l’Agence Silence, près de Toulouse." \
 "Comment choisir son DJ de mariage à Toulouse" \
 "Sept questions à poser avant de signer, trois réponses qui doivent vous faire fuir, et le bon moment pour réserver." \
 "blog-choisir-dj.svg" "2026-08-12" "12 août 2026" "$A1"

# ------------------------------------------------------------- ARTICLE 2 --
read -r -d '' A2 <<'HTML' || true
<p class="mt-0">
  C’est la question que tout le monde pose en premier. Plutôt qu’une fourchette vague,
  voici un tarif réel, et ce qu’il recouvre.
</p>

<h2>Un exemple concret&nbsp;: le forfait de l’Agence Silence</h2>
<p>
  Le forfait mariage de l’agence coûte <strong>1&nbsp;600&nbsp;€</strong>. Il couvre le
  cocktail, le dîner et la soirée. Il comprend&nbsp;:
</p>
<ul>
  <li>la sonorisation complète, avec des enceintes professionnelles&nbsp;;</li>
  <li>huit projecteurs PAR LED&nbsp;;</li>
  <li>deux micros sans fil pour les discours&nbsp;;</li>
  <li>un vidéoprojecteur et un écran pour les animations des témoins&nbsp;;</li>
  <li>les rallonges et multiprises&nbsp;;</li>
  <li>la soirée jusqu’à 4&nbsp;h&nbsp;30.</li>
</ul>
<p>
  Derrière ce prix, il y a une quinzaine d’heures de présence le jour J, installation et
  démontage compris, sans compter la préparation en amont.
</p>

<h2>Ce qui fait varier le prix</h2>
<ul>
  <li><strong>La durée</strong>&nbsp;: prolonger au-delà de l’heure de fin se paie en heures supplémentaires.</li>
  <li><strong>La saison et le jour</strong>&nbsp;: un samedi de juin ne se négocie pas comme un vendredi de novembre.</li>
  <li><strong>Le déplacement</strong>&nbsp;: offert jusqu’à 50&nbsp;km, puis compté au kilomètre. Le montant est écrit sur le devis.</li>
  <li><strong>Les options</strong>&nbsp;: cérémonie laïque, photobooth, livre d’or audio, fumée lourde pour l’ouverture de bal, éclairage dynamique, musiciens.</li>
</ul>

<h2>Et pour les autres événements</h2>
<p>
  Une soirée privée coûte à partir de 600&nbsp;€. Un événement d’entreprise coûte à partir
  de 500&nbsp;€. Le son et la lumière sont inclus dans les deux cas.
  <a href="/tarifs/">Voir tous les tarifs</a>
</p>

<h2>Ce qu’il faut vérifier dans un devis</h2>
<ul>
  <li><strong>Ce qui est inclus.</strong> Un prix bas qui n’inclut ni la lumière ni les micros finit rarement bas.</li>
  <li><strong>L’heure de fin</strong> et le tarif d’une heure supplémentaire.</li>
  <li><strong>Le déplacement</strong>, chiffré noir sur blanc.</li>
  <li><strong>L’acompte et l’annulation.</strong> À l’Agence Silence, l’acompte est de 30&nbsp;%. Le solde se paie une semaine avant. En cas d’annulation, l’acompte n’est pas remboursé.</li>
  <li><strong>La TVA.</strong> Une micro-entreprise non assujettie facture sans TVA&nbsp;: le prix affiché est le prix payé.</li>
</ul>

<h2>Le son, justement</h2>
<p>
  À prix proche, la différence s’entend. Un DJ qui se déplace en camion peut emporter des
  enceintes plus grandes et de meilleure qualité que celui qui charge une voiture. Posez
  la question&nbsp;: la réponse dit beaucoup de ce que vos invités entendront.
</p>

<hr style="border:none;border-top:1px solid var(--line);margin:3.5rem 0">
<p>
  <a href="/prestations/dj-mariage/">Le forfait mariage en détail</a> &middot;
  <a href="/prestations/options-mariage/">Les options</a> &middot;
  <a href="/blog/choisir-dj-mariage-toulouse/">Comment choisir son DJ de mariage</a>
</p>
HTML

article "budget-dj-mariage" \
 "Quel budget pour un DJ de mariage ? Un tarif réel, détaillé" \
 "Combien coûte un DJ de mariage près de Toulouse : un tarif réel détaillé, ce qu’il comprend, ce qui fait varier le prix et les points à vérifier dans un devis." \
 "Quel budget prévoir pour un DJ de mariage ?" \
 "Un tarif réel plutôt qu’une fourchette&nbsp;: ce que comprend un forfait mariage, ce qui fait varier le prix, et les points à vérifier avant de signer." \
 "blog-budget-dj.svg" "2026-06-24" "24 juin 2026" "$A2"

# ------------------------------------------------------------- ARTICLE 3 --
read -r -d '' A3 <<'HTML' || true
<p class="mt-0">
  Vue depuis la cabine, une tendance mariage n’est pas une couleur de nappe. C’est un
  changement de déroulé, qui modifie la façon dont la soirée se construit. Voici ce
  qui bouge pour 2027.
</p>

<h2>La cérémonie laïque prend de la place</h2>
<p>
  Plus d’intervenants, des lectures, parfois un moment musical&nbsp;: la cérémonie laïque
  n’est plus un préambule. Elle se sonorise, et elle se prépare.
</p>
<p>
  Conséquence concrète&nbsp;: les proches qui prennent la parole ont besoin d’être
  accompagnés. Aider l’officiant et les témoins à caler leur passage fait désormais
  partie du travail du DJ.
</p>

<h2>Le retour du live, en complément</h2>
<p>
  Un saxophoniste sur le cocktail, un pianiste pour un moment plus calme&nbsp;: les formats
  hybrides se multiplient. Bien fait, l’effet est magnifique. Mal calé, c’est un musicien
  qui joue par-dessus le mix.
</p>
<p>
  La règle est simple&nbsp;: le musicien et le DJ préparent la soirée ensemble, avec des
  moments d’intervention définis à l’avance.
</p>

<h2>Des effets, mais au bon moment</h2>
<p>
  La tendance n’est pas au spectacle permanent, mais à l’effet qui marque un instant&nbsp;:
  un tapis de fumée lourde pour l’ouverture de bal, des feux de couleur pour la cérémonie,
  un ciel étoilé pour la soirée.
</p>
<p>
  Un bon tapis de fumée ne se lance pas n’importe quand&nbsp;: il faut attendre que les
  conditions de la salle s’y prêtent. C’est ce détail qui fait la différence sur les photos.
</p>

<h2>Les souvenirs deviennent sonores</h2>
<p>
  Le livre d’or change de forme. À côté du photobooth, le «&nbsp;téléphone d’or&nbsp;» s’installe
  dans les mariages&nbsp;: les invités décrochent et laissent un message que les mariés
  réécoutent des années plus tard.
</p>

<h2>Une sélection musicale plus large</h2>
<p>
  Les couples qui se marient en 2027 ont grandi avec les années 2000 et 2010, et les
  assument. Cela ne veut pas dire abandonner les générations précédentes&nbsp;: cela veut
  dire construire la soirée par vagues, pour que tout le monde danse.
</p>

<h2>Ce qui ne change pas</h2>
<p>
  Une soirée réussie tient à la lecture de la piste, pas à la playlist. Un couple voulait
  une soirée entièrement techno&nbsp;; personne ne dansait. Les mariés ont fini par dire à
  Léo&nbsp;: «&nbsp;On te fait confiance.&nbsp;» La piste est restée pleine jusqu’à 5&nbsp;heures
  du matin.
</p>

<hr style="border:none;border-top:1px solid var(--line);margin:3.5rem 0">
<p>
  <a href="/prestations/options-mariage/">Les options mariage</a> &middot;
  <a href="/prestations/dj-mariage/">Le forfait mariage</a> &middot;
  <a href="/blog/choisir-dj-mariage-toulouse/">Comment choisir son DJ de mariage</a>
</p>
HTML

article "tendances-mariage-2027" \
 "Tendances mariage 2027 : ce qui change vraiment dans la soirée" \
 "Cérémonies laïques plus riches, retour du live, fumée lourde et effets au bon moment, livre d’or audio : les tendances mariage 2027 vues par un DJ de mariage près de Toulouse." \
 "Les tendances mariage 2027 vues de la cabine" \
 "Cérémonies laïques plus riches, musiciens live, effets au bon moment et souvenirs sonores&nbsp;: ce qui change concrètement dans une soirée de mariage." \
 "blog-tendances-2027.svg" "2026-04-08" "8 avril 2026" "$A3"
