const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const banner = document.querySelector('.banner');
  const loginID = document.getElementById('btn-login');
  const login = document.querySelector('.btn-clear');

  if (navbar && banner) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-white');
        navbar.classList.remove('navbar-transparent');
        if (loginID) {
          login.classList.add('btn-black');
          login.classList.remove('btn-white');
        }
      } else {
        if (loginID) {
          login.classList.remove('btn-black');
          login.classList.add('btn-white');
        }
        navbar.classList.remove('navbar-white');
        navbar.classList.add('navbar-transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
