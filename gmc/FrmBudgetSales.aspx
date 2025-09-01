<%@ Page Title="Input Budget Sales" Language="C#" MasterPageFile="~/Insentive.Master" AutoEventWireup="true" CodeBehind="FrmBudgetSales.aspx.cs" Inherits="gmc.FrmBudgetSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-header">
                <div class="container-fluid form-control-sm">
                    <div class="row justify-content-between fv-row">
                        <div class="col-sm-8 row mb-2">
                            <h1 class="text-uppercase">BAP Budget Sales</h1>                        
                        </div>                       
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row justify-content-between fv-row" runat="server" id="list_budget2">                        
		                <div class="col-sm-4 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Bulan</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <asp:DropDownList ID="cb_bulan" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                            </div>
                        </div>      
                        <div class="col-sm-4 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Tahun</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <asp:DropDownList ID="cb_tahun" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4 row mb-2">
                            <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Sales</label>
                            <div class="col-sm-8 mt-1 right-inner-addon">
                                <asp:DropDownList ID="cb_sales" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                            </div>
                        </div>
                 </div>
                <div class="row justify-content-between fv-row" runat="server" id="list_budget1">
                        <div class="col-sm-4 row mb-2">
                            <div class="input-group">
                                <asp:Button ID="cmd_ok" runat="server" Text="--Ok--" OnClick="cmd_ok_Click" CssClass="btn  btn-outline-secondary" />
                                <asp:Button ID="cmd_add" runat="server" Text="--Add--"  CssClass="btn btn-outline-secondary" OnClick="cmd_add_Click"/>
                            </div>
                        </div>
                </div>
                <div class="row justify-content-between fv-row" runat="server" id="list_budget">
                    <div class="col-sm-12 row mb-2">
                        <asp:SqlDataSource ID="sql_budgetsales" runat="server" ConnectionString="<%$ ConnectionStrings:insentiveConnectionString %>" DeleteCommand="proc_budgetsales" DeleteCommandType="StoredProcedure" InsertCommand="proc_budgetsales" InsertCommandType="StoredProcedure" SelectCommand="proc_budgetsales" SelectCommandType="StoredProcedure" UpdateCommand="proc_budgetsales" UpdateCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
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
                        <asp:GridView ID="grv_budgetsales" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pkey" DataSourceID="sql_budgetsales" EmptyDataText="Data Not Found" OnLoad="grv_budgetsales_Load" OnRowDataBound="grv_budgetsales_RowDataBound" CssClass="table table-hover table-responsive" >
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnk_update" runat="server" CausesValidation="True"  Text="Update" OnClick="lnk_update_Click"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="lnk_cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        
                                        &nbsp;<asp:LinkButton ID="lnk_delete" runat="server" CausesValidation="False"  Text="Delete" OnClick="lnk_delete_Click"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="lnk_select" runat="server" CausesValidation="False" CommandName="Select" Text="Select" CssClass="d-none"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kdsales" SortExpression="Kdsales">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="txt_kdsales" runat="server" Text='<%# Bind("Kdsales") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_kdsales" runat="server" Text='<%# Bind("Kdsales") %>'></asp:Label>
                                        <asp:Label ID="lbl_e_pkey" runat="server" Text='<%# Eval("pkey") %>' CssClass="d-none"></asp:Label>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_kdsales" runat="server" Text='<%# Bind("Kdsales") %>' ></asp:Label>
                                        <asp:Label ID="lbl_i_pkey" runat="server" Text='<%# Bind("pkey") %>' CssClass="d-none">></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nama Sales" SortExpression="Nama Sales">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="txt_nmsales" runat="server" Text='<%# Bind("[Nama Sales]") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_nmsales" runat="server" Text='<%# Bind("[Nama Sales]") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_nmsales" runat="server" Text='<%# Bind("[Nama Sales]") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="KdDivisi" SortExpression="KdDivisi">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="txt_kddivisi" runat="server" Text='<%# Bind("KdDivisi") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_kddivisi" runat="server" Text='<%# Bind("KdDivisi") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_kddivisi" runat="server" Text='<%# Bind("KdDivisi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bulan" SortExpression="Bulan">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="txt_bulan" runat="server" Text='<%# Bind("Bulan") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_bulan" runat="server" Text='<%# Bind("Bulan") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_bulan" runat="server" Text='<%# Bind("Bulan") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tahun" SortExpression="Tahun">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="txt_tahun" runat="server" Text='<%# Bind("Tahun") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_tahun" runat="server" Text='<%# Bind("Tahun") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_tahun" runat="server" Text='<%# Bind("Tahun") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Value" SortExpression="Value">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_value" runat="server" Text='<%# Bind("Value","{0:N0}") %>' CssClass="amount"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_value" runat="server" Text='<%# Bind("Value","{0:N0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tgl Input" SortExpression="tgl_input">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("tgl_input","{0:dd-MMM-yyyy}") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_tglinput" runat="server" Text='<%# Bind("tgl_input","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("tgl_input","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Input" SortExpression="user_input">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("user_input") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_userinput" runat="server" Text='<%# Bind("user_input") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("user_input") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tgl Update" SortExpression="tgl_update">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("tgl_update","{0:dd-mm-yyyy}") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_tglupdate" runat="server" Text='<%# Bind("tgl_update") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("tgl_update") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Update" SortExpression="user_update">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("user_update") %>' readonly="true"></asp:TextBox>--%>
                                        <asp:Label ID="lbl_e_userupdate" runat="server" Text='<%# Bind("user_update") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("user_update") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--
                                <asp:TemplateField HeaderText="pkey" InsertVisible="False" SortExpression="pkey">
                                    <EditItemTemplate>
                                        
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                --%>
                            </Columns>
                            <EmptyDataTemplate>
                                Data Kosong
                                <div id="AddBudget" class ="d-none">
                                    <div class="row justify-content-between fv-row">
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Sales</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_sales" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                                             </div>
                                        </div> 
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Bulan</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_bulan" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Tahun</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_tahun" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Divisi</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_divisi" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" >
                                                      <asp:ListItem Text="ICD" Value="ICD"></asp:ListItem>
                                                      <asp:ListItem Text="FID" Value="FID"></asp:ListItem>
                                                  </asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Nilai Budget</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                 <asp:TextBox ID="txt_nilai_budget" runat="server" CssClass="form-control"></asp:TextBox>
                                             </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-between fv-row">
                                        <div class="col-sm-4 row mb-2">
                                            <asp:Button ID="cmd_simpan" runat="server" Text="Simpan" OnClick="cmd_simpan_Click" />
                                        </div>
                                    </div>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                    <div class="col-sm-12 row mb-2">
                        
                    </div>
                </div>
                    <asp:Panel ID="pnl_add" runat="server" Visible="false" >
                            <div id="AddBudget" >
                                    <div class="row justify-content-between fv-row">
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Sales</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_sales" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                                             </div>
                                        </div> 
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Bulan</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_bulan" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Tahun</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_tahun" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" ></asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Divisi</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                  <asp:DropDownList ID="cb_add_divisi" runat="server" CssClass="form-select form-select-sm  form-select-solid rounded" >
                                                      <asp:ListItem Text="ICD" Value="ICD"></asp:ListItem>
                                                      <asp:ListItem Text="FID" Value="FID"></asp:ListItem>
                                                  </asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="col-sm-4 row mb-2">
                                             <label for="colFormLabel" class="col-sm-4 col-form-label col-form-label-sm">Nilai Budget</label>
                                             <div class="col-sm-8 mt-1 right-inner-addon">
                                                 <asp:TextBox ID="txt_nilai_budget" runat="server" CssClass="form-control amount"></asp:TextBox>
                                             </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-between fv-row">
                                        <div class="col-sm-4 row mb-2">
                                            <div class="btn-group me-2" role="group" aria-label="First group">
                                                <asp:Button ID="cmd_simpan" runat="server" Text="Simpan" OnClick="cmd_simpan_Click" />
                                                <asp:Button ID="cmd_cancel" runat="server" Text="Cancel" OnClick="cmd_cancel_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </asp:Panel>

            </div>
     </div>
    
    <%--
    <script  type="text/javascript">
        $(document).ready(function () {
            $('#cb_sales').select2();
             Inputmask("currency", { "rightAlignNumerics": false, "digits": 0 }).mask(".amount");
        });

    </script>
    --%>
</asp:Content>
