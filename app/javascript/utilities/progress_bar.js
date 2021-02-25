document.addEventListener('turbolinks:load',function(){
  const progressBar=document.querySelector('.progress-bar')
  const question=document.querySelector('.question-number')
  if(progressBar)
  {
    let testProgress= question.dataset.testProgress
    let passdiv=document.createElement('div');
    passdiv.className= 'progress';
    passdiv.style.width=testProgress+'%'
    progressBar.append(passdiv)
  }
})
