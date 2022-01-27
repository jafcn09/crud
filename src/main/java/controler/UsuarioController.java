package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import dao.AulaDAO;
import dao.UsuarioDAO;
import model.Aula;
import model.Usuario;

/**
 * Servlet implementation class UsuarioController
 */
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UsuarioDAO uDao = new UsuarioDAO();
	AulaDAO aDao = new AulaDAO();
	RequestDispatcher rd;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equals("login")) {
			login(request,response);
		}
		
	}
	
protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usuario = request.getParameter("username");
		String password = DigestUtils.md5Hex(request.getParameter("password"));
		
		HttpSession session = request.getSession();
		
		Usuario logged = uDao.login(usuario, password);
		List<Aula> aulas = aDao.getAulas("");
		
		if (logged != null) {
			session.setAttribute("user", logged);
			session.setAttribute("aulas", aulas);
			rd = request.getRequestDispatcher("/main.jsp");
			rd.forward(request, response);
		}
		else {
			String msg = "Usuario y/o password incorrectos";
			request.setAttribute("message", msg);
			rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		
	}

public class Logout extends HttpServlet {

   //Ya sea que el método sea por GET o POST, cerraremos la sesion.
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       HttpSession sesion = request.getSession(true);
       
       //Cerrar sesion
       sesion.invalidate();
       
       //Redirecciono a index.jsp
       response.sendRedirect("index.jsp");
   }

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       processRequest(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       processRequest(request, response);
   }
}


}
