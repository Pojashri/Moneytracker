<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profileSetting.aspx.cs" Inherits="Tracker.profileSetting" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>profile</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Welcome to profile</h1>
    <asp:Label ID="lblUser" runat="server" Text="Hello, User!"></asp:Label>
</asp:Content>