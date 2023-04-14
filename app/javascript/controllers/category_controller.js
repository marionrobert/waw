import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap";

export default class extends Controller {

  connect() {
  }

  // homebuttondeploy() {
  //   const homebtn= document.getElementById("homebutton");
  //   homebtn.classList.remove("deploy_home_icon");
  //   homebtn.classList.add("TESTAPPEARHOME");
  // }

  // homebuttonrestore() {
  //   const homebtn2= document.getElementById("homebutton");
  //   homebtn2.classList.remove("TESTAPPEARHOME");
  //   homebtn2.classList.add("deploy_home_icon");
  // }



  ////////   FOR MOBILE VERSION   /////////

  /* 1 - slide category menu */
  slidecategorymenu() {
    const accountbutton = document.getElementById('account_and_wishlist_buttons');
    const cat_left_barre = document.getElementById("smalldevicecategories");
    cat_left_barre.classList.add("displaycat");
    accountbutton.classList.add("displaycat");
  }

  /* 1 - hide category menu */
  hidecategorymenu() {
    const accountbutton = document.getElementById('account_and_wishlist_buttons');
    const catcross = document.getElementById("smalldevicecategories");
    catcross.classList.remove("displaycat");

    // supprimer les sub-catégories qui étaient affichées selon la catégorie sélectionnée
    // remise à zéro
    accountbutton.classList.remove("displaycat");
    const allSubcategories = document.getElementsByClassName("subcat")
    const arrayallSubcategories = Object.values(allSubcategories)
    arrayallSubcategories.forEach(function(subcategory){
      subcategory.classList.remove("displaysubcat");
    });

  }


  /* 2 - display subcategory */

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

    // finalement, on fait apparaître le subcategory menu avec la classe displaysubcat
    const subcatmenu = document.getElementById("subcatmenu")
    subcatmenu.classList.add("displaysubcat")

  }

  hidesubcategorymenu() {
    // console.log("this is hidesubcategorymenu function");
    const subcatmenu = document.getElementById("subcatmenu")
    subcatmenu.classList.remove("displaysubcat")
  }




  ///////// FOR DESKTOP VERSION   ////////

  sub_cat_deploy_desktop(event) {
    // Alert("CONNECTE")

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
      subcategorychoosen.style.display = "inline";
    });

    const subcatdesktop = document.getElementById("subcatdesktopmenu");
    subcatdesktop.style.removeProperty("display");
  }

  sub_cat_hidding_desktop(){
    const subcatdesktop = document.getElementById("subcatdesktopmenu");
    subcatdesktop.style.setProperty('display', 'none')
  }

}
