﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForAdmin/mpAdmins.master" AutoEventWireup="true" CodeFile="wfAddWorker.aspx.cs" Inherits="PagesForAdmin_wfAddWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" defaultbutton="btnAdd">
                <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin-top:100px">
                <div style="width:60%; height:100%; display:flex; flex-direction:row; align-items:center;">
                    <div style="width:100%; height:stretch; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 0 80px 0;">
                       <asp:Panel runat="server" style="display:flex; flex-direction:column; align-items:center" DefaultButton="btnAdd">
                           <asp:Label ID="lblInstuctions" runat="server" Text="Add A Worker" style="height: 59px; margin-bottom:15px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="35pt"></asp:Label>
                            <ul style="width:fit-content; height:stretch; display:flex; flex-direction:row; align-items:center; list-style-type:none; padding:0; background-color:#FFBB44;">
                                <li style="display:flex; flex-direction:column; margin-right:20px">
                                    <asp:Label ID="lblFirstName" runat="server" Text="First name" CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblLastName" runat="server" Text="Last name"  CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"  CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblUserName" runat="server" Text="Username" CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="labelStyle"></asp:Label>
                                </li>
                                <li style="display:flex; flex-direction:column; margin-right:20px">
                                    <asp:TextBox ID="txtbxFirstName" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxLastName" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxEmail" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxUserName" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxPassword" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset" TextMode="Password"></asp:TextBox>
                                </li>
                                <li style="display:flex; flex-direction:column; margin-right:20px">
                                    <asp:Label ID="lblProfession" runat="server" Text="Profession" CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblDateOfBirth" runat="server" Text="Birth Date"  CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number"  CssClass="labelStyle"></asp:Label>
                                    <asp:Label ID="lblWorkerID" runat="server" Text="Worker ID" CssClass="labelStyle"></asp:Label>
                                </li>
                                <li style="display:flex; flex-direction:column">
                                    <asp:TextBox ID="txtbxProfession" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxDateOfBirth" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxPhoneNumber" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                    <asp:TextBox ID="txtbxWorkerID" runat="server" style="height: 30px; width:250px; margin-bottom:10px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset"></asp:TextBox>
                                </li>
                            </ul>
                        <div style="display:flex;flex-direction:row-reverse;align-items:end; width:100%; padding:0 0 0 0px">
                         <asp:Button ID="btnAdd" runat="server" Text="Add" ForeColor="#BB0000" Font-Size="18px" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="80px" Height="40px" OnClick="btnAdd_Click"/>
                             <div style="display:flex; flex-direction:row; align-items:center; height:40px; max-width:fit-content; overflow-x:visible; margin-right:15px">
                                <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="20px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Visible="true"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="ValidatorID" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="txtbxWorkerID" ErrorMessage="Wrong ID Format" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                                 <asp:RegularExpressionValidator ID="ValidatorPhoneNumber" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="txtbxPhoneNumber" ErrorMessage="Wrong Phone Number Format" ValidationExpression="0\d{1,2}-?\d{7}" Visible="false"></asp:RegularExpressionValidator>
                                <asp:Label ID="lblErrorMessage" runat="server" style=" border-left:solid; border-color:red; padding-left:2px" Font-Size="20px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                             </div>
                        </div>
                       </asp:Panel>
                    </div>
                </div>
                </div>
    <style>
        .labelStyle
        {
            height:36px;
            display:flex;
            flex-direction:row;
            text-align:center;
             margin-bottom:10px;
             color:#FF2200;
             font-weight:700;
             font-size:30px;
        }
    </style>
</asp:Content>

