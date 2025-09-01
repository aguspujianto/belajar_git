<%@ Page Title="" Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmKetentuanBAP.aspx.cs" Inherits="gmc.FrmKetentuanBAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-8 row mb-2">
                            <h1 class="text-uppercase">Ketentuan BAP</h1>                        
                        </div>                       
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between fv-row">
                       <div class="col-sm-6 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Ket</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">                        
                                <div class="input-group">                                    
                                    <asp:DropDownList ID="cb_ket" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded cb_sales" AutoPostBack="True" OnSelectedIndexChanged="cb_ket_SelectedIndexChanged" >
                                        <asp:ListItem>KETENTUAN INSENTIVE</asp:ListItem>
                                        <asp:ListItem>GP RULE</asp:ListItem>
                                        <asp:ListItem>OVERDUE</asp:ListItem>
                                    </asp:DropDownList>                                
                                </div>                                
                            </div>
                        </div>
                        <div class="col-sm-6 row mb-2 d-none">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Number</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">                        
                                <div class="input-group">                                    
                                    <asp:TextBox ID="txt_nilai" runat="server" TextMode="Number" CssClass="numeric" alias="currency"></asp:TextBox>                                
                                </div>                                
                            </div>
                        </div>
                </div>
                <div class="row justify-content-between fv-row">
                       <div class="col-sm-12 row mb-2">
                           <asp:GridView ID="grv_ketentuan" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkey" DataSourceID="sql_ketentuan" CssClass="table table-hover m-0">
                               <Columns>
                                   <asp:TemplateField ShowHeader="False">
                                       <EditItemTemplate>
                                           <asp:LinkButton ID="lnk_update" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="lnk_update_Click"></asp:LinkButton>
                                           &nbsp;<asp:LinkButton ID="lnk_cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                           &nbsp;<asp:LinkButton ID="lnk_select" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                           &nbsp;<asp:LinkButton ID="lnk_delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="d-none"></asp:LinkButton>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="nilai1" SortExpression="nilai1">
                                       <EditItemTemplate>
                                           <asp:TextBox ID="txt_e_nilai1" runat="server" Text='<%# Bind("nilai1") %>'  CssClass="amount_k"></asp:TextBox>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label ID="lbl_i_nilai1" runat="server" Text='<%# Bind("nilai1") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="nilai2" SortExpression="nilai2">
                                       <EditItemTemplate>
                                           <asp:TextBox ID="txt_e_nilai2" runat="server" Text='<%# Bind("nilai2") %>' CssClass="amount_k"></asp:TextBox>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label ID="lbl_i_nilai2" runat="server" Text='<%# Bind("nilai2") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="persen" SortExpression="persen">
                                       <EditItemTemplate>
                                           <asp:TextBox ID="txt_e_persen" runat="server" Text='<%# Bind("persen") %>' CssClass="amount_k"></asp:TextBox>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label ID="lbl_i_persen" runat="server" Text='<%# Bind("persen") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="status" SortExpression="status">
                                       <EditItemTemplate>
                                           <asp:CheckBox ID="chk_e_status" runat="server" Checked='<%# Bind("status") %>' />
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:CheckBox ID="chk_i_status" runat="server" Checked='<%# Bind("status") %>' Enabled="false" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="pkey" InsertVisible="False" SortExpression="pkey">
                                       <EditItemTemplate>
                                           <asp:Label ID="lbl_e_pkey" runat="server" Text='<%# Eval("pkey") %>'></asp:Label>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label ID="lbl_i_pkey" runat="server" Text='<%# Bind("pkey") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                           </asp:GridView>
                           <asp:SqlDataSource ID="sql_ketentuan" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" DeleteCommand="sp_ketentuan_bap" DeleteCommandType="StoredProcedure" InsertCommand="sp_ketentuan_bap" InsertCommandType="StoredProcedure" SelectCommand="sp_ketentuan_bap" SelectCommandType="StoredProcedure" UpdateCommand="sp_ketentuan_bap" UpdateCommandType="StoredProcedure">
                               <DeleteParameters>
                                   <asp:Parameter Name="p_nilai1" Type="Double" />
                                   <asp:Parameter Name="p_nilai2" Type="Double" />
                                   <asp:Parameter Name="p_persen" Type="Double" />
                                   <asp:Parameter Name="p_status" Type="Boolean" />
                                   <asp:Parameter Name="p_pkey" Type="Int32" />
                                   <asp:Parameter Name="p_ket_ketentuan" Type="String" />
                                   <asp:Parameter Name="p_ket" Type="String" />
                               </DeleteParameters>
                               <InsertParameters>
                                   <asp:Parameter Name="p_nilai1" Type="Double" />
                                   <asp:Parameter Name="p_nilai2" Type="Double" />
                                   <asp:Parameter Name="p_persen" Type="Double" />
                                   <asp:Parameter Name="p_status" Type="Boolean" />
                                   <asp:Parameter Name="p_pkey" Type="Int32" />
                                   <asp:Parameter Name="p_ket_ketentuan" Type="String" />
                                   <asp:Parameter Name="p_ket" Type="String" />
                               </InsertParameters>
                               <SelectParameters>
                                   <asp:Parameter Name="p_nilai1" Type="Double" />
                                   <asp:Parameter Name="p_nilai2" Type="Double" />
                                   <asp:Parameter Name="p_persen" Type="Double" />
                                   <asp:Parameter Name="p_status" Type="Boolean" />
                                   <asp:Parameter Name="p_pkey" Type="Int32" />
                                   <asp:ControlParameter ControlID="cb_ket" Name="p_ket_ketentuan" PropertyName="SelectedValue" Type="String" />
                                   <asp:Parameter Name="p_ket" Type="String" />
                               </SelectParameters>
                               <UpdateParameters>
                                   <asp:Parameter Name="p_nilai1" Type="Double" />
                                   <asp:Parameter Name="p_nilai2" Type="Double" />
                                   <asp:Parameter Name="p_persen" Type="Double" />
                                   <asp:Parameter Name="p_status" Type="Boolean" />
                                   <asp:Parameter Name="p_pkey" Type="Int32" />
                                   <asp:Parameter Name="p_ket_ketentuan" Type="String" />
                                   <asp:Parameter Name="p_ket" Type="String" />
                               </UpdateParameters>
                           </asp:SqlDataSource>
                        </div>
                </div>
            </div>
    </div>

</asp:Content>
