<%@ Page Title="Hoja de Produccion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Production.aspx.cs" Inherits="Stations_Monitor.Production" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <div class="jumbotron">
              
            <table style="width:100%;">
                <tr>
                    <td style="height: 78px">
                                <table  style="width: 80%;">
                                    <tr>
                                        <td>
                                <asp:Label ID="Label7" runat="server" Text="Linea:" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                <asp:Label ID="lblLine" runat="server" BorderStyle="None" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                <asp:Label ID="Label12" runat="server" Text="Celda:" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
        <asp:Label ID="lblCellID" runat="server" Font-Bold="False" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Label ID="Label6" runat="server" Text="Fecha:" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
        <asp:Label ID="lblProductionDate" runat="server" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                <asp:Label ID="Label2" runat="server" Text="Turno:" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                <asp:Label ID="lblShift" runat="server" BorderStyle="None" Font-Bold="False" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                            ZXCzc</td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Label ID="Label8" runat="server" Text="# de Empleado" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmployeeId" runat="server" Font-Size="12pt" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                   
                                    <tr>
                                        <td colspan="2">
                                <asp:Label ID="Label11" runat="server" Text="Piezas buenas producidas: " Font-Bold="True" Font-Size="12pt"></asp:Label>
                                <asp:Label ID="lblTotalGood" runat="server" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                                    <br />
                                                    </td>
                                        <td colspan="2">
                                <asp:Label ID="Label10" runat="server" Text="Alcanzó su meta de Produccion Diaria?" Font-Bold="True" Font-Size="12pt"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                   
                                    <tr>
                                        <td colspan="2">
                                <asp:Label ID="lblMessage" runat="server" Text="Label" Font-Size="12pt"></asp:Label>
                                                    </td>
                                        <td colspan="2">
                                                        <asp:CheckBox ID="cbYes"  runat="server" Text="SI" AutoPostBack="True" OnCheckedChanged="cbYes_CheckedChanged" Font-Size="12pt" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:CheckBox ID="cbNo" runat="server" Text="NO" AutoPostBack="True" OnCheckedChanged="cbNo_CheckedChanged" Font-Size="12pt" />
                                        </td>
                                        <td>
            <asp:Button ID="btnSave" runat="server"  Text="Guardar" CssClass="btn btn-primary" />     
                                        </td>
                                    </tr>
                                    </table>
                    </td>                                  
                  
                </tr>
                </table>
        </div>
               
               
                    <table class="nav-justified">
                        <tr>
                            <td class="text-center">
                               
                                <asp:Label ID="Label13" runat="server" Text="HOJA DE PRODUCCION" Font-Bold="True" ></asp:Label>
                             
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width:100%;">
                                   
                                    <tr>
                                        <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idrec_det" OnDataBinding="GridView1_DataBinding" OnDataBound="GridView1_DataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Font-Size="12pt" Width="100%" HorizontalAlign="Center" ForeColor="#333333" GridLines="None" CellSpacing="5">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" CancelText="Cancelar" EditText="Editar" UpdateText="Guardar" CancelImageUrl="~/images/gtk_dialog_error.ico" UpdateImageUrl="~/images/good_or_tick.ico" ShowHeader="True" ButtonType="Button" >
                            <ControlStyle Width="115px" />                        
                            <HeaderStyle Width="115px" />
                            <ItemStyle Width="115px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="idrec_det" HeaderText="idrec_det" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="hour" HeaderText="HR" ReadOnly="True" >
                            <ControlStyle Width="70px"  />
                            <HeaderStyle Width="70px" />
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="goal_hr" HeaderText="Meta/HR" ReadOnly="True" >
                            <ControlStyle />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Total Pzs">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTotalParts" runat="server" Text='<%# Bind("total_parts") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalParts" runat="server" Text='<%# Bind("total_parts") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="70px" />
                                <HeaderStyle />
                                <ItemStyle />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scrap">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtScrapParts" runat="server" Text='<%# Bind("scrap_parts") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("scrap_parts") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="70px"  />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QX">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQXParts" runat="server" Text='<%# Bind("qx_parts") %>'></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("qx_parts") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="70px" />
                                <HeaderStyle />
                                <ItemStyle  />
                            </asp:TemplateField>
                            <asp:BoundField DataField="good_parts" HeaderText="OK" ReadOnly="True" >                           
                            <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Descripcion Rechazo/SCrap">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtScrapDescription" runat="server" TextMode="MultiLine" Width="400px" Text='<%# Bind("description_scrap") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("description_scrap") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comentarios">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="400px"  Text='<%# Bind("comment") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("comment") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="350px" />
                            </asp:TemplateField>
                           
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                </h1>
</asp:Content>
