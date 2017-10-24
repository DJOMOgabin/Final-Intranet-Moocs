package Hibernate;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Modele.Epreuve;
import Traitement.ExerciceEntier;
import Traitement.Question;
import controlleur.Lecture;

public class TestHibernate2 {
	
	public static Epreuve chargerEpreuve(String nomEpreuve,String matiere){
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory =  new Configuration().configure(Lecture.Fichier("hibernate.cfg.xml")).buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx=null;
		Epreuve epreuve=null;
		try{
			tx=session.beginTransaction();
			epreuve =(Epreuve)session.createQuery("FROM Epreuve WHERE titre=? and matiere=?" )
					.setString(0, nomEpreuve).setString(1, matiere).uniqueResult();
			tx.commit();
		}finally {
			session.close();
		}
		sessionFactory.close();
		if(epreuve!=null)epreuve.setExercice(chargerExercice(epreuve.getId()));
		return epreuve;
	}
	
	@SuppressWarnings("unchecked")
	public static ArrayList<ExerciceEntier> chargerExercice(int idEpreuve){
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx=null;
		ArrayList<ExerciceEntier> exercice;
		try{
			tx=session.beginTransaction();
			exercice =(ArrayList<ExerciceEntier>)session.createQuery("FROM ExerciceEntier WHERE "
					+ "idEpreuve=?").setString(0, ""+idEpreuve).list();
			tx.commit();
		}finally {
			session.close();
		}
		sessionFactory.close();
		if(exercice!=null)
		for(int i=0;i<exercice.size();i++){
			exercice.get(i).setQuestion(
					chargerQuestion(idEpreuve,exercice.get(i).getId()));
		}
		
		return exercice;
	}

	@SuppressWarnings("unchecked")
	public static ArrayList<Question> chargerQuestion(int idEpreuve,int idExercice){
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx=null;
		ArrayList<Question> question;
		try{
			tx=session.beginTransaction();
			question =(ArrayList<Question>)session.createQuery("FROM Question WHERE "
					+ "idExercice=? and idEpreuve=?").setString(0, ""+idExercice).
					setString(1, ""+idEpreuve).list();
			tx.commit();
		}finally {
			session.close();
		}
		sessionFactory.close();
		return question;
	}
}
