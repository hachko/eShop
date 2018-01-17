package com.eCom.beans;

public class Utilisateur {
	
	private String email;
    private String motdepasse;
    private String login;
	
    
    public String getEmail() {
		return email;
	}
	public String getMotdepasse() {
		return motdepasse;
	}
	public String getLogin() {
		return login;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMotDePasse(String motDePasse) {
		this.motdepasse = motDePasse;
	}
	public void setLogin(String login) {
		this.login = login;
	}

}
