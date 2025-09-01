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
                                <asp:DropDownList ID="cb_ket" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
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
            </div>
    </div>
</asp:Content>
