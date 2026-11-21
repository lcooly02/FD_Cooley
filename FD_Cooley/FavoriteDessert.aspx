
<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="FavoriteDessert.aspx.cs"
    Inherits="FavoriteDessert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Favorite Dessert</title>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Favorite Dessert Records</h2>

        Enter your name:
        <asp:TextBox ID="txtName" runat="server" MaxLength="50" />

        <asp:RequiredFieldValidator
            ID="valName"
            runat="server"
            ControlToValidate="txtName"
            ErrorMessage="Name is required."
            ForeColor="Red" />
        <br /><br />

        Choose your favorite dessert:
        <asp:DropDownList ID="ddlDessert" runat="server">
            <asp:ListItem>Cake</asp:ListItem>
            <asp:ListItem>Ice Cream</asp:ListItem>
            <asp:ListItem>Cookies</asp:ListItem>
            <asp:ListItem>Pie</asp:ListItem>
            <asp:ListItem>Pastries</asp:ListItem>
        </asp:DropDownList>
        <br /><br />

        Do you like chocolate?
        <asp:CheckBox ID="chkChocolate" runat="server"
            Text="Yes" />
        <br /><br />

        <asp:Button ID="btnSubmit" runat="server"
            Text="Submit"
            OnClick="btnSubmit_Click" />
        <br /><br />

        <asp:Label ID="lblResult" runat="server" />
<h3>Saved Dessert Records</h3>
    <asp:GridView ID="gvDesserts" runat="server"
        AutoGenerateColumns="False" DataKeyNames="DessertID"
        DataSourceID="dsDesserts">
        <Columns>
            <asp:BoundField DataField="DessertID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="FullName" HeaderText="Name" />
            <asp:BoundField DataField="FavoriteDessert" HeaderText="Favorite Dessert" />
            <asp:CheckBoxField DataField="LikesChocolate" HeaderText="Likes Chocolate" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="dsDesserts" runat="server"
        ConnectionString="<%$ ConnectionStrings:DessertDB %>"
        SelectCommand="SELECT DessertID, FullName, FavoriteDessert, LikesChocolate FROM DessertRecords ORDER BY DessertID"
        InsertCommand="INSERT INTO DessertRecords (FullName, FavoriteDessert, LikesChocolate) VALUES (@FullName, @FavoriteDessert, @LikesChocolate)"
        UpdateCommand="UPDATE DessertRecords SET FullName=@FullName, FavoriteDessert=@FavoriteDessert, LikesChocolate=@LikesChocolate WHERE DessertID=@DessertID"
        DeleteCommand="DELETE FROM DessertRecords WHERE DessertID=@DessertID">
        <InsertParameters>
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="FavoriteDessert" Type="String" />
            <asp:Parameter Name="LikesChocolate" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="FavoriteDessert" Type="String" />
            <asp:Parameter Name="LikesChocolate" Type="Boolean" />
            <asp:Parameter Name="DessertID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="DessertID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
