const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    Object.values(input.files).forEach((file) => {
      const reader = new FileReader();
      reader.onload = (event) => {
        const img = `<img width="100" class="" id="photo-preview" src="${event.currentTarget.result}">`;

        document.querySelector('.photo-previews').insertAdjacentHTML('beforeend', img);
      }
      reader.readAsDataURL(file);
      document.querySelector('.photo-previews').classList.remove('hidden');

    })
  }
}

export { previewImageOnFileSelect };
