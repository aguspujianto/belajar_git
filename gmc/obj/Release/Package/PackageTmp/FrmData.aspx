<%@ Page Title="" Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmData.aspx.cs" Inherits="gmc.FrmData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-8 row mb-2">
                            <h1 class="text-uppercase">DATA</h1>                        
                        </div>                       
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between fv-row" runat="server" id="list_budget2">                        
		                <div class="col-sm-4 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Ket</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <asp:DropDownList ID="cb_ket" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" >
                                    <asp:ListItem>INV</asp:ListItem>
                                    <asp:ListItem>PAYMENT</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div> 
                        <div class="col-sm-4 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Tahun</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <asp:DropDownList ID="cb_tahun" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                            </div>
                        </div>  
                        <div class="col-sm-4 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Bulan</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <asp:DropDownList ID="cb_bulan" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                            </div>
                        </div>
                </div>
                <div class="row justify-content-between fv-row" runat="server" id="list_budget1">
                        <div class="col-sm-4 row mb-2">
                            <div class="input-group">
                                <asp:Button ID="cmd_ok" runat="server" Text="--Ok--" OnClick="cmd_ok_Click" CssClass="btn  btn-outline-secondary" />
                                
                            </div>
                        </div>
                </div>
                <div class="row justify-content-between fv-row" runat="server" id="list_data">
                        <div class="col-sm-12 row mb-2">
                            <asp:SqlDataSource ID="sql_list_data" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" SelectCommand="sp_inv_payment" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cb_tahun" Name="p_tahun" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="cb_bulan" Name="p_bulan" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="cb_ket" Name="p_ket" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="sql_list_data" CssClass="table table-hover m-0" OnDataBinding="GridView1_DataBinding" >
                                <Columns>
                                    <%--
                                    <asp:BoundField DataField="BRANCH" HeaderText="BRANCH" SortExpression="BRANCH" />
                                    <asp:BoundField DataField="INV#DATE" HeaderText="INV#DATE" SortExpression="INV#DATE" />
                                    <asp:BoundField DataField="MONTH" HeaderText="MONTH" SortExpression="MONTH" />
                                    <asp:BoundField DataField="INV#NUMBER" HeaderText="INV#NUMBER" SortExpression="INV#NUMBER" />
                                    <asp:BoundField DataField="TERM" HeaderText="TERM" SortExpression="TERM" />
                                    <asp:BoundField DataField="CUST#CODE" HeaderText="CUST#CODE" SortExpression="CUST#CODE" />
                                    <asp:BoundField DataField="CUST#NAME" HeaderText="CUST#NAME" SortExpression="CUST#NAME" />
                                    <asp:BoundField DataField="SLS#CODE" HeaderText="SLS#CODE" SortExpression="SLS#CODE" />
                                    <asp:BoundField DataField="SALESMAN" HeaderText="SALESMAN" SortExpression="SALESMAN" />
                                    <asp:BoundField DataField="DIVISION" HeaderText="DIVISION" SortExpression="DIVISION" />
                                    <asp:BoundField DataField="DIV# SALESMAN" HeaderText="DIV# SALESMAN" SortExpression="DIV# SALESMAN" />
                                    <asp:BoundField DataField="PRD#CODE" HeaderText="PRD#CODE" SortExpression="PRD#CODE" />
                                    <asp:BoundField DataField="PRD#NAME" HeaderText="PRD#NAME" SortExpression="PRD#NAME" />
                                    <asp:BoundField DataField="SUPP#CODE" HeaderText="SUPP#CODE" SortExpression="SUPP#CODE" />
                                    <asp:BoundField DataField="SUPP#NAME" HeaderText="SUPP#NAME" SortExpression="SUPP#NAME" />
                                    <asp:BoundField DataField="MANUF#CODE" HeaderText="MANUF#CODE" SortExpression="MANUF#CODE" />
                                    <asp:BoundField DataField="MANUF#NAME" HeaderText="MANUF#NAME" SortExpression="MANUF#NAME" />
                                    <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" />
                                    <asp:BoundField DataField="UNIT" HeaderText="UNIT" SortExpression="UNIT" />
                                    <asp:BoundField DataField="CURRENCY" HeaderText="CURRENCY" SortExpression="CURRENCY" />
                                    <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                                    <asp:BoundField DataField="NETT SALES" HeaderText="NETT SALES" SortExpression="NETT SALES" />
                                    <asp:BoundField DataField="UNIT COST MOVING" HeaderText="UNIT COST MOVING" SortExpression="UNIT COST MOVING" />
                                    <asp:BoundField DataField="C#O#G#S MOVING" HeaderText="C#O#G#S MOVING" SortExpression="C#O#G#S MOVING" />
                                    <asp:BoundField DataField="G#P MOVING" HeaderText="G#P MOVING" SortExpression="G#P MOVING" />
                                    <asp:BoundField DataField="%GP" HeaderText="%GP" SortExpression="%GP" />
                                    <asp:BoundField DataField="E#D" HeaderText="E#D" SortExpression="E#D" />
                                    <asp:BoundField DataField="G#P AFTER E#D" HeaderText="G#P AFTER E#D" SortExpression="G#P AFTER E#D" />
                                    <asp:BoundField DataField="% GPAED" HeaderText="% GPAED" SortExpression="% GPAED" />
                                    <asp:BoundField DataField="G#P AFTER E#D (Incl# Forex Loss)" HeaderText="G#P AFTER E#D (Incl# Forex Loss)" SortExpression="G#P AFTER E#D (Incl# Forex Loss)" />
                                    <asp:BoundField DataField="% GPAED (Incl# Forex Loss)" HeaderText="% GPAED (Incl# Forex Loss)" SortExpression="% GPAED (Incl# Forex Loss)" />
                                    <asp:BoundField DataField="tgl_input" HeaderText="tgl_input" SortExpression="tgl_input" />
                                    <asp:BoundField DataField="user_input" HeaderText="user_input" SortExpression="user_input" />
                                    <asp:BoundField DataField="tgl_update" HeaderText="tgl_update" SortExpression="tgl_update" />
                                    <asp:BoundField DataField="user_update" HeaderText="user_update" SortExpression="user_update" />
                                    --%>
                                </Columns>
                            </asp:GridView> 
                        </div>
                </div>
            </div>
    </div>
</asp:Content>
