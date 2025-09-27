<%@ Page Language="C#"MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="Tracker.reports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Welcome to monthaly budget reports </h1>
    <asp:Label ID="lblUser" runat="server" Text="Hello, User!"></asp:Label>
</asp:Content>