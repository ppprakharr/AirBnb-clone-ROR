import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
    static targets=["checkin", "checkout"]
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
    }
});
    this.checkoutTarget.click() 
}

}
