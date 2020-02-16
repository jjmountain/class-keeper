import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["add_school", "add_faculty", "school_template", "faculty_template", "school_input", "faculty_input"]

  add_association(event) {
    event.preventDefault();
    var content = this.school_templateTarget.innerHTML.replace(/SCHOOL_TEMPLATE_RECORD/g, Math.floor(Math.random() * 20000))
    this.add_schoolTarget.insertAdjacentHTML('beforebegin', content)
    this.add_schoolTarget.style.display = 'none';
    this.school_inputTarget.remove()

    var content = this.faculty_templateTarget.innerHTML.replace(/FACULTY_TEMPLATE_RECORD/g, Math.floor(Math.random() * 20000))
    this.add_facultyTarget.insertAdjacentHTML('beforebegin', content)
    this.faculty_inputTarget.remove()


  }

  remove_association(event) {
    event.preventDefault()
    let item = event.target.closest(".nested-fields")
    console.log(item)
    item.style.display = 'none'
    var content = this.school_templateTarget.innerHTML.replace(/SCHOOL_TEMPLATE_RECORD/g, Math.floor(Math.random() * 200000))
    this.add_facultyTarget.insertAdjacentHTML('beforebegin', content);
  }
}