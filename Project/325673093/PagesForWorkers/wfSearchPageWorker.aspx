<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForWorkers/mpWorkers.master" AutoEventWireup="true" CodeFile="wfSearchPageWorker.aspx.cs" Inherits="PagesForWorkers_wfSearchPageWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <MyUserControls:WorkerProfileInSearch ID="wucWorkerProfileInSearch1" runat="server" Visible="false"/>
        
        <div style="align-items:center; display:flex; flex-direction:column">
            <div id="divs" runat="server" style="display:flex; flex-direction:row;margin-top:30px; width:1380px; height:100%">
                <div id="div1" runat="server" style="display:flex; flex-direction:column; width:450px; height:100%">
                </div>

                <div id="div2" runat="server" style="display:flex; flex-direction:column; margin-left:15px; width:450px; height:100%">
                </div>

                <div id="div3" runat="server" style="display:flex; flex-direction:column; margin-left:15px; width:450px; height:100%">
                </div>
            </div>

        </div>
</asp:Content>

