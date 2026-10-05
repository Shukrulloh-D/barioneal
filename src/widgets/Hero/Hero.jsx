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
