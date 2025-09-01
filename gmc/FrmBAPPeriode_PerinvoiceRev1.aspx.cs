using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmBAPPeriode_PerinvoiceRev1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                Form.Action = Request.RawUrl;

                //BindGrid(sql_witholdingwapu, grv_ntpn, "VIEW", txt_find.Text.ToString(), "", txt_find_tgl_invoice.Text.ToString(), txt_find_tgl_invoice1.Text.ToString(), "", "", "");
            }
            cmd_ok_Click(null, null);
        }

        
        protected void cmd_ok_Click(object sender, EventArgs e)
        {
            var periode1 = txt_periode1.Text.ToString() as string;
            var periode2 = txt_periode2.Text.ToString() as string;
            var sales    = cb_sales.SelectedValue.ToString() as string;
            //DateTime dt;
            //Label1.Text = "Tahun" + tahun.ToString() + " Bulan " + bulan.ToString() + " Sales : " + sales.ToString();
            try
            {
                //if (DateTime.Parse(periode1) || DateTime.Parse(periode2))
                //dt = DateTime.Parse(periode1);
                //if (DateTime.Parse(periode1))
                if (periode1.ToString() != "" || periode2.ToString() != "")
                //if (String.IsNullOrEmpty(periode1.ToString())  && String.IsNullOrEmpty(periode2.ToString()) )
                //{
                //    Page.Response.Write("<script>console.log('" + periode1.ToString() + "');</script>");
                //}else
                {

                
                    //SqlDataSource2.SelectParameters["p_periode1"].DefaultValue = periode1;
                    //SqlDataSource2.SelectParameters["p_periode2"].DefaultValue = periode2;
                    //SqlDataSource2.SelectParameters["p_kdsales"].DefaultValue = sales;
                    //SqlDataSource2.DataBind();
                    ReportDocument cryRpt = new ReportDocument();
                    //ReportDocument cryRptsub = new ReportDocument();
                    //CrystalDecisions.CrystalReports.Engine.ReportDocument cryRpt = new ReportDocument();                    
                    cryRpt.Load(Server.MapPath(@"~/ReportBapPerperiode.rpt"));
                    //cryRpt.SetDatabaseLogon("sa", "Plaza123", "10.10.1.1\\PALDB01", "PAL_LIVE");
                    cryRpt.SetDatabaseLogon("sa", "200884", "localhost", "insentive");
                    cryRpt.Subreports[0].SetDatabaseLogon("sa", "200884", "localhost", "insentive");
                    //cryRpt.SetDatabaseLogon("sa", "@dmin1strat0r150525", "localhost", "insentive");
                    //cryRpt.Subreports[0].SetDatabaseLogon("sa", "@dmin1strat0r150525", "localhost", "insentive");

                    cryRpt.SetParameterValue("@p_periode1", periode1);
                    cryRpt.SetParameterValue("@p_periode2", periode2);
                    cryRpt.SetParameterValue("@p_kdsales", sales);
                    
                    ////CrystalReportViewer1.ReportSourceID = SqlDataSource2;
                    CrystalReportViewer1.ReportSource = cryRpt;
                    CrystalReportViewer1.ReuseParameterValuesOnRefresh = true;
                    CrystalReportViewer1.DataBind();
                    CrystalReportViewer1.Visible = true;

                }
                //else
                //{
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Format Tanggal Salah"), false);

                //}
                
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }
    }
}