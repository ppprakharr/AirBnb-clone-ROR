import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets=["numberOfNights", "grossPrice", "serviceCharge", "totalFare"]
    SERVICE_FEE = 0.18
  connect() {
    this.updateDetails()
  }

  updateDetails(){
    this.numberOfNightsTarget.textContent = this.numberOfNights();
    this.grossPriceTarget.textContent = this.calculateGrossPrice();
    this.serviceChargeTarget.textContent = this.calculateServiceFee();
    this.totalFareTarget.textContent = this.calculateTotalFare();
  }

  numberOfNights(){
    return 4;
  }

  calculateGrossPrice(){
    return parseFloat((this.numberOfNights() * this.element.dataset.perNightPrice).toFixed(2))
  }

  calculateServiceFee(){
    return parseFloat((this.calculateGrossPrice()*this.SERVICE_FEE).toFixed(2))
  }

  calculateTotalFare(){
    return parseFloat((this.calculateServiceFee()+this.calculateGrossPrice()).toFixed(2))
  }
}
