import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap";

// Connects to data-controller="panier"
export default class extends Controller {

  connect() {

  }

  homebuttondeploy() {
    const homebtn= document.getElementById("homebutton");
    homebtn.classList.remove("deploy_home_icon");
    homebtn.classList.add("TESTAPPEARHOME");
  }

  homebuttonrestore() {
    const homebtn2= document.getElementById("homebutton");
    homebtn2.classList.remove("TESTAPPEARHOME");
    homebtn2.classList.add("deploy_home_icon");
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




  hidesubcategorymenu() {
    console.log("this is hidesubcategorymenu function");
    const subcatmenu = document.getElementById("subcatmenu")
    subcatmenu.classList.remove("displaysubcat")
  }

  sub_cat_deploy_desktop() {
    // Alert("CONNECTE")
    const subcatdesktop = document.getElementById("subcatdesktopmenu");
    subcatdesktop.style.removeProperty("display");
  }

  sub_cat_hidding_desktop(){
    const subcatdesktop = document.getElementById("subcatdesktopmenu");
    subcatdesktop.style.setProperty('display', 'none')
  }

}

// quand je display la subcat je dois appliquer la classname displaysubcat à la div entière et je passe les chossenSubcatégories en block et les autres restent en hidden
