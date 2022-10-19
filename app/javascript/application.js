// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// menu deployant lateral gauche
let toggle = document.querySelector('.toggle');
let body = document.querySelector('body');
toggle.addEventListener('click', function() {
  body.classList.toggle('open');
})
