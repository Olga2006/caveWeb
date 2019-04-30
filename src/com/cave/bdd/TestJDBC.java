package com.cave.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class TestJDBC {
	/* La liste qui contiendra tous les résultats de nos essais */
	private List<String> messages = new ArrayList<String>();

	public List<String> executerTests(HttpServletRequest request) {
		/* Chargement du driver JDBC pour MySQL */
		try {
			messages.add("Chargement du driver...");
			Class.forName("com.mysql.jdbc.Driver");
			messages.add("Driver chargé !");
		} catch (ClassNotFoundException e) {
			messages.add("Erreur lors du chargement : le driver n'a pas été trouvé dans le classpath ! <br/>"
					+ e.getMessage());
		}

		/* Connexion à la base de données */
		String url = "jdbc:mysql://localhost:3306/bdd_cave?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String utilisateur = "olga";
		String motDePasse = "ph";
		Connection connexion = null;
		//Statement statement = null;
		ResultSet resultat = null;
		PreparedStatement preparedStatement = null;
		try {
			messages.add("Connexion à la base de données...");
			connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
			messages.add("Connexion réussie !");

			/* Création de l'objet gérant les requêtes */
			//statement = connexion.createStatement();
			//messages.add("Objet requête créé !");

			/* Exécution d'une requête de lecture */
/*			resultat = statement.executeQuery("SELECT id, email, mot_de_passe, nom FROM Utilisateur;");
			messages.add("Requête \"SELECT id, email, mot_de_passe, nom FROM Utilisateur;\" effectuée !");*/
			
			
			/* Création de l'objet gérant les requêtes préparées */
			preparedStatement = connexion.prepareStatement( "SELECT id, email, mot_de_passe, nom FROM Utilisateur;" );
			messages.add( "Requête préparée créée !" );

			/* Exécution d'une requête de lecture */
			resultat = preparedStatement.executeQuery();
			messages.add( "Requête \"SELECT id, email, mot_de_passe, nom FROM Utilisateur;\" effectuée !" );
			
			
			/* Formatage pour affichage dans la JSP finale. */
			messages.add("Résultat de la requête d'insertion : " + resultat + ".");
			/* Récupération des données du résultat de la requête de lecture */
			while (resultat.next()) {
				int idUtilisateur = resultat.getInt("id");
				String emailUtilisateur = resultat.getString("email");
				String motDePasseUtilisateur = resultat.getString("mot_de_passe");
				String nomUtilisateur = resultat.getString("nom");
				/* Formatage des données pour affichage dans la JSP finale. */
				messages.add(
						"Données retournées par la requête : id = " + idUtilisateur + ", email = " + emailUtilisateur
								+ ", motdepasse = " + motDePasseUtilisateur + ", nom = " + nomUtilisateur + ".");
			}

			
			  //Exécution d'une requête d'écriture avec renvoi de l'id auto-généré int statut
			/*  int statut = statement.executeUpdate("INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) VALUES ('jmarc2@mail.fr', MD5('lavieestbelle78'), "
			  + "'jean-marc', NOW());" , Statement.RETURN_GENERATED_KEYS);*/
			  
			/* Création d'un PreparedStatement avec renvoi de l'id auto-généré */
			PreparedStatement preparedStatement1 = connexion.prepareStatement( "INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) VALUES ('jmarc@mail.fr', MD5('lavieestbelle78'), 'jean-marc', NOW());", 
					Statement.RETURN_GENERATED_KEYS );			
			preparedStatement1.executeUpdate();
			  
			 // Récupération de l'id auto-généré par la requête d'insertion. 
			//resultat =statement.getGeneratedKeys(); 
			resultat =preparedStatement1.getGeneratedKeys();
			  //Formatage pour affichage dans la JSP finale.
			messages.add("Résultat de la requête d'insertion : " + resultat + "." );
			
			//Parcours du ResultSet et formatage pour affichage de la valeur qu'il contient dans la JSP finale. 
			while ( resultat.next() ) { messages.add(
			  "ID retourné lors de la requête d'insertion :" + resultat.getInt( 1 ) );
			  }
			 

			/* Création de l'objet gérant les requêtes préparées */
			preparedStatement = connexion.prepareStatement("INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) VALUES(?, MD5(?), ?, NOW());");
			/* Récupération des paramètres d'URL saisis par l'utilisateur */
			messages.add("Requête préparée créée !");

			String paramEmail = request.getParameter("email");
			String paramMotDePasse = request.getParameter("motdepasse");
			String paramNom = request.getParameter("nom");

			/* Exécution d'une requête d'écriture */
			/*
			 * int statut = statement.executeUpdate(
			 * "INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) " +
			 * "VALUES ('" + paramEmail + "', MD5('" + paramMotDePasse + "'), '" + paramNom
			 * + "', NOW());" );
			 */

			/*
			 * Remplissage des paramètres de la requête grâce aux méthodes setXXX() mises à
			 * disposition par l'objet PreparedStatement.
			 */
			preparedStatement.setString(1, paramEmail);
			preparedStatement.setString(2, paramMotDePasse);
			preparedStatement.setString(3, paramNom);

			/* Exécution de la requête */
			int statut = preparedStatement.executeUpdate();
			/* Formatage pour affichage dans la JSP finale. */
			messages.add("Résultat de la requête d'insertion préparée : " + statut + ".");

		} catch (SQLException e) {
			messages.add("Erreur lors de la connexion : <br/>" + e.getMessage());
		} finally {
			messages.add("Fermeture de l'objet ResultSet.");
			if (resultat != null) {
				try {
					resultat.close();
				} catch (SQLException ignore) {
				}
			}
			
		/*	messages.add("Fermeture de l'objet Statement.");
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException ignore) {
				}
			}*/
			
			messages.add( "Fermeture de l'objet PreparedStatement." );
			if ( preparedStatement != null ) {
			    try {
			        preparedStatement.close();
			    } catch ( SQLException ignore ) {
			    }
			}
			
			
			messages.add("Fermeture de l'objet Connection.");
			if (connexion != null) {
				try {
					connexion.close();
				} catch (SQLException ignore) {
				}
			}
		}

		return messages;
	}
}
