
var inactivityTimeout = 30000; 
var inactivityTimer;

function startInactivityTimer() {
  inactivityTimer = setTimeout(logout, inactivityTimeout);
}

function resetInactivityTimer() {
  clearTimeout(inactivityTimer);
  startInactivityTimer();
}

function logout() {
 
  window.location.href = "./ValidarLogin?Op=CerrarSesion";
}


document.addEventListener("mousemove", resetInactivityTimer);
document.addEventListener("keydown", resetInactivityTimer);

startInactivityTimer();