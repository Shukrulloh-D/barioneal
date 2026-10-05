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
