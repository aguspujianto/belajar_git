<%@ Page Title="" Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmSqlCommandBAP.aspx.cs" Inherits="gmc.FrmSqlCommandBAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-8 row mb-2">
                            <h1 class="text-uppercase">SQL COMMAND BAP All Salesman</h1>                        
                        </div>          <%--<a href="FrmBAPPeriode_Perinvoice.aspx">FrmBAPPeriode_Perinvoice.aspx</a>--%>              
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between fv-row">
                    <div class="col-sm-6 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Tahun</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">                        
                                <div class="input-group">                                    
                                    <asp:DropDownList ID="cb_tahun" runat="server" 
                                        CssClass="form-select form-select-sm  form-select-solid rounded cb_tahun" >
                                    </asp:DropDownList>
                                    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="SELECT [KodeSales], [NamaSales] FROM [tbl_salesman] order by [NamaSales]"></asp:SqlDataSource>--%>
                                </div>                                
                            </div>
                   </div> 
                </div>
                <div class="row justify-content-between fv-row">
                   <div class="col-sm-2 row mb-2 ">
                       <asp:Button ID="cmd_ok" runat="server" Text="ok" OnClick="cmd_ok_Click" CssClass="btn btn-outline-secondary"  />
                    </div>
                </div>
            </div>
      </div>
</asp:Content>
