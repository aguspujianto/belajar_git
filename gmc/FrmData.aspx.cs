using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                show_bulan(cb_bulan);
                show_tahun(cb_tahun);
                //show_sales(cb_sales);

                //show_bulan(cb_add_bulan);
                //show_tahun(cb_add_tahun);
                //show_sales(cb_add_sales);
            }
        }

        protected void cmd_ok_Click(object sender, EventArgs e)
        {

        }

        protected void show_bulan(DropDownList drp)
        {
            for (int i = 1; i <= 12; i++)
            {

                DateTime date = new DateTime(1900, i, 1);
                drp.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString("0")));
            }
            drp.Items.Insert(0, new ListItem("--All--", "All"));
            drp.SelectedValue = DateTime.Today.Month.ToString("0");

        }

        protected void show_tahun(DropDownList drp)
        {
            for (int i = Convert.ToInt32(DateTime.Today.Year.ToString()) - 5; i <= Convert.ToInt32(DateTime.Today.Year.ToString()); i++)
            {

                drp.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            drp.SelectedValue = DateTime.Today.Year.ToString();
        }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}