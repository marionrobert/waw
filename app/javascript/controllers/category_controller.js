import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {

  connect() {

  }


  /* slide or hide category menu */
  slidecategorymenu() {
    const cat_left_barre = document.getElementById("smalldevicecategories");
    cat_left_barre.classList.add("displaycat");
  }

  hidecategorymenu() {
    const catarrow = document.getElementById("smalldevicecategories");
    catarrow.classList.remove("displaycat");

    /* dé-sélectionner la catégorie et les subgatégories associées */
    const categoryActive = document.getElementsByClassName("categorymenu active");
    categoryActive.item(0).classList.remove("active");

    const tabsubcategories = document.getElementsByClassName("active show");
    tabsubcategories.item(0).classList.remove("active");
  }

  /* hidecategorymenu quand on display les subcatégories avec notre propre code cad sans bootstrap*/
  /*
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
  */



  /* display subcategory with data-action : avec notre propre code cad sans boostrap */
  /*
  displaysubcategory(event) {
    // remove les sub-catégories qui étaient affichées
    const allSubcategories = document.getElementsByClassName(`subcat`)
    const arrayallSubcategories = Object.values(allSubcategories)
    arrayallSubcategories.forEach(function(subcategory){
      subcategory.classList.remove("displaysubcat");
    });

    // on display les nouvelles sub-catégories correspondant à la nouvelle catégorie choisie
    const categoryName = event.target.textContent;
    console.log(`The category is: ${categoryName}`)
    // 1 - récupérer toutes les subcatégories avec le nom de la catégorie en classe
    const chosenSubcategories = document.getElementsByClassName(`${categoryName}`)
    // chosenSubcategories est un "objet" --> conversion en array
    const arrayChoosenSubCategories = Object.values(chosenSubcategories)
    // 2 faire une boucle sur toutes les subcatégories en leur ajoutant la class displaysubcat
    arrayChoosenSubCategories.forEach(function(subcategory){
      subcategory.classList.add("displaysubcat");
    });

  } */
}
