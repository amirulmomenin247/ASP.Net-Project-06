<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Publishers.aspx.cs" Inherits="Module_06_Project_01.Management.Publishers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="text-success">Publishers</h1>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="PublisherId" DataSourceID="dsPublishers" InsertItemPosition="LastItem">

        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF; ">

                <td>
                    <asp:Label ID="PublisherIdLabel1" runat="server" Text='<%# Eval("PublisherId") %>' />
                </td>
                <td>
                    <asp:TextBox CssClass ="form-control "  ID="PublisherNameTextBox" runat="server" Text='<%# Bind("PublisherName") %>' />
                </td>
                <td>
                    <asp:TextBox CssClass ="form-control "  ID="PublisherEmailTextBox" runat="server" Text='<%# Bind("PublisherEmail") %>' />
                </td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                    <asp:TextBox ValidationGroup="ins" CssClass ="form-control " ID="PublisherNameTextBox" runat="server" Text='<%# Bind("PublisherName") %>' />
                    <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="ins" ControlToValidate="PublisherNameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Publisher Name is Required"></asp:RequiredFieldValidator>
                </td>
                <td>

                    <asp:TextBox TextMode="Email" ValidationGroup="ins" CssClass ="form-control "  ID="PublisherEmailTextBox" runat="server" Text='<%# Bind("PublisherEmail") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ID="RequiredFieldValidator5"  runat="server" ControlToValidate="PublisherEmailTextBox" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="ins" ID="RegularExpressionValidator1" CssClass="text-danger" Text="Email is invalid!" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" 
                                Display = "Dynamic" ErrorMessage = "Invalid email address" ControlToValidate="PublisherEmailTextBox" runat="server"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Button ValidationGroup="ins" CssClass="btn btn-outline-success" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button CssClass="btn btn-warning" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">

                <td>
                    <asp:Label ID="PublisherIdLabel" runat="server" Text='<%# Eval("PublisherId") %>' />
                </td>
                <td>
                    <asp:Label ID="PublisherNameLabel" runat="server" Text='<%# Eval("PublisherName") %>' />
                </td>
                <td>
                    <asp:Label ID="PublisherEmailLabel" runat="server" Text='<%# Eval("PublisherEmail") %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-outline-primary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table " runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table table-bordered " id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">

                                <th runat="server">PublisherId</th>
                                <th runat="server">PublisherName</th>
                                <th runat="server">PublisherEmail</th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
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
    <asp:SqlDataSource ID="dsPublishers" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Publishers] WHERE [PublisherId] = @PublisherId" InsertCommand="INSERT INTO [Publishers] ([PublisherName], [PublisherEmail]) VALUES (@PublisherName, @PublisherEmail)" SelectCommand="SELECT * FROM [Publishers]" UpdateCommand="UPDATE [Publishers] SET [PublisherName] = @PublisherName, [PublisherEmail] = @PublisherEmail WHERE [PublisherId] = @PublisherId">
        <DeleteParameters>
            <asp:Parameter Name="PublisherId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PublisherName" Type="String" />
            <asp:Parameter Name="PublisherEmail" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PublisherName" Type="String" />
            <asp:Parameter Name="PublisherEmail" Type="String" />
            <asp:Parameter Name="PublisherId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
