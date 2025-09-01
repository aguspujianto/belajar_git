<%@ Page Title="" Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmReportBAP_CrosTab.aspx.cs" Inherits="gmc.FrmReportBAP_CrosTab" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-8 row mb-2">
                            <h1 class="text-uppercase">BAP All Salesman</h1>                        
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
                       <%--<a href="FrmAllSalesman.aspx">FrmAllSalesman.aspx</a></div>   --%>  

                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-12 row mb-2">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="PerhitunganBapCrossTabPerTahun" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cb_tahun" Name="tahun" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                <Report FileName="ReportBAP_CrosTab.rpt">
                                    <DataSources>
                                        <CR:DataSourceRef DataSourceID="SqlDataSource1" TableName="PerhitunganBapCrossTabPerTahun;1" />
                                    </DataSources>
                                    <Parameters>
                                        <CR:ControlParameter ControlID="cb_tahun" ConvertEmptyStringToNull="False" DefaultValue="" Name="@tahun" PropertyName="SelectedValue" ReportName="" />
                                    </Parameters>
                                </Report>
                            </CR:CrystalReportSource>
                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
