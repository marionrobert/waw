import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {
  connect() {
  }

  catremove() {
    const catarrow = document.getElementById("smalldevicecategories");
    catarrow.classList.remove("displaycat");
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

  displaycategorymenu() {
    const catmenu = document.getElementById('smalldevicecategories');
    catmenu.classList.add("displaycat");
  }






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




  div_categories_first_slide() {
    const cat_left_barre = document.getElementById("smalldevicecategories");
    cat_left_barre.classList.toggle("displaycat");
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
