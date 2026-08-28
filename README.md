# Agence Silence — site vitrine

Site statique multi-pages (HTML / CSS / JS, aucune dépendance, aucun build).
21 pages, 635 Ko publiés (hors `tools/`). Se déploie tel quel sur Netlify.

---

> **Le document à envoyer à Léo** pour récupérer tout ce qui manque :
> `Documents/Questionnaire-Agence-Silence.odt` (version à remplir) et son `.pdf`
> (version à lire ou imprimer). 18 sections, dont une liste précise des photos attendues.

## 1. Ce qu'il reste à faire avant la mise en ligne

Par ordre de priorité. Les points 2 et 3 sont bloquants ; le logo est fait.

### 0. Le logo — intégré, mais à améliorer plus tard

Le logo est en place sur les 21 pages. **Attention à la source :** le fichier
fourni était une *capture d'écran JPEG* (966 × 845, fond blanc opaque,
artefacts de compression), et non le fichier d'origine.

Ce qui en a été tiré :

| Fichier servi | Usage | Poids |
|---|---|---|
| `assets/img/logo.webp` | En-tête, verrou horizontal 430 × 120 affiché à 46 px | 15,5 Ko |
| `assets/img/logo-empile-blanc.webp` | Pied de page, version blanche empilée | 16,2 Ko |
| `assets/img/logo-blanc.webp` | Verrou horizontal blanc, en réserve | 14,7 Ko |
| `assets/img/logo-empile.webp` | Version empilée sombre, en réserve | 17,3 Ko |
| `assets/img/logo-mark[-blanc].webp` | Icône seule | 13 Ko |
| `favicon.png` | Onglet, 64 × 64 | 1,9 Ko |
| `assets/img/apple-touch-icon.png` | Écran d'accueil iOS, 180 × 180 | 6,9 Ko |
| `assets/img/og-agence-silence.jpg` | Aperçu de partage, 1200 × 630 | 24,6 Ko |

Méthode : le fond blanc a été retiré en résolvant, pour chaque pixel,
l'équation de mélange `pixel = α × encre + (1 − α) × blanc` contre les deux
encres du logo. Ça restitue des aplats nets, une transparence antialiasée
correcte, et ça efface au passage les franges de compression JPEG.
Les versions blanches sont obtenues en substituant l'encre noire, le violet
étant conservé (4,8:1 sur `#1A1A1A`, conforme AA).

Les fichiers maîtres haute définition et le JPEG d'origine sont dans
`tools/logo-source/` — non publiés. Planche de contrôle : `tools/controle-logo.png`.

**Ce qu'il faut encore demander à Léo :** le *fichier vectoriel d'origine*
(`.svg`, `.ai`, `.eps` ou `.pdf`) auprès de qui a créé le logo. Un vecteur
resterait net à n'importe quelle taille, pèserait quelques kilo-octets au lieu
de 15, et donnerait un favicon parfaitement net à 16 px. En l'état, la qualité
est bonne pour un écran, mais elle est plafonnée par la capture d'écran.
C'est la question 1 de la section 12 du questionnaire.

### 1. La couleur d'accent — relevée

`--lavande: #7B7AE9`, mesuré au pixel sur l'intérieur des aplats du logo
(médiane sur 23 655 pixels, hors bords antialiasés). La valeur du brief
(`#7B7EE8`) était juste à 4/255 près sur le vert — écart invisible.

`--lavande-deep: #5A59CA` est la même teinte assombrie, utilisée dès que le
violet porte du texte sur fond clair : 5,3:1 sur écru, 4,9:1 sur écru foncé,
donc conforme WCAG AA. Le violet du logo lui-même ne fait que 3,4:1 sur écru,
il ne doit donc jamais servir à du texte sur fond clair — uniquement aux
filets, aux puces et aux fonds sombres.

Si le fichier vectoriel révèle une valeur différente, ajuster les deux
variables ensemble en gardant ce rapport de contraste.

### 2. Les coordonnées (NAP)

Toutes les données de contact sont des **placeholders** :

| Donnée   | Valeur actuelle          |
|----------|--------------------------|
| Adresse  | 12 rue de la Pomme, 31000 Toulouse |
| Téléphone| 06 12 34 56 78 / +33612345678 |
| E-mail   | contact@agence-silence.fr |

Elles apparaissent dans le pied de page, la page contact, les données
structurées `LocalBusiness` et `assets/js/main.js`. Elles doivent être
**strictement identiques** à la fiche Google Business Profile — c'est le
critère NAP, un des principaux facteurs de référencement local.

Le plus simple : modifier les variables en haut de `tools/common.sh`
(`TEL_AFF`, `TEL_URI`, `MAIL`, `RUE`, `CP`, `VILLE`) et régénérer.

### 3. Le formulaire de devis

`contact/index.html` pointe vers `https://formspree.io/f/VOTRE_ID`.
Tant que `VOTRE_ID` est présent, le JavaScript affiche un message invitant
le visiteur à téléphoner plutôt que de perdre silencieusement sa demande.

Pour le brancher : créer un formulaire sur [formspree.io](https://formspree.io)
et remplacer l'attribut `action`. Alternative sans compte tiers : Netlify Forms
(ajouter l'attribut `netlify` sur la balise `<form>`).

Si l'endpoint change de domaine, mettre à jour `form-action` et `connect-src`
dans le fichier `_headers` (politique de sécurité CSP).

### 4. Photos et vidéos

Les 25 visuels `.svg` de `assets/img/` sont des **dégradés d'attente** (les fichiers `logo*`, `favicon` et `og-*` sont, eux, définitifs).
Ils sont légers (108 Ko au total) et respectent les proportions finales,
donc les remplacer ne provoquera aucun décalage de mise en page.

| Fichier                    | Format à fournir | Usage |
|----------------------------|------------------|-------|
| `hero-mariage-toulouse.svg`| 2000 × 1250 paysage | Bandeau d'accueil |
| `ville-*.svg`              | 1800 × 1000 paysage | Bandeaux des pages villes |
| `prestation-*.svg`         | 1400 × 1050 (4:3)   | Cartes prestations |
| `leo-portrait.svg`         | 1100 × 1375 portrait| Page « Le DJ » |
| `galerie-01` à `08`        | 900 × 1200 portrait | Galerie |
| `galerie-09`, `10`         | 1400 × 933 paysage  | Galerie, format large |
| `blog-*.svg`               | 1400 × 933 paysage  | Illustrations d'articles |

Fournir en **`.webp`** (meilleur rapport poids/qualité) et adapter l'extension
dans les balises `<img>`. Viser moins de 200 Ko par image.

**Les attributs `alt` sont déjà rédigés et géolocalisés** (« DJ mariage
Toulouse — ouverture de bal dans un domaine du Lauragais, Haute-Garonne »).
Les conserver et les adapter à ce que montre réellement la photo.

Pour les vidéos, voir le commentaire en bas de `galerie/index.html` :
utiliser une balise `<video>` locale, **pas** d'iframe YouTube (cela ferait
chuter le score Lighthouse et casserait la CSP).

### 5. Témoignages et avis

Les six témoignages de `temoignages/index.html` sont des exemples de mise en
page. Ils doivent être remplacés par de vrais avis.

⚠️ **Le balisage `Review` / `AggregateRating` est volontairement commenté**
dans cette page. Publier des données structurées d'avis sur de faux
témoignages est une violation des règles Google, sanctionnée par une action
manuelle. Ne décommenter ce bloc qu'une fois les vrais avis en place, et
aligner `ratingValue` / `reviewCount` sur ce qui est réellement affiché.

### 6. Mentions légales

`mentions-legales/index.html` contient des champs `[à compléter]` :
raison sociale, statut juridique, SIRET, TVA, directeur de la publication.

### 7. Le nom de domaine

Le site est écrit pour `https://agence-silence.fr`. Cette valeur apparaît dans
les balises canoniques, Open Graph, `sitemap.xml`, `robots.txt` et toutes les
données structurées.

Si le domaine diffère, modifier la variable `SITE` en haut de
`tools/common.sh` et `tools/p6-technique.sh`, puis régénérer.

---

## 2. Déploiement sur Netlify

Même procédure que les sites de garage :

1. Pousser le dossier sur GitHub.
2. Sur Netlify, « Add new site » → « Import an existing project ».
3. Aucun réglage de build à saisir : `netlify.toml` déclare
   `publish = "."` et une commande de build vide.
4. Brancher le domaine dans « Domain management ».

Les fichiers `_headers` (sécurité + cache) et `netlify.toml` (redirections 301
et page 404) sont pris en compte automatiquement.

### Prévisualiser en local

Sans Node.js sur cette machine, ouvrir les fichiers en `file://` casse les
liens absolus (`/contact/`). Utiliser le petit serveur PowerShell :

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File tools/serve.ps1
```

Puis ouvrir `http://localhost:8791/`.

---

## 3. Ce qui est déjà en place côté SEO

- **Métadonnées uniques** sur les 21 pages : `<title>` (tous ≤ 65 caractères),
  `meta description`, canonique, Open Graph, Twitter Card.
- **Un seul `<h1>` par page**, contenant le mot-clé principal, puis
  hiérarchie `h2` / `h3` propre. Vérifié page par page.
- **Pages géolocalisées** : `/dj-mariage-toulouse/`, `/dj-mariage-bordeaux/`,
  `/dj-mariage-montpellier/`, `/dj-mariage-paris/`. Chacune a un contenu
  réellement différent (contraintes locales, secteurs, logistique) — c'est ce
  qui les protège du filtre « pages dupliquées » de Google.
- **Pas de cannibalisation** : `/prestations/dj-mariage/` (la prestation) et
  `/dj-mariage-toulouse/` (la page locale) ont des titres et des H1 distincts.
- **`alt` géolocalisés et descriptifs** sur toutes les images, en systématisant
  la pratique repérée chez Les Petites Pépites et en l'étendant à plus de villes.
- **Données structurées** : `LocalBusiness` + `WebSite` + `Person` en accueil,
  `Service` sur les prestations et les pages villes, `FAQPage` sur la FAQ,
  `BlogPosting` sur les articles, `BreadcrumbList` partout, `ContactPage`.
  Tous validés (JSON parsé sans erreur).
- **`sitemap.xml`** avec priorités hiérarchisées, **`robots.txt`** pointant
  vers le sitemap.
- **Maillage interne** : chaque page ville renvoie vers les autres villes et
  vers la prestation ; les articles renvoient vers les prestations ; le pied
  de page expose l'ensemble de l'arborescence.
- **NAP** visible en pied de page sur les 21 pages, prêt pour Google Business
  Profile.
- **Performance** : aucun framework, aucune dépendance, aucun CDN sauf Google
  Fonts (chargé en non bloquant). CSS 15 Ko, JS 5 Ko, images 108 Ko au total.
  Attributs `width`/`height` sur toutes les images (aucun décalage de mise en
  page), `fetchpriority="high"` sur l'image de bandeau, `loading="lazy"`
  ailleurs.
- **Accessibilité** : contrastes validés WCAG AA (recalculés et corrigés),
  navigation au clavier, lien d'évitement, `aria-expanded` sur le menu mobile,
  contenu intégralement lisible sans JavaScript.

### Note sur le balisage `Event`

Le brief demandait `LocalBusiness` **+ `Event`**. `LocalBusiness` est en place.
En revanche `Event` décrit un événement **public et identifiable** (date, lieu,
billetterie). Un mariage privé n'en est pas un : le balisage serait rejeté par
Google et exposerait des données de clients. Il a été remplacé par `Service`,
qui est le type adapté à une prestation. À reconsidérer si Léo organise un jour
des événements ouverts au public.

---

## 4. Modifier le site

### Une page en particulier

Éditer directement le fichier HTML concerné. Le site est statique, il n'y a
rien à recompiler.

### L'en-tête, le pied de page ou le bandeau d'appel à l'action

Ces blocs sont identiques sur les 21 pages. Plutôt que de les modifier 21 fois,
utiliser les générateurs dans `tools/` :

```bash
cd tools && for s in p1-accueil p2-prestations p3-villes p4-pages p5-blog p6-technique; do bash $s.sh; done
```

- `common.sh` — en-tête, pied de page, fil d'Ariane, bandeau CTA, coordonnées
- `p1-accueil.sh` — accueil
- `p2-prestations.sh` — « Le DJ » + les 4 pages prestations
- `p3-villes.sh` — les 4 pages villes
- `p4-pages.sh` — galerie, témoignages, zone, FAQ, contact, mentions, 404
- `p5-blog.sh` — le journal et ses 3 articles
- `p6-technique.sh` — sitemap, robots, netlify.toml, _headers, favicon

⚠️ Ces scripts **écrasent** les fichiers HTML. Si des modifications ont été
faites à la main dans les pages, les reporter dans le générateur avant de le
relancer.

### Ajouter une page ville

Dans `p3-villes.sh`, dupliquer un appel à `ville` et écrire un contenu
réellement spécifique (contraintes locales, secteurs desservis, logistique).
Une page ville sans contenu propre est contre-productive : Google la traite
comme du remplissage et cela pèse sur le site entier.

Puis ajouter l'URL dans `p6-technique.sh` (sitemap) et dans les listes de
liens du pied de page (`common.sh`).

### Ajouter un article

Dans `p5-blog.sh`, dupliquer un appel à `article` et ajouter l'entrée
correspondante dans la liste de `blog/index.html` (même fichier) ainsi que
dans le sitemap.

---

## 5. Après la mise en ligne

1. **Google Search Console** — valider le domaine, soumettre
   `https[...]/sitemap.xml`, surveiller la couverture d'indexation.
2. **Google Business Profile** — créer/réclamer la fiche avec un NAP
   strictement identique à celui du pied de page, et y ajouter le site.
3. **Test des résultats enrichis** — passer l'accueil, une page prestation et
   la FAQ dans l'outil de test des données structurées de Google.
4. **PageSpeed Insights** — mesurer une fois les vraies photos en place :
   c'est le seul poste susceptible de faire baisser le score.
5. **Avis Google** — demander systématiquement un avis aux mariés. C'est le
   levier le plus puissant sur les requêtes locales du type « DJ Toulouse »,
   plus que n'importe quelle optimisation technique du site.
