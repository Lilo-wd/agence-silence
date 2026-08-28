/* Agence Silence — interactions
   Aucune dependance externe. Tout est optionnel : le site reste
   parfaitement lisible et navigable si ce fichier ne se charge pas. */
(function () {
  'use strict';

  /* ---------------------------------------------------- Navigation mobile
     L affichage est entierement gere par le CSS via la classe .is-nav-open
     sur le header. Le JS ne fait que basculer cette classe et l attribut
     aria-expanded : le menu ne peut donc jamais rester bloque en position
     fermee sur grand ecran. */
  var header = document.querySelector('.site-header');
  var toggle = document.querySelector('.nav-toggle');
  var nav = document.getElementById('nav-principal');
  var mq = window.matchMedia('(max-width: 1060px)');

  function closeNav() {
    if (!header || !toggle) return;
    header.classList.remove('is-nav-open');
    toggle.setAttribute('aria-expanded', 'false');
  }

  if (header && toggle && nav) {
    toggle.addEventListener('click', function () {
      var open = header.classList.toggle('is-nav-open');
      toggle.setAttribute('aria-expanded', String(open));
    });

    nav.addEventListener('click', function (e) {
      if (e.target.closest('a')) closeNav();
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && header.classList.contains('is-nav-open')) {
        closeNav();
        toggle.focus();
      }
    });

    // Retour au grand ecran : on remet le bouton dans son etat replie.
    var onMq = function () { if (!mq.matches) closeNav(); };
    (mq.addEventListener ? mq.addEventListener('change', onMq) : mq.addListener(onMq));
  }

  /* --------------------------------------------- En-tete escamotable
     Descente = l'en-tete s'efface vers le haut. Remontee = il revient.
     Le CSS fait l'animation, on se contente de poser la classe. */
  if (header) {
    var SEUIL_HAUT   = 140;  // zone haute ou l'en-tete reste toujours visible
    var SEUIL_DELTA  = 8;    // ignore les micro-soubresauts et le rebond iOS
    var dernierY = Math.max(0, window.scrollY);
    var ticking = false;

    var montrer = function () { header.classList.remove('is-hidden'); };
    var cacher  = function () { header.classList.add('is-hidden'); };

    var majEntete = function () {
      var y = Math.max(0, window.scrollY);          // iOS peut passer negatif
      header.classList.toggle('is-scrolled', y > 12);

      var delta = y - dernierY;
      if (Math.abs(delta) < SEUIL_DELTA) return;    // on garde dernierY : le
                                                    // mouvement doit s'accumuler
      // Tiroir mobile ouvert : masquer l'en-tete emporterait le menu avec lui.
      if (header.classList.contains('is-nav-open')) montrer();
      else if (y <= SEUIL_HAUT) montrer();          // haut de page : toujours la
      else if (delta > 0) cacher();
      else montrer();

      dernierY = y;
    };

    var onScroll = function () {
      if (ticking) return;
      ticking = true;
      window.requestAnimationFrame(function () { majEntete(); ticking = false; });
    };

    window.addEventListener('scroll', onScroll, { passive: true });

    // Navigation au clavier : si le focus entre dans un en-tete masque,
    // l'utilisateur ne verrait pas ou il se trouve.
    header.addEventListener('focusin', montrer);
    // Ouvrir le menu doit toujours ramener l'en-tete.
    if (toggle) toggle.addEventListener('click', montrer);

    majEntete();
  }

  /* --------------------------------------------- Apparition au defilement */
  var revealables = document.querySelectorAll('.reveal');
  if (revealables.length) {
    if (!('IntersectionObserver' in window) ||
        window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      Array.prototype.forEach.call(revealables, function (el) {
        el.classList.add('is-in');
      });
    } else {
      var io = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-in');
            io.unobserve(entry.target);
          }
        });
      }, { rootMargin: '0px 0px -8% 0px', threshold: 0.08 });
      Array.prototype.forEach.call(revealables, function (el) { io.observe(el); });

      // Filet de securite : si l observateur ne se declenche jamais (onglet en
      // arriere-plan, moteur sans compositing, extension bloquante), le contenu
      // doit rester visible. Rien ne justifie de cacher du texte a cause d une
      // animation decorative.
      window.setTimeout(function () {
        Array.prototype.forEach.call(revealables, function (el) {
          el.classList.add('is-in');
        });
      }, 2500);
    }
  }

  /* --------------------------------------------------- Formulaire de devis
     Envoi en AJAX vers l'endpoint declare dans l'attribut action du <form>.
     Compatible Formspree / Netlify Forms / Resend via fonction serverless.
     Si l'envoi AJAX echoue, on laisse le navigateur soumettre normalement. */
  var form = document.querySelector('[data-devis-form]');
  if (form) {
    var status = form.querySelector('[data-form-status]');
    var submit = form.querySelector('button[type="submit"]');

    var say = function (message, isError) {
      if (!status) return;
      status.hidden = false;
      status.textContent = message;
      status.style.borderLeftColor = isError ? '#C0392B' : '';
      status.style.background = isError ? '#FBEDEB' : '';
    };

    form.addEventListener('submit', function (e) {
      var endpoint = form.getAttribute('action') || '';
      // Endpoint non configure : on previent au lieu de perdre la demande.
      if (endpoint.indexOf('VOTRE_ID') !== -1 || endpoint === '' || endpoint === '#') {
        e.preventDefault();
        say('Le formulaire n’est pas encore relié à une boîte mail. ' +
            'Écrivez directement à contact@agence-silence.fr ou appelez le 06 12 34 56 78.', true);
        return;
      }

      e.preventDefault();
      if (submit) { submit.disabled = true; submit.dataset.label = submit.textContent; submit.textContent = 'Envoi en cours…'; }
      say('Envoi de votre demande…', false);

      fetch(endpoint, {
        method: 'POST',
        body: new FormData(form),
        headers: { Accept: 'application/json' }
      }).then(function (res) {
        if (!res.ok) throw new Error('HTTP ' + res.status);
        form.reset();
        say('Merci, votre demande est bien partie. Léo vous répond sous 24 h ouvrées ' +
            'avec la disponibilité de votre date et une proposition chiffrée.', false);
      }).catch(function () {
        say('L’envoi a échoué. Écrivez-nous à contact@agence-silence.fr ' +
            'ou appelez le 06 12 34 56 78, nous reprenons la main tout de suite.', true);
      }).then(function () {
        if (submit) { submit.disabled = false; submit.textContent = submit.dataset.label || 'Envoyer ma demande'; }
      });
    });
  }

  /* ------------------------------------------------------- Annee dynamique */
  Array.prototype.forEach.call(document.querySelectorAll('[data-annee]'), function (el) {
    el.textContent = String(new Date().getFullYear());
  });
})();
