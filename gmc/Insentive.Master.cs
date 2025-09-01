using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class Insentive : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("FrmLogin.aspx");
            }
        }

        protected void lnk_logout_Click(object sender, EventArgs e)
        {
            Session["userid"] = "";
            Session["username"] = "";
            Session["password"] = "";
            Session["status"] = "";   

            
            Session.Clear();
            Response.Redirect("FrmLogin.aspx");
        }
    }
}