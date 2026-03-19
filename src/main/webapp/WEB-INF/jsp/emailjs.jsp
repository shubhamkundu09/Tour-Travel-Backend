<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<script>
(function(){
   emailjs.init("Qxyn_HbplufDHZrFR"); // replace with your public key
})();

document.getElementById("bookingForm")
.addEventListener("submit", function(event) {
   event.preventDefault();

   emailjs.sendForm("service_g8xg6f9", "template_wsitvfm", this)
   .then(function() {
       alert("Booking sent successfully!");
   }, function(error) {
       alert("Failed to send booking. Error: " + JSON.stringify(error));
   });
});
</script>