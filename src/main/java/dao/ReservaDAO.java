package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Aula;
import model.Reserva;
import utils.HibernateUtil;

public class ReservaDAO {
public List<Reserva> seleccionarReservas(){
		
		List<Reserva> reservas = new ArrayList<Reserva>();
		SessionFactory sessfact = HibernateUtil.getSessionFactory();
		
		Session session = sessfact.getCurrentSession();
		
		Transaction tr = null;
		
		try {
			
			tr = session.beginTransaction();
			reservas = session.createQuery("Select r from Reserva r", Reserva.class).getResultList();
			
		}catch(Exception ex){
			
			if(tr!=null) 
				tr.rollback();
			
			ex.printStackTrace();
			reservas = null; 
			
		}
		finally {
			session.close();
			sessfact.close();
		}
		
for(Reserva variable:reservas){
        	
			System.out.println(variable.getIdreserva());
        	;
        	
        }
		
		return reservas; 
		
	}
	
	
	

    public boolean eliminar(int idReserva) {
        SessionFactory sessFact = HibernateUtil.getSessionFactory();
        Session session = sessFact.getCurrentSession();
        Transaction tr = null;

        try {
            tr = session.beginTransaction();

            // Eliminar la reserva de la tabla de reservas
            Query<Reserva> query = (Query<Reserva>) session.createQuery("Delete Reserva r where idreserva = " + idReserva);
            query.executeUpdate();

            Reserva reserva = session.get(Reserva.class, idReserva);

            session.delete(reserva);
            tr.commit();
            return true;
        } catch (Exception ex) {
            if (tr != null)
                tr.rollback();

            ex.printStackTrace();
            return false;
        } finally {
            session.close();
            sessFact.close();
        }

    }
}