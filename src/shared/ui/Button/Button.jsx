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
