<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForAdmin/mpAdmins.master" AutoEventWireup="true" CodeFile="wfUpdDelWorker.aspx.cs" Inherits="PagesForAdmin_wfUpdDelWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin:100px 0 50px">
                <div style="height:100%; display:flex; flex-direction:row; align-items:center; overflow:hidden">
                    <div style="width:100%; height:stretch; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 80px;">
                       <div style="display:flex; flex-direction:column; align-items:center">
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="workerID">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="workerID" HeaderText="WorkerID" ReadOnly="True" SortExpression="workerID" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="firstName" HeaderText="Firstname" SortExpression="firstName" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="lastName" HeaderText="Lastname" SortExpression="lastName" >
                                </asp:BoundField>
                                <asp:TemplateField  HeaderText="BirthDate(US)" SortExpression="dateOfBirth">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate" operator="DataTypeCheck">
                                            <asp:TextBox ID="txtbxDateOfBirth" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("dateOfBirth","{0:d}") %>'></asp:TextBox>
                                            <asp:CompareValidator ID="ValidatorDateOfBirth" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxDateOfBirth" ErrorMessage="Wrong Date Format" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator> 
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("dateOfBirth","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField  HeaderText="PhoneNumber" SortExpression="phoneNumber">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="txtbxPhoneNumber" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="ValidatorPhoneNumber" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red"  ControlToValidate="txtbxPhoneNumber" ErrorMessage="Wrong Phone Number Format" ValidationExpression="0\d{1,2}-?\d{7}" Visible="true"></asp:RegularExpressionValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="email">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="txtbxEmail" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("email") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Visible="true"></asp:RegularExpressionValidator>
                                        <div class="EditItemTemplate">
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="userName" HeaderText="Username" SortExpression="userName" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="password" HeaderText="Password" SortExpression="password" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="profession" HeaderText="Profession" SortExpression="profession" >
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="PFP" SortExpression="ImageURL">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                              <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle"  Text='<%# Bind("ImageURL") %>'></asp:TextBox>
                                        <div class="EditItemTemplate">
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imgPFP" runat="server" ImageUrl='<%# Bind("ImageURL") %>' Width="50px" Height="50px"></asp:Image>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Biograph" SortExpression="biograph">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                             <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("biograph") %>' TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("biograph") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="status" HeaderText="Status" SortExpression="status" >
                                </asp:BoundField>
                            </Columns>
                                <HeaderStyle ForeColor="#DD0000" Font-Bold="true" Font-Size="20px" CssClass="HeaderStyle"/>
                                <RowStyle Font-Size="16px" ForeColor="Red" HorizontalAlign="Center" CssClass="RowStyle"/>
                        </asp:GridView>
                           <asp:Button ID="btnWorkerAttributes" runat="server" Text="Worker Attributes" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="120px" Height="40px" OnClick="btnWorkerAttributes_Click"/>
                                <asp:Label ID="lblErrorMessage" runat="server" style=" border-left:solid; border-color:red; padding-left:2px" Font-Size="20px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [tblWorkers] WHERE [workerID] = ?" InsertCommand="INSERT INTO [tblWorkers] ([workerID], [firstName], [lastName], [dateOfBirth], [phoneNumber], [email], [userName], [password], [profession], [ImageURL], [biograph], [status]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblWorkers]" UpdateCommand="UPDATE [tblWorkers] SET [firstName] = ?, [lastName] = ?, [dateOfBirth] = ?, [phoneNumber] = ?, [email] = ?, [userName] = ?, [password] = ?, [profession] = ?, [ImageURL] = ?, [biograph] = ?, [status] = ? WHERE [workerID] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="workerID" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="workerID" Type="String" />
                                <asp:Parameter Name="firstName" Type="String" />
                                <asp:Parameter Name="lastName" Type="String" />
                                <asp:Parameter Name="dateOfBirth" Type="DateTime" />
                                <asp:Parameter Name="phoneNumber" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="userName" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="profession" Type="String" />
                                <asp:Parameter Name="ImageURL" Type="String" />
                                <asp:Parameter Name="biograph" Type="String" />
                                <asp:Parameter Name="status" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="firstName" Type="String" />
                                <asp:Parameter Name="lastName" Type="String" />
                                <asp:Parameter Name="dateOfBirth" Type="DateTime" />
                                <asp:Parameter Name="phoneNumber" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="userName" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="profession" Type="String" />
                                <asp:Parameter Name="ImageURL" Type="String" />
                                <asp:Parameter Name="biograph" Type="String" />
                                <asp:Parameter Name="status" Type="String" />
                                <asp:Parameter Name="workerID" Type="String" />
                            </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
        </div>
    <style>
        .GridViewStyle{
            max-width:90%;
            display:flex;
            flex-direction:row;
            align-items:center;
            margin:0 auto;
            overflow-x:scroll;
        }
        .CommandFieldStyle{
            width:80%;
            display:block;
        }
        .BoundFieldStyle{
            width:80%;
            background-color:#FF9922;
            color:red;
            font-size:16px;
            border-color:#FF7700;
            border-style:outset
        }
        .TextBoxStyle{
            width:100%;
            background-color:#FF9922;
            color:red;
            font-size:16px;
            border-color:#FF7700;
            border-style:outset
        }
        .EditItemTemplate{
            display:flex;
            flex-direction:row;
            align-items:center;
        }
        .RowStyle{
            max-width:90%
        }
        .HeaderStyle{
            width:;
            height:40px
        }
    </style>
</asp:Content>

