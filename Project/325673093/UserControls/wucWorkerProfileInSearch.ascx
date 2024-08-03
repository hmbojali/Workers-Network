<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucWorkerProfileInSearch.ascx.cs" Inherits="wucWorkerProfileInSearch" %>

        <div id="div" style="height:200px; width:450px; margin-bottom:0px" runat="server">
            <asp:Button ID="btnToProfile" runat="server" style="position:absolute; height: 200px; width: 450px; z-index:2;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="6px" OnClick="btnToProfile_Click"/>
            <ul style="flex-direction:row; display:flex; align-items:center; list-style-type:none; padding-left:0px; margin:0px; height:200px; width:450px">
                <li style="height:auto; width: contain auto; z-index:3; margin:0px 15px">
                    <asp:Image ID="imgPFP" runat="server" style="height: 140px; width: 140px; z-index:3"/>
                </li>
                <li style="height:auto; width: contain auto;display:flex; flex-direction:column;">
                    <asp:Label ID="lblUsername" runat="server" style=" z-index:3; height: 34px;width: fit-content; z-index:3" Font-Bold="True" Font-Size="20pt">Username</asp:Label>
                    <asp:Label ID="lblName" runat="server" style=" width: fit-content; z-index:3; margin-bottom:20px" Font-Italic="True" Font-Size="13pt">Name</asp:Label>
                    <div style="display:flex;flex-direction:row;align-items:baseline; margin-bottom:10px">
                        <asp:Label ID="lblProfession" runat="server" style="z-index:3" Font-Bold="True" Font-Size="14pt">Profession</asp:Label>
                        <asp:Label ID="lblStatus" runat="server" style="z-index:3" Font-Bold="True" Font-Size="10pt">Status</asp:Label>
                    </div>
                    <div style="display:flex;flex-direction:row;align-items:baseline">
                        <asp:Label ID="lblOverAllRating" runat="server" style="width: fit-content;z-index:3" Font-Bold="True" Font-Size="14pt"></asp:Label>
                        <asp:Label ID="lblTimesRated" runat="server" style="width: fit-content;z-index:3" Font-Bold="True" Font-Size="10pt"></asp:Label>
                    </div>
                </li>
            </ul>



        </div>

