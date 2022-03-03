import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('offer_address');
  if (addressInput) {
    console.log('hello');
    places({ container: addressInput });
  }
};

export { initAutocomplete };
