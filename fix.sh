#!/bin/bash

mkdir -p src/widgets/{Header,Hero,Wedding,Sustainability,About,OurJewelry,CustomDesign,LoveInAllWays,Footer}
mkdir -p src/shared/ui/Button

# =====================================================
# ОБЩИЕ СТИЛИ — обновим глобалку
# =====================================================
cat > src/app/styles/index.css << 'END'
* { margin: 0; padding: 0; box-sizing: border-box; }

html { scroll-behavior: smooth; }

body {
  font-family: 'Inter', system-ui, sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #1a1a1a;
  background: #ffffff;
}

img { display: block; max-width: 100%; }
a { color: inherit; text-decoration: none; }
button { font-family: inherit; cursor: pointer; border: none; background: none; }
ul { list-style: none; }

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.eyebrow {
  display: block;
  font-size: 13px;
  font-weight: 400;
  letter-spacing: 0.03em;
  margin-bottom: 20px;
  color: #1a1a1a;
}

.section-title {
  font-size: 56px;
  font-weight: 400;
  line-height: 1.1;
  letter-spacing: -0.02em;
  margin-bottom: 32px;
}

@media (max-width: 900px) {
  .section-title { font-size: 36px; }
}
END

# =====================================================
# BUTTON — пилюля, светлая
# =====================================================
cat > src/shared/ui/Button/Button.module.css << 'END'
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 16px 36px;
  border-radius: 100px;
  font-size: 14px;
  font-weight: 500;
  transition: all 0.2s ease;
  white-space: nowrap;
}

.btn--light {
  background: #f8f5f0;
  color: #1a1a1a;
}
.btn--light:hover { background: #ffffff; }

.btn--primary {
  background: #c9d9c2;
  color: #1a1a1a;
}
.btn--primary:hover { background: #b5c8ae; }

.btn--dark {
  background: #1a1a1a;
  color: #ffffff;
}
.btn--dark:hover { background: #333; }
END

cat > src/shared/ui/Button/Button.jsx << 'END'
import styles from './Button.module.css';

function Button({ children, variant = 'light', onClick, className = '' }) {
  return (
    <button
      className={`${styles.btn} ${styles[`btn--${variant}`]} ${className}`}
      onClick={onClick}
    >
      {children}
    </button>
  );
}

export default Button;
END

# =====================================================
# HEADER — 2 строки, прозрачный, поверх hero
# =====================================================
cat > src/widgets/Header/Header.module.css << 'END'
.header {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 20;
  padding: 30px 0;
  color: #1a1a1a;
}

.row1 {
  display: flex;
  justify-content: space-between;
  font-size: 13px;
  margin-bottom: 40px;
  color: #1a1a1a;
}

.row2 {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  gap: 24px;
}

.nav {
  display: flex;
  gap: 44px;
  font-size: 15px;
  justify-content: center;
  grid-column: 2;
}

.nav a {
  color: #1a1a1a;
  transition: opacity 0.2s;
}

.nav a:hover { opacity: 0.6; }

.cart {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  justify-self: end;
  color: #1a1a1a;
}

@media (max-width: 900px) {
  .row1 { display: none; }
  .nav { gap: 20px; font-size: 13px; }
  .row2 { grid-template-columns: 1fr auto; }
  .nav { grid-column: 1; justify-content: flex-start; }
}
END

cat > src/widgets/Header/Header.jsx << 'END'
import styles from './Header.module.css';

function Header() {
  return (
    <header className={styles.header}>
      <div className="container">
        <div className={styles.row1}>
          <a href="#">Read our</a>
          <a href="#">Customer Reviews</a>
        </div>

        <div className={styles.row2}>
          <nav className={styles.nav}>
            <a href="#wedding">Engagement</a>
            <a href="#wedding">Wedding</a>
            <a href="#custom">Custom</a>
            <a href="#fine">Fine Jewelry</a>
            <a href="#ethics">Ethics</a>
            <a href="#about">About</a>
          </nav>

          <div className={styles.cart}>
            <span>🛒</span>
            <span>0</span>
          </div>
        </div>
      </div>
    </header>
  );
}

export default Header;
END

# =====================================================
# HERO — текст по центру, кнопки слева и справа
# =====================================================
cat > src/widgets/Hero/Hero.module.css << 'END'
.hero {
  position: relative;
  height: 100vh;
  min-height: 780px;
  background-image: url('/images/hero-woman.jpg');
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
  justify-content: center;
  padding-top: 160px;
}

.center {
  text-align: center;
  color: #ffffff;
  max-width: 700px;
}

.title {
  font-size: 72px;
  font-weight: 400;
  line-height: 1.05;
  letter-spacing: -0.02em;
  margin-bottom: 20px;
}

.subtitle {
  font-size: 16px;
  margin-bottom: 40px;
  opacity: 0.9;
}

/* нижняя плашка с двумя кнопками по краям */
.actions {
  position: absolute;
  bottom: 60px;
  left: 0;
  right: 0;
}

.actionsInner {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* REVIEWS — вертикальная плашка слева */
.reviews {
  position: absolute;
  left: 0;
  top: 40%;
  background: #f5c9b8;
  padding: 30px 14px;
  writing-mode: vertical-rl;
  transform: rotate(180deg);
  font-size: 11px;
  letter-spacing: 0.4em;
  color: #1a1a1a;
  z-index: 5;
}

@media (max-width: 900px) {
  .title { font-size: 42px; }
  .reviews { display: none; }
  .actionsInner { flex-direction: column; gap: 12px; }
  .actions { bottom: 30px; }
}
END

cat > src/widgets/Hero/Hero.jsx << 'END'
import Button from 'shared/ui/Button/Button';
import styles from './Hero.module.css';

function Hero() {
  return (
    <section className={styles.hero}>
      <div className={styles.reviews}>REVIEWS</div>

      <div className={styles.center}>
        <h1 className={styles.title}>
          We Find Always<br />
          in All Ways
        </h1>
        <p className={styles.subtitle}>
          Our design ethos is gender-neutral and size-inclusive.
        </p>
      </div>

      <div className={styles.actions}>
        <div className="container">
          <div className={styles.actionsInner}>
            <Button variant="light">Shop Rings</Button>
            <Button variant="light">Book Appointment</Button>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Hero;
END

# =====================================================
# WEDDING — та же сетка, но картинки крупнее
# =====================================================
cat > src/widgets/Wedding/Wedding.module.css << 'END'
.section {
  padding: 120px 0 100px;
  text-align: center;
}

.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 24px;
  margin-top: 60px;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
}

.card { cursor: pointer; }

.card img {
  width: 100%;
  aspect-ratio: 255 / 303;
  object-fit: cover;
  border-radius: 2px;
  transition: transform 0.3s ease;
}

.card:hover img { transform: scale(1.02); }

.label {
  margin-top: 22px;
  font-size: 15px;
  color: #1a1a1a;
}

@media (max-width: 900px) {
  .grid { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 500px) {
  .grid { grid-template-columns: 1fr; }
}
END

cat > src/widgets/Wedding/Wedding.jsx << 'END'
import styles from './Wedding.module.css';

const items = [
  { label: 'Cluster Rings', image: '/images/wedding-1.jpg' },
  { label: 'Bands',         image: '/images/wedding-2.jpg' },
  { label: 'Rings',         image: '/images/wedding-3.jpg' },
  { label: 'Custom Design', image: '/images/wedding-4.jpg' },
];

function Wedding() {
  return (
    <section className={styles.section} id="wedding">
      <div className="container">
        <span className="eyebrow">Handcrafted Jewelry</span>
        <h2 className="section-title">Wedding &amp; Engagement</h2>
      </div>

      <div className={styles.grid}>
        {items.map((item) => (
          <div key={item.label} className={styles.card}>
            <img src={item.image} alt={item.label} />
            <div className={styles.label}>{item.label}</div>
          </div>
        ))}
      </div>
    </section>
  );
}

export default Wedding;
END

# =====================================================
# SUSTAINABILITY — высокий блок, теги снизу полосой
# =====================================================
cat > src/widgets/Sustainability/Sustainability.module.css << 'END'
.section { background: #c9d9c2; }

.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  min-height: 620px;
}

.image {
  background-image: url('/images/ethical.jpg');
  background-size: cover;
  background-position: center;
  min-height: 620px;
}

.content {
  padding: 100px 80px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.title {
  font-size: 52px;
  font-weight: 400;
  letter-spacing: -0.02em;
  line-height: 1.1;
  margin-bottom: 36px;
}

.text {
  font-size: 16px;
  line-height: 1.75;
  margin-bottom: 44px;
  max-width: 480px;
}

/* Нижняя полоса с тегами — на всю ширину секции */
.tags {
  background: #ffffff;
  padding: 24px 0;
}

.tagsInner {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  font-size: 14px;
  color: #1a1a1a;
}

@media (max-width: 900px) {
  .grid { grid-template-columns: 1fr; }
  .image { min-height: 400px; }
  .content { padding: 60px 24px; }
  .title { font-size: 34px; }
}
END

cat > src/widgets/Sustainability/Sustainability.jsx << 'END'
import Button from 'shared/ui/Button/Button';
import styles from './Sustainability.module.css';

function Sustainability() {
  return (
    <section id="ethics">
      <div className={styles.section}>
        <div className={styles.grid}>
          <div className={styles.image}></div>

          <div className={styles.content}>
            <span className="eyebrow">Sustainability</span>
            <h2 className={styles.title}>An Ethical Approach</h2>

            <p className={styles.text}>
              Making jewelry requires responsibility to the earth that creates
              our materials and respect for the people who inhabit it. From day
              one, we committed to creating designs of ethical origins from
              mine to market.
            </p>

            <div>
              <Button variant="light">Learn More</Button>
            </div>
          </div>
        </div>
      </div>

      <div className={styles.tags}>
        <div className="container">
          <div className={styles.tagsInner}>
            <span>Traceable Gems</span>
            <span>Reclaimed Metals</span>
            <span>Fairmined Gold</span>
            <span>Love in All Ways</span>
            <span>Small Footprint</span>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Sustainability;
END

# =====================================================
# ABOUT — картинка НАД текстом (декоративная)
# =====================================================
cat > src/widgets/About/About.module.css << 'END'
.section {
  background: #e5dfd3;
  padding: 140px 0;
  text-align: center;
}

.topIcon {
  width: 120px;
  margin: 0 auto 12px;
}

.label {
  font-size: 13px;
  color: #1a1a1a;
  margin-bottom: 60px;
}

.bigText {
  font-size: 44px;
  font-weight: 400;
  line-height: 1.25;
  letter-spacing: -0.02em;
  max-width: 900px;
  margin: 0 auto;
}

@media (max-width: 900px) {
  .bigText { font-size: 26px; }
  .section { padding: 80px 0; }
}
END

cat > src/widgets/About/About.jsx << 'END'
import styles from './About.module.css';

function About() {
  return (
    <section className={styles.section} id="about">
      <div className="container">
        <img className={styles.topIcon} src="/images/ring-top.png" alt="" />
        <p className={styles.label}>About Us</p>

        <h2 className={styles.bigText}>
          Each Barioneal piece is crafted with ethically sourced precious
          metals to reflect our commitment to human rights and environmental
          sustainability.
        </h2>
      </div>
    </section>
  );
}

export default About;
END

# =====================================================
# OUR JEWELRY — крупные карточки
# =====================================================
cat > src/widgets/OurJewelry/OurJewelry.module.css << 'END'
.section {
  padding: 120px 0 100px;
  text-align: center;
}

.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 24px;
  margin-top: 60px;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
}

.card img {
  width: 100%;
  aspect-ratio: 255 / 303;
  object-fit: cover;
  border-radius: 2px;
}

.label {
  margin-top: 22px;
  font-size: 15px;
}

@media (max-width: 900px) {
  .grid { grid-template-columns: repeat(2, 1fr); }
}
END

cat > src/widgets/OurJewelry/OurJewelry.jsx << 'END'
import styles from './OurJewelry.module.css';

const items = [
  { label: 'Rings',      image: '/images/jewelry-1.jpg' },
  { label: 'Bracelets',  image: '/images/jewelry-2.jpg' },
  { label: 'Necklaces',  image: '/images/jewelry-3.jpg' },
  { label: 'Earrings',   image: '/images/jewelry-4.jpg' },
];

function OurJewelry() {
  return (
    <section className={styles.section} id="fine">
      <div className="container">
        <span className="eyebrow">Consciously Made</span>
        <h2 className="section-title">Our Jewelry</h2>
      </div>

      <div className={styles.grid}>
        {items.map((item) => (
          <div key={item.label} className={styles.card}>
            <img src={item.image} alt={item.label} />
            <div className={styles.label}>{item.label}</div>
          </div>
        ))}
      </div>
    </section>
  );
}

export default OurJewelry;
END

# =====================================================
# CUSTOM DESIGN — картинка крупная, text слева
# =====================================================
cat > src/widgets/CustomDesign/CustomDesign.module.css << 'END'
.section {
  background: #c9d9c2;
  padding: 140px 0;
}

.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.content { max-width: 520px; }

.title {
  font-size: 64px;
  font-weight: 400;
  letter-spacing: -0.02em;
  line-height: 1.05;
  margin-bottom: 40px;
}

.text {
  font-size: 16px;
  line-height: 1.75;
  margin-bottom: 40px;
}

.actions {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.image {
  display: flex;
  justify-content: flex-end;
}

.image img {
  width: 100%;
  max-width: 520px;
  aspect-ratio: 480 / 302;
  object-fit: cover;
  border-radius: 4px;
}

@media (max-width: 900px) {
  .grid { grid-template-columns: 1fr; gap: 40px; }
  .title { font-size: 40px; }
  .image { justify-content: center; }
}
END

cat > src/widgets/CustomDesign/CustomDesign.jsx << 'END'
import Button from 'shared/ui/Button/Button';
import styles from './CustomDesign.module.css';

function CustomDesign() {
  return (
    <section className={styles.section} id="custom">
      <div className={styles.grid}>
        <div className={styles.content}>
          <span className="eyebrow">Tradition in the Making</span>
          <h2 className={styles.title}>Custom Design</h2>

          <p className={styles.text}>
            Whether you want to create a future heirloom that can be passed
            down or re-envision a current heirloom while maintaining its
            sentiment, our Custom process brings meaningful designs to life.
          </p>

          <div className={styles.actions}>
            <Button variant="light">Get Inspired</Button>
            <Button variant="light">Get an Estimate</Button>
          </div>
        </div>

        <div className={styles.image}>
          <img src="/images/custom-design.jpg" alt="Custom Design" />
        </div>
      </div>
    </section>
  );
}

export default CustomDesign;
END

# =====================================================
# LOVE IN ALL WAYS — верх 2 колонки + галерея снизу
# =====================================================
cat > src/widgets/LoveInAllWays/LoveInAllWays.module.css << 'END'
.top {
  display: grid;
  grid-template-columns: 1fr 1fr;
  min-height: 500px;
}

.topImage {
  background-image: url('/images/love-couple.jpg');
  background-size: cover;
  background-position: center;
  min-height: 500px;
}

.topContent {
  background: #c9d9e8;
  padding: 80px 60px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.title {
  font-size: 52px;
  font-weight: 400;
  letter-spacing: -0.02em;
  line-height: 1.1;
  margin-bottom: 28px;
}

.text {
  font-size: 16px;
  line-height: 1.75;
  margin-bottom: 36px;
  max-width: 500px;
}

/* Галерея снизу */
.gallery {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 4px;
}

.gallery img {
  width: 100%;
  aspect-ratio: 1;
  object-fit: cover;
}

@media (max-width: 900px) {
  .top { grid-template-columns: 1fr; }
  .topContent { padding: 60px 24px; }
  .title { font-size: 34px; }
  .gallery { grid-template-columns: repeat(2, 1fr); }
}
END

cat > src/widgets/LoveInAllWays/LoveInAllWays.jsx << 'END'
import Button from 'shared/ui/Button/Button';
import styles from './LoveInAllWays.module.css';

function LoveInAllWays() {
  return (
    <section>
      <div className={styles.top}>
        <div className={styles.topImage}></div>

        <div className={styles.topContent}>
          <span className="eyebrow">The Heart of It</span>
          <h2 className={styles.title}>Love in All Ways</h2>

          <p className={styles.text}>
            We embrace love in all forms, and our jewelry is made to
            celebrate every milestone. We strive for inclusivity at every
            step, from a non-gendered design ethos and comprehensive sizing
            to our founding belief in marriage equality and the right to
            love who you choose.
          </p>

          <div>
            <Button variant="light">Learn More</Button>
          </div>
        </div>
      </div>

      <div className={styles.gallery}>
        <img src="/images/gallery-1.jpg" alt="" />
        <img src="/images/gallery-2.jpg" alt="" />
        <img src="/images/gallery-3.jpg" alt="" />
        <img src="/images/gallery-4.jpg" alt="" />
      </div>
    </section>
  );
}

export default LoveInAllWays;
END

# =====================================================
# FOOTER — 5 колонок, центр, копирайт
# =====================================================
cat > src/widgets/Footer/Footer.module.css << 'END'
.footer {
  background: #ffffff;
  padding: 100px 0 40px;
}

/* Верхние 5 колонок */
.columns {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 40px;
  margin-bottom: 120px;
}

.colTitle {
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 24px;
  color: #1a1a1a;
}

.col a {
  display: block;
  font-size: 14px;
  color: #6b6b6b;
  margin-bottom: 12px;
  transition: color 0.2s;
}

.col a:hover { color: #1a1a1a; }

/* Центральный блок */
.center {
  text-align: center;
  margin-bottom: 60px;
}

.centerTitle {
  font-size: 56px;
  font-weight: 400;
  letter-spacing: -0.02em;
  line-height: 1.1;
  margin-bottom: 48px;
}

.subscribe {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  max-width: 640px;
  margin: 0 auto;
}

.subscribe input {
  flex: 1;
  padding: 16px 24px;
  border: 1px solid #e0e0e0;
  border-radius: 100px;
  font-size: 14px;
  outline: none;
}

.subscribe input:focus { border-color: #c9d9c2; }

.subscribe button {
  padding: 16px 40px;
  background: #c9d9c2;
  border-radius: 100px;
  font-size: 14px;
  font-weight: 500;
  transition: background 0.2s;
}

.subscribe button:hover { background: #b5c8ae; }

.captcha {
  font-size: 12px;
  color: #999;
}

/* Нижняя строка */
.bottom {
  text-align: center;
  font-size: 13px;
  color: #999;
  padding-top: 40px;
  border-top: 1px solid #eaeaea;
}

@media (max-width: 900px) {
  .columns { grid-template-columns: repeat(2, 1fr); gap: 24px; }
  .centerTitle { font-size: 32px; }
  .subscribe { flex-direction: column; }
  .subscribe input,
  .subscribe button { width: 100%; }
}
END

cat > src/widgets/Footer/Footer.jsx << 'END'
import styles from './Footer.module.css';

function Footer() {
  return (
    <footer className={styles.footer}>
      <div className="container">
        <div className={styles.columns}>
          <div className={styles.col}>
            <div className={styles.colTitle}>Get In Touch</div>
            <a href="#">Contact</a>
            <a href="#">Appointments</a>
            <a href="#">Philadelphia Shop</a>
            <a href="#">NYC Shop</a>
            <a href="#">Newsletter</a>
            <a href="#">Get an Estimate</a>
          </div>

          <div className={styles.col}>
            <div className={styles.colTitle}>About</div>
            <a href="#">Who We Are</a>
            <a href="#">Blog</a>
            <a href="#">Careers</a>
            <a href="#">Reviews</a>
            <a href="#">Press</a>
          </div>

          <div className={styles.col}>
            <div className={styles.colTitle}>Social</div>
            <a href="#">Instagram</a>
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">Pinterest</a>
          </div>

          <div className={styles.col}>
            <div className={styles.colTitle}>Policy</div>
            <a href="#">Log In</a>
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
            <a href="#">Returns &amp; Exchanges</a>
            <a href="#">Accessibility</a>
          </div>

          <div className={styles.col}>
            <div className={styles.colTitle}>FAQs</div>
            <a href="#">Warranty &amp; Repairs</a>
            <a href="#">Ring Resizing</a>
            <a href="#">Jewelry Care</a>
            <a href="#">Hand-Made For You</a>
            <a href="#">Shipping</a>
            <a href="#">International Orders</a>
          </div>
        </div>

        <div className={styles.center}>
          <h2 className={styles.centerTitle}>
            We Find Always<br />in All Ways.
          </h2>

          <form className={styles.subscribe} onSubmit={(e) => e.preventDefault()}>
            <input type="email" placeholder="Email Address" />
            <button type="submit">Subscribe</button>
            <span className={styles.captcha}>CAPTCHA</span>
          </form>
        </div>

        <div className={styles.bottom}>
          © 2024 Barioneal. All rights reserved.
        </div>
      </div>
    </footer>
  );
}

export default Footer;
END

echo ""
echo "═══════════════════════════════════"
echo "✅ ФИКСЫ ПРИМЕНЕНЫ"
echo "═══════════════════════════════════"
echo ""
echo "Перезапусти: npm run dev"
