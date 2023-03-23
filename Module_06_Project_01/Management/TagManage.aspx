<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TagManage.aspx.cs" Inherits="Module_06_Project_01.TagManagement.TagManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h1 class="text-success">Tag</h1>
            <a href="TagManage.aspx"></a><asp:ListView runat="server" DataKeyNames="TagId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                
                <EditItemTemplate>
                    <tr style="">
                       
                        <td>
                            <asp:Label ID="TagIdLabel1" runat="server" Text='<%# Eval("TagId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TagNameTextBox" runat="server" Text='<%# Bind("TagName") %>' />
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-primary" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                       
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ValidationGroup="ins"  ID="TagNameTextBox" CssClass="form form-control" runat="server" Text='<%# Bind("TagName") %>' />
                            <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="ins" ControlToValidate="TagNameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tag Name is Required"></asp:RequiredFieldValidator>
                           <%-- <asp:RequiredFieldValidator ControlToValidate="TagNameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="TagName is Require"></asp:RequiredFieldValidator>--%>
                        </td>
                         <td>
                            <asp:Button ValidationGroup="ins" CssClass="btn btn-outline-success" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-warning" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="TagIdLabel" runat="server" Text='<%# Eval("TagId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("TagName") %>' />
                        </td>
                        <td>
                            <asp:Button CssClass="btn btn-primary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table ">
                        <tr runat="server">
                            <td runat="server" >
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="" >
                                    <tr runat="server" style="">
                                        <th runat="server">Tag Id</th>
                                        <th runat="server">Tag Name</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="" >
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Tags] WHERE [TagId] = @TagId" InsertCommand="INSERT INTO [Tags] ([TagName]) VALUES (@TagName)" SelectCommand="SELECT * FROM [Tags]" UpdateCommand="UPDATE [Tags] SET [TagName] = @TagName WHERE [TagId] = @TagId">
                <DeleteParameters>
                    <asp:Parameter Name="TagId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TagName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TagName" Type="String" />
                    <asp:Parameter Name="TagId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
