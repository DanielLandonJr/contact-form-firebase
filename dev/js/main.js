const ContactForm = (() => {

  const loadEventListeners = () => {
    document.querySelector('#submit').addEventListener('click', submitForm);
  };

  const submitForm = (event) => {
    event.preventDefault();

    alert('Click');
  };

  // public methods
  return {
    init: () => {
      loadEventListeners();
    }
  }
})();

ContactForm.init();