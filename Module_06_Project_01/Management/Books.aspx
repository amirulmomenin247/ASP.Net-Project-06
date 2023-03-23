<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Module_06_Project_01.Management.Books" %>

<%@ Register Src="~/Management/BookPartial.ascx" TagPrefix="uc1" TagName="BookPartial" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <uc1:BookPartial runat="server" id="BookPartial" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
