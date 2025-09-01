using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmKetentuanBAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    sql_ketentuan.SelectParameters["p_nilai1"].DefaultValue = "";
                    sql_ketentuan.SelectParameters["p_nilai2"].DefaultValue = "";
                    sql_ketentuan.SelectParameters["p_persen"].DefaultValue = "";
                    sql_ketentuan.SelectParameters["p_status"].DefaultValue = "";
                    sql_ketentuan.SelectParameters["p_pkey"].DefaultValue = "";
                    sql_ketentuan.SelectParameters["p_ket_ketentuan"].DefaultValue = cb_ket.SelectedValue;
                    sql_ketentuan.SelectParameters["p_ket"].DefaultValue = "SELECT";
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }

        protected void cb_ket_SelectedIndexChanged(object sender, EventArgs e)
        {
            sql_ketentuan.SelectParameters["p_nilai1"].DefaultValue = "";
            sql_ketentuan.SelectParameters["p_nilai2"].DefaultValue = "";
            sql_ketentuan.SelectParameters["p_persen"].DefaultValue = "";
            sql_ketentuan.SelectParameters["p_status"].DefaultValue = "";
            sql_ketentuan.SelectParameters["p_pkey"].DefaultValue = "";
            sql_ketentuan.SelectParameters["p_ket_ketentuan"].DefaultValue = cb_ket.SelectedValue;
            sql_ketentuan.SelectParameters["p_ket"].DefaultValue = "SELECT";
        }

        protected void lnk_update_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            try
            {
                var nilai1 = lnk.FindControl("txt_e_nilai1") as TextBox;
                var nilai2 = lnk.FindControl("txt_e_nilai2") as TextBox;
                var persen = lnk.FindControl("txt_e_persen") as TextBox;
                var status = lnk.FindControl("chk_e_status") as CheckBox;
                var pkey = lnk.FindControl("lbl_e_pkey") as Label;
                string ket_status = (status.Checked  ? "True" : "False");

                sql_ketentuan.UpdateParameters["p_nilai1"].DefaultValue = nilai1.Text;
                sql_ketentuan.UpdateParameters["p_nilai2"].DefaultValue = nilai2.Text;
                sql_ketentuan.UpdateParameters["p_persen"].DefaultValue = persen.Text;
                sql_ketentuan.UpdateParameters["p_status"].DefaultValue = ket_status;
                sql_ketentuan.UpdateParameters["p_pkey"].DefaultValue = pkey.Text;
                sql_ketentuan.UpdateParameters["p_ket_ketentuan"].DefaultValue = cb_ket.SelectedValue;
                sql_ketentuan.UpdateParameters["p_ket"].DefaultValue = "UPDATE";
                sql_ketentuan.Update();

                grv_ketentuan.EditIndex = -1;
                /*
                sql_ketentuan.SelectParameters["p_nilai1"].DefaultValue = "";
                sql_ketentuan.SelectParameters["p_nilai2"].DefaultValue = "";
                sql_ketentuan.SelectParameters["p_persen"].DefaultValue = "";
                sql_ketentuan.SelectParameters["p_status"].DefaultValue = "";
                sql_ketentuan.SelectParameters["p_pkey"].DefaultValue = "";
                sql_ketentuan.SelectParameters["p_ket_ketentuan"].DefaultValue = cb_ket.SelectedValue;
                sql_ketentuan.SelectParameters["p_ket"].DefaultValue = "SELECT";
                 */
                sql_ketentuan.DataBind();
                grv_ketentuan.DataBind();

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Data Sukses Di Update"), false);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }
    }
}