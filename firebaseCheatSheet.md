# FIREBASE HOSTING

- init with :     

        npm i -g firebase-tools
(Assuming one has npm / nodejs installed already...)

## GOOGLE FIREBASE 'BASIC' COMMANDS

- Login to your google account
   
        firebase login

- Initiate your project:
   
        firebase init

- Add your static files to your deploy directory (the default is 'public')... then...
Deploy your website with...

        firebase deploy

Add to the <head> of webpages to be deployed...
````
<script src="https://www.gstatic.com/firebasejs/5.0.1/firebase.js"></script>
<script>
  // Initialize Firebase
  var PROJ = process.env.PROJECT;
  var config = {
    apiKey: process.env.APIKEY,
    authDomain: PROJ + ".firebaseapp.com",
    databaseURL: "https://" + PROJ + ".firebaseio.com",
    projectId: PROJ,
    storageBucket: PROJ + ".appspot.com",
    messagingSenderId: process.env.MSGID
  };
  firebase.initializeApp(config);
</script>
````
