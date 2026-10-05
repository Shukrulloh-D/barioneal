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
        <img src="/images/gallery-1.png" alt="" />
        <img src="/images/gallery-2.png" alt="" />
        <img src="/images/gallery-3.png" alt="" />
        <img src="/images/gallery-4.png" alt="" />
      </div>
    </section>
  );
}

export default LoveInAllWays;
