import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-index-products"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hello from filter-index-products")
    console.log("ddd")
  }

  filterBySubCatAndOrientation(event) {
    event.preventDefault();
    console.log("filterBySubCatAndOrientation has been triggered")
    const url = "/products/filter_by_subcat_and_orientation"
    console.log(this.form);
  }
}
