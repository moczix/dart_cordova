const deviceIsReady = new Event('deviceready');


window.addEventListener('deviceready', () => {
  console.log('tu dziala');
});

document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById('triggerDeviceIsReady').addEventListener('click', () => {
    window.dispatchEvent(deviceIsReady);
  });
});