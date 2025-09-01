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
    public partial class FrmBudgetSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                show_bulan(cb_bulan);
                show_tahun(cb_tahun);
                show_sales(cb_sales);

                show_bulan(cb_add_bulan);
                show_tahun(cb_add_tahun);
                show_sales(cb_add_sales);
            }
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

        protected void show_sales(DropDownList drp)
        {
            string constr = ConfigurationManager.ConnectionStrings["insentiveConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    cmd.CommandText = "select kodesales as kode, namasales as name from tbl_salesman order by name";
                    cmd.CommandType = CommandType.Text;
                    //cmd.CommandText = "select * from tbl_roommeeting where isstatus = @status";
                    //cmd.Parameters.AddWithValue("@status", "1");

                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            while (sdr.Read())
                            {
                                ListItem listItem = new ListItem();
                                listItem.Text   = sdr["name"].ToString();
                                listItem.Value  = sdr["kode"].ToString();

                                drp.Items.Add(listItem);
                                //drp.Items..Add("All");
                            }
                            drp.Items.Insert(0, new ListItem("--All--", "All"));
                        }
                        else
                        {
                            Console.WriteLine("No rows found.");
                        }


                    }
                    con.Close();
                }
            }
        }

        protected void cmd_ok_Click(object sender, EventArgs e)
        {
            var bulan = cb_bulan.Text.ToString() as string;
            var tahun = cb_tahun.Text.ToString() as string;
            var sales = cb_sales.Text.ToString() as string;
            var ket = "Select" as string;
            try
            {
                sql_budgetsales.SelectParameters["tahun"].DefaultValue = tahun;
                sql_budgetsales.SelectParameters["bulan"].DefaultValue = bulan;
                sql_budgetsales.SelectParameters["kd_sales"].DefaultValue = sales;
                sql_budgetsales.SelectParameters["ket"].DefaultValue = ket;
                sql_budgetsales.DataBind();

                grv_budgetsales.DataBind();

                pnl_add.Visible = false;
                grv_budgetsales.Visible = true;

                //cmd_add_Click(null, null);
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }

        protected void cmd_simpan_Click(object sender, EventArgs e)
        {
            /*
            GridViewRow emptyrow = grv_budgetsales.Controls[0].Controls[0] as GridViewRow;
            var kd_sales = emptyrow.FindControl("cb_add_sales") as DropDownList;
            var tahun = emptyrow.FindControl("cb_add_tahun") as DropDownList;
            var bulan = emptyrow.FindControl("cb_add_bulan") as DropDownList;
            var nilai = emptyrow.FindControl("txt_nilai_budget") as TextBox;
            var kd_divisi = emptyrow.FindControl("cb_add_divisi") as DropDownList;
             */
            var kd_sales = cb_add_sales as DropDownList;
            var tahun =cb_add_tahun as DropDownList;
            var bulan = cb_add_bulan as DropDownList;
            var nilai = txt_nilai_budget as TextBox;
            var kd_divisi = cb_add_divisi as DropDownList;
            string message = "Sukses Simpan";
            string redirectUrl = "FrmBudgetSales.aspx";
            try
            {
                sql_budgetsales.InsertParameters["kd_sales"].DefaultValue = kd_sales.Text.ToString();
                sql_budgetsales.InsertParameters["kd_divisi"].DefaultValue = kd_divisi.Text.ToString();
                sql_budgetsales.InsertParameters["tahun"].DefaultValue = tahun.Text.ToString();
                sql_budgetsales.InsertParameters["bulan"].DefaultValue = bulan.Text.ToString();
                sql_budgetsales.InsertParameters["val"].DefaultValue = nilai.Text.ToString();
                sql_budgetsales.InsertParameters["ket"].DefaultValue = "ADD";
                sql_budgetsales.Insert();
                sql_budgetsales.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}');window.location.href = '{1}';</script>", message,redirectUrl), false);

                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>window.open('FrmParkirVsCashEntryPreview.aspx?docnum=" + docnum + "');</script>", "Preview"), false);
                //int temp = sql_budgetsales.Insert();
                //if (temp == 1)
                //{
                //    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Tidak Sukses"), false);

                    
                //}else{
                //    sql_budgetsales.DataBind();
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Simpan Sukses"), false);
                //}

                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('ERROR : {0}')</script>", ex.Message.ToString()), false);
                //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "tahun" + tahun), false);
        }

        protected void grv_budgetsales_Load(object sender, EventArgs e)
        {
            //GridViewRow emptyrow = grv_budgetsales.Controls[0].Controls[0] as GridViewRow;
            //var kd_sales = emptyrow.FindControl("cb_add_sales") as DropDownList;
            //var tahun = emptyrow.FindControl("cb_add_tahun") as DropDownList;
            //var bulan = emptyrow.FindControl("cb_add_bulan") as DropDownList;
            //var nilai = emptyrow.FindControl("txt_nilai_budget") as TextBox;
            ////show_sales(kd_sales);
            //show_tahun(tahun);
            //show_bulan(bulan);
             
            

        }

        protected void cmd_add_Click(object sender, EventArgs e)
        {
            //if (pnl_add.Visible)
            //{
            //    pnl_add.Visible = false;
            //    grv_budgetsales.Visible = true;
            //}
            //else
            //{
                pnl_add.Visible = true;
                grv_budgetsales.Visible = false;

                list_budget.Visible = false;
                list_budget1.Visible = false;
                list_budget2.Visible = false;
            //}
              
            
        }

        protected void grv_budgetsales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                //if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState ==(DataControlRowState.Edit | DataControlRowState.Alternate))
                {

                }
                else
                {

                    LinkButton lnkBtnDelete = e.Row.FindControl("lnk_delete") as LinkButton;
                    var budget = e.Row.FindControl("lbl_nmsales") as Label;
                    var tahun = e.Row.FindControl("lbl_tahun") as Label;
                    var bulan = e.Row.FindControl("lbl_bulan") as Label;
                    var nilai = e.Row.FindControl("lbl_value") as Label;

                    lnkBtnDelete.Attributes.Add("onclick", string.Format("return confirm('Apakah Kamu Yakin Akan Menghapus budget {0} Tahun {1} Bulan {2} Sebesar {3}?');", budget.Text.ToString(), tahun.Text.ToString(), bulan.Text.ToString(), nilai.Text.ToString()));
                    //// Use whatever control you want to show in the confirmation message
                    //Label nama = e.Row.FindControl("lbl_i_spk_req_id") as Label;
                    //Label stat = e.Row.FindControl("lbl_i_stat") as Label;
                    ///*Jika Status 1,2,3 masih bisa di edit*/
                    ////if (stat.Text.ToString() != "1" || stat.Text.ToString() != "2" || stat.Text.ToString() != "3")
                    //if (stat.Text.ToString() != "2" && stat.Text.ToString() != "1" && stat.Text.ToString() != "3")
                    //{
                    //    //ClientScript.RegisterStartupScript(GetType(), "openwindow", "<script type=text/javascript> window.location.href='Frm_SPK_Request.aspx?spk_req_id=" + spk_req_id.Text + "'; </script>");

                    //    lnkBtnDelete.Attributes.Add("onclick", string.Format("alert('Status SPK {0} sedang jalan');return false;", nama.Text + " STATUS : " + stat.Text.ToString()));
                    //    //btnAlertStatus.Attributes.Add("onclick", "alert('Current Status is '" + status + "'); return false;");
                    //    //e.
                    //}

                }

            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                //    e.Row.Cells.RemoveAt(1);
                //    e.Row.Cells[0].ColumnSpan = 2;
                //    e.Row.HorizontalAlign = HorizontalAlign.Center;
                //var kode = e.Row.FindControl("lbl_f_kode_produk") as Label;
                //lihat_kode("MDPRODUK", kode);

            }
        }

        protected void cmd_cancel_Click(object sender, EventArgs e)
        {
            pnl_add.Visible = false;
            grv_budgetsales.Visible = true;

            list_budget.Visible = true;
            list_budget1.Visible = true;
            list_budget2.Visible = true;
        }

        protected void lnk_update_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            var pkey = lnk.FindControl("lbl_e_pkey") as Label;
            var kd_sales = lnk.FindControl("lbl_e_kdsales") as Label;
            var nm_sales = lnk.FindControl("lbl_e_nmsales") as Label;
            var kd_divisi = lnk.FindControl("lbl_e_kddivisi") as Label;
            var bulan = lnk.FindControl("lbl_e_bulan") as Label;
            var tahun = lnk.FindControl("lbl_e_tahun") as Label;

            /*
            var kd_sales = lnk.FindControl("txt_kdsales") as TextBox;
            var nm_sales = lnk.FindControl("txt_nmsales") as TextBox;
            var kd_divisi = lnk.FindControl("txt_kddivisi") as TextBox;
            var bulan = lnk.FindControl("txt_bulan") as TextBox;
            var tahun = lnk.FindControl("txt_tahun") as TextBox;
            */
            var nilai = lnk.FindControl("txt_value") as TextBox;
             
            var user_input = "Agus P" as string;
            try
            {
                sql_budgetsales.UpdateParameters["kd_sales"].DefaultValue = kd_sales.Text.ToString();
                sql_budgetsales.UpdateParameters["kd_divisi"].DefaultValue = kd_divisi.Text.ToString();
                sql_budgetsales.UpdateParameters["tahun"].DefaultValue = tahun.Text.ToString();
                sql_budgetsales.UpdateParameters["bulan"].DefaultValue = bulan.Text.ToString();
                sql_budgetsales.UpdateParameters["val"].DefaultValue = nilai.Text.ToString();
                sql_budgetsales.UpdateParameters["ket"].DefaultValue = "UPDATE";
                sql_budgetsales.UpdateParameters["pkey"].DefaultValue = pkey.Text.ToString();
                sql_budgetsales.UpdateParameters["user_input"].DefaultValue = user_input.ToString();

                sql_budgetsales.Update();
                sql_budgetsales.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0};')</script>", "Update Sukses"), false);

                grv_budgetsales.EditIndex = -1;
                grv_budgetsales.DataBind();
                cmd_ok_Click(null, null);
                //int temp = sql_budgetsales.Insert();
                //if (temp == 1)
                //{
                //    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Tidak Sukses"), false);


                //}else{
                //    sql_budgetsales.DataBind();
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Simpan Sukses"), false);
                //}


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('ERROR : {0}')</script>", ex.Message.ToString()), false);
                //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }

        protected void lnk_delete_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            var pkey = lnk.FindControl("lbl_i_pkey") as Label;

            try
            {
                sql_budgetsales.DeleteParameters["kd_sales"].DefaultValue = "";
                sql_budgetsales.DeleteParameters["kd_divisi"].DefaultValue = "";
                sql_budgetsales.DeleteParameters["tahun"].DefaultValue = "";
                sql_budgetsales.DeleteParameters["bulan"].DefaultValue = "";
                sql_budgetsales.DeleteParameters["val"].DefaultValue = "";
                sql_budgetsales.DeleteParameters["ket"].DefaultValue = "DELETE";
                sql_budgetsales.DeleteParameters["pkey"].DefaultValue = pkey.Text.ToString();
                sql_budgetsales.DeleteParameters["user_input"].DefaultValue = "";

                sql_budgetsales.Delete();
                sql_budgetsales.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0};')</script>", "Delete Sukses"), false);

                grv_budgetsales.EditIndex = -1;
                grv_budgetsales.DataBind();
                cmd_ok_Click(null, null);
                //int temp = sql_budgetsales.Insert();
                //if (temp == 1)
                //{
                //    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Tidak Sukses"), false);


                //}else{
                //    sql_budgetsales.DataBind();
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Simpan Sukses"), false);
                //}


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('ERROR : {0}')</script>", ex.Message.ToString()), false);
                //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }
    }
}