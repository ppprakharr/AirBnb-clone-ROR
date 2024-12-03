import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
    
 connect(){
    console.log("chicked")
 
}

toggleModal(){
    console.log("button clicked")
    const modalTriggerId = this.element.dataset.modalTriggerId
    // console.log('id is: ',id)
    toggle(document.getElementById(`modal-${modalTriggerId}-wrapper`))

}



}