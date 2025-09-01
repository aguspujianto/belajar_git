using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmAllSalesman : System.Web.UI.Page
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

        }

        protected void show_tahun(DropDownList drp)
        {
            for (int i = Convert.ToInt32(DateTime.Today.Year.ToString()) - 1; i <= Convert.ToInt32(DateTime.Today.Year.ToString()); i++)
            {

                drp.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            drp.SelectedValue = DateTime.Today.Year.ToString();
        }
    }
}