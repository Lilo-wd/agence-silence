#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"

# ============================================================ BLOG INDEX ====
{
page_open \
 "Journal — conseils pour choisir son DJ de mariage" \
 "Le journal de l’Agence Silence : comment choisir son DJ de mariage à Toulouse, quel budget prévoir, et les tendances mariage 2027. Des articles écrits par Léo." \
 "/blog/" "blog-choisir-dj.svg"
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
      Ce que dix ans de mariages ont appris à Léo, mis par écrit.
      Sans langue de bois commerciale.
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
          <p>Sept questions à poser avant de signer, et trois réponses qui doivent vous faire fuir. Le guide complet pour la Haute-Garonne.</p>
        </div>
      </a>

      <a class="post-item" href="/blog/budget-dj-mariage/">
        <p class="post-item__date"><time datetime="2026-06-24">24 juin 2026</time></p>
        <div>
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.5rem">Quel budget prévoir pour un DJ de mariage ?</h2>
          <p>Ce que recouvre réellement un tarif de DJ, pourquoi l’écart va de 600 à 3 000 €, et où se situe le vrai risque quand on choisit le moins cher.</p>
        </div>
      </a>

      <a class="post-item" href="/blog/tendances-mariage-2027/">
        <p class="post-item__date"><time datetime="2026-04-08">8 avril 2026</time></p>
        <div>
          <h2 style="font-size:clamp(1.25rem,1.1rem + .7vw,1.6rem);margin-bottom:.5rem">Les tendances mariage 2027 vues de la cabine</h2>
          <p>Cérémonies laïques plus longues, dîners raccourcis, retour du live : ce qui change concrètement dans le déroulé d’une soirée.</p>
        </div>
      </a>
    </div>
  </div>
</section>
HTML
bande_cta "Une question qui mériterait un article&nbsp;?" "Écrivez-la nous. Les meilleurs articles de ce journal viennent de questions de mariés."
page_close
} | page_write "blog/index.html"


# ============================================================== ARTICLES ====
# article <slug> <titre> <desc> <h1> <chapo> <img> <date-iso> <date-affichee> <corps>
article () {
local SLUG=$1 TITRE=$2 DESC=$3 H1=$4 CHAPO=$5 IMG=$6 DISO=$7 DAFF=$8 CORPS=$9
{
page_open "$TITRE" "$DESC" "/blog/$SLUG/" "$IMG"
cat <<JSON
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "$H1",
  "description": "$DESC",
  "image": "$SITE/assets/img/$IMG",
  "datePublished": "$DISO",
  "dateModified": "$DISO",
  "inLanguage": "fr-FR",
  "mainEntityOfPage": { "@type": "WebPage", "@id": "$SITE/blog/$SLUG/" },
  "author": { "@type": "Person", "name": "Léo", "url": "$SITE/a-propos/" },
  "publisher": {
    "@type": "Organization",
    "name": "Agence Silence",
    "url": "$SITE/",
    "logo": { "@type": "ImageObject", "url": "$SITE/assets/img/logo-empile.png" }
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
bande_cta "Votre date est-elle libre&nbsp;?" "Le plus simple reste encore de poser la question. Réponse sous 24 heures ouvrées."
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
  Beaucoup de DJ toulousains font du mariage <em>en plus</em> du club, du bar, ou des
  soirées étudiantes. Ce n’est pas disqualifiant en soi, mais les deux métiers
  n’ont presque rien en commun.
</p>
<p>
  En club, le public est venu pour danser, connaît le style de la maison, et le volume
  reste constant toute la nuit. À un mariage, quatre-vingts personnes qui ne se
  connaissent pas doivent passer d’un cocktail bavard à une piste pleine, en respectant
  un déroulé précis, avec trois générations dans la même salle.
</p>
<p>
  Demandez combien de mariages il a faits <strong>l’année dernière</strong>, pas depuis
  le début de sa carrière.
</p>

<h2>Les sept questions à poser avant de signer</h2>
<ol>
  <li><strong>Serez-vous là personnellement&nbsp;?</strong> Certaines agences vendent un
      nom et envoient un intervenant qu’on ne rencontre jamais avant le jour J.</li>
  <li><strong>Combien de mariages faites-vous par week-end&nbsp;?</strong> Au-delà d’un,
      la préparation en pâtit forcément.</li>
  <li><strong>Venez-vous repérer notre lieu&nbsp;?</strong> Un domaine avec limiteur sonore
      ou une grange en pierre ne se découvrent pas le jour même.</li>
  <li><strong>Avez-vous du matériel de secours&nbsp;?</strong> La bonne réponse est
      « oui, sur chaque prestation, sans supplément ».</li>
  <li><strong>Prenez-vous le micro&nbsp;?</strong> Question de goût, mais la réponse doit
      correspondre au mariage que vous voulez.</li>
  <li><strong>Que se passe-t-il si vous êtes malade&nbsp;?</strong> Un professionnel
      sérieux a un réseau de remplacement et le mentionne au contrat.</li>
  <li><strong>Le devis est-il ferme&nbsp;?</strong> Déplacement, heures supplémentaires
      et éclairage doivent figurer dès le premier chiffrage.</li>
</ol>

<h2>Trois réponses qui doivent vous alerter</h2>
<blockquote>« On verra ça le jour J, j’ai l’habitude. »</blockquote>
<p>
  L’habitude ne remplace pas la préparation. Un DJ qui refuse de construire un déroulé
  avec vous improvisera aussi le reste.
</p>
<blockquote>« Je m’adapte, envoyez-moi juste votre playlist. »</blockquote>
<p>
  Une playlist n’est pas une soirée. Le travail consiste précisément à décider
  quel morceau passer, et surtout <em>quand</em>, en fonction de ce qui se passe dans la salle.
</p>
<blockquote>« Le déplacement, on verra plus tard. »</blockquote>
<p>
  C’est la première ligne du budget qui dérape. Elle doit être chiffrée avant signature.
</p>

<h2>Les spécificités toulousaines</h2>
<p>
  En Haute-Garonne, deux sujets reviennent systématiquement. Le premier est le
  <strong>limiteur sonore</strong>&nbsp;: beaucoup de domaines de la couronne toulousaine
  en sont équipés, et un système mal calibré déclenche des coupures à répétition
  en pleine soirée. Le second est le <strong>basculement extérieur-intérieur</strong>,
  imposé par les arrêtés préfectoraux en été.
</p>
<p>
  Un DJ qui connaît la région évoquera ces deux points de lui-même. S’il ne les
  mentionne jamais, c’est qu’il n’a pas beaucoup travaillé dans le secteur.
</p>

<h2>Quand réserver&nbsp;?</h2>
<p>
  Pour un samedi de juin à septembre à Toulouse, comptez douze à dix-huit mois
  d’avance. Les bons DJ de mariage sont réservés avant la plupart des autres
  prestataires, souvent avant même que le traiteur ne soit choisi.
</p>

<hr style="border:none;border-top:1px solid var(--line);margin:3.5rem 0">
<p>
  <a href="/prestations/dj-mariage/">Voir la prestation DJ mariage</a> &middot;
  <a href="/dj-mariage-toulouse/">DJ mariage à Toulouse</a> &middot;
  <a href="/faq/">Toutes les questions fréquentes</a>
</p>
HTML

article "choisir-dj-mariage-toulouse" \
 "Comment choisir son DJ de mariage à Toulouse — Agence Silence" \
 "Sept questions à poser à un DJ de mariage avant de signer, trois réponses qui doivent vous alerter, et les deux spécificités toulousaines à connaître : limiteur sonore et arrêtés d’été." \
 "Comment choisir son DJ de mariage à Toulouse" \
 "Sept questions à poser avant de signer, trois réponses qui doivent vous faire fuir, et deux spécificités locales que la plupart des couples découvrent trop tard." \
 "blog-choisir-dj.svg" "2026-08-12" "12 août 2026" "$A1"

# ------------------------------------------------------------- ARTICLE 2 --
read -r -d '' A2 <<'HTML' || true
<p class="mt-0">
  C’est la question que tout le monde pose en premier et que peu de sites traitent
  honnêtement. Voici les chiffres réels du marché toulousain, et surtout ce qu’ils
  recouvrent.
</p>

<h2>Les ordres de grandeur</h2>
<p>
  À Toulouse et en Haute-Garonne, un DJ de mariage se situe généralement dans ces
  fourchettes, pour une soirée complète&nbsp;:
</p>
<ul>
  <li><strong>600 à 1&nbsp;000&nbsp;€</strong> — souvent un DJ débutant ou occasionnel,
      matériel limité, pas de secours, préparation minimale.</li>
  <li><strong>1&nbsp;200 à 2&nbsp;500&nbsp;€</strong> — le cœur du marché professionnel.
      Repérage, préparation, matériel doublé, assurance, déplacement inclus.</li>
  <li><strong>2&nbsp;500 à 4&nbsp;000&nbsp;€ et plus</strong> — prestations sur plusieurs
      espaces, éclairage scénique, mariages sur deux jours, ou déplacements lointains.</li>
</ul>

<h2>Ce que vous payez réellement</h2>
<p>
  Une prestation de mariage ne se résume pas aux huit heures visibles. Sur une
  prestation à 1&nbsp;700&nbsp;€, le temps réellement engagé se répartit à peu près ainsi&nbsp;:
</p>
<ul>
  <li>Deux à trois rendez-vous de préparation&nbsp;: 4&nbsp;h</li>
  <li>Repérage du lieu et échanges avec les prestataires&nbsp;: 4&nbsp;h</li>
  <li>Construction et test de la sélection musicale&nbsp;: 8&nbsp;h</li>
  <li>Chargement, route, installation et démontage&nbsp;: 8&nbsp;h</li>
  <li>Prestation elle-même&nbsp;: 10&nbsp;h</li>
</ul>
<p>
  Soit une trentaine d’heures, auxquelles s’ajoute l’amortissement d’un parc matériel
  de plusieurs dizaines de milliers d’euros, l’assurance, et le doublon de secours
  qui ne sert — heureusement — presque jamais.
</p>

<h2>Où se situe le vrai risque</h2>
<p>
  Le risque, en choisissant l’offre la moins chère, n’est pas d’avoir une mauvaise
  playlist. C’est plus prosaïque&nbsp;: pas de matériel de secours, pas d’assurance
  exigible par le domaine, pas de repérage, et une disponibilité incertaine si une
  prestation mieux payée se présente.
</p>
<p>
  Rapporté au budget global d’un mariage — où le DJ représente en général
  entre 4&nbsp;% et 7&nbsp;% du total — l’écart entre une offre à 900&nbsp;€ et une
  offre à 1&nbsp;700&nbsp;€ est marginal. L’écart de risque, lui, ne l’est pas.
</p>

<h2>Les postes qui font varier le devis</h2>
<ul>
  <li><strong>La durée</strong>&nbsp;: une soirée jusqu’à 4&nbsp;h coûte plus qu’une soirée
      jusqu’à 2&nbsp;h, mécaniquement.</li>
  <li><strong>Le nombre d’espaces</strong>&nbsp;: cérémonie en extérieur, cocktail au jardin
      et dîner en salle, c’est trois systèmes à installer, pas un.</li>
  <li><strong>L’éclairage</strong>&nbsp;: l’ambiance de base est généralement incluse&nbsp;;
      la mise en lumière architecturale du bâtiment est une option.</li>
  <li><strong>Le déplacement</strong>&nbsp;: inclus dans un rayon proche, chiffré au-delà.</li>
  <li><strong>La saison</strong>&nbsp;: un samedi de juin ne se négocie pas comme un
      vendredi de novembre.</li>
</ul>

<h2>Une question à poser systématiquement</h2>
<blockquote>« Ce montant est-il ferme, ou peut-il évoluer&nbsp;? »</blockquote>
<p>
  Un devis professionnel est ferme. Les heures supplémentaires éventuelles y figurent
  avec leur tarif, connu à l’avance. Si le devis reste flou sur ce point, la facture
  finale le sera aussi.
</p>

<hr style="border:none;border-top:1px solid var(--line);margin:3.5rem 0">
<p>
  <a href="/prestations/dj-mariage/">Les formules DJ mariage et leurs tarifs</a> &middot;
  <a href="/blog/choisir-dj-mariage-toulouse/">Comment choisir son DJ de mariage</a>
</p>
HTML

article "budget-dj-mariage" \
 "Quel budget pour un DJ de mariage ? Les prix réels à Toulouse" \
 "Combien coûte un DJ de mariage à Toulouse : les fourchettes réelles du marché, le détail des trente heures de travail derrière une prestation, et les postes qui font varier un devis." \
 "Quel budget prévoir pour un DJ de mariage ?" \
 "Les fourchettes réelles du marché toulousain, le détail de ce que recouvre un tarif, et l’endroit exact où se situe le risque quand on choisit le moins cher." \
 "blog-budget-dj.svg" "2026-06-24" "24 juin 2026" "$A2"

# ------------------------------------------------------------- ARTICLE 3 --
read -r -d '' A3 <<'HTML' || true
<p class="mt-0">
  Vue depuis la cabine, une tendance mariage n’est pas une couleur de nappe. C’est un
  changement de déroulé, qui modifie la façon dont la soirée se construit. Voici ce
  qui bouge réellement pour 2027.
</p>

<h2>La cérémonie laïque s’allonge et se soigne</h2>
<p>
  Il y a cinq ans, la cérémonie laïque durait vingt minutes et se sonorisait avec une
  enceinte posée sur un pied. Aujourd’hui, elle dépasse souvent quarante-cinq minutes,
  avec quatre à six intervenants, des lectures, parfois un live acoustique.
</p>
<p>
  Conséquence concrète&nbsp;: il faut des micros HF en nombre, un retour pour l’officiant,
  et une gestion des entrées et sorties musicales calées au signal. Ce n’est plus un
  supplément anecdotique, c’est une prestation à part entière.
</p>

<h2>Le dîner raccourcit, la piste s’ouvre plus tôt</h2>
<p>
  La tendance de fond est nette&nbsp;: moins de discours interminables, moins d’animations
  entre les plats, un dîner qui se termine vers 23&nbsp;h plutôt que minuit. Les mariés
  veulent danser plus longtemps.
</p>
<p>
  Cela change la construction de la soirée. Ouvrir la piste plus tôt implique de tenir
  une intensité pendant cinq heures au lieu de trois — ce qui se prépare, sous peine
  d’un creux vers 1&nbsp;h du matin.
</p>

<h2>Le retour du live, en complément</h2>
<p>
  Saxophoniste sur le cocktail, percussionniste sur la fin de soirée, chanteuse pour
  l’ouverture de bal&nbsp;: les formats hybrides se multiplient. Bien fait, l’effet est
  spectaculaire. Mal calé, c’est un musicien qui joue par-dessus le mix.
</p>
<p>
  La règle est simple&nbsp;: le musicien doit être briefé par le DJ, sur les mêmes morceaux,
  avec un retour dédié et des plages d’intervention définies à l’avance.
</p>

<h2>Une sélection musicale plus large, moins « années 80 »</h2>
<p>
  Le medley nostalgique obligatoire recule. Les couples qui se marient en 2027 ont grandi
  avec les années 2000 et 2010, et les assument. Cela ne veut pas dire abandonner les
  générations précédentes&nbsp;: cela veut dire construire la soirée par vagues plutôt que
  par blocs d’époques.
</p>

<h2>Moins d’effets, plus de lumière</h2>
<p>
  Le laser et le stroboscope disparaissent des demandes. Ce qui les remplace&nbsp;: un
  éclairage chaud qui met en valeur la pierre, la charpente ou les arbres, et des sources
  basses plutôt que des projecteurs en hauteur. Le mariage se photographie beaucoup&nbsp;;
  l’éclairage se pense désormais aussi pour l’objectif.
</p>

<h2>Ce qui ne change pas</h2>
<p>
  La règle fondamentale tient depuis dix ans&nbsp;: une soirée réussie tient à la lecture
  de la salle, pas à la playlist. Tous les effets du monde ne rattrapent pas un DJ qui
  ne regarde pas ses danseurs.
</p>

<hr style="border:none;border-top:1px solid var(--line);margin:3.5rem 0">
<p>
  <a href="/prestations/dj-mariage/">La prestation DJ mariage en détail</a> &middot;
  <a href="/blog/choisir-dj-mariage-toulouse/">Comment choisir son DJ de mariage</a>
</p>
HTML

article "tendances-mariage-2027" \
 "Tendances mariage 2027 : ce qui change vraiment dans la soirée" \
 "Cérémonies laïques allongées, dîners raccourcis, retour du live et disparition du laser : les tendances mariage 2027 vues par un DJ de mariage toulousain, côté déroulé." \
 "Les tendances mariage 2027 vues de la cabine" \
 "Cérémonies laïques plus longues, dîners raccourcis, formats hybrides avec musiciens live : ce qui change concrètement dans la construction d’une soirée." \
 "blog-tendances-2027.svg" "2026-04-08" "8 avril 2026" "$A3"
