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

public class TestHibernate {
	
	private static boolean reussite=false;
	
	public static void Supprimer(Epreuve epreuve){

		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure(Lecture.Fichier("hibernate.cfg.xml")).buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				ArrayList<ExerciceEntier> exercice = TestHibernate2.
						chargerExercice(epreuve.getId());
				for(int i=0;i<exercice.size();i++){
					ArrayList<Question> question = TestHibernate2.
							chargerQuestion(epreuve.getId(), exercice.get(i).getId());
					for(int j=0;j<question.size();j++){
						session.delete(question.get(j));
					}
					session.delete(exercice.get(i));
				}
				session.delete(epreuve);
				session.flush();
				tx.commit();
				TestHibernate.setReussite(true);
			}catch(Exception e){
				if(tx!=null){
					tx.rollback();
				}
				throw e;
			}finally {
				session.close();
			}
			sessionFactory.close();
		}catch(Throwable ex){
			System.out.println(ex);
		}
		
	}
	
	public static int EnregistrerEpreuve(Epreuve epreuve){
		//Configuration config = new Configuration().configure("hibernate.cfg.xml");
		//config.addClass(Epreuve.class);
		int valeur=-1;

		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				Epreuve epreuveCharge = TestHibernate2.chargerEpreuve
						(epreuve.getTitre(), epreuve.getMatiere());
				if (epreuveCharge!=null){
					TestHibernate.Supprimer(epreuveCharge);
				}
				valeur=(Integer)session.save(epreuve);
				session.flush();
				tx.commit();
			}catch(Exception e){
				if(tx!=null){
					tx.rollback();
				}
				throw e;
			}finally {
				session.close();
			}
			sessionFactory.close();
		}catch(Throwable ex){
			System.out.println(ex);
		}
		
		return valeur;
	}
	
	public static int EnregistrerExercice(ExerciceEntier exercice){
		//Configuration config = new Configuration().configure("hibernate.cfg.xml");
		//config.addClass(Epreuve.class);
		int valeur=-1;

		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				valeur=(Integer)session.save(exercice);
				session.flush();
				tx.commit();
			}catch(Exception e){
				if(tx!=null){
					tx.rollback();
				}
				throw e;
			}finally {
				session.close();
			}
			sessionFactory.close();
		}catch(Throwable ex){
			System.out.println(ex);
		}
		
		return valeur;
	}
	
	public static int EnregistrerQuestion(Question question){
		//Configuration config = new Configuration().configure("hibernate.cfg.xml");
		//config.addClass(Epreuve.class);
		int valeur=-1;

		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				valeur=(Integer)session.save(question);
				session.flush();
				tx.commit();
			}catch(Exception e){
				if(tx!=null){
					tx.rollback();
				}
				throw e;
			}finally {
				session.close();
			}
			sessionFactory.close();
		}catch(Throwable ex){
			System.out.println(ex);
		}
		
		return valeur;
	}
	
	
	
	
	public static boolean isReussite() {
		return reussite;
	}

	public static void setReussite(boolean reussite) {
		TestHibernate.reussite = reussite;
	}
	
	public static int ret(int u){
		return u;
	}
	
}
