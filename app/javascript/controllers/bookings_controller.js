import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
    static targets=["numberOfNights", "grossPrice", "serviceCharge", "totalFare", "checkin", "checkout"]
    SERVICE_FEE = 0.18
  connect() {
    flatpickr(this.checkinTarget, {
        minDate: new Date().fp_incr(1),
        onChange: (selectedDates, dateStr, instance) => {
            this.triggerCheckoutDateChange(selectedDates) 
        },
    });

}

triggerCheckoutDateChange(selectedDates){
    flatpickr(this.checkoutTarget, {
        minDate: new Date(selectedDates).fp_incr(1),
        onChange: (selectedDates, dateStr, instance) => {
        this.updateDetails()
    }
});
    this.checkoutTarget.click() 
}
  
  updateDetails(){
    const nightsCount = this.numberOfNights();
    const grossPrice = this.calculateGrossPrice(nightsCount);
    const serviceCharge = this.calculateServiceFee(grossPrice);
    const totalFare = this.calculateTotalFare(serviceCharge, grossPrice)
    this.numberOfNightsTarget.textContent = nightsCount
    this.grossPriceTarget.textContent = grossPrice
    this.serviceChargeTarget.textContent = serviceCharge
    this.totalFareTarget.textContent = totalFare
  }

  numberOfNights(){
    const checkinDate = new Date(this.checkinTarget.value)
    console.log('checkin click: ',checkinDate)
    const checkoutDate = new Date(this.checkoutTarget.value)
    console.log('checkout click: ',checkoutDate)
    return (checkoutDate - checkinDate) / (1000*60*60*24)
  }

  calculateGrossPrice(nightsCount){
    return parseFloat((nightsCount * this.element.dataset.perNightPrice).toFixed(2))
  }

  calculateServiceFee(grossPrice){
    return parseFloat((grossPrice*this.SERVICE_FEE).toFixed(2))
  }

  calculateTotalFare(serviceCharge, grossPrice){
    return parseFloat((serviceCharge + grossPrice).toFixed(2))
  }
}
