<%@ Page Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmBAP.aspx.cs" Inherits="gmc.FrmBAP"  ClientTarget="uplevel" Title="Perhitungan" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="card">
  <div class="card-header">
                       
      <%--<asp:Image ID="Image2" runat="server" CssClass="img-thumbnail" ImageUrl="~/img/logo-blue-gmc.png" />--%>

      BAP</div>
  <div class="card-body">

    <%--
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
    --%>
  


      <div class="container form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-12 row mb-2">
                
                        <table style="width: 100%;" class="table">
           
                            <tr>
                                <td class="auto-style3">Tahun</td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="cb_tahun" runat="server" CssClass="form-select form-select-sm">
                                    <%--
                                        <asp:ListItem>2024</asp:ListItem>
                                        <asp:ListItem>2025</asp:ListItem>
                                    --%>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Bulan</td>
                                <td class="auto-style5">
                                    <asp:DropDownList ID="cb_bulan" runat="server" CssClass="form-select form-select-sm">
                                    <%--
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                    --%>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Nama Sales</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="SALESMAN" DataValueField="SALESMAN" CssClass="form-select form-select-sm">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="select distinct SALESMAN from AR2024 order by SALESMAN"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="hitunginsentif" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False" >
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList3" Name="NamaSales" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="cb_tahun" Name="Tahun" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="cb_bulan" Name="Bulan" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Button ID="Button1" runat="server" Text="----Ok----" CssClass="btn btn-outline-dark" OnClick="Button1_Click"  />
                                </td>
                                <td>

                                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>

                                </td>
                            </tr>
                        </table>
                    
                            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                <Report FileName="CrystalReport1.rpt">
                                    <DataSources>
                                        <CR:DataSourceRef DataSourceID="SqlDataSource2" TableName="hitunginsentif;1" />
                                    </DataSources>
                                </Report>
                            </CR:CrystalReportSource>
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" Visible="false" />
      
                        
                        </div>
                    </div>
          </div>
      </div>
    </div>
</asp:Content>


