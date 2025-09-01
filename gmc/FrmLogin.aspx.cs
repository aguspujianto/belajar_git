using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmd_login_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["insentiveConnectionString"].ConnectionString;
            var email = txt_user.Text.ToString() as string;
            var password = txt_password.Text.ToString() as string;
            string ket = "login" as string;
            //string password = txt_password.Text.ToString() as string;
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        //cmd.CommandText = "select * from Accounts h WHERE h.name = @userid and h.name = @password";
                        //cmd.CommandText = "select *,(select fullname from [dbo].[Accounts] where name = d.Dept_Head) as Nm_Dept_Head,(select fullname from [dbo].[Accounts] where name = d.bod) as Nm_Dept_Bod " +
                        //                    " from Accounts h " +
                        //                    " left join Approval_level d on h.Dept_Id = d.[Department ID] " +
                        //                    " WHERE h.name = @userid and h.password =@password";
                        //cmd.CommandText = "sp_login_user_cas";
                        cmd.CommandText = "sp_login_user";
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@p_user", email);
                        cmd.Parameters.AddWithValue("@p_pass", password);
                        cmd.Parameters.AddWithValue("@p_ket", ket);
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            if (sdr.HasRows)
                            {
                                Session["userid"]   = sdr["pkey"].ToString();
                                Session["username"] = sdr["username"].ToString();
                                Session["nama"]     = sdr["nama"].ToString();
                                Session["password"] = sdr["password"].ToString();                                
                                Session["status"]   = sdr["status"].ToString();                            

                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("alert('Data {0} Tidak Di Temukan')", email), true);
                            }
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
            }
        }
    }
}