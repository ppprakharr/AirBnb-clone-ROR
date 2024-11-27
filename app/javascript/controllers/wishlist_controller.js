import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


    updateWishlistStatus(){
    // get status whether the user is logged in
    // if not logged in redirect to login page,return
        const isUserLoggedIn = this.element.dataset.userLoggedIn;
        if (isUserLoggedIn=="false"){
            document.getElementById("login").click()
            return
        }
        
        if(this.element.dataset.status=="false"){
        this.element.classList.remove("fill-none")
        this.element.classList.add("fill-primary")
        this.element.dataset.status="true"
        
        }
        else{
            this.element.classList.remove("fill-primary")
            this.element.classList.add("fill-none")
            this.element.dataset.status="false"
        }
}
  }

