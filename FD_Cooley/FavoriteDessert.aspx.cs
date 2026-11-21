using System;
using System.Web.UI;

public partial class FavoriteDessert : Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        if (!Page.IsValid) return;

        dsDesserts.InsertParameters["FullName"].DefaultValue = txtName.Text.Trim();
        dsDesserts.InsertParameters["FavoriteDessert"].DefaultValue = ddlDessert.SelectedValue;
        dsDesserts.InsertParameters["LikesChocolate"].DefaultValue = chkChocolate.Checked.ToString();
        dsDesserts.Insert();

        lblResult.Text = "Dessert record added for " + Server.HtmlEncode(txtName.Text.Trim()) + ".";
        txtName.Text = "";
        ddlDessert.SelectedIndex = 0;
        chkChocolate.Checked = false;
        gvDesserts.DataBind();
        txtName.Focus();
    }
}
