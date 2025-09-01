<%@ Page Title="BAP Upload" Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmUpload.aspx.cs" Inherits="gmc.FrmUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-10 row mb-2">                                
                            <h1 class="text-uppercase"><% Response.Write(Page.Title.ToString() +"#"+ Request.QueryString["pgs"]); %></h1>                    
                        </div>   
                        <div class="col-sm-2 row mb-2">
                            <asp:LinkButton ID="lnk_download" runat="server" onclick="lnk_download_Click">Download Template</asp:LinkButton>
                            <asp:LinkButton ID="lnk_download_grid" runat="server" 
                                onclick="lnk_download_grid_Click" >Download Grid</asp:LinkButton>
                        </div>                    
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between fv-row"> 
                     <div class="col-sm-6 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">File</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                        
                                <div class="input-group">
                                    
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                    
                                </div>
                                
                            </div>
                     </div>
		             <div class="col-sm-6 row mb-2">
                            <div class="btn-group me-2" role="group" aria-label="First group">
			                    <asp:Button ID="btnUpload" runat="server" OnClick="cmd_upload_Click" Text="Upload To Gridview" />
                                <asp:Button ID="cmd_uploaddb" runat="server" onclick="cmd_uploaddb_Click" Text="Upload To Database" />
                                <asp:SqlDataSource ID="sql_budget" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" DeleteCommand="proc_budgetsales" DeleteCommandType="StoredProcedure" InsertCommand="proc_budgetsales" InsertCommandType="StoredProcedure" SelectCommand="proc_budgetsales" SelectCommandType="StoredProcedure" UpdateCommand="proc_budgetsales" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="kd_sales" Type="String" />
                                        <asp:Parameter Name="nm_sales" Type="String" />
                                        <asp:Parameter Name="kd_divisi" Type="String" />
                                        <asp:Parameter Name="bulan" Type="String" />
                                        <asp:Parameter Name="tahun" Type="String" />
                                        <asp:Parameter Name="val" Type="Decimal" />
                                        <asp:Parameter Name="pkey" Type="Int32" />
                                        <asp:Parameter Name="user_input" Type="String" />
                                        <asp:Parameter Name="ket" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="kd_sales" Type="String" />
                                        <asp:Parameter Name="nm_sales" Type="String" />
                                        <asp:Parameter Name="kd_divisi" Type="String" />
                                        <asp:Parameter Name="bulan" Type="String" />
                                        <asp:Parameter Name="tahun" Type="String" />
                                        <asp:Parameter Name="val" Type="Decimal" />
                                        <asp:Parameter Name="pkey" Type="Int32" />
                                        <asp:Parameter Name="user_input" Type="String" />
                                        <asp:Parameter Name="ket" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:Parameter Name="kd_sales" Type="String" />
                                        <asp:Parameter Name="nm_sales" Type="String" />
                                        <asp:Parameter Name="kd_divisi" Type="String" />
                                        <asp:Parameter Name="bulan" Type="String" />
                                        <asp:Parameter Name="tahun" Type="String" />
                                        <asp:Parameter Name="val" Type="Decimal" />
                                        <asp:Parameter Name="pkey" Type="Int32" />
                                        <asp:Parameter Name="user_input" Type="String" />
                                        <asp:Parameter Name="ket" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="kd_sales" Type="String" />
                                        <asp:Parameter Name="nm_sales" Type="String" />
                                        <asp:Parameter Name="kd_divisi" Type="String" />
                                        <asp:Parameter Name="bulan" Type="String" />
                                        <asp:Parameter Name="tahun" Type="String" />
                                        <asp:Parameter Name="val" Type="Decimal" />
                                        <asp:Parameter Name="pkey" Type="Int32" />
                                        <asp:Parameter Name="user_input" Type="String" />
                                        <asp:Parameter Name="ket" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_inv" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" DeleteCommand="sp_invoice" DeleteCommandType="StoredProcedure" InsertCommand="sp_invoice" InsertCommandType="StoredProcedure" SelectCommand="sp_invoice" SelectCommandType="StoredProcedure" UpdateCommand="sp_invoice" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="P_BRANCH"      Type="String" />
                                        <asp:Parameter Name="P_INV#DATE"    Type="DateTime" />
                                        <asp:Parameter Name="P_MONTH"       Type="Int32" />
                                        <asp:Parameter Name="P_INV#NUMBER"  Type="String" />
                                        <asp:Parameter Name="P_TERM"        Type="String" />
                                        <asp:Parameter Name="P_CUST#CODE"   Type="String" />
                                        <asp:Parameter Name="P_CUST#NAME"   Type="String" />
                                        <asp:Parameter Name="P_SLS#CODE"    Type="String" />
                                        <asp:Parameter Name="P_SALESMAN"    Type="String" />
                                        <asp:Parameter Name="P_DIVISION"        Type="String" />
                                        <asp:Parameter Name="P_DIV#SALESMAN"    Type="String" />
                                        <asp:Parameter Name="P_PRD#CODE"        Type="String" />
                                        <asp:Parameter Name="P_PRD#NAME"        Type="String" />
                                        <asp:Parameter Name="P_SUPP#CODE"       Type="String" />
                                        <asp:Parameter Name="P_SUPP#NAME"       Type="String" />
                                        <asp:Parameter Name="P_MANUF#CODE"      Type="String" />
                                        <asp:Parameter Name="P_MANUF#NAME"      Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_UNIT" Type="String" />
                                        <asp:Parameter Name="P_CURRENCY" Type="String" />
                                        <asp:Parameter Name="P_PRICE" Type="Decimal" />
                                        <asp:Parameter Name="P_NETTSALES" Type="Decimal" />
                                        <asp:Parameter Name="P_UNITCOSTMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_C#O#G#SMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_G#PMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_GP" Type="Double" />
                                        <asp:Parameter Name="P_E#D" Type="Double" />
                                        <asp:Parameter Name="P_G#PAFTERE#D" Type="Double" />
                                        <asp:Parameter Name="P_GPAED" Type="Double" />
                                        <asp:Parameter Name="P_G#PAFTERE#DIncl#ForexLoss" Type="Decimal" />
                                        <asp:Parameter Name="P_GPAEDIncl#ForexLoss" Type="Double" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_INV#DATE" Type="String" />
                                        <asp:Parameter Name="P_MONTH" Type="String" />
                                        <asp:Parameter Name="P_INV#NUMBER" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_CUST#CODE" Type="String" />
                                        <asp:Parameter Name="P_CUST#NAME" Type="String" />
                                        <asp:Parameter Name="P_SLS#CODE" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISION" Type="String" />
                                        <asp:Parameter Name="P_DIV#SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_PRD#CODE" Type="String" />
                                        <asp:Parameter Name="P_PRD#NAME" Type="String" />
                                        <asp:Parameter Name="P_SUPP#CODE" Type="String" />
                                        <asp:Parameter Name="P_SUPP#NAME" Type="String" />
                                        <asp:Parameter Name="P_MANUF#CODE" Type="String" />
                                        <asp:Parameter Name="P_MANUF#NAME" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="String" />
                                        <asp:Parameter Name="P_UNIT" Type="String" />
                                        <asp:Parameter Name="P_CURRENCY" Type="String" />
                                        <asp:Parameter Name="P_PRICE" Type="String" />
                                        <asp:Parameter Name="P_NETTSALES" Type="String" />
                                        <asp:Parameter Name="P_UNITCOSTMOVING" Type="String" />
                                        <asp:Parameter Name="P_C#O#G#SMOVING" Type="String" />
                                        <asp:Parameter Name="P_G#PMOVING" Type="String" />
                                        <asp:Parameter Name="P_GP" Type="String" />
                                        <asp:Parameter Name="P_E#D" Type="String" />
                                        <asp:Parameter Name="P_G#PAFTERE#D" Type="String" />
                                        <asp:Parameter Name="P_GPAED" Type="String" />
                                        <asp:Parameter Name="P_G#PAFTERE#DIncl#ForexLoss" Type="String" />
                                        <asp:Parameter Name="P_GPAEDIncl#ForexLoss" Type="String" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_INV#DATE" Type="DateTime" />
                                        <asp:Parameter Name="P_MONTH" Type="Int32" />
                                        <asp:Parameter Name="P_INV#NUMBER" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_CUST#CODE" Type="String" />
                                        <asp:Parameter Name="P_CUST#NAME" Type="String" />
                                        <asp:Parameter Name="P_SLS#CODE" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISION" Type="String" />
                                        <asp:Parameter Name="P_DIV#SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_PRD#CODE" Type="String" />
                                        <asp:Parameter Name="P_PRD#NAME" Type="String" />
                                        <asp:Parameter Name="P_SUPP#CODE" Type="String" />
                                        <asp:Parameter Name="P_SUPP#NAME" Type="String" />
                                        <asp:Parameter Name="P_MANUF#CODE" Type="String" />
                                        <asp:Parameter Name="P_MANUF#NAME" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_UNIT" Type="String" />
                                        <asp:Parameter Name="P_CURRENCY" Type="String" />
                                        <asp:Parameter Name="P_PRICE" Type="Decimal" />
                                        <asp:Parameter Name="P_NETTSALES" Type="Decimal" />
                                        <asp:Parameter Name="P_UNITCOSTMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_C#O#G#SMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_G#PMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_GP" Type="Double" />
                                        <asp:Parameter Name="P_E#D" Type="Double" />
                                        <asp:Parameter Name="P_G#PAFTERE#D" Type="Double" />
                                        <asp:Parameter Name="P_GPAED" Type="Double" />
                                        <asp:Parameter Name="P_G#PAFTERE#DIncl#ForexLoss" Type="Decimal" />
                                        <asp:Parameter Name="P_GPAEDIncl#ForexLoss" Type="Double" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_INV#DATE" Type="DateTime" />
                                        <asp:Parameter Name="P_MONTH" Type="Int32" />
                                        <asp:Parameter Name="P_INV#NUMBER" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_CUST#CODE" Type="String" />
                                        <asp:Parameter Name="P_CUST#NAME" Type="String" />
                                        <asp:Parameter Name="P_SLS#CODE" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISION" Type="String" />
                                        <asp:Parameter Name="P_DIV#SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_PRD#CODE" Type="String" />
                                        <asp:Parameter Name="P_PRD#NAME" Type="String" />
                                        <asp:Parameter Name="P_SUPP#CODE" Type="String" />
                                        <asp:Parameter Name="P_SUPP#NAME" Type="String" />
                                        <asp:Parameter Name="P_MANUF#CODE" Type="String" />
                                        <asp:Parameter Name="P_MANUF#NAME" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_UNIT" Type="String"/>
                                        <asp:Parameter Name="P_CURRENCY" Type="String" />
                                        <asp:Parameter Name="P_PRICE" Type="Decimal" />
                                        <asp:Parameter Name="P_NETTSALES" Type="Decimal" />
                                        <asp:Parameter Name="P_UNITCOSTMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_C#O#G#SMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_G#PMOVING" Type="Decimal" />
                                        <asp:Parameter Name="P_GP" Type="Double" />
                                        <asp:Parameter Name="P_E#D" Type="Double" />
                                        <asp:Parameter Name="P_G#PAFTERE#D" Type="Double" />
                                        <asp:Parameter Name="P_GPAED" Type="Double" />
                                        <asp:Parameter Name="P_G#PAFTERE#DIncl#ForexLoss" Type="Decimal" />
                                        <asp:Parameter Name="P_GPAEDIncl#ForexLoss" Type="Double" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_ar" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" DeleteCommand="sp_AR" DeleteCommandType="StoredProcedure" InsertCommand="sp_AR" InsertCommandType="StoredProcedure" SelectCommand="sp_AR" SelectCommandType="StoredProcedure" UpdateCommand="sp_AR" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="P_YEAR" Type="String" />
                                        <asp:Parameter Name="P_YEARDIV" Type="String" />
                                        <asp:Parameter Name="P_MONTH" Type="String" />
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_TANGGAL" Type="String" />
                                        <asp:Parameter Name="P_INVOICEDAYS" Type="String" />
                                        <asp:Parameter Name="P_NOMOR" Type="String" />
                                        <asp:Parameter Name="P_BRANCHINVOICE" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_DUEDATE" Type="String" />
                                        <asp:Parameter Name="P_IDCUST" Type="String" />
                                        <asp:Parameter Name="P_NAMACUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_GRUPCUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_KODESALES" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISI" Type="String" />
                                        <asp:Parameter Name="P_BU" Type="String" />
                                        <asp:Parameter Name="P_KODEPRODUK" Type="String" />
                                        <asp:Parameter Name="P_NAMAPRODUK" Type="String" />
                                        <asp:Parameter Name="P_KODESUPP" Type="String" />
                                        <asp:Parameter Name="P_NAMASUPP" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_CURR#" Type="String" />
                                        <asp:Parameter Name="P_HARGA" Type="Decimal" />
                                        <asp:Parameter Name="P_JUMLAHHARGATARGET" Type="Decimal" />
                                        <asp:Parameter Name="P_d" Type="Decimal" />
                                        <asp:Parameter Name="P_JUMLAHHARGA" Type="Decimal" />
                                        <asp:Parameter Name="P_PPN" Type="Decimal" />
                                        <asp:Parameter Name="P_TOTAL" Type="Decimal" />
                                        <asp:Parameter Name="P_PAYDATE" Type="DateTime" />
                                        <asp:Parameter Name="P_PAYDATE2" Type="DateTime" />
                                        <asp:Parameter Name="P_OVERDUE" Type="Int32" />
                                        <asp:Parameter Name="P_STATUS" Type="String" />
                                        <asp:Parameter Name="P_MONTHPAID" Type="Int32" />
                                        <asp:Parameter Name="P_PAIDDAYS" Type="Int32" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="P_YEAR" Type="String" />
                                        <asp:Parameter Name="P_YEARDIV" Type="String" />
                                        <asp:Parameter Name="P_MONTH" Type="String" />
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_TANGGAL" Type="String" />
                                        <asp:Parameter Name="P_INVOICEDAYS" Type="String" />
                                        <asp:Parameter Name="P_NOMOR" Type="String" />
                                        <asp:Parameter Name="P_BRANCHINVOICE" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_DUEDATE" Type="String" />
                                        <asp:Parameter Name="P_IDCUST" Type="String" />
                                        <asp:Parameter Name="P_NAMACUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_GRUPCUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_KODESALES" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISI" Type="String" />
                                        <asp:Parameter Name="P_BU" Type="String" />
                                        <asp:Parameter Name="P_KODEPRODUK" Type="String" />
                                        <asp:Parameter Name="P_NAMAPRODUK" Type="String" />
                                        <asp:Parameter Name="P_KODESUPP" Type="String" />
                                        <asp:Parameter Name="P_NAMASUPP" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_CURR#" Type="String" />
                                        <asp:Parameter Name="P_HARGA" Type="String" />
                                        <asp:Parameter Name="P_JUMLAHHARGATARGET" Type="String" />
                                        <asp:Parameter Name="P_d" Type="String" />
                                        <asp:Parameter Name="P_JUMLAHHARGA" Type="String" />
                                        <asp:Parameter Name="P_PPN" Type="String" />
                                        <asp:Parameter Name="P_TOTAL" Type="String" />
                                        <asp:Parameter Name="P_PAYDATE" Type="String" />
                                        <asp:Parameter Name="P_PAYDATE2" Type="String" />
                                        <asp:Parameter Name="P_OVERDUE" Type="String" />
                                        <asp:Parameter Name="P_STATUS" Type="String" />
                                        <asp:Parameter Name="P_MONTHPAID" Type="String" />
                                        <asp:Parameter Name="P_PAIDDAYS" Type="String" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:Parameter Name="P_YEAR" Type="String" />
                                        <asp:Parameter Name="P_YEARDIV" Type="String" />
                                        <asp:Parameter Name="P_MONTH" Type="String" />
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_TANGGAL" Type="String" />
                                        <asp:Parameter Name="P_INVOICEDAYS" Type="String" />
                                        <asp:Parameter Name="P_NOMOR" Type="String" />
                                        <asp:Parameter Name="P_BRANCHINVOICE" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_DUEDATE" Type="String" />
                                        <asp:Parameter Name="P_IDCUST" Type="String" />
                                        <asp:Parameter Name="P_NAMACUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_GRUPCUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_KODESALES" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISI" Type="String" />
                                        <asp:Parameter Name="P_BU" Type="String" />
                                        <asp:Parameter Name="P_KODEPRODUK" Type="String" />
                                        <asp:Parameter Name="P_NAMAPRODUK" Type="String" />
                                        <asp:Parameter Name="P_KODESUPP" Type="String" />
                                        <asp:Parameter Name="P_NAMASUPP" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_CURR#" Type="String" />
                                        <asp:Parameter Name="P_HARGA" Type="Decimal" />
                                        <asp:Parameter Name="P_JUMLAHHARGATARGET" Type="Decimal" />
                                        <asp:Parameter Name="P_d" Type="Decimal" />
                                        <asp:Parameter Name="P_JUMLAHHARGA" Type="Decimal" />
                                        <asp:Parameter Name="P_PPN" Type="Decimal" />
                                        <asp:Parameter Name="P_TOTAL" Type="Decimal" />
                                        <asp:Parameter Name="P_PAYDATE" Type="DateTime" />
                                        <asp:Parameter Name="P_PAYDATE2" Type="DateTime" />
                                        <asp:Parameter Name="P_OVERDUE" Type="Int32" />
                                        <asp:Parameter Name="P_STATUS" Type="String" />
                                        <asp:Parameter Name="P_MONTHPAID" Type="Int32" />
                                        <asp:Parameter Name="P_PAIDDAYS" Type="Int32" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="P_YEAR" Type="String" />
                                        <asp:Parameter Name="P_YEARDIV" Type="String" />
                                        <asp:Parameter Name="P_MONTH" Type="String" />
                                        <asp:Parameter Name="P_BRANCH" Type="String" />
                                        <asp:Parameter Name="P_TANGGAL" Type="String" />
                                        <asp:Parameter Name="P_INVOICEDAYS" Type="String" />
                                        <asp:Parameter Name="P_NOMOR" Type="String" />
                                        <asp:Parameter Name="P_BRANCHINVOICE" Type="String" />
                                        <asp:Parameter Name="P_TERM" Type="String" />
                                        <asp:Parameter Name="P_DUEDATE" Type="String" />
                                        <asp:Parameter Name="P_IDCUST" Type="String" />
                                        <asp:Parameter Name="P_NAMACUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_GRUPCUSTOMER" Type="String" />
                                        <asp:Parameter Name="P_KODESALES" Type="String" />
                                        <asp:Parameter Name="P_SALESMAN" Type="String" />
                                        <asp:Parameter Name="P_DIVISI" Type="String" />
                                        <asp:Parameter Name="P_BU" Type="String" />
                                        <asp:Parameter Name="P_KODEPRODUK" Type="String" />
                                        <asp:Parameter Name="P_NAMAPRODUK" Type="String" />
                                        <asp:Parameter Name="P_KODESUPP" Type="String" />
                                        <asp:Parameter Name="P_NAMASUPP" Type="String" />
                                        <asp:Parameter Name="P_QTY" Type="Decimal" />
                                        <asp:Parameter Name="P_CURR#" Type="String" />
                                        <asp:Parameter Name="P_HARGA" Type="Decimal" />
                                        <asp:Parameter Name="P_JUMLAHHARGATARGET" Type="Decimal" />
                                        <asp:Parameter Name="P_d" Type="Decimal" />
                                        <asp:Parameter Name="P_JUMLAHHARGA" Type="Decimal" />
                                        <asp:Parameter Name="P_PPN" Type="Decimal" />
                                        <asp:Parameter Name="P_TOTAL" Type="Decimal" />
                                        <asp:Parameter Name="P_PAYDATE" Type="DateTime" />
                                        <asp:Parameter Name="P_PAYDATE2" Type="DateTime" />
                                        <asp:Parameter Name="P_OVERDUE" Type="Int32" />
                                        <asp:Parameter Name="P_STATUS" Type="String" />
                                        <asp:Parameter Name="P_MONTHPAID" Type="Int32" />
                                        <asp:Parameter Name="P_PAIDDAYS" Type="Int32" />
                                        <asp:Parameter Name="P_KET" Type="String" />
                                        <asp:Parameter Name="P_USERID" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
		                </div>                 
                </div>

                <div class="row justify-content-between fv-row">
                        <div class="col-sm-12 row mb-2">
                            <asp:Label ID="Label1" runat="server"></asp:Label><br />
                            <asp:GridView ID="gvExcelFile" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EditRowStyle BackColor="#999999" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

                            </asp:GridView>
                        </div>
                </div>
            </div>
    </div>
</asp:Content>
