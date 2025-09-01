using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gmc
{
    public partial class FrmUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnk_download_Click(object sender, EventArgs e)
        {
            var pgs = Request.QueryString["pgs"] as string;
            var nm_file = "" as string;
            if (pgs =="budgetsales")
            {
                nm_file = "Template_Export_SQL_BUDGET.xls";
            }
            else if (pgs =="invoice")
            {

                nm_file = "Template_Export_SQL_INV.xls";
            }
            else if (pgs == "payment")
            
            {
                nm_file = "Template_Export_SQL_AR.xls";
            }
            try
            {
                //string subPath = "E:\\PublishWeb\\UniversalReport\\";
                //string subPath = "C:\\data\\compile\\insentive\\uploads\\";
                string subPath = "D:\\compile\\insentive\\uploads\\";
                //string subPath = @"D:\Agus P\compile\InvoicePDF\UploadPTN\";
                //string subPath ="D:\\Agus P\\compile\\InvoicePDF\\UploadPTN\\";
                Page.Response.Write("<script>console.log('" + nm_file.ToString() + "');</script>");
                string path = Server.UrlDecode(subPath + nm_file);
                if (!(new FileInfo(path).Exists))
                    return;

                System.IO.FileInfo fileToDownload = new System.IO.FileInfo(path);
                Response.Clear(); //set appropriate headers
                Response.AddHeader("Content-Disposition", "attachment; filename=" + nm_file);
                Response.AddHeader("Content-Length", fileToDownload.Length.ToString());
                //Response.ContentType = "application/pdf";
                Response.ContentType = "application/vnd.ms-excel";
                Response.WriteFile(fileToDownload.FullName);
                Response.End(); //if file does not exist 
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('ERROR : {0}')</script>", ex.Message.ToString()), false);
                //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }

        protected void lnk_download_grid_Click(object sender, EventArgs e)
        {
            var pgs = Request.QueryString["pgs"] as string;
            var nm_file = "" as string;
            if (pgs == "budgetsales")
            {
                nm_file = "BUDGET";
            }
            else if (pgs == "invoice")
            {

                nm_file = "INV";
            }
            else if (pgs == "payment")
            {
                nm_file = "AR";
            }
             try
            {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Upload" + nm_file + DateTime.Now + ".xls";

            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);

            // Style is added dynamically
            gvExcelFile.AllowPaging = false;
            gvExcelFile.Columns[0].Visible = false;
            gvExcelFile.Columns[1].Visible = false;
            gvExcelFile.Columns[2].Visible = false;
            gvExcelFile.DataBind();
            gvExcelFile.GridLines = GridLines.Both;
            gvExcelFile.HeaderStyle.Font.Bold = true;
            gvExcelFile.Font.Name = "Arial";
            gvExcelFile.Font.Size = 8;
            gvExcelFile.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            gvExcelFile.AllowPaging = true;
            gvExcelFile.Columns[0].Visible = true;
            gvExcelFile.Columns[1].Visible = true;
            gvExcelFile.Columns[2].Visible = true;
            gvExcelFile.DataBind();
            }
             catch (Exception ex)
             {
                 ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('ERROR : {0}')</script>", ex.Message.ToString()), false);
                 //Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
             }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //Page.Response.Write("<script>console.log('Mulai1');</script>");
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('0 Mulai')</script>", ""), false);
            //Coneection String by default empty  
            string ConStr = "";
            //Extantion of the file upload control saving into ext because   
            //there are two types of extation .xls and .xlsx of Excel   
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            //getting the path of the file   
            string path = Server.MapPath("~/uploads/" + FileUpload1.FileName);
            string filename = FileUpload1.FileName;
            try
            {
                if ((filename.Length != 0))
                //if ((ext.Trim() == ".xlsx"))
                {
                    //saving the file inside the MyFolder of the server  
                    FileUpload1.SaveAs(path);
                    Label1.Text = FileUpload1.FileName + "\'s Data showing into the GridView";
                    //checking that extantion is .xls or .xlsx  
                    if (ext.Trim() == ".xls")
                    {
                        //connection string for that file which extantion is .xls  
                        ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (ext.Trim() == ".xlsx")
                    {
                        //connection string for that file which extantion is .xlsx  
                        ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                        //Page.Response.Write("<script>console.log('Mulai2');</script>");
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('1 Constring {0}')</script>", ConStr), false);

                    }
                    //making query  
                    //string query = "SELECT * FROM [Sheet1$]";
                    string query = "SELECT * FROM [INV$]";
                    //Providing connection  
                    OleDbConnection conn = new OleDbConnection(ConStr);
                    //Page.Response.Write("<script>console.log('Mulai3');</script>");
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('2 Sedang Open Constring')</script>"), false);

                    //checking that connection state is closed or not if closed the   
                    //open the connection  
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                        //Page.Response.Write("<script>console.log('Mulai4');</script>");
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('3 Sudah Open Constring')</script>"), false);

                    }
                    //create command object  
                    OleDbCommand cmd = new OleDbCommand(query, conn);

                    //Page.Response.Write("<script>console.log('Mulai5');</script>");
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('4 Sedang isi DbCommand')</script>"), false);

                    // create a data adapter and get the data into dataadapter  
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);

                    //Page.Response.Write("<script>console.log('Mulai6');</script>");
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('5 Sedang Open adapter')</script>"), false);

                    DataSet ds = new DataSet();
                    //fill the Excel data to data set  
                    da.Fill(ds);
                    //set data source of the grid view  
                    gvExcelFile.DataSource = ds.Tables[0];
                    //binding the gridview  
                    gvExcelFile.DataBind();
                    //close the connection  
                    conn.Close();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('File yg diupload blm ada atau Bukan {0}')</script>", "Excell"), false);
                    //    Page.Response.Write("<script>console.log('File yg diupload blm ada atau Bukan Exel');</script>");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }

        protected void cmd_uploaddb_Click(object sender, EventArgs e)
        {
            
            var pgs = Request.QueryString["pgs"] as string;
            var nm_file = "" as string;
            string query = "";
            string message = "Sukses Simpan";
            string redirectUrl = "";
            if (pgs == "budgetsales")
            {
                nm_file = "budgetsales";
                //query = "SELECT * FROM [budget$]";
            }
            else if (pgs == "invoice")
            {
                nm_file = "invoice";
                //query = "SELECT * FROM [INV$]";
            }
            else if (pgs == "payment")
            {
                nm_file = "payment";
                //query = "SELECT * FROM [AR$]";
            }

            redirectUrl = "FrmUpload.aspx?pgs=" + nm_file;
            //FrmUpload.aspx?pgs=budgetsales
            //NMKOLOMBUDGET
            //Kdsales Nama Sales	KdDivisi	KdCabang	NmCabang	Bulan	Tahun	Value
            //NMKOLOMINV
            //BRANCH	INV#DATE	MONTH	INV#NUMBER	TERM	CUST#CODE	CUST#NAME	SLS#CODE	SALESMAN	DIVISION	DIV# SALESMAN	PRD#CODE	PRD#NAME	SUPP#CODE	SUPP#NAME	MANUF#CODE	MANUF#NAME	QTY	UNIT	CURRENCY	 PRICE 	 NETT SALES 	 UNIT COST MOVING 	 C#O#G#S MOVING 	G#P MOVING	%GP	E#D	G#P AFTER E#D	% GPAED	G#P AFTER E#D (Incl# Forex Loss)	% GPAED (Incl# Forex Loss)
            //NMKOLOMAR
            //YEAR	YEAR DIV	MONTH	BRANCH	TANGGAL	INVOICE DAYS	NOMOR 	BRANCH - INVOICE	TERM	DUE DATE	ID CUST	NAMA CUSTOMER	GRUP CUSTOMER	KODE SALES	SALESMAN	DIVISI	BU	KODE PRODUK	NAMA PRODUK	KODESUPP	NAMASUPP	QTY	CURR.	 HARGA 	 JUMLAH HARGA TARGET 	 d 	 JUMLAH HARGA 	 PPN 	 TOTAL 	Paydate	PAY DATE 2	OVER DUE	STATUS	MONTH PAID	PAID DAYS


            String Kdsales = "", NamaSales = "", KdDivisi = "", KdCabang = "", NmCabang = "", Bulan = "", Tahun = "", Value="";
            String BRANCH = "",	INVDATE = "",	MONTH = "",	INVNUMBER = "",TERM = "",	CUSTCODE = "",	CUSTNAME = "",	SLSCODE = "",	SALESMAN = "",	DIVISION = "",	DIVSALESMAN  = "",	PRDCODE= "",	PRDNAME= "",	SUPPCODE= "",	SUPPNAME= "",	MANUFCODE= "",	MANUFNAME= "",	QTY= "",	UNIT= "",	CURRENCY= "",	 PRICE= "", 	 NETTSALES = "",	 UNITCOSTMOVING= "", 	 COGSMOVING= "", 	GPMOVING= "",	GP= "",	ED= "",	GPAFTERED= "",	GPAED= "",	GPAFTEREDInclForexLoss = "",	GPAEDInclForexLoss = "";
            String YEAR= "",	YEARDIV = "",	MONTH_AR = "",	BRANCH_AR = "",	TANGGAL	= "",INVOICEDAYS= "",	NOMOR = "",	BRANCHINVOICE= "",	TERM_AR= "",	DUEDATE= "",	IDCUST= "",	NAMACUSTOMER= "",	GRUPCUSTOMER = "",	KODESALES= "",	SALESMAN_AR= "",	DIVISI= "",	BU= "",	KODEPRODUK= "",	NAMAPRODUK= "",	KODESUPP= "",	NAMASUPP= "",	QTY_AR= "",	CURR= "",	 HARGA= "", 	 JUMLAHHARGATARGET= "", d= "", 	 JUMLAHHARGA = "",	 PPN= "", 	 TOTAL= "", 	Paydate= "",	PAYDATE2= "",	OVERDUE= "",	STATUS= "",	MONTHPAID= "",	PAIDDAYS= "";
            //String PPhAmount = "";
            //String TanggalNTPN = "";
            //String NomorNTPN = "";
            string header = "", celltext = "";
            
            //string header = "", celltext = "";
            //try
            //{ 

            int rowCount = gvExcelFile.Rows.Count;
            /*HAPUS YANG KOSONG*/
            //for (int i = 1; i < gvExcelFile.Rows.Count - 1; i++)
            //{
            //    Boolean isEmpty = true;
            //    for (int j = 0; j < gvExcelFile.Columns.Count; j++)
            //    {
            //        if (gvExcelFile.Rows[i].Cells[j].Value.ToString() != "")
            //        {
            //            isEmpty = false;
            //            break;
            //        }
            //    }
            //    if (isEmpty)
            //    {
            //        gvExcelFile.Rows.RemoveAt(i);
            //        i--;
            //    }
            //}

            if (rowCount > 0)
            {
                int gridViewCellCount = gvExcelFile.Rows[0].Cells.Count;
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", "Tidak Bisa Di Upload Karna Kosong1"), false);
                if (pgs == "budgetsales")
                {

                    foreach (GridViewRow row in gvExcelFile.Rows)
                    {

                        for (int i = 0; i < gridViewCellCount; i++)
                        {
                            header = ((System.Web.UI.WebControls.DataControlFieldCell)(gvExcelFile.Rows[0].Cells[i])).ContainingField.HeaderText.ToString();
                            //String header = gvExcelFile.Columns[i].HeaderText;
                            celltext = row.Cells[i].Text.ToString();
                            //Page.Response.Write("<script>console.log('" + header.ToString() + "');</script>");

                            if (header.ToLower() == "kdsales")
                            {
                                Kdsales = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "nama sales")
                            {
                                NamaSales = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "kddivisi")
                            {
                                KdDivisi = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "kdcabang")
                            {
                                KdCabang = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "nmcabang")
                            {
                                NmCabang = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "bulan")
                            {
                                Bulan = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "tahun")
                            {
                                Tahun = celltext;
                                //tahun1 = "2017";
                            }
                            if (header.ToLower() == "value")
                            {
                                Value = celltext;
                                //tahun1 = "2017";
                            }

                        }
                        //if (Kdsales != "&nbsp;" || !string.IsNullOrEmpty(Kdsales))
                        if (!Kdsales.Equals("&nbsp;"))
                        {
                            sql_budget.InsertParameters["kd_sales"].DefaultValue = Kdsales;
                            sql_budget.InsertParameters["nm_sales"].DefaultValue = NamaSales;
                            sql_budget.InsertParameters["kd_divisi"].DefaultValue = KdDivisi;
                            sql_budget.InsertParameters["bulan"].DefaultValue = Bulan;
                            sql_budget.InsertParameters["tahun"].DefaultValue = Tahun;
                            //sql_budget.InsertParameters["val"].DefaultValue = decimal.Parse(Value);
                            sql_budget.InsertParameters["val"].DefaultValue = Value;
                            sql_budget.InsertParameters["pkey"].DefaultValue = "0";
                            sql_budget.InsertParameters["user_input"].DefaultValue = "System Export";
                            sql_budget.InsertParameters["ket"].DefaultValue = "ADDSYSTEM";
                            sql_budget.Insert();
                            sql_budget.DataBind();
                        }


                    }
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}');window.location.href = '{1}';</script>", message, redirectUrl), false);
                }//tutup budget

                /*Invoice*/
                if (pgs == "invoice")
                {

                    foreach (GridViewRow row in gvExcelFile.Rows)
                    {

                        for (int i = 0; i < gridViewCellCount; i++)
                        {
                            header = ((System.Web.UI.WebControls.DataControlFieldCell)(gvExcelFile.Rows[0].Cells[i])).ContainingField.HeaderText.ToString();
                            //String header = gvExcelFile.Columns[i].HeaderText;
                            celltext = row.Cells[i].Text.ToString();
                            //Page.Response.Write("<script>console.log('" + header.ToString() + "');</script>");

                            if (header.ToUpper() == "BRANCH")
                            {
                                BRANCH = celltext;                                
                            }
                            if (header.ToUpper() == "INV#DATE")
                            {
                                INVDATE = celltext;                                
                            }
                            if (header.ToUpper() == "MONTH")
                            {
                                MONTH = celltext;                                
                            }
                            if (header.ToUpper() == "INV#NUMBER")
                            {
                                INVNUMBER = celltext;                                
                            }
                            if (header.ToUpper() == "TERM")
                            {
                                TERM = celltext;                                
                            }
                            if (header.ToUpper() == "CUST#CODE")
                            {
                                CUSTCODE = celltext;                                
                            }
                            if (header.ToUpper() == "CUST#NAME")
                            {
                                CUSTNAME = celltext;                                
                            }
                            if (header.ToUpper() == "SLS#CODE")
                            {
                                SLSCODE = celltext;                                
                            }                            
                            if (header.ToUpper() == "SALESMAN")
                            {
                                SALESMAN = celltext;                                
                            }
                            if (header.ToUpper() == "DIVISION")
                            {
                                DIVISION = celltext;                                
                            }
                            if (header.ToUpper() == "DIV# SALESMAN")
                            {
                                DIVSALESMAN = celltext;                                
                            }
                            if (header.ToUpper() == "PRD#CODE")
                            {
                                PRDCODE = celltext;                                
                            }
                            if (header.ToUpper() == "PRD#NAME")
                            {
                                PRDNAME = celltext;                                
                            }
                            if (header.ToUpper() == "SUPP#CODE")
                            {
                                SUPPCODE = celltext;                                
                            }
                            if (header.ToUpper() == "SUPP#NAME")
                            {
                                SUPPNAME = celltext;                                
                            }
                            if (header.ToUpper() == "MANUF#CODE")
                            {
                                MANUFCODE = celltext;                                
                            }                            
                            if (header.ToUpper() == "MANUF#NAME")
                            {
                                MANUFNAME = celltext;                                
                            }
                            if (header.ToUpper() == "QTY")
                            {
                                QTY = celltext;                                
                            }
                            if (header.ToUpper() == "UNIT")
                            {
                                UNIT = celltext;                                
                            }
                            if (header.ToUpper() == "CURRENCY")
                            {
                                CURRENCY = celltext;                                
                            }
                            if (header.ToUpper() == "PRICE")
                            {
                                PRICE = celltext;                                
                            }
                            if (header.ToUpper() == "NETT SALES")
                            {
                                NETTSALES = celltext;                                
                            }
                            if (header.ToUpper() == "UNIT COST MOVING")
                            {
                                UNITCOSTMOVING = celltext;                                
                            }
                            if (header.ToUpper() == "C#O#G#S MOVING")
                            {
                                COGSMOVING = celltext;                                
                            }                            
                            if (header.ToUpper() == "G#P MOVING")
                            {
                                GPMOVING = celltext;                                
                            }
                            if (header.ToUpper() == "%GP")
                            {
                                GP = celltext;                                
                            }
                            if (header.ToUpper() == "E#D")
                            {
                                ED = celltext;                                
                            }
                            if (header.ToUpper() == "G#P AFTER E#D")
                            {
                                GPAFTERED = celltext;                                
                            }
                            if (header.ToUpper() == "% GPAED")
                            {
                                GPAED = celltext;                                
                            }
                            if (header.ToUpper() == "G#P AFTER E#D (Incl# Forex Loss)")
                            {
                                GPAFTEREDInclForexLoss = celltext;                                
                            }
                            if (header.ToUpper() == "% GPAED (Incl# Forex Loss)")
                            {
                                GPAEDInclForexLoss = celltext;                                
                            }
                            
                        }
                        //if (Kdsales != "&nbsp;" || !string.IsNullOrEmpty(Kdsales))
                        if (!BRANCH.Equals("&nbsp;"))
                        {
                            sql_inv.InsertParameters["P_BRANCH"].DefaultValue = BRANCH;
                            sql_inv.InsertParameters["P_INV#DATE"].DefaultValue = INVDATE;
                            sql_inv.InsertParameters["P_MONTH"].DefaultValue = MONTH;
                            sql_inv.InsertParameters["P_INV#NUMBER"].DefaultValue = INVNUMBER;
                            sql_inv.InsertParameters["P_TERM"].DefaultValue = TERM;                            
                            sql_inv.InsertParameters["P_CUST#CODE"].DefaultValue = CUSTCODE;
                            sql_inv.InsertParameters["P_CUST#NAME"].DefaultValue = CUSTNAME;
                            sql_inv.InsertParameters["P_SLS#CODE"].DefaultValue = SLSCODE;
                            sql_inv.InsertParameters["P_SALESMAN"].DefaultValue = SALESMAN;
                            sql_inv.InsertParameters["P_DIVISION"].DefaultValue = DIVISION;
                            sql_inv.InsertParameters["P_DIV#SALESMAN"].DefaultValue = DIVSALESMAN;
                            sql_inv.InsertParameters["P_PRD#CODE"].DefaultValue = PRDCODE;
                            sql_inv.InsertParameters["P_PRD#NAME"].DefaultValue = PRDNAME;
                            sql_inv.InsertParameters["P_SUPP#CODE"].DefaultValue = SUPPCODE;
                            sql_inv.InsertParameters["P_SUPP#NAME"].DefaultValue = SUPPNAME;
                            sql_inv.InsertParameters["P_MANUF#CODE"].DefaultValue = MANUFCODE;
                            sql_inv.InsertParameters["P_MANUF#NAME"].DefaultValue = MANUFNAME;
                            sql_inv.InsertParameters["P_QTY"].DefaultValue = QTY;
                            sql_inv.InsertParameters["P_UNIT"].DefaultValue = UNIT;
                            sql_inv.InsertParameters["P_CURRENCY"].DefaultValue = CURRENCY;
                            sql_inv.InsertParameters["P_PRICE"].DefaultValue = PRICE;
                            sql_inv.InsertParameters["P_NETTSALES"].DefaultValue = NETTSALES;
                            sql_inv.InsertParameters["P_UNITCOSTMOVING"].DefaultValue = UNITCOSTMOVING;
                            sql_inv.InsertParameters["P_C#O#G#SMOVING"].DefaultValue = COGSMOVING;
                            sql_inv.InsertParameters["P_G#PMOVING"].DefaultValue = GPMOVING;
                            sql_inv.InsertParameters["P_GP"].DefaultValue = GP;
                            sql_inv.InsertParameters["P_E#D"].DefaultValue = ED;
                            sql_inv.InsertParameters["P_G#PAFTERE#D"].DefaultValue = GPAFTERED;
                            sql_inv.InsertParameters["P_GPAED"].DefaultValue = GPAED;
                            sql_inv.InsertParameters["P_G#PAFTERE#DIncl#ForexLoss"].DefaultValue = GPAFTEREDInclForexLoss;
                            sql_inv.InsertParameters["P_GPAEDIncl#ForexLoss"].DefaultValue = GPAEDInclForexLoss;
                            sql_inv.InsertParameters["P_KET"].DefaultValue = "ADDSYSTEM";
                            sql_inv.InsertParameters["P_USERID"].DefaultValue = "SYSTEMBAP";
                            sql_inv.Insert();
                            sql_inv.DataBind();
                        }
                    }
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}');window.location.href = '{1}';</script>", message, redirectUrl), false);
                }//tutup inv

                /*Payment*/
                if (pgs == "payment")
                {

                    foreach (GridViewRow row in gvExcelFile.Rows)
                    {

                        for (int i = 0; i < gridViewCellCount; i++)
                        {
                            header = ((System.Web.UI.WebControls.DataControlFieldCell)(gvExcelFile.Rows[0].Cells[i])).ContainingField.HeaderText.ToString();
                            //String header = gvExcelFile.Columns[i].HeaderText;
                            celltext = row.Cells[i].Text.ToString();
                            //Page.Response.Write("<script>console.log('" + header.ToString() + "');</script>");

                            if (header.ToUpper().Trim() == "YEAR")
                            {
                                YEAR = celltext;
                            }
                            if (header.ToUpper().Trim() == "YEAR DIV")
                            {
                                YEARDIV = celltext;
                            }
                            if (header.ToUpper().Trim() == "MONTH")
                            {
                                MONTH_AR = celltext;
                            }
                            if (header.ToUpper().Trim() == "BRANCH")
                            {
                                BRANCH_AR = celltext;
                            }
                            if (header.ToUpper().Trim() == "TANGGAL")
                            {
                                TANGGAL = celltext;
                            }
                            if (header.ToUpper().Trim() == "INVOICE DAYS")
                            {
                                INVOICEDAYS = celltext;
                            }
                            if (header.ToUpper().Trim() == "NOMOR")
                            {
                                NOMOR = celltext;
                            }
                            if (header.ToUpper().Trim() == "BRANCH - INVOICE")
                            {
                                BRANCHINVOICE = celltext;
                            }
                            if (header.ToUpper().Trim() == "TERM")
                            {
                                TERM_AR = celltext;
                            }
                            if (header.ToUpper().Trim() == "DUE DATE")
                            {
                                DUEDATE = celltext;
                            }
                            if (header.ToUpper().Trim() == "ID CUST")
                            {
                                IDCUST = celltext;
                            }
                            if (header.ToUpper().Trim() == "NAMA CUSTOMER")
                            {
                                NAMACUSTOMER = celltext;
                            }
                            if (header.ToUpper().Trim() == "GRUP CUSTOMER")
                            {
                                GRUPCUSTOMER = celltext;
                            }
                            if (header.ToUpper().Trim() == "KODE SALES")
                            {
                                KODESALES = celltext;
                            }
                            if (header.ToUpper().Trim() == "SALESMAN")
                            {
                                SALESMAN_AR = celltext;
                            }
                            if (header.ToUpper().Trim() == "DIVISI")
                            {
                                DIVISI = celltext;
                            }
                            if (header.ToUpper().Trim() == "BU")
                            {
                                BU = celltext;
                            }
                            if (header.ToUpper().Trim() == "KODE PRODUK")
                            {
                                KODEPRODUK = celltext;
                            }
                            if (header.ToUpper().Trim() == "NAMA PRODUK")
                            {
                                NAMAPRODUK = celltext;
                            }
                            if (header.ToUpper().Trim() == "KODESUPP")
                            {
                                KODESUPP = celltext;
                            }
                            if (header.ToUpper().Trim() == "NAMASUPP")
                            {
                                NAMASUPP = celltext;
                            }
                            if (header.ToUpper().Trim() == "QTY")
                            {
                                QTY_AR = celltext;
                            }
                            if (header.ToUpper().Trim() == "CURR#")
                            {
                                CURR = celltext;
                            }
                            if (header.ToUpper().Trim() == "HARGA")
                            {
                                HARGA = celltext;
                            }
                            if (header.ToUpper().Trim() == "JUMLAH HARGA TARGET")
                            {
                                JUMLAHHARGATARGET = celltext;
                            }
                            if (header.ToUpper().Trim() == "d")
                            {
                                d = celltext;
                            }
                            if (header.ToUpper().Trim() == "JUMLAH HARGA")
                            {
                                JUMLAHHARGA = celltext;
                            }
                            if (header.ToUpper().Trim() == "PPN")
                            {
                                PPN = celltext;
                            }
                            if (header.ToUpper().Trim() == "TOTAL")
                            {
                                TOTAL = celltext;
                            }
                            if (header.ToUpper().Trim() == "Paydate")
                            {
                                Paydate = celltext;
                            }
                            if (header.ToUpper().Trim() == "PAY DATE 2")
                            {
                                PAYDATE2 = celltext;
                            }

                            if (header.ToUpper().Trim() == "OVER DUE")
                            {
                                OVERDUE = celltext;
                            }
                            if (header.ToUpper().Trim() == "STATUS")
                            {
                                STATUS = celltext;
                            }

                            if (header.ToUpper().Trim() == "MONTH PAID")
                            {
                                MONTHPAID = celltext;
                            }
                            if (header.ToUpper().Trim() == "PAID DAYS")
                            {
                                PAIDDAYS = celltext;
                            }

                        }
                        //if (Kdsales != "&nbsp;" || !string.IsNullOrEmpty(Kdsales))
                        if (!YEAR.Equals("&nbsp;"))
                        {
                            sql_ar.InsertParameters["P_YEAR"].DefaultValue = YEAR;
                            sql_ar.InsertParameters["P_YEARDIV"].DefaultValue = YEARDIV;
                            sql_ar.InsertParameters["P_MONTH"].DefaultValue = MONTH_AR;
                            sql_ar.InsertParameters["P_BRANCH"].DefaultValue = BRANCH_AR;
                            sql_ar.InsertParameters["P_TANGGAL"].DefaultValue = (TANGGAL.Equals("&nbsp;") ? "" :TANGGAL);
                            sql_ar.InsertParameters["P_INVOICEDAYS"].DefaultValue = INVOICEDAYS;
                            sql_ar.InsertParameters["P_NOMOR"].DefaultValue = NOMOR;
                            sql_ar.InsertParameters["P_BRANCHINVOICE"].DefaultValue = BRANCHINVOICE;
                            sql_ar.InsertParameters["P_TERM"].DefaultValue = TERM;
                            sql_ar.InsertParameters["P_DUEDATE"].DefaultValue = (DUEDATE.Equals("&nbsp;") ? "" : DUEDATE);
                            sql_ar.InsertParameters["P_IDCUST"].DefaultValue = IDCUST;
                            sql_ar.InsertParameters["P_NAMACUSTOMER"].DefaultValue = NAMACUSTOMER;
                            sql_ar.InsertParameters["P_GRUPCUSTOMER"].DefaultValue = GRUPCUSTOMER;
                            sql_ar.InsertParameters["P_KODESALES"].DefaultValue = KODESALES;
                            sql_ar.InsertParameters["P_SALESMAN"].DefaultValue = SALESMAN_AR;
                            sql_ar.InsertParameters["P_DIVISI"].DefaultValue = DIVISI;
                            sql_ar.InsertParameters["P_BU"].DefaultValue = BU;
                            sql_ar.InsertParameters["P_KODEPRODUK"].DefaultValue = KODEPRODUK;
                            sql_ar.InsertParameters["P_NAMAPRODUK"].DefaultValue = NAMAPRODUK;
                            sql_ar.InsertParameters["P_KODESUPP"].DefaultValue = KODESUPP;
                            sql_ar.InsertParameters["P_NAMASUPP"].DefaultValue = NAMASUPP;
                            sql_ar.InsertParameters["P_QTY"].DefaultValue = QTY_AR;
                            sql_ar.InsertParameters["P_CURR#"].DefaultValue = CURR;
                            sql_ar.InsertParameters["P_HARGA"].DefaultValue = HARGA;
                            sql_ar.InsertParameters["P_JUMLAHHARGATARGET"].DefaultValue = JUMLAHHARGATARGET;
                            sql_ar.InsertParameters["P_d"].DefaultValue = d;
                            sql_ar.InsertParameters["P_JUMLAHHARGA"].DefaultValue = JUMLAHHARGA;
                            sql_ar.InsertParameters["P_PPN"].DefaultValue = PPN;
                            sql_ar.InsertParameters["P_TOTAL"].DefaultValue = TOTAL;
                            sql_ar.InsertParameters["P_PAYDATE"].DefaultValue = (Paydate.Equals("&nbsp;") ? "" : Paydate);
                            sql_ar.InsertParameters["P_PAYDATE2"].DefaultValue = (PAYDATE2.Equals("&nbsp;") ? "" : PAYDATE2);
                            sql_ar.InsertParameters["P_OVERDUE"].DefaultValue = OVERDUE;
                            sql_ar.InsertParameters["P_STATUS"].DefaultValue = STATUS;
                            sql_ar.InsertParameters["P_MONTHPAID"].DefaultValue = MONTHPAID;
                            sql_ar.InsertParameters["P_PAIDDAYS"].DefaultValue = PAIDDAYS;
                            sql_ar.InsertParameters["P_KET"].DefaultValue = "ADDSYSTEM";
                            sql_ar.InsertParameters["P_USERID"].DefaultValue = "SYSTEMBAP";
                            sql_ar.Insert();
                            sql_ar.DataBind();
                        }
                    }
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}');window.location.href = '{1}';</script>", message, redirectUrl), false);
                }//tutup AR
            }//rowCount
            //}
            
            //catch (Exception ex)
            //{
            //    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
            //    Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            //}
        }

        protected void cmd_upload_Click(object sender, EventArgs e)
        {
            //Page.Response.Write("<script>console.log('Mulai1');</script>");
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('0 Mulai')</script>", ""), false);
            //Coneection String by default empty  
            var pgs = Request.QueryString["pgs"] as string;
            var nm_file = "" as string;
            string query = "";
            string ConStr = "";
            //Extantion of the file upload control saving into ext because   
            //there are two types of extation .xls and .xlsx of Excel   
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            //getting the path of the file   
            string path = Server.MapPath("~/uploads/" + FileUpload1.FileName);
            string filename = FileUpload1.FileName;
            try
            {
                if ((filename.Length != 0))
                //if ((ext.Trim() == ".xlsx"))
                {
                    //saving the file inside the MyFolder of the server  
                    FileUpload1.SaveAs(path);
                    Label1.Text = FileUpload1.FileName + "\'s Data showing into the GridView";
                    //checking that extantion is .xls or .xlsx  
                    if (ext.Trim() == ".xls")
                    {
                        //connection string for that file which extantion is .xls  
                        ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (ext.Trim() == ".xlsx")
                    {
                        //connection string for that file which extantion is .xlsx  
                        ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                        //Page.Response.Write("<script>console.log('Mulai2');</script>");
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('1 Constring {0}')</script>", ConStr), false);

                    }
                    //making query  
                    //string query = "SELECT * FROM [Sheet1$]";
                    //string getExcelSheetName = dt.Rows[0]["Table_Name"].ToString();
                    if (pgs == "budgetsales")
                    {
                        //nm_file = "BUDGET";
                        query = "SELECT * FROM [budget$]";
                        //query = @"SELECT * FROM [budget@]";
                    }
                    else if (pgs == "invoice")
                    {

                        query = "SELECT * FROM [INV$]";
                        //query = @"SELECT * FROM [INV@]";
                    }
                    else if (pgs == "payment")
                    {
                        query = "SELECT * FROM [AR$]";
                        //query = @"SELECT * FROM [AR@]";
                    }
                    
                    //Providing connection  
                    OleDbConnection conn = new OleDbConnection(ConStr);
                    //Page.Response.Write("<script>console.log('Mulai3');</script>");
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('2 Sedang Open Constring')</script>"), false);

                    //checking that connection state is closed or not if closed the   
                    //open the connection  
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                        //Page.Response.Write("<script>console.log('Mulai4');</script>");
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('3 Sudah Open Constring')</script>"), false);

                    }
                    //create command object  
                    OleDbCommand cmd = new OleDbCommand(query, conn);

                    //Page.Response.Write("<script>console.log('Mulai5');</script>");
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('4 Sedang isi DbCommand')</script>"), false);

                    // create a data adapter and get the data into dataadapter  
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);

                    //Page.Response.Write("<script>console.log('Mulai6');</script>");
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('5 Sedang Open adapter')</script>"), false);

                    DataSet ds = new DataSet();
                    //fill the Excel data to data set  
                    da.Fill(ds);
                    //set data source of the grid view  
                    gvExcelFile.DataSource = ds.Tables[0];
                    //binding the gridview  
                    gvExcelFile.DataBind();
                    //close the connection  
                    conn.Close();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('File yg diupload blm ada atau Bukan {0}')</script>", "Excell"), false);
                    //    Page.Response.Write("<script>console.log('File yg diupload blm ada atau Bukan Exel');</script>");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CONFIRM", string.Format("<script type='text/javascript'>alert('{0}')</script>", ex.Message.ToString()), false);
                Page.Response.Write("<script>console.log('" + ex.Message.ToString() + "');</script>");
            }
        }
    }
}