export default {
  fadeUp: (delay = 50) => ({
    initial: { opacity: 0, y: 20 },
    visibleOnce: {
      opacity: 1,
      y: 0,
      transition: { duration: 600, ease: 'easeOutExpo', delay },
    },
  }),
  fadeIn: (delay = 50) => ({
    initial: { opacity: 0 },
    visibleOnce: {
      opacity: 1,
      transition: { duration: 600, ease: 'easeOutExpo', delay },
    },
  }),
  fadeLeft: (delay = 50) => ({
    initial: { opacity: 0, x: -20 },
    visibleOnce: {
      opacity: 1,
      x: 0,
      transition: { duration: 600, ease: 'easeOutExpo', delay },
    },
  }),
  fadeRight: (delay = 50) => ({
    initial: { opacity: 0, x: 20 },
    visibleOnce: {
      opacity: 1,
      x: 0,
      transition: { duration: 600, ease: 'easeOutExpo', delay },
    },
  }),
  fadeDown: (delay = 50) => ({
    initial: { opacity: 0, y: -20 },
    visibleOnce: {
      opacity: 1,
      y: 0,
      transition: { duration: 600, ease: 'easeOutExpo', delay },
    },
  }),
};
