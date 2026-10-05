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
          <img src="/images/custom-design.png" alt="Custom Design" />
        </div>
      </div>
    </section>
  );
}

export default CustomDesign;
