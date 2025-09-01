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
    public partial class FrmSqlCommandBAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //show_bulan(cb_bulan);
                show_tahun(cb_tahun);

                //cb_bulan.DataBind();
                cb_tahun.DataBind();
                //DropDownList3.DataBind();

            }
        }

        protected void cmd_ok_Click(object sender, EventArgs e)
        {
           var tahun = cb_tahun.SelectedValue.ToString() as string;
           BindBAP(tahun);
        }

        
        /*protected void BindBAP(string ket, string tahun)*/
        protected void BindBAP(string tahun)
        {
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["insentiveConnectionString"].ToString();
                
                string sql = "";

                //string sql = "SP_T_CASH_ADVANCE_SETTLEMENT_H";
                //if (ket == "PerhitunganBapAllSalesHeader")
                //if (ket == "BAPHeader")
                //{
                    //sql = "exec PerhitunganBapAllSalesHeader @p_tahun='" + tahun.ToString() + "'";
                    sql = "PerhitunganBapAllSalesHeader";
                    using (SqlConnection conn = new SqlConnection())
                    {
                        conn.ConnectionString = connString;
                        conn.Open();
                        //string sql = "sp_tbl_roommeeting";
                        SqlCommand cmd1 = new SqlCommand(sql, conn);
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.Parameters.Add("@p_tahun", SqlDbType.VarChar).Value = tahun.ToString();
                        

                        //if (status_tran < 1)
                        //{
                        //status_tran = 
                        cmd1.ExecuteNonQuery();
                        //}

                        conn.Close();

                    }
                //}

                //if (ket == "PerhitunganBapAllSalesDetail")
                //if (ket == "BAPDetail")
                //{
                    //sql = "exec PerhitunganBapAllSalesHeader @p_tahun='" + tahun.ToString() + "'";
                    sql = "PerhitunganBapAllSalesDetail";
                    using (SqlConnection conn = new SqlConnection())
                    {
                        conn.ConnectionString = connString;
                        conn.Open();
                        //string sql = "sp_tbl_roommeeting";
                        SqlCommand cmd1 = new SqlCommand(sql, conn);
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.Parameters.Add("@p_tahun", SqlDbType.VarChar).Value = tahun.ToString();


                        //if (status_tran < 1)
                        //{
                        //status_tran = 
                        cmd1.ExecuteNonQuery();
                        //}

                        conn.Close();

                    }
                //}

                
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "SUKSES"), false);
                
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", "alert('" + ex.Message.ToString() + "')", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('Error {0}')</script>", ex.Message.ToString()), false);
            }
        }

        protected void show_tahun(DropDownList drp)
        {
            //for (int i = Convert.ToInt32(DateTime.Today.Year.ToString()) - 1; i <= Convert.ToInt32(DateTime.Today.Year.ToString()); i++)
            for (int i = Convert.ToInt32(DateTime.Today.Year.ToString()) - 1; i <= Convert.ToInt32(DateTime.Today.Year.ToString()); i++)
            {

                drp.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            drp.SelectedValue = DateTime.Today.Year.ToString();
        }
    }
}