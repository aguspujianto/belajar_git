using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmBAPPeriode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmd_ok_Click(object sender, EventArgs e)
        {
            var periode1 = txt_periode1.Text.ToString() as string;
            var periode2 = txt_periode2.Text.ToString() as string;
            var sales = cb_sales.SelectedValue.ToString() as string;

            //Label1.Text = "Tahun" + tahun.ToString() + " Bulan " + bulan.ToString() + " Sales : " + sales.ToString();
            try
            {
                SqlDataSource2.SelectParameters["p_periode1"].DefaultValue = periode1;
                SqlDataSource2.SelectParameters["p_periode2"].DefaultValue = periode2;
                SqlDataSource2.SelectParameters["p_kdsales"].DefaultValue = sales;
                SqlDataSource2.DataBind();

                ////CrystalReportViewer1.ReportSourceID = SqlDataSource2;
                CrystalReportViewer1.DataBind();
                CrystalReportViewer1.Visible = true;
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }
    }
}