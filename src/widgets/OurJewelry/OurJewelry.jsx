import styles from './OurJewelry.module.css';

const items = [
  { label: 'Rings',      image: '/images/jewelry-1.png' },
  { label: 'Bracelets',  image: '/images/jewelry-2.png' },
  { label: 'Necklaces',  image: '/images/jewelry-3.png' },
  { label: 'Earrings',   image: '/images/jewelry-4.png' },
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
