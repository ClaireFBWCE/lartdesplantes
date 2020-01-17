/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you require will output into a single css file (app.css in this case)
// import('../css/home.css'); // require('../css/app.css') ou import c'est pareil;
import('../css/main.css');
import('../css/maintenance.css');
import('../css/oneProduct.css');



import React    from 'react'; // from 'react' provient du nom du dossier dans node_modules
import ReactDOM from 'react-dom';

import {Page} from './Components/Page';

// recherche de la balise racine sur laquelle React s'accroche
let reactRoot = document.getElementById('react-root');
// let reactRoot = document.querySelector('#react-root'); // getEmelent ou querySelector

// est-ce qu'on a trouvé la balise existe?
if (reactRoot != null){
    // Initialisation de React
    ReactDOM.render(<Page/>, reactRoot);
}