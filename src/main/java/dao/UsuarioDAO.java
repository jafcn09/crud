package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Aula;
import model.Usuario;
import utils.HibernateUtil;

public class UsuarioDAO {
	
	
	public Usuario login(String username, String password) {
		
		Usuario usuario = null;
		
		SessionFactory sessfact = HibernateUtil.getSessionFactory();		
		Session session = sessfact.getCurrentSession();		
		Transaction tr = null;
		
		try {
			
			tr = session.beginTransaction();
			Query<Usuario> query = (Query<Usuario>)session.createQuery("Select u from Usuario u where u.username = '"+username+"' and u.password = '"+password+"'");
			List<Usuario> usuarios = query.list();
			
			if(usuarios.size()>0) {
				usuario = usuarios.get(0);
				return usuario; 
			}else {
				return null;	
			}
			
		}catch(Exception ex){
			
			if(tr!=null) 
				tr.rollback();
			
			ex.printStackTrace();
			 return null;
			
		}
		finally {
			session.close();
			sessfact.close();
		}
		
	}

}
