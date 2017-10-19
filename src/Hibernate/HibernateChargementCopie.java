package Hibernate;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Modele.CopieEtudiant;
import Modele.Reponse;
import Traitement.ReponseQuestion;
import controlleur.Lecture;

public class HibernateChargementCopie {
	
	@SuppressWarnings("unchecked")
	public static CopieEtudiant chargerCopie(String nomEpreuve,String matiere,String idEtudiant,boolean reste){
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory =  new Configuration().configure(Lecture.Fichier("hibernate.cfg.xml")).buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx=null;
		CopieEtudiant epreuve;
		try{
			tx=session.beginTransaction();
			epreuve =(CopieEtudiant)session.createQuery("FROM copie WHERE epreuve=? and cours=? and idEtudiant=?" )
					.setString(0, nomEpreuve).setString(1, matiere).setString(2, idEtudiant).uniqueResult();
			if(reste&&epreuve!=null){
				ArrayList<Reponse> reponse= HibernateChargementCopie.chargerReponse(epreuve.getId());
				ArrayList<ReponseQuestion> reponseQuestion;
				for(int i=0;i<reponse.size();i++){
					reponseQuestion = HibernateChargementCopie.chargerProposition(epreuve.getId(), reponse.get(i).getId());
					reponse.get(i).setSuiteReponse((ArrayList<ReponseQuestion>)(reponseQuestion.clone()));
					reponseQuestion.clear();
				}
				epreuve.setReponse(reponse);
			}
			tx.commit();
		}finally {
			session.close();
		}
		sessionFactory.close();
		if(epreuve!=null)epreuve.setReponse(chargerReponse(epreuve.getId()));
		return epreuve;
	}
	
	@SuppressWarnings("unchecked")
	public static ArrayList<Reponse> chargerReponse(int idEpreuve){
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx=null;
		ArrayList<Reponse> exercice;
		try{
			tx=session.beginTransaction();
			exercice =(ArrayList<Reponse>)session.createQuery("FROM Reponse WHERE "
					+ "idCopie=?").setString(0, ""+idEpreuve).list();
			tx.commit();
		}finally {
			session.close();
		}
		sessionFactory.close();
		if(exercice!=null)
		for(int i=0;i<exercice.size();i++){
			exercice.get(i).setSuiteReponse(chargerProposition(idEpreuve,exercice.get(i).getId()));
		}
		
		return exercice;
	}

	@SuppressWarnings("unchecked")
	public static ArrayList<ReponseQuestion> chargerProposition(int idCopie,int idReponse){
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx=null;
		ArrayList<ReponseQuestion> question;
		try{
			tx=session.beginTransaction();
			question =(ArrayList<ReponseQuestion>)session.createQuery("FROM ReponseQuestion WHERE "
					+ "idCopie=? and idReponse=?").setString(0, ""+idCopie).
					setString(1, ""+idReponse).list();
			tx.commit();
		}finally {
			session.close();
		}
		sessionFactory.close();
		return question;
	}
	
}
