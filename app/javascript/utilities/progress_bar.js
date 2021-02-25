document.addEventListener('turbolinks:load',function(){
  const progressBar=document.querySelector('.progress-bar')
  const question=document.querySelector('.question-number')
  if(progressBar)
  {
    let testProgress= question.dataset.testProgress
    let passdiv=document.createElement('div');
    passdiv.className= 'progress';
    progress_width=parseInt(getComputedStyle(progressBar).width)*testProgress
    passdiv.style.width=progress_width+'px'
    progressBar.append(passdiv)
  }
})
