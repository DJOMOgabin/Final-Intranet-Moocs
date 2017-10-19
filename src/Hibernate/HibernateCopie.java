package Hibernate;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import Modele.CopieEtudiant;
import Modele.Epreuve;
import Modele.Reponse;
import Traitement.ReponseQuestion;
import controlleur.Lecture;

public class HibernateCopie {
	
	private static boolean reussite=false;
	
	public static void Supprimer(CopieEtudiant copie){

		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure(Lecture.Fichier("hibernate.cfg.xml")).buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				ArrayList<Reponse> exercice = HibernateChargementCopie.chargerReponse(copie.getId());
				for(int i=0;i<exercice.size();i++){
					ArrayList<ReponseQuestion> question = HibernateChargementCopie.
							chargerProposition(copie.getId(), exercice.get(i).getId());
					for(int j=0;j<question.size();j++){
						session.delete(question.get(j));
					}
					session.delete(exercice.get(i));
				}
				session.delete(copie);
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
	
	public static int EnregistrerCopie(CopieEtudiant epreuve){
		int valeur=-1;

		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				CopieEtudiant epreuveCharge = HibernateChargementCopie.chargerCopie
						(epreuve.getNomEpreuve(), epreuve.getNomCours(),epreuve.getIdEtudiant(),true);
				if (epreuveCharge!=null){
					epreuve.setNombreTentative(epreuveCharge.getNombreTentative()+1);
					HibernateCopie.Supprimer(epreuveCharge);
				}else{
					epreuve.setNombreTentative(0);
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
	
	public static int EnregistrerReponse(Reponse exercice){
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
	
	public static int EnregistrerProposition(ReponseQuestion question){
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
		HibernateCopie.reussite = reussite;
	}
	
	public static boolean UploadNote(CopieEtudiant epreuve){
		boolean valeur=false;
		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				session.update(epreuve);
				session.flush();
				tx.commit();
				valeur=true;
			}catch(Exception e){
				valeur=false;
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
	@SuppressWarnings("unchecked")
	public static  ArrayList<Epreuve> getEpreuve(String name_cours){
		ArrayList<Epreuve> valeur=null;
		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				Query query =session.createQuery("FROM Epreuve WHERE matiere=?").setString(0,name_cours);
               valeur=(ArrayList<Epreuve>) query.list();
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
	@SuppressWarnings("unchecked")
	public static ArrayList<CopieEtudiant> getetudiant(String name_cours,String name_epreuve){
		ArrayList<CopieEtudiant> valeur=null;
		try{
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction tx=null;
			try{
				tx = session.beginTransaction();
				Query query =session.createQuery("FROM copie WHERE cours=? and epreuve=?").setString(0,name_cours).setString(1,name_epreuve);
              valeur=(ArrayList<CopieEtudiant>)query.list();
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
	
}
