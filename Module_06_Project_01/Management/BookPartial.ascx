<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookPartial.ascx.cs" Inherits="Module_06_Project_01.Management.WebUserControl1" %>
    <div class="row">
        <div class="col-12">
            <h1 class="text-danger">Books</h1>
            <asp:GridView CssClass="table table-bordered table-striped " ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookId" DataSourceID="dsBooks" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="BookTitle" SortExpression="BookTitle">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("BookTitle") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BookPrice" SortExpression="BookPrice">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Text='<%# Bind("BookPrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PublishDate" SortExpression="PublishDate">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" Text='<%# Bind("PublishDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PublishDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Available" SortExpression="Available">
                        <EditItemTemplate>
                            <asp:CheckBox CssClass="form-control" ID="CheckBox1" runat="server" Checked='<%# Bind("Available") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Available") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BookImg" SortExpression="BookImg">
                        <EditItemTemplate>
                            <asp:FileUpload CssClass="form-control " ID="FileUpload1" runat="server" />
                            <asp:HiddenField Value='<%# Bind("BookImg") %>' ID="HiddenField1" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image Width ="50px" ImageUrl='<%# Eval("BookImg", "~/Pictures/{0}") %>' ID="Image1" runat="server" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PublisherId" SortExpression="PublisherId">
                        <EditItemTemplate>
                            <asp:DropDownList CssClass="form-select" ID="DropDownList2" AppendDataBoundItems="true" DataSourceID="dsPublishers" DataTextField="PublisherName" DataValueField="PublisherId" SelectedValue='<%# Bind("PublisherId") %>' runat="server">
                                <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PublisherId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton CssClass="btn btn-outline-primary" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Books] WHERE [BookId] = @BookId" InsertCommand="INSERT INTO [Books] ([BookTitle], [BookPrice], [PublishDate], [Available], [BookImg], [PublisherId]) VALUES (@BookTitle, @BookPrice, @PublishDate, @Available, @BookImg, @PublisherId)" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [BookTitle] = @BookTitle, [BookPrice] = @BookPrice, [PublishDate] = @PublishDate, [Available] = @Available, [BookImg] = @BookImg, [PublisherId] = @PublisherId WHERE [BookId] = @BookId">
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
        </div>
        <div class="col-6">
            <h3 class="text-success">Add New Book</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="BookId" DataSourceID="dsBooks" DefaultMode="Insert" RenderOuterTable="False" OnItemInserting="FormView1_ItemInserting">

                <InsertItemTemplate>
                    BookTitle:
                    <asp:TextBox ValidationGroup="ins" CssClass="form-control " ID="BookTitleTextBox" runat="server" Text='<%# Bind("BookTitle") %>' />
                    <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="ins" ControlToValidate="BookTitleTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Book Title is Required"></asp:RequiredFieldValidator>
                    <br />
                    BookPrice:
                    <asp:TextBox CssClass="form-control " ID="BookPriceTextBox" runat="server" Text='<%# Bind("BookPrice") %>' />
                    <br />
                    PublishDate:
                    <asp:TextBox CssClass="form-control " ID="PublishDateTextBox" runat="server" Text='<%# Bind("PublishDate") %>' />
                    <br />
                    Available:
                    <asp:CheckBox CssClass="form-control " ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                    <br />
                    BookImg:
                    <asp:FileUpload CssClass="form-control " ID="FileUpload1" runat="server" />
                    <asp:HiddenField Value='<%# Bind("BookImg") %>' ID="HiddenField1" runat="server" />
                    <br />
                    PublisherId:
                    <asp:DropDownList CssClass="form-select" ID="DropDownList1" AppendDataBoundItems="true" DataSourceID="dsPublishers" DataTextField="PublisherName" DataValueField="PublisherId" SelectedValue='<%# Bind("PublisherId") %>' runat="server">
                        <asp:ListItem Selected="True" Value="">Select one</asp:ListItem>
                    </asp:DropDownList>

                    <br />
                    <asp:LinkButton ValidationGroup="ins" CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>

            </asp:FormView>
            <asp:SqlDataSource ID="dsPublishers" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Publishers]"></asp:SqlDataSource>
        </div>
    </div>