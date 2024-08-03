<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForAdmin/mpAdmins.master" AutoEventWireup="true" CodeFile="wfUpdDelWorkerAttributes.aspx.cs" Inherits="PagesForAdmin_wfUpdDelWorkerAttributes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin-top:100px">
                <div style="height:100%; width:100%; display:flex; flex-direction:row; align-items:center; overflow:hidden">
                    <div style="width:100%; height:stretch; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 80px;">
                       <div style="display:flex; flex-direction:column; align-items:center">
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="workerID">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="workerID" HeaderText="workerID" ReadOnly="True" SortExpression="workerID" >
<ControlStyle CssClass="BoundFieldStyle"></ControlStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="avgPayment" SortExpression="avgPayment">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("avgPayment") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("avgPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="avgHours" SortExpression="avgHours">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                             <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("avgHours") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("avgHours") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="timesOrdered" SortExpression="timesOrdered">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("timesOrdered") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("timesOrdered") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="experienceYears" SortExpression="experienceYears">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                              <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("experienceYears") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("experienceYears") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ratingQuality" SortExpression="ratingQuality">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                                <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("ratingQuality") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ratingQuality") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ratingSpeed" SortExpression="ratingSpeed">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                               <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("ratingSpeed") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ratingSpeed") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ratingComfort" SortExpression="ratingComfort">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                              <asp:TextBox ID="TextBox7" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("ratingComfort") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ratingComfort") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="timesRated" SortExpression="timesRated">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                              <asp:TextBox ID="TextBox8" runat="server" CssClass="TextBoxStyle" onkeypress="return isNumberKey(event)" Text='<%# Bind("timesRated") %>'></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("timesRated") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="tags" HeaderText="tags" SortExpression="tags" >
<ControlStyle CssClass="BoundFieldStyle"></ControlStyle>
                                </asp:BoundField>
                            </Columns>
                                <HeaderStyle ForeColor="#DD0000" Font-Bold="true" Font-Size="20px" />
                                <RowStyle Font-Size="16px" ForeColor="Red" HorizontalAlign="Center" CssClass="RowStyle"/>
                        </asp:GridView>
                           <asp:Label ID="lblErrorMessage" runat="server" style=" border-left:solid; border-color:red; padding-left:2px" Font-Size="20px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [tblWorkerAttributes] WHERE [workerID] = ?" InsertCommand="INSERT INTO [tblWorkerAttributes] ([workerID], [avgPayment], [avgHours], [timesOrdered], [experienceYears], [ratingQuality], [ratingSpeed], [ratingComfort], [timesRated], [tags]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblWorkerAttributes]" UpdateCommand="UPDATE [tblWorkerAttributes] SET [avgPayment] = ?, [avgHours] = ?, [timesOrdered] = ?, [experienceYears] = ?, [ratingQuality] = ?, [ratingSpeed] = ?, [ratingComfort] = ?, [timesRated] = ?, [tags] = ? WHERE [workerID] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="workerID" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="workerID" Type="String" />
                                <asp:Parameter Name="avgPayment" Type="Decimal" />
                                <asp:Parameter Name="avgHours" Type="Double" />
                                <asp:Parameter Name="timesOrdered" Type="Int32" />
                                <asp:Parameter Name="experienceYears" Type="Double" />
                                <asp:Parameter Name="ratingQuality" Type="Double" />
                                <asp:Parameter Name="ratingSpeed" Type="Double" />
                                <asp:Parameter Name="ratingComfort" Type="Double" />
                                <asp:Parameter Name="timesRated" Type="Int32" />
                                <asp:Parameter Name="tags" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="avgPayment" Type="Decimal" />
                                <asp:Parameter Name="avgHours" Type="Double" />
                                <asp:Parameter Name="timesOrdered" Type="Int32" />
                                <asp:Parameter Name="experienceYears" Type="Double" />
                                <asp:Parameter Name="ratingQuality" Type="Double" />
                                <asp:Parameter Name="ratingSpeed" Type="Double" />
                                <asp:Parameter Name="ratingComfort" Type="Double" />
                                <asp:Parameter Name="timesRated" Type="Int32" />
                                <asp:Parameter Name="tags" Type="String" />
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
    </style>
       <SCRIPT language=Javascript>
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
          if (charCode > 31 && (charCode < 48 || charCode > 57))
              if (!charCode == 190)
                  return false;
         return true;
      }
       </SCRIPT>
</asp:Content>

