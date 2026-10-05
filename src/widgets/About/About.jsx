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
