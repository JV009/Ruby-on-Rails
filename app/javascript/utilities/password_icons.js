document.addEventListener("turbolinks:load", function() {
    const password = document.getElementById('password');
    const passwordConfirmation = document.getElementById('password_confirmation');

    function color_change() {
        if (passwordConfirmation.value === '') {
            passwordConfirmation.style.borderColor = '';
            return;
        }

        if (passwordConfirmation.value === password.value) {
            passwordConfirmation.style.borderColor = 'green';
        } else {
            passwordConfirmation.style.borderColor = 'red';
        }
    }

    if (password) {password.addEventListener('input', color_change)}
    if (passwordConfirmation) {passwordConfirmation.addEventListener('input', color_change)}
})
