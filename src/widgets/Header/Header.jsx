import styles from './Header.module.css';

function Header() {
  return (
    <header className={styles.header}>
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
    </header>
  );
}

export default Header;