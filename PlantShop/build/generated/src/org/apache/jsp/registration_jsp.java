package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/header.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style/register.css\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style/mycss.css\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <nav class=\"nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li class=\"shopLogo\"><a href=\"\"><img src=\"images/logo.jpg\"></a></li>\n");
      out.write("                    <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                    <li><a href=\"registration.jsp\">Register</a></li>\n");
      out.write("                    <li><a href=\"login.jsp\">Login</a></li>\n");
      out.write("                    <li><a href=\"mainController?action=viewcart\">View cart</a></li>\n");
      out.write("                    \n");
      out.write("                    <li class=\"formsearch\">\n");
      out.write("                        <div>\n");
      out.write("                           <form action=\"mainController\" method=\"post\" >\n");
      out.write("                            <input type=\"text\" name=\"txtsearch\" value=\"");
      out.print( (request.getParameter("txtsearch")==null)?"":request.getParameter("txtsearch") );
      out.write("\">\n");
      out.write("                            <select name=\"searchby\">\n");
      out.write("                                <option>By name</option>\n");
      out.write("                                <option>By category</option>\n");
      out.write("                            </select>\n");
      out.write("                            <input type=\"submit\" value=\"search\" name=\"action\">\n");
      out.write("                        </form> \n");
      out.write("                        </div>\n");
      out.write("                        </li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>    \n");
      out.write("        </header>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        </header>\n");
      out.write("        <section class=\"registerSection\">\n");
      out.write("            <form action=\"mainController\" method=\"post\" class=\"formRegister\">\n");
      out.write("                <h1>Register</h1>\n");
      out.write("                <table>\n");
      out.write("                    <tr><td>Email</td><td><input type=\"text\" name=\"txtemail\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.txtemail}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" \n");
      out.write("                                                 required=\"\" class=\"inputInfo\" pattern=\"^(\\\\w)+@(a-zA-Z]+([.](\\\\w+){1,2}\"/></td></tr>\n");
      out.write("                    <tr><td>Full name</td><td><input type=\"text\" name=\"txtfullname\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.txtfullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"\n");
      out.write("                                                     required=\"\" class=\"inputInfo\"/></td></tr>\n");
      out.write("                    <tr><td>Password</td><td><input type=\"password\" name=\"txtpassword\" required=\"\"class=\"inputInfo\"/></td></tr>\n");
      out.write("                    <tr><td>Phone</td><td><input type=\"text\" name=\"txtphone\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.txtphone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"\n");
      out.write("                                                 class=\"inputInfo\"/></td></tr>\n");
      out.write("                    <tr><td colspan=\"2\"><input type=\"submit\" value=\"register\" name=\"action\" class=\"registerBtn\"/></td></tr>\n");
      out.write("                </table>\n");
      out.write("                <div class=\"error_text\">\n");
      out.write("                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.error_phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.error_email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("        </section>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
