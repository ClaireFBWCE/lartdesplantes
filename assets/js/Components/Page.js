import React from 'react';

export class Page extends React.Component{
    
    constructor(props){

        super(props);

        this.state = 
        {
            email       : '',
            password    : '',
            message     : null
        };

    }

    onChangeEmail = (event) =>{
        let email = event.target.value;
        this.setState({ email: email })
    }

    onChangePassword = (event) => {

        this.setState({ password: event.target.value })

    }

    onSubmitForm = (event) =>{

        let loginForm;
        event.preventDefault();
        // console.log(this.state.email);
        // console.log(this.state.password);
       
        // Construction d'un objet de formulaire, avec ce qui a été saisi par l'utilisateur.
        loginForm = new FormData();
        loginForm.append('email',    this.state.email);
        loginForm.append('password', this.state.password);

        // Construction d'une requête HTTP POST avec les données du formulaire.
        window.fetch('/api/login.php', { method: 'POST', body: loginForm })
            .then((response) =>
            {
                // Récupère la réponse HTTP et désérialise le JSON.
                return response.json();
            })
            .then((result) =>
            {
                console.log(result);

                if(result.status == 'login_ok')
                {
                    this.setState(
                    {
                        message : 'Vous êtes désormais connecté !',
                    });
                }
                else
                {
                    if(result.details == 'bad_password')
                    {
                        this.setState(
                        {
                            message : 'ERREUR : mot de passe incorrect', 
                        });
                    }
                    else if(result.details == 'unknown_email')
                    {
                        this.setState({ message: 'ERREUR : utilisateur inconnu' });
                    }
                }
            });
        }

    
    render(){
        return(
            <form onSubmit={ this.onSubmitForm }>
                <div className="alert alert-danger" role="alert"> 
                    { this.state.message }
                </div> 
                <div className="container">
                    <label htmlFor="email">Email</label>
                    <input id="email" type="text" value={ this.state.email } onChange={ this.onChangeEmail } />
                </div>
                <div className="container">
                    <label htmlFor="password">Mot de passe</label>
                    <input id="password" type="password" value={ this.state.password } onChange={ this.onChangePassword } className={ this.state.passwordClass } />
                </div>
                <div className="container">
                    <button>Se connecter</button>
                </div>
            </form>
        );
    }
}
