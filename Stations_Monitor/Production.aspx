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
                                            ergerg</td>
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
                                            ZXCzckkkk</td>
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
                                            ergerg</td>
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
                                            &nbsp;</td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                </h1>
</asp:Content>
