<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookTags.aspx.cs" Inherits="Module_06_Project_01.Management.BookTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="text-success">Book Tag</h1>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="BookId,TagId,AuthorId" DataSourceID="dsBookTags" InsertItemPosition="LastItem">

        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">

                <td>
                    <asp:Label ID="BookIdLabel1" runat="server" Text='<%# Eval("BookId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="BookCatagoryTextBox" runat="server" Text='<%# Bind("BookCatagory") %>' />
                </td>
                <td>
                    <asp:Label ID="TagIdLabel1" runat="server" Text='<%# Eval("TagId") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorIdLabel1" runat="server" Text='<%# Eval("AuthorId") %>' />
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

                <td>
                    <asp:DropDownList CssClass="form-select" ID="DropDownList2" AppendDataBoundItems="true" DataSourceID="dsBooks" DataTextField="BookTitle" DataValueField="BookId" SelectedValue='<%# Bind("BookId") %>' runat="server">
                        <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>
                    <asp:TextBox ValidationGroup="ins" ID="BookCatagoryTextBox" runat="server" Text='<%# Bind("BookCatagory") %>' />
                    <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="ins" ControlToValidate="BookCatagoryTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Book Catagory is Required"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:DropDownList CssClass="form-select" ID="DropDownList1" AppendDataBoundItems="true" DataSourceID="dsTags" DataTextField="TagName" DataValueField="TagId" SelectedValue='<%# Bind("TagId") %>' runat="server">
                        <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList CssClass="form-select" ID="DropDownList3" AppendDataBoundItems="true" DataSourceID="dsAuthors" DataTextField="AuthorName" DataValueField="AuthorId" SelectedValue='<%# Bind("AuthorId") %>' runat="server">
                        <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                    </asp:DropDownList>

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
                    <asp:Label ID="BookIdLabel" runat="server" Text='<%# Eval("BookId") %>' />
                </td>
                <td>
                    <asp:Label ID="BookCatagoryLabel" runat="server" Text='<%# Eval("BookCatagory") %>' />
                </td>
                <td>
                    <asp:Label ID="TagIdLabel" runat="server" Text='<%# Eval("TagId") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-primary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table" runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">

                                <th runat="server">BookId</th>
                                <th runat="server">BookCatagory</th>
                                <th runat="server">TagId</th>
                                <th runat="server">AuthorId</th>
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
                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-primary" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="dsBookTags" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [BookTags] WHERE [BookId] = @BookId AND [TagId] = @TagId AND [AuthorId] = @AuthorId" InsertCommand="INSERT INTO [BookTags] ([BookId], [BookCatagory], [TagId], [AuthorId]) VALUES (@BookId, @BookCatagory, @TagId, @AuthorId)" SelectCommand="SELECT * FROM [BookTags]" UpdateCommand="UPDATE [BookTags] SET [BookCatagory] = @BookCatagory WHERE [BookId] = @BookId AND [TagId] = @TagId AND [AuthorId] = @AuthorId">
        <DeleteParameters>
            <asp:Parameter Name="BookId" Type="Int32" />
            <asp:Parameter Name="TagId" Type="Int32" />
            <asp:Parameter Name="AuthorId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BookId" Type="Int32" />
            <asp:Parameter Name="BookCatagory" Type="String" />
            <asp:Parameter Name="TagId" Type="Int32" />
            <asp:Parameter Name="AuthorId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BookCatagory" Type="String" />
            <asp:Parameter Name="BookId" Type="Int32" />
            <asp:Parameter Name="TagId" Type="Int32" />
            <asp:Parameter Name="AuthorId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsTags" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Tags]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Authors]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
