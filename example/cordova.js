const deviceIsReady = new Event('deviceready');


document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById('triggerDeviceIsReady').addEventListener('click', () => {
    document.dispatchEvent(deviceIsReady);
  });
});