<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="Module_06_Project_01.Management.Authors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="text-success">Authors</h1>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="AuthorId" DataSourceID="dsAuthors" InsertItemPosition="LastItem">

        <EditItemTemplate>
            <tr style="background-color: #FFCC66; color: #000080;">

                <td>
                    <asp:Label ID="AuthorIdLabel1" runat="server" Text='<%# Eval("AuthorId") %>' />
                </td>
                <td>
                    <asp:TextBox CssClass ="form-control "  ID="AuthorNameTextBox" runat="server" Text='<%# Bind("AuthorName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AuthorEmailTextBox" runat="server" Text='<%# Bind("AuthorEmail") %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-primary" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">

                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ValidationGroup="ins" CssClass ="form-control "  ID="AuthorNameTextBox" runat="server" Text='<%# Bind("AuthorName") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="ins" ControlToValidate="AuthorNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Author Name is Required"></asp:RequiredFieldValidator>
                </td>
                <td>

                    <asp:TextBox TextMode="Email" ValidationGroup="ins"  CssClass="form-control "  ID="AuthorEmailTextBox" runat="server" Text='<%# Bind("AuthorEmail") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ID="RequiredFieldValidator5"  runat="server" ControlToValidate="AuthorEmailTextBox" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="ins" ID="RegularExpressionValidator1" CssClass="text-danger" Text="Email is invalid!" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" 
                                Display = "Dynamic" ErrorMessage = "Invalid email address" ControlToValidate="AuthorEmailTextBox" runat="server"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Button ValidationGroup="ins" CssClass="btn btn-outline-success" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button CssClass="btn btn-warning" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6; color: #333333;">

                <td>
                    <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorEmailLabel" runat="server" Text='<%# Eval("AuthorEmail") %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-primary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table " runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                <th runat="server">AuthorId</th>
                                <th runat="server">AuthorName</th>
                                <th runat="server">AuthorEmail</th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-primary" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Authors] WHERE [AuthorId] = @AuthorId" InsertCommand="INSERT INTO [Authors] ([AuthorName], [AuthorEmail]) VALUES (@AuthorName, @AuthorEmail)" SelectCommand="SELECT * FROM [Authors]" UpdateCommand="UPDATE [Authors] SET [AuthorName] = @AuthorName, [AuthorEmail] = @AuthorEmail WHERE [AuthorId] = @AuthorId">
        <DeleteParameters>
            <asp:Parameter Name="AuthorId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AuthorName" Type="String" />
            <asp:Parameter Name="AuthorEmail" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AuthorName" Type="String" />
            <asp:Parameter Name="AuthorEmail" Type="String" />
            <asp:Parameter Name="AuthorId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
