import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
    static targets=["numberOfNights", "grossPrice", "serviceCharge", "totalFare", "checkin", "checkout"]
    SERVICE_FEE = 0.18
    disabled_dates = []
  connect() {
    this.getBookedDates()
    flatpickr(this.checkinTarget, {
        disable: this.disabled_dates,
        minDate: new Date().fp_incr(1),
        onChange: (selectedDates, dateStr, instance) => {
            this.triggerCheckoutDateChange(selectedDates) 
        },
    });

}

getBookedDates(){
    const dates = JSON.parse(this.element.dataset.blockedDates)
    for(let i=0; i< dates.length; i++){
        const blocked_date = dates[i]
        this.disabled_dates.push(
            {
                from: blocked_date[0], //checkin date
                to: blocked_date[1], //checkout date
            }
        )

    }
}

triggerCheckoutDateChange(selectedDates){
    this.getBookedDates()
    flatpickr(this.checkoutTarget, {
        disable: this.disabled_dates,
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

  reserveProperty(e){
    e.preventDefault();
    const queryData = {
        checkin_date: this.checkinTarget.value,
        checkout_date: this.checkoutTarget.value
    }
    const queryParam = (new URLSearchParams(queryData)).toString()
    const baseURL = e.target.dataset.reservePropertyUrl
    Turbo.visit(`${baseURL}?${queryParam}`)

  }
}
