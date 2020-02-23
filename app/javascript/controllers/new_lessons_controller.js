import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'start_date', 'end_date', 'added_lessons', 'template' ]

  diff_weeks(dt1, dt2) {
    var diff =(dt2.getTime() - dt1.getTime()) / 1000;
    diff /= (60 * 60 * 24 * 7);
    return Math.abs(Math.round(diff));
  }

  add_lessons(event, ) {
    // event.preventDefault();
    // const startDate = new Date(this.start_dateTarget.value);
    // const endDate = new Date (this.end_dateTarget.value);
    // console.log(this.templateTarget)
    // var content = this.templateTarget.innerHTML.replace(/LESSON_TEMPLATE_RECORD/g, Math.floor(Math.random() * 20))
    // this.added_lessonsTarget.insertAdjacentHTML('beforeend', content);
  }

  remove_lesson(event) {
    event.preventDefault()
    let item = event.target.closest(".nested-fields")
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }
}