using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmBAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                show_bulan(cb_bulan);
                show_tahun(cb_tahun);

                cb_bulan.DataBind();
                cb_tahun.DataBind();
                DropDownList3.DataBind();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //var cb_tahun = 
            var tahun =  cb_tahun.SelectedValue.ToString() as string;
            var bulan = cb_bulan.SelectedValue.ToString() as string;
            var sales = DropDownList3.SelectedValue.ToString() as string;

            Label1.Text = "Tahun" + tahun.ToString() + " Bulan " + bulan.ToString() + " Sales : " + sales.ToString();
            try
            {
                SqlDataSource2.SelectParameters["Tahun"].DefaultValue = tahun;
                SqlDataSource2.SelectParameters["Bulan"].DefaultValue = bulan;
                SqlDataSource2.SelectParameters["NamaSales"].DefaultValue = sales;
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

        protected void show_tahun(DropDownList drp)
        {
            for (int i = Convert.ToInt32(DateTime.Today.Year.ToString()) - 2; i <= Convert.ToInt32(DateTime.Today.Year.ToString()); i++)
            {

                drp.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            drp.SelectedValue = DateTime.Today.Year.ToString();
        }

        protected void show_bulan(DropDownList drp)
        {
            for (int i = 1; i <= 12; i++)
            {

                DateTime date = new DateTime(1900, i, 1);
                drp.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString("0")));
            }
            drp.SelectedValue = DateTime.Today.Month.ToString("0");
        }
    }
}