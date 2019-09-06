<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Stations_Monitor._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
              
            <table style="width:100%;">
                <tr>
                    <td style="height: 78px">
                       <h1> <asp:Label ID="lblCellID" runat="server"></asp:Label></h1>
                    </td>
                  
                    <td style="height: 78px">
                        <%--<asp:Label ID="lblCurrentDate" runat="server" Font-Size="Medium"></asp:Label>--%>
                    </td>
                  
                </tr>
                </table>
        </div>
 <h2>Fecha de Producción: <asp:Label ID="lblProductionDate" runat="server"></asp:Label></h2>


    <div class="row">
        <div class="col-md-4">
            <h2>Primer Turno</h2>
            <p>
            <asp:Button ID="btnFirstShift" runat="server"  Text="Ver Producción" CssClass="btn btn-primary" OnClick="btnFirstShift_Click" />     
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4">
            <h2>Segundo Turno</h2>
            <p>
            <asp:Button ID="btnSecondShift" runat="server" Text="Ver Producción" CssClass="btn btn-primary" OnClick="btnSecondShift_Click" /> 
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4">
            <h2>Tercer Turno</h2>
            <p>
            <asp:Button ID="btnThirdShift" runat="server" Text="Ver Producción" CssClass="btn btn-primary" OnClick="btnThirdShift_Click" /> 
            </p>
            <p>
                <asp:Label ID="lblMessage" runat="server"></asp:Label></p>
        </div>
    </div>

</asp:Content>
