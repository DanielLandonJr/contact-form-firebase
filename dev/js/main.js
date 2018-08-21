const ContactForm = (() => {
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyDVZUZRmmdwE7XNTJKA5BliDeZI_9siFNA",
    authDomain: "contactform-1a725.firebaseapp.com",
    databaseURL: "https://contactform-1a725.firebaseio.com",
    projectId: "contactform-1a725",
    storageBucket: "contactform-1a725.appspot.com",
    messagingSenderId: "865062413170"
  };

  firebase.initializeApp(config);

  // create reference to collection we want to modify
  let messageRef = firebase.database().ref('messages');

  document.addEventListener('DOMContentLoaded', () => {
    console.log('javascript loaded...');
  });

  const loadEventListeners = () => {
    document.querySelector('#contactForm').addEventListener('submit', submitForm);
  };

  const submitForm = (event) => {
    event.preventDefault();

    let name = document.querySelector('#name').value;
    let company = document.querySelector('#company').value;
    let email = document.querySelector('#email').value;
    let phone = document.querySelector('#phone').value;
    let message = document.querySelector('#message').value;

    saveMessage(name, company, email, phone, message);

    // show alert
    document.querySelector('.alert').style.display = "block";

    setTimeout(() => {
      document.querySelector('.alert').style.display = "none";
    }, 3000);

    // clear the form
    document.querySelector('#contactForm').reset();
  };

  // save message to firebase
  const saveMessage = (name, company, email, phone, message) => {
    let newMessage = messageRef.push();

    newMessage.set({
      name: name,
      comapny: company,
      email: email,
      phone: phone,
      message: message
    });
  };

  // public methods
  return {
    init: () => {
      loadEventListeners();
    }
  }
})();

ContactForm.init();