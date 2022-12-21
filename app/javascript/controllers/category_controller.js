import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {

  connect() {

  }

  TESTHOME() {
    // alert("CONNECTE")
    const test= document.getElementById("TESTHOME");
    test.classList.remove("TESTHIDE");
    test.classList.add("TESTAPPEARHOME");
    // test.classList.remove("TESTAPPEARHOME");
    // test.classList.add("TESTHIDE");
  }

  TESTHOMEOUT() {
    // alert("CONNECTE")
    const test2= document.getElementById("TESTHOME");
    test2.classList.remove("TESTAPPEARHOME");
    test2.classList.add("TESTHIDE");
  }

  displaycategorymenu() {
    const catmenu = document.getElementById('smalldevicecategories');
    catmenu.classList.add("displaycat");
  }


  /* slide or hide category menu */
  slidecategorymenu() {
    const cat_left_barre = document.getElementById("smalldevicecategories");
    cat_left_barre.classList.add("displaycat");
  }

  hidecategorymenu() {
    const catarrow = document.getElementById("smalldevicecategories");
    catarrow.classList.remove("displaycat");

    // remove les sub-catégories qui étaient affichées quand
    const allSubcategories = document.getElementsByClassName("subcat")
    const arrayallSubcategories = Object.values(allSubcategories)
    arrayallSubcategories.forEach(function(subcategory){
      subcategory.classList.remove("displaysubcat");
    });
  }


  /* display subcategory with data-action : avec notre propre code cad sans boostrap */

  displaysubcategory(event) {

    // cacher les sous-catégories qui étaient affichées
    const allSubcategories = document.getElementsByClassName(`subcat`)
    const arrayallSubcategories = Object.values(allSubcategories)
    arrayallSubcategories.forEach(function(subcategory){
      subcategory.style.display = "none";
    });


    // AFFICHER LES SOUS-CATEGORIES CORRESPONDANT A LA CATEGORIE CHOISIE

    // récupérer la catégorie sélectionnée
    const categoryName = event.target.textContent;
    // récupérer les subcatégories liés à la catégorie càd qui ont la catégorie comme classe
    const chosenSubcategories = document.getElementsByClassName(`${categoryName}`)
    // convertir l'objet chosenSubcategories en array
    const arrayChoosenSubCategories = Object.values(chosenSubcategories)
    // itérer sur les subcatégories choisies et les display
    arrayChoosenSubCategories.forEach(function(subcategorychoosen){
      subcategorychoosen.style.display = "block";
    });

    // finalement, on fait glisser le subcategory menu avec la classe displaysubcat
    const subcatmenu = document.getElementById("subcatmenu")
    subcatmenu.classList.add("displaysubcat")

  }

  hidesubcategorymenu(){
    console.log("this is hidesubcategorymenu function");
    const subcatmenu = document.getElementById("subcatmenu")
    subcatmenu.classList.remove("displaysubcat")
  }
}

// quand je display la subcat je dois appliquer la classname displaysubcat à la div entière et je passe les chossenSubcatégories en block et les autres restent en hidden
