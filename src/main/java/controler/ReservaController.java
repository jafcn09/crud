package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import dao.ReservaDAO;
import model.Reserva;

public class ReservaController extends HttpServlet {
	  private static final long serialVersionUID = 1L;

	    ReservaDAO rDao = new ReservaDAO();
	    RequestDispatcher rd;
	    public ReservaController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");
	        if (action.equals("listar")) {
	            listar(request,response);
	        }else if (action.equals("eliminar")) {
	            eliminar(request,response);
	        }
	    }
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        if (action.equals("listar")) {
	            listar(request,response);
	        }else if (action.equals("editar")) {
	            editar(request,response);
	        }else if (action.equals("alta")) {
	            crear(request,response);
	        }
	    }
		
		private void crear(HttpServletRequest request, HttpServletResponse response) {
			// TODO Auto-generated method stub
			
		}
		private void editar(HttpServletRequest request, HttpServletResponse response) {
			// TODO Auto-generated method stub
			
		}
		private void listar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		
			  String queryParam = request.getParameter("query");
		        List<Reserva> reservas = rDao.seleccionarReservas();
		        request.setAttribute("reservas", reservas);
		        rd = request.getRequestDispatcher("/main.jsp");
		        rd.forward(request, response);
		}
		private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			  int idReserva = Integer.parseInt(request.getParameter("idreserva"));
		        boolean eliminado = rDao.eliminar(idReserva);
		        request.setAttribute("eliminado", eliminado);
		        rd = request.getRequestDispatcher("/reserva?action=listar");
		        rd.forward(request, response);
			
		}
}
