// Login/Registation system
let username = document.querySelector('#username');
let password = document.querySelector('#password');
let email = document.querySelector('#email');
let birthdate = document.querySelector('#birthdate');
let submit = document.querySelector('#submit');

let users = {};

function User(username, password, email, birthdate){
    this.username = username;
    this.password = password;
    this.email = email;
    this.birthdate = birthdate;
}

function createId(users){
    return Object.keys(users).length;
}

submit.addEventListener('click', () => {
    const usernameUser = username.value;
    const passwordUser = password.value;
    const emailUser = email.value;
    const birthdateUser = birthdate.value;

    const user = new User(usernameUser, passwordUser, emailUser, birthdateUser);

    const userId = 'User' + createId(users);
    users[userId] = user;

    console.log(users);

    alert(`${usernameUser}, jūs esat veiksmīgi reģistrējūsies!`);
})
// Login/Registation system