const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-white');
        navbar.classList.remove('navbar-transparent');
      } else {
        navbar.classList.remove('navbar-white');
        navbar.classList.add('navbar-transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
