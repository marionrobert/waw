import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-products-stockmanagement"
export default class extends Controller {
  connect() {
    console.log("hello from filter-products-stockmanagement")
    console.log("ddd")
  }


  filterProducts(event) {
    event.preventDefault();
    const orientation = document.getElementById("orientation").value;
    const support = document.getElementById("support").value;
    const name = document.getElementById("name").value.trim().toLowerCase();

    const rows = document.querySelectorAll("#product-table tbody tr");

    rows.forEach((row) => {
      event.preventDefault();
      const rowOrientation = row.querySelector("td:nth-child(7)").textContent;
      const rowSupport = row.querySelector("td:nth-child(6)").textContent;
      const rowName = row.querySelector("td:nth-child(2)").textContent.trim().toLowerCase();

      if ((orientation === "" || rowOrientation === orientation) &&
          (support === "" || rowSupport === support) &&
          (name === "" || rowName.includes(name))) {
        row.style.display = "";
      } else {
        row.style.display = "none";
      }
    });

    const table = document.getElementById("product-table");
    const tbody = table.querySelector("tbody");
    const rowsArray = Array.from(tbody.children);
    rowsArray.sort((rowA, rowB) => {
      const idA = Number(rowA.querySelector("td").textContent);
      const idB = Number(rowB.querySelector("td").textContent);
      return idA - idB;
    });
    tbody.append(...rowsArray);
  }


}
