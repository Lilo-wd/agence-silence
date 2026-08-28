#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"
cd "$ROOT"
TODAY=$(date +%Y-%m-%d)

# ============================================================== SITEMAP ====
{
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<urlset xmlns="http://www.sitemap.org/schemas/sitemap/0.9">'
} > /dev/null   # placeholder, on ecrit proprement ci-dessous

url () { # url <chemin> <priorite> <frequence>
  printf '  <url>\n    <loc>%s%s</loc>\n    <lastmod>%s</lastmod>\n    <changefreq>%s</changefreq>\n    <priority>%s</priority>\n  </url>\n' \
    "$SITE" "$1" "$TODAY" "$3" "$2"
}

{
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
url "/"                                 "1.0" "monthly"
url "/dj-mariage-toulouse/"             "0.9" "monthly"
url "/prestations/dj-mariage/"          "0.9" "monthly"
url "/contact/"                         "0.9" "yearly"
url "/prestations/"                     "0.8" "monthly"
url "/dj-mariage-bordeaux/"             "0.8" "monthly"
url "/dj-mariage-montpellier/"          "0.8" "monthly"
url "/dj-mariage-paris/"                "0.8" "monthly"
url "/prestations/dj-entreprise/"       "0.8" "monthly"
url "/prestations/dj-soiree-privee/"    "0.8" "monthly"
url "/a-propos/"                        "0.7" "yearly"
url "/temoignages/"                     "0.7" "monthly"
url "/galerie/"                         "0.7" "monthly"
url "/zone-intervention/"               "0.7" "yearly"
url "/faq/"                             "0.7" "yearly"
url "/blog/"                            "0.6" "weekly"
url "/blog/choisir-dj-mariage-toulouse/" "0.6" "yearly"
url "/blog/budget-dj-mariage/"          "0.6" "yearly"
url "/blog/tendances-mariage-2027/"     "0.6" "yearly"
echo '</urlset>'
} > sitemap.xml
echo "  ecrit  sitemap.xml"

# ============================================================== ROBOTS ====
if [ "$PREPROD" = "1" ]; then
cat > robots.txt <<TXT
# robots.txt — Agence Silence
#
# PREPRODUCTION : le site est en ligne mais volontairement ferme aux moteurs.
# Les temoignages, l'adresse et le telephone sont encore des exemples ; laisser
# Google indexer un NAP faux abimerait le referencement local avant meme de
# l'avoir commence.
#
# Pour ouvrir le site : PREPROD=0 en haut de tools/common.sh, puis relancer
# la generation. Ce fichier et les balises meta robots basculent ensemble.
User-agent: *
Disallow: /
TXT
echo "  ecrit  robots.txt  (PREPROD : site ferme aux moteurs)"
else
cat > robots.txt <<TXT
# robots.txt — Agence Silence
User-agent: *
Allow: /
Disallow: /mentions-legales/

Sitemap: $SITE/sitemap.xml
TXT
echo "  ecrit  robots.txt  (production : site ouvert)"
fi

# ============================================================= NETLIFY ====
cat > netlify.toml <<'TOML'
# Configuration Netlify — Agence Silence
# Site 100 % statique : aucune commande de build, on publie le dossier tel quel.

[build]
  publish = "."
  command = ""

# Les URL propres (/contact/ plutot que /contact/index.html) fonctionnent
# nativement grace a la structure en dossiers + index.html.

[[redirects]]
  from = "/tools/*"
  to   = "/404.html"
  status = 404
  force = true

[[redirects]]
  from = "/README.md"
  to   = "/404.html"
  status = 404
  force = true

[[redirects]]
  from = "/prestations/mariage/"
  to   = "/prestations/dj-mariage/"
  status = 301

[[redirects]]
  from = "/dj-toulouse/"
  to   = "/dj-mariage-toulouse/"
  status = 301

[[redirects]]
  from = "/*"
  to   = "/404.html"
  status = 404
TOML
echo "  ecrit  netlify.toml"

# ============================================================= HEADERS ====
cat > _headers <<'HDR'
/*
  X-Frame-Options: SAMEORIGIN
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: geolocation=(), microphone=(), camera=(), interest-cohort=()
  Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
  Content-Security-Policy: default-src 'self'; base-uri 'self'; form-action 'self' https://formspree.io; frame-ancestors 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; script-src 'self' 'sha256-xMEne5xSNlgeOligOATNEvyFpyN5H3HG/E/qDyG8S5Y=' 'unsafe-hashes' 'sha256-MhtPZXr7+LpJUY5qtMutB+qWfQtMaPccfe7QXtCcEYc='; connect-src 'self' https://formspree.io; object-src 'none'; upgrade-insecure-requests

/assets/*
  Cache-Control: public, max-age=31536000, immutable

/*.html
  Cache-Control: public, max-age=0, must-revalidate
HDR
echo "  ecrit  _headers"


# ============================================================== VERSION ====
# Permet de verifier d'un coup d'oeil quelle generation est reellement en
# ligne : https://agence-silence.netlify.app/version.txt
# Utile quand on doute qu'un deploiement soit bien passe.
cat > version.txt <<TXT
Agence Silence — site statique
Genere le : $(date -u +"%Y-%m-%d %H:%M UTC")
Preprod   : $PREPROD $([ "$PREPROD" = "1" ] && echo "(ferme aux moteurs)" || echo "(ouvert aux moteurs)")
Pages     : $(find "$ROOT" -name "*.html" -not -path "*/tools/*" | wc -l | tr -d ' ')
TXT
echo "  ecrit  version.txt"


# ============================================================ GITIGNORE ====
cat > .gitignore <<'GIT'
# Fichiers systeme
Thumbs.db
desktop.ini
.DS_Store

# Editeurs
.vscode/
.idea/

# Documents de travail internes — ne jamais publier
/_travail/
*.odt
*.pdf
*.docx
*.xlsx
Questionnaire*
GIT
echo "  ecrit  .gitignore"
