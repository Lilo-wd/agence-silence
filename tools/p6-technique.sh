#!/usr/bin/env bash
set -e
source "$(dirname "$0")/common.sh"
cd "$ROOT"
TODAY=$(date +%Y-%m-%d)

# ============================================================== SITEMAP ====
url () { # url <chemin> <priorite> <frequence>
  printf '  <url>\n    <loc>%s%s</loc>\n    <lastmod>%s</lastmod>\n    <changefreq>%s</changefreq>\n    <priority>%s</priority>\n  </url>\n' \
    "$SITE" "$1" "$TODAY" "$3" "$2"
}

{
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
url "/"                                  "1.0" "monthly"
url "/dj-mariage-toulouse/"              "0.9" "monthly"
url "/prestations/dj-mariage/"           "0.9" "monthly"
url "/contact/"                          "0.9" "yearly"
url "/dj-mariage-castres/"               "0.8" "monthly"
url "/prestations/"                      "0.8" "monthly"
url "/prestations/options-mariage/"      "0.8" "monthly"
url "/prestations/dj-entreprise/"        "0.8" "monthly"
url "/prestations/dj-soiree-privee/"     "0.8" "monthly"
url "/temoignages/"                      "0.8" "monthly"
url "/a-propos/"                         "0.7" "yearly"
url "/galerie/"                          "0.7" "monthly"
url "/zone-intervention/"                "0.7" "yearly"
url "/faq/"                              "0.7" "yearly"
url "/blog/"                             "0.6" "weekly"
url "/blog/choisir-dj-mariage-toulouse/" "0.6" "yearly"
url "/blog/budget-dj-mariage/"           "0.6" "yearly"
url "/blog/tendances-mariage-2027/"      "0.6" "yearly"
echo '</urlset>'
} > sitemap.xml
echo "  ecrit  sitemap.xml"

# ============================================================== ROBOTS ====
if [ "$PREPROD" = "1" ]; then
cat > robots.txt <<TXT
# robots.txt — Agence Silence
#
# PREPRODUCTION : le site est en ligne mais volontairement ferme aux moteurs.
# Le domaine agence-silence.com n'est pas encore branche et les photos sont
# provisoires. Pour ouvrir le site : PREPROD=0 en haut de tools/common.sh,
# puis relancer la generation.
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
Disallow: /contact/merci/

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

# Pages villes retirees en septembre 2026 : l'agence n'intervient pas dans
# ces regions. Redirigees vers la zone d'intervention.
[[redirects]]
  from = "/dj-mariage-bordeaux/*"
  to   = "/zone-intervention/"
  status = 301
  force = true

[[redirects]]
  from = "/dj-mariage-montpellier/*"
  to   = "/zone-intervention/"
  status = 301
  force = true

[[redirects]]
  from = "/dj-mariage-paris/*"
  to   = "/zone-intervention/"
  status = 301
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
# form-action et connect-src : 'self' suffit, le formulaire passe par
# Netlify Forms sur le meme domaine (Formspree n'est plus utilise).
cat > _headers <<'HDR'
/*
  X-Frame-Options: SAMEORIGIN
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: geolocation=(), microphone=(), camera=(), interest-cohort=()
  Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
  Content-Security-Policy: default-src 'self'; base-uri 'self'; form-action 'self'; frame-ancestors 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; script-src 'self' 'sha256-xMEne5xSNlgeOligOATNEvyFpyN5H3HG/E/qDyG8S5Y=' 'unsafe-hashes' 'sha256-MhtPZXr7+LpJUY5qtMutB+qWfQtMaPccfe7QXtCcEYc='; connect-src 'self'; object-src 'none'; upgrade-insecure-requests

/assets/*
  Cache-Control: public, max-age=31536000, immutable

/*.html
  Cache-Control: public, max-age=0, must-revalidate
HDR
echo "  ecrit  _headers"


# ============================================================== VERSION ====
# Permet de verifier d'un coup d'oeil quelle generation est reellement en ligne.
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
# Verrous LibreOffice quand un document est ouvert
.~lock.*

# Images de demonstration trouvees sur le web — ne pas publier
/tools/demo-assets/
GIT
echo "  ecrit  .gitignore"
