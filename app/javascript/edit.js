
function showEditControls() {
  const editButton = document.getElementById('edit-button');
  const hiddenElements = document.querySelectorAll('.hidden');
  editButton.addEventListener('click', (event) => {
    event.preventDefault();
    hiddenElements.forEach((element) => {
      element.classList.remove('hidden');
    });
    editButton.classList.add('hidden');
    document.getElementById('description-text').classList.add('hidden');
  });
}

export { showEditControls };
