import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
    
 connect(){
    console.log("chicked")
 
}

show(){
    console.log("button clicked")
    enter(document.getElementById("modal-wrapper"))

}

hide(){
    console.log("button clicked")
    leave(document.getElementById("modal-wrapper"))

}

}