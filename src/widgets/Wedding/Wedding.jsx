import styles from './Wedding.module.css';

const items = [
  { label: 'Cluster Rings', image: '/images/wedding-1.png' },
  { label: 'Bands',         image: '/images/wedding-2.png' },
  { label: 'Rings',         image: '/images/wedding-3.png' },
  { label: 'Custom Design', image: '/images/wedding-4.png' },
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
