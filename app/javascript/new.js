
function dose() {
  let counter = 0;
  const plus = document.getElementById('plus');
  const hiddenDoses = document.querySelectorAll('.dose.hidden');
  const del = document.querySelectorAll('.delete');
  plus.addEventListener('click', (event) => {
    // doses.classList.remove('hidden');
    hiddenDoses[counter].classList.remove('hidden');
    counter += 1;
  });
  del.forEach((element) => {
    element.addEventListener('click', (event) => {
      let ingredientElement = 'cocktail_doses_dose' + counter + '_ingredient';
      let descriptionElement = 'cocktail_doses_dose' + counter + '_description';
      document.getElementById(ingredientElement).value = '';
      document.getElementById(descriptionElement).value = '';
      console.log(hiddenDoses);
      console.log(counter);
      counter -= 1;
      hiddenDoses[counter].classList.add('hidden');
    });
  });
}

export { dose };
