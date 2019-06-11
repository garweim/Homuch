import places from 'places.js';

  const initAutocomplete = () => {
    const addressInput = document.getElementById('project_street_and_nr');
    if (addressInput) {
      places({ container: addressInput });
    }
  };

export { initAutocomplete };
