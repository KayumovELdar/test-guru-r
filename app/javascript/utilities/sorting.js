document.addEventListener('turbolinks:load', function() {
  const control = document.getElementById('sort-by-title')

  if (control) {
    control.addEventListener('click', sortRowsByTitle)
  }
})

function sortRowsByTitle() {
  const table = document.getElementById('table')
  const sortedRows = Array.from(table.rows).slice(1)
  const arrowUp = document.querySelector('.octicon-arrow-up')
  const arrowDown = document.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {

    sortedRows
      .sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1);
    rebuildTable(table, sortedRows)
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')

  } else {

    sortedRows
      .sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1);
    rebuildTable(table, sortedRows)
    arrowUp.classList.add('hide')
    arrowDown.classList.remove('hide')
  }
}

function rebuildTable(table, sortedRows) {
  table.tBodies[0].append(...sortedRows)
}
