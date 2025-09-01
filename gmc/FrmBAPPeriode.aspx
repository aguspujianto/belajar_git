<%@ Page  Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmBAPPeriode.aspx.cs" Inherits="gmc.FrmBAPPeriode" ClientTarget="uplevel" Title="Perhitungan"  %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-8 row mb-2">
                            <h1 class="text-uppercase">BAP Periode</h1>                        
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between fv-row">
                        
		                <div class="col-sm-6 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Periode</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <div class="input-group"> 
                                    <asp:TextBox ID="txt_periode1"  runat="server" CssClass="form-control form-control-sm" placeholder="C00001" autocomplete="off" TextMode="Date"></asp:TextBox>   &nbsp s/d &nbsp                                                 
                                    <asp:TextBox ID="txt_periode2"  runat="server" CssClass="form-control form-control-sm" placeholder="C00001" autocomplete="off" TextMode="Date"></asp:TextBox>
                                </div>
                                </div>
                        </div>      
                        <div class="col-sm-6 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Sales</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">                        
                                <div class="input-group">                                    
                                    <asp:DropDownList ID="cb_sales" runat="server" 
                                        CssClass="form-select form-select-sm  form-select-solid rounded cb_sales" DataSourceID="SqlDataSource1" DataTextField="NamaSales" DataValueField="KodeSales" 
                                        >
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="SELECT [KodeSales], [NamaSales] FROM [tbl_salesman] order by [NamaSales]"></asp:SqlDataSource>
                                </div>                                
                            </div>
                        </div>                  
                        <div class="col-sm-6 row mb-2 ">
                            <asp:Button ID="cmd_ok" runat="server" Text="ok" OnClick="cmd_ok_Click"  />
                        </div>
                        
                    </div>
                    <hr style="dotted #eee"; />
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-12 row mb-2">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="PerhitunganBap" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False"  >
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txt_periode1" Name="p_periode1" Type="String"  />
                                            <asp:ControlParameter ControlID="txt_periode2" Name="p_periode2" Type="String"  />
                                            <asp:ControlParameter ControlID="cb_sales"     Name="p_kdsales" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                <Report FileName="report_bap.rpt">
                                    <DataSources>
                                        <CR:DataSourceRef DataSourceID="SqlDataSource2" TableName="PerhitunganBap;1" />
                                    </DataSources>
                                    <Parameters>
                                        <CR:ControlParameter ControlID="" ConvertEmptyStringToNull="False" DefaultValue="" Name="@p_periode1" PropertyName="" ReportName="" />
                                        <CR:ControlParameter ControlID="" ConvertEmptyStringToNull="False" DefaultValue="" Name="@p_periode2" PropertyName="" ReportName="" />
                                        <CR:ControlParameter ControlID="" ConvertEmptyStringToNull="False" DefaultValue="" Name="@p_kdsales" PropertyName="" ReportName="" />
                                    </Parameters>
                                </Report>
                            </CR:CrystalReportSource>
                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" Visible="false" ToolPanelView="None" />
      
                        </div>
                    </div>
            </div>
    </div>
</asp:Content>
