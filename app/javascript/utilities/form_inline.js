
document.addEventListener('turbolinks:load', function(){
  const controls = document.querySelectorAll('.form-inline-link')

  if (!controls.length) return

  for (var i = 0; i < controls.length; i++){
    controls[i].addEventListener('click', formInlineLinkHandler)
  }

  const errors = document.getElementById('.resource-errors')

  if(errors){
    let resourceId = errors.dataset.resourceId

    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event){
  event.preventDefault()

  const testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId){
  let testName = document.querySelector('.test-name[data-test-id="' + testId +'"]')
  let formInline = document.querySelector('.form-inline[data-test-id="' + testId +'"]')

  if (formInline.classList.contains('hide')){
    testName.classList.add('hide')
    formInline.classList.remove('hide')
  } else {
    testName.classList.remove('hide')
    formInline.classList.add('hide')
  }
}
