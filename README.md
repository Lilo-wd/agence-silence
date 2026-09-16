# Agence Silence — site vitrine

Site statique multi-pages (HTML / CSS / JS, aucune dépendance, aucun build).
22 pages. Dépôt `Lilo-wd/agence-silence`, déployé en continu sur
https://agence-silence.netlify.app (un `git push` suffit).

Le contenu est celui du **questionnaire rempli par Léo Malhie (septembre 2026)** :
coordonnées, tarifs, biographie, matériel, zone, avis clients et FAQ sont réels.

---

## 1. Ce qu'il reste à faire

### Bloquant pour ouvrir le site à Google

**1. Acheter le nom de domaine `agence-silence.com`.**
Choisi par Léo, libre au registre le 16 septembre 2026. Le site est déjà écrit
pour cette adresse (balises canoniques, sitemap, données structurées). Une fois
acheté : Netlify → *Domain management → Add a domain*.

**2. Les vraies photos.** Aucune photo n'a été fournie avec le questionnaire.
Tous les visuels `.svg` de `assets/img/` sont des dégradés d'attente, et l'image
du hero (`hero-dj-platines.webp`) est **générée par IA** : ce n'est pas Léo.
Liste précise des photos attendues : section 13 du questionnaire.

Quand ces deux points sont réglés, passer en production (§ 2).

### À activer dans Netlify (une fois)

**3. Les demandes de devis par e-mail.** Le formulaire utilise **Netlify Forms**
(aucun compte tiers). Dans Netlify :
- *Site configuration → Forms* : vérifier que la détection des formulaires est
  activée (sinon l'activer et redéployer) ;
- *Forms → Form notifications → Add notification → Email* : envoyer les
  demandes du formulaire `devis` vers **leomalhie@yahoo.fr**.

Sans JavaScript, le formulaire poste directement et affiche `/contact/merci/`.
Avec JavaScript, il envoie sans quitter la page et valide les champs avant.

### Réponses complémentaires de Léo (intégrées)

- **Déplacement** : gratuit dans 50 km, puis **0,60 € du kilomètre aller-retour**.
- **Hébergement** : au-delà d'1 h 20 de route, le DJ dort à proximité la veille,
  **à la charge des clients**.
- **Profils** : Instagram `@agencesilence` et
  [Mariages.net](https://www.mariages.net/musique-mariage/leo-malhie--e274959),
  reliés en pied de page et dans les données structurées (`sameAs`).
- **Château de la Baronnie** : 1854 route de Molières, 82130 Lafrançaise
  (Tarn-et-Garonne), cité sur la page Zone d'intervention.
- **SACEM** : réponse « Personne ». Les mentions SACEM restent retirées plutôt que
  d'afficher une information juridique incertaine.

**Note corrigée** : le questionnaire indiquait 5/5, mais le profil Mariages.net affiche
**4,9/5 sur 59 avis**, avec **3 Wedding Awards (2024, 2025, 2026)**. Le site reprend
les chiffres publics, vérifiables par n'importe quel visiteur. Si la note évolue,
la mettre à jour dans `p1-accueil.sh`, `p2-prestations.sh` et `p4-pages.sh`.

### Dossier suivant attendu de Léo

- **Le logo vectoriel** (`.svg`, `.ai`, `.eps` ou `.pdf`) et sa version blanche.
- **Les photos** : section 13 du questionnaire.
- **Vidéos** : extraits MP4 4K de 20 s à 2 min, à réencoder en 1080p avant ajout
  (commentaire en bas de `galerie/index.html`).
- **Brochure des options** : les tarifs des options y figurent, le site y renvoie.

---

## 2. Le mode PRÉPRODUCTION

`PREPROD=1` en haut de `tools/common.sh`. Tant qu'il vaut 1 : `noindex` sur toutes
les pages, `Disallow: /` dans `robots.txt`, et un bandeau « photos provisoires ».

Il reste à 1 parce que le domaine n'est pas branché (les canoniques pointeraient
vers une adresse qui ne répond pas) et que les photos sont provisoires.

**Pour ouvrir le site aux moteurs** :

```bash
cd tools && sed -i 's/^PREPROD=${PREPROD:-1}$/PREPROD=${PREPROD:-0}/' common.sh && for s in p1-accueil p2-prestations p3-villes p4-pages p5-blog p6-technique; do bash "$s.sh"; done
```

Puis pousser, et **seulement ensuite** déclarer le site dans Google Search Console.

---

## 3. Choix de contenu à connaître

### Les tarifs : un seul endroit, une information par ligne

Retour de Léo (septembre 2026) : les prix étaient incompréhensibles. Ils étaient
éparpillés dans des phrases qui mélangeaient durées, distances et montants, et
« 0,60 € du kilomètre » se lisait « 60 € ».

Désormais :
- une page **`/tarifs/`** (dans le menu) réunit tout ;
- les prix ne s'écrivent **que** dans les blocs de `common.sh` : `TARIF_MARIAGE`,
  `TARIF_PRIVEE`, `TARIF_ENTREPRISE`, `BLOC_DEPLACEMENT`, `BLOC_RESERVATION`,
  `BLOC_OPTIONS`. Un changement de prix se fait là, et nulle part ailleurs ;
- chaque bloc présente une ligne par information : libellé au-dessus, valeur en
  dessous (`.lignes`) ;
- les autres pages affichent au plus le prix du forfait et renvoient vers `/tarifs/`.
  Exceptions à tenir à jour à la main : la FAQ (texte et données structurées),
  l'article budget et les meta descriptions.

Vocabulaire : on écrit « forfait », jamais « pack ».

### Pages villes : Toulouse et Castres uniquement

Les anciennes pages Bordeaux, Montpellier et Paris ont été **supprimées** : Léo n'y
a jamais joué et elles contenaient des affirmations fausses. Elles redirigent en 301
vers `/zone-intervention/`. Castres les remplace : c'est l'un de ses trois secteurs
les plus demandés (avec Toulouse et Ramonville).

Une page ville n'a de valeur que si son contenu est réel. Pour en ajouter une,
partir de faits fournis par Léo, jamais de généralités.

### Avis clients : pas de balisage étoiles

Les 8 avis viennent de Mariages.net, reproduits sans modification (y compris les
fautes) avec l'accord de leurs auteurs. **Aucun balisage `Review` /
`AggregateRating`** : Google n'affiche pas d'étoiles pour des avis publiés par
l'entreprise sur son propre site, et déconseille de reprendre dans son balisage des
avis collectés sur un autre site. Les étoiles viendront de la fiche Google Business
Profile — Léo n'en a pas encore.

### Une agence, pas un DJ seul

Les avis citent Laurie (« Azla ») et Romain aux platines. Le site présente donc
l'Agence Silence comme Léo **et son équipe** : il prépare toujours avec les mariés,
mais ce n'est pas forcément lui qui mixe. L'article « Comment choisir son DJ »,
qui mettait en garde contre les agences envoyant un autre DJ, a été corrigé en
conséquence.

### Affirmations retirées

Parce qu'elles contredisaient le questionnaire : matériel de secours systématique,
repérage systématique du lieu, solde à 30 jours pour les entreprises, référencement
fournisseur / URSSAF, accord de confidentialité, SACEM, fourchettes de prix du
marché et statistiques non sourcées dans l'article budget.

---

## 4. Le logo

Extrait d'une **capture d'écran JPEG** (le fichier vectoriel n'a jamais été fourni).
Fond détouré en résolvant pour chaque pixel `pixel = α × encre + (1 − α) × blanc`.
Maîtres dans `tools/logo-source/` (non publiés).

`--lavande: #7B7AE9` est relevé au pixel sur le logo. `--lavande-deep: #5A59CA`
(même teinte, 5,3:1 sur écru) sert au texte sur fond clair ; le violet du logo seul
ne fait que 3,4:1 et ne doit jamais porter de texte sur fond clair.

---

## 5. Modifier le site

Les 22 pages sont **générées** par les scripts de `tools/`. Ne pas éditer le HTML à
la main : la prochaine génération l'écraserait.

```bash
cd tools && for s in p1-accueil p2-prestations p3-villes p4-pages p5-blog p6-technique; do bash "$s.sh"; done
```

- `common.sh` — coordonnées (NAP), domaine, PREPROD, en-tête, pied de page, bandeau CTA
- `p1-accueil.sh` — accueil
- `p2-prestations.sh` — « Le DJ », prestations, tarifs, mariage, options, entreprise, soirée privée
- `p3-villes.sh` — Toulouse et Castres
- `p4-pages.sh` — galerie, avis, zone, FAQ, contact (+ merci), mentions légales, 404
- `p5-blog.sh` — le journal et ses 3 articles
- `p6-technique.sh` — sitemap, robots, netlify.toml, _headers, version.txt, .gitignore

Les URL du CSS et du JS portent une empreinte (`style.css?v=…`) recalculée à chaque
génération : `_headers` les met en cache un an, sans empreinte les modifications
n'atteindraient jamais les visiteurs déjà venus.

Les chemins sont calculés à partir de l'emplacement des scripts : le projet peut
être déplacé sans rien modifier.

### Prévisualiser en local

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File tools/serve.ps1
```

Puis `http://localhost:8791/`. Le formulaire ne peut pas être testé en local :
seul Netlify reçoit réellement les demandes.

`https://agence-silence.netlify.app/version.txt` indique quelle génération est en ligne.

---

## 6. Après l'ouverture aux moteurs

1. **Google Search Console** — valider le domaine, soumettre le sitemap.
2. **Google Business Profile** — créer la fiche avec le NAP exact du site :
   *Agence Silence, 53 impasse du Communal, 31650 Lauzerville, 06.20.25.66.63*.
3. **Avis Google** — Léo n'en demande pas aujourd'hui. C'est le levier le plus
   puissant sur « DJ Toulouse », avant toute optimisation du site.
4. **Liens entrants** — demander aux domaines de Preissac et de Montjoie, et à la
   photographe Marine Blue, de référencer l'agence parmi leurs prestataires.
5. **PageSpeed Insights** — à mesurer une fois les vraies photos en place.
