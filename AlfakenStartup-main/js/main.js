/* ========================================================
   Alfaken Startup – Main JavaScript
   ======================================================== */

'use strict';

// ---------- Navbar scroll behaviour ----------
const navbar  = document.getElementById('navbar');
const navLinks = document.getElementById('navLinks');
const hamburger = document.getElementById('hamburger');

function onScroll() {
  if (window.scrollY > 60) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
}
window.addEventListener('scroll', onScroll, { passive: true });
onScroll();

// ---------- Mobile menu ----------
hamburger.addEventListener('click', () => {
  const isOpen = navLinks.classList.toggle('open');
  hamburger.classList.toggle('open', isOpen);
  hamburger.setAttribute('aria-expanded', String(isOpen));
  document.body.style.overflow = isOpen ? 'hidden' : '';
});

// Close mobile menu when a link is clicked
navLinks.querySelectorAll('a').forEach(link => {
  link.addEventListener('click', () => {
    navLinks.classList.remove('open');
    hamburger.classList.remove('open');
    hamburger.setAttribute('aria-expanded', 'false');
    document.body.style.overflow = '';
  });
});

// ---------- Smooth scroll for anchor links ----------
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    const target = document.querySelector(this.getAttribute('href'));
    if (!target) return;
    e.preventDefault();
    const navH = navbar.getBoundingClientRect().height;
    const top  = target.getBoundingClientRect().top + window.scrollY - navH;
    window.scrollTo({ top, behavior: 'smooth' });
  });
});

// ---------- Intersection Observer – AOS-like animations ----------
const aosElements = document.querySelectorAll('[data-aos]');

const aosObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('aos-animate');
      aosObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.12, rootMargin: '0px 0px -50px 0px' });

aosElements.forEach(el => aosObserver.observe(el));

// ---------- Counter animation ----------
function animateCounter(el) {
  const target = parseInt(el.dataset.target, 10);
  const duration = 1600;
  const step     = 16;
  const increment = target / (duration / step);
  let current = 0;

  const timer = setInterval(() => {
    current += increment;
    if (current >= target) {
      el.textContent = target;
      clearInterval(timer);
    } else {
      el.textContent = Math.floor(current);
    }
  }, step);
}

const statNums = document.querySelectorAll('.stat-num');
const counterObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      animateCounter(entry.target);
      counterObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 });

statNums.forEach(el => counterObserver.observe(el));

// ---------- Portfolio filter ----------
const filterBtns   = document.querySelectorAll('.filter-btn');
const portfolioCards = document.querySelectorAll('.portfolio-card');

filterBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    // Update active state
    filterBtns.forEach(b => {
      b.classList.remove('active');
      b.setAttribute('aria-selected', 'false');
    });
    btn.classList.add('active');
    btn.setAttribute('aria-selected', 'true');

    const filter = btn.dataset.filter;

    portfolioCards.forEach(card => {
      if (filter === 'all' || card.dataset.category === filter) {
        card.classList.remove('hidden');
        // Re-trigger animation
        card.classList.remove('aos-animate');
        requestAnimationFrame(() => {
          requestAnimationFrame(() => card.classList.add('aos-animate'));
        });
      } else {
        card.classList.add('hidden');
      }
    });
  });
});

// ---------- Contact form validation & submit ----------
const form       = document.getElementById('contactForm');
const submitBtn  = document.getElementById('submitBtn');
const formSuccess = document.getElementById('formSuccess');

const validators = {
  name:    { el: null, error: null, validate: v => v.trim().length >= 2 ? '' : 'Por favor, insira seu nome completo.' },
  email:   { el: null, error: null, validate: v => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v.trim()) ? '' : 'Por favor, insira um e-mail válido.' },
  message: { el: null, error: null, validate: v => v.trim().length >= 10 ? '' : 'A mensagem deve ter pelo menos 10 caracteres.' },
};

Object.keys(validators).forEach(key => {
  validators[key].el    = document.getElementById(key);
  validators[key].error = document.getElementById(key + 'Error');
});

function validateField(key) {
  const { el, error, validate } = validators[key];
  const msg = validate(el.value);
  error.textContent = msg;
  el.classList.toggle('error', msg !== '');
  return msg === '';
}

Object.keys(validators).forEach(key => {
  validators[key].el.addEventListener('blur', () => validateField(key));
  validators[key].el.addEventListener('input', () => {
    if (validators[key].el.classList.contains('error')) validateField(key);
  });
});

form.addEventListener('submit', async (e) => {
  e.preventDefault();

  // Validate all fields
  const valid = Object.keys(validators).map(k => validateField(k)).every(Boolean);
  if (!valid) return;

  // Simulate async submission
  submitBtn.classList.add('loading');
  submitBtn.disabled = true;

  try {
    await new Promise(resolve => setTimeout(resolve, 1500)); // Simulated request
    form.reset();
    formSuccess.style.display = 'block';
    formSuccess.scrollIntoView({ behavior: 'smooth', block: 'nearest' });

    // Hide success after 6 seconds
    setTimeout(() => {
      formSuccess.style.display = 'none';
    }, 6000);
  } finally {
    submitBtn.classList.remove('loading');
    submitBtn.disabled = false;
  }
});

// ---------- Update footer year ----------
const yearEl = document.getElementById('year');
if (yearEl) yearEl.textContent = new Date().getFullYear();

// ---------- Hero video fallback ----------
const heroVideo = document.querySelector('.hero-video');
if (heroVideo) {
  heroVideo.addEventListener('error', () => {
    // Video failed to load — the CSS gradient fallback is already in place
    heroVideo.style.display = 'none';
  });
}

// ---------- Active nav link on scroll ----------
const sections = document.querySelectorAll('section[id]');
const navAnchors = document.querySelectorAll('.nav-links .nav-link:not(.cta-btn)');

const sectionObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const id = entry.target.getAttribute('id');
      navAnchors.forEach(a => {
        if (a.getAttribute('href') === `#${id}`) {
          a.style.color = '#fff';
        } else {
          a.style.color = '';
        }
      });
    }
  });
}, { threshold: 0.4 });

sections.forEach(s => sectionObserver.observe(s));
