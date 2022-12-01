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

    /* remove les sub-catégories qui étaient affichées */
    const allSubcategories = document.getElementsByClassName(`subcat`)
    const arrayallSubcategories = Object.values(allSubcategories)
    arrayallSubcategories.forEach(function(subcategory){
      subcategory.classList.remove("displaysubcat");
    });
  }

  /* display subcategory */
  displaysubcategory(event) {
    /* remove les sub-catégories qui étaient affichées */
    const allSubcategories = document.getElementsByClassName(`subcat`)
    const arrayallSubcategories = Object.values(allSubcategories)
    arrayallSubcategories.forEach(function(subcategory){
      subcategory.classList.remove("displaysubcat");
    });

    /* on display les nouvelles sub-catégories correspondant à la nouvelle catégorie choisie */
    const categoryName = event.target.textContent;
    console.log(`The category is: ${categoryName}`)
    /* 1 - récupérer toutes les subcatégories avec le nom de la catégorie en classe  */
    const chosenSubcategories = document.getElementsByClassName(`${categoryName}`)
    // chosenSubcategories est un "objet" --> conversion en array
    const arrayChoosenSubCategories = Object.values(chosenSubcategories)
    // 2 faire une boucle sur toutes les subcatégories en leur ajoutant la class displaysubcat
    arrayChoosenSubCategories.forEach(function(subcategory){
      subcategory.classList.add("displaysubcat");
    });


  }


  subcatremove() {
    const subcatarrow0 = document.getElementById("subcat0");
    const subcatarrow1 = document.getElementById("subcat1");
    const subcatarrow2 = document.getElementById("subcat2");

    subcatarrow0.classList.remove("displaysubcat");
    subcatarrow1.classList.remove("displaysubcat");
    subcatarrow2.classList.remove("displaysubcat");
  }

  // subcat() {
  //   const subcategory = document.getElementById('subcat')
  //   subcategory.classList.toggle("DISPLAY")
  // }

  displaysubcatid0() {
    const subcatmenu = document.getElementsByClassName('subcat_id0')
    catmenu.classList.add("displaysubcat")
  }

  displaysubcatid1() {
    const subcatmenu = document.getElementsByClassName('subcat_id1')
    catmenu.classList.add("displaysubcat")
  }

  displaysubcatid2() {
    const subcatmenu = document.getElementsByClassName('subcat_id2')
    catmenu.classList.add("displaysubcat")
  }

  subcat0() {
    const subcat0 = document.getElementById('subcat0')
    const subcat1 = document.getElementById('subcat1')
    const subcat2 = document.getElementById('subcat2')

    subcat1.classList.remove("displaysubcat")
    subcat2.classList.remove("displaysubcat")

    subcat0.classList.toggle("displaysubcat")
  }
  subcat1() {
    const subcat0 = document.getElementById('subcat0')
    const subcat1 = document.getElementById('subcat1')
    const subcat2 = document.getElementById('subcat2')

    subcat0.classList.remove("displaysubcat")
    subcat2.classList.remove("displaysubcat")

    subcat1.classList.toggle("displaysubcat")
  }
  subcat2() {
    const subcat0 = document.getElementById('subcat0')
    const subcat1 = document.getElementById('subcat1')
    const subcat2 = document.getElementById('subcat2')

    subcat0.classList.remove("displaysubcat")
    subcat1.classList.remove("displaysubcat")
    subcat2.classList.toggle("displaysubcat")
  }
}
