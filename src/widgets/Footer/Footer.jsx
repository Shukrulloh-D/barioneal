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
      </div>
    </footer>
  );
}

export default Footer;
