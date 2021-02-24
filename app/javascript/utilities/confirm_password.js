document.addEventListener('turbolinks:load', function() {
  const passwordField = document.getElementById('user_password')
  const confirmationField = document.getElementById('user_password_confirmation')

  if (passwordField && confirmationField) {
    passwordField.addEventListener('input', passwordCheck)
    confirmationField.addEventListener('input', passwordCheck)
  }
})

function passwordCheck() {
  const match = document.querySelector('.octicon-check').classList;
  const notMatch = document.querySelector('.octicon-x').classList;
  const password = document.getElementById('user_password').value
  const confirmation = document.getElementById('user_password_confirmation').value

  if (confirmation == "") {
    match.add('hide');
    notMatch.add('hide');
  } else if (password == confirmation) {
    match.remove('hide');
    notMatch.add('hide');
  } else {
    match.add('hide');
    notMatch.remove('hide');
  }
}
