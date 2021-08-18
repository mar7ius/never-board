const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const banner = document.querySelector('.banner');
  const loginID = document.getElementById('btn-login');
  const linkAddNew = document.getElementById('link-add-new');
  const btnClear = document.querySelectorAll('.btn-clear');

  if (navbar && banner) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-white');
        navbar.classList.remove('navbar-transparent');
        linkAddNew.classList.add('btn-black');
        linkAddNew.classList.remove('btn-white');
        if (loginID) {
          btnClear.forEach(btn => {
            btn.classList.add('btn-black');
            btn.classList.remove('btn-white');
          });
        }
      } else {
        if (loginID) {
          btnClear.forEach(btn => {
            btn.classList.remove('btn-black');
            btn.classList.add('btn-white');
          });
        }
        linkAddNew.classList.remove('btn-black');
        linkAddNew.classList.add('btn-white');
        navbar.classList.remove('navbar-white');
        navbar.classList.add('navbar-transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
