<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookPublisher.aspx.cs" Inherits="Module_06_Project_01.Management.BookPublisher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">

            <h1 class="text-success">Publishers</h1>
            <asp:GridView CssClass="table table-bordered table-striped"  ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="PublisherId" DataSourceID="dspublishers">
                <Columns>
                    <asp:TemplateField HeaderText="Publisher Id" InsertVisible="False" SortExpression="PublisherId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PublisherId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PublisherId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publisher Name" SortExpression="PublisherName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PublisherName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PublisherName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publisher Email" SortExpression="PublisherEmail">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PublisherEmail") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PublisherEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-warning" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-outline-primary" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-outline-success" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-12">
            <h1 class="text-primary">Books</h1>
            <asp:GridView CssClass="table table-bordered table-striped"  ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookId" DataSourceID="dsBooks">
                <Columns>
                    <asp:TemplateField HeaderText="Book Title" SortExpression="BookTitle">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookTitle") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Book Price" SortExpression="BookPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("BookPrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("BookPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publish Date" SortExpression="PublishDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PublishDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PublishDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Available" SortExpression="Available">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Available") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Available") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BookImg" SortExpression="BookImg">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("BookImg") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image Width ="50px" ImageUrl='<%# Eval("BookImg", "~/Pictures/{0}") %>' ID="Image1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publisher" SortExpression="PublisherId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PublisherId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PublisherName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-warning" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-outline-primary" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-outline-success" Visible="false" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <asp:SqlDataSource ID="dspublishers" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Publishers] WHERE [PublisherId] = @PublisherId" InsertCommand="INSERT INTO [Publishers] ([PublisherName], [PublisherEmail]) VALUES (@PublisherName, @PublisherEmail)" SelectCommand="SELECT * FROM [Publishers]" UpdateCommand="UPDATE [Publishers] SET [PublisherName] = @PublisherName, [PublisherEmail] = @PublisherEmail WHERE [PublisherId] = @PublisherId">
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
    <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Books] WHERE [BookId] = @BookId" InsertCommand="INSERT INTO [Books] ([BookTitle], [BookPrice], [PublishDate], [Available], [BookImg], [PublisherId]) VALUES (@BookTitle, @BookPrice, @PublishDate, @Available, @BookImg, @PublisherId)" SelectCommand="SELECT Books.BookId, Books.BookTitle, Books.BookPrice, Books.PublishDate, Books.Available, Books.BookImg, Books.PublisherId, Publishers.PublisherName FROM Books INNER JOIN Publishers ON Books.PublisherId = Publishers.PublisherId WHERE (Books.PublisherId = @PublisherId)" UpdateCommand="UPDATE [Books] SET [BookTitle] = @BookTitle, [BookPrice] = @BookPrice, [PublishDate] = @PublishDate, [Available] = @Available, [BookImg] = @BookImg, [PublisherId] = @PublisherId WHERE [BookId] = @BookId">
        <DeleteParameters>
            <asp:Parameter Name="BookId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BookTitle" Type="String" />
            <asp:Parameter Name="BookPrice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="PublishDate" />
            <asp:Parameter Name="Available" Type="Boolean" />
            <asp:Parameter Name="BookImg" Type="String" />
            <asp:Parameter Name="PublisherId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="PublisherId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="BookTitle" Type="String" />
            <asp:Parameter Name="BookPrice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="PublishDate" />
            <asp:Parameter Name="Available" Type="Boolean" />
            <asp:Parameter Name="BookImg" Type="String" />
            <asp:Parameter Name="PublisherId" Type="Int32" />
            <asp:Parameter Name="BookId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
