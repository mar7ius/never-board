import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["total"]
  connect() {
    console.log("Hello");
  }

  update() {
    console.log("Hello")
    const dateRange = document.getElementById('range_start').value;
    const unitPrice = document.getElementById('price').dataset.price;
    const unitPriceNumber = Number.parseInt(unitPrice, 10)
    const regex = /\d{4}-\d{2}-\d{2}/g;
    const found = dateRange.match(regex);
    const startDate = new Date(found[0]);
    const endDate = new Date(found[1]);
    const countDates = (endDate - startDate) / (1000 * 3600 *24);
    const priceTotal = countDates * unitPriceNumber;
    this.totalTarget.innerHTML = priceTotal;

  }
}
