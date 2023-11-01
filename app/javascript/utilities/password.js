document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('#new_user')

    if (control) { control.addEventListener('input', new PasswordValidation(control).validatePasswords) }
})

class PasswordValidation {

    constructor() {
        this.password = document.getElementById('user_password');
        this.confirmPassword = document.getElementById('user_password_confirmation');
        this.error = document.getElementById('confirmation-alert');
    }

    validatePasswords = () => {

        if (!this.confirmPassword.value) {
            this.error.textContent = '';
        } else if (this.password.value === this.confirmPassword.value) {
            this.error.classList.add('text-success');
            this.error.classList.remove('text-danger');
            this.error.textContent = 'Пароли совпадают!';
        } else if (this.password.value !== this.confirmPassword.value) {
            this.error.classList.add('text-danger');
            this.error.classList.remove('text-success');
            this.error.textContent = 'Пароли не совпадают!';
        }
    }
}